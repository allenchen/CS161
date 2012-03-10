// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ThumbnailCache.java

package com.nloko.android;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.lang.ref.SoftReference;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

// Referenced classes of package com.nloko.android:
//            Utils, Log

public class ThumbnailCache
{
    private static class ImageDownloader
    {

        private void setupThread()
        {
            ThumbnailCache thumbnailcache = (ThumbnailCache)mCache.get();
            _cls1 _lcls1 = new  Object(thumbnailcache)         /* anonymous class not found */
        class _anm1 {}

;
            Thread thread = new Thread(_lcls1);
            downloadThread = thread;
            downloadThread.start();
        }

        public void download(String s)
        {
            if(s == null)
                return;
            urlQueue.put(s);
            return;
            printStackTrace();
        }

        public void setPause(boolean flag)
        {
            if(paused != flag)
                return;
            String s = (new StringBuilder()).append("setPause called with ").append(flag).toString();
            Log.d("ImageDownloader", s);
            paused = flag;
            if(paused && downloadThread != null)
            {
                downloadThread.interrupt();
                return;
            }
            if(paused)
            {
                return;
            } else
            {
                setupThread();
                return;
            }
        }

        private static final String TAG = "ImageDownloader";
        private Thread downloadThread;
        private WeakReference mCache;
        private boolean paused;
        private final BlockingQueue urlQueue;



        public ImageDownloader(ThumbnailCache thumbnailcache)
        {
            LinkedBlockingQueue linkedblockingqueue = new LinkedBlockingQueue();
            urlQueue = linkedblockingqueue;
            paused = false;
            WeakReference weakreference = new WeakReference(thumbnailcache);
            mCache = weakreference;
            setupThread();
        }
    }

    public static interface ImageProvider
    {

        public abstract boolean onImageRequired(String s);
    }

    /* member class not found */
    class ImageListener {}


    public ThumbnailCache()
    {
        HashMap hashmap = new HashMap();
        mImages = hashmap;
        Object obj = new Object();
        lock = obj;
        mDefaultImage = null;
        mListener = null;
        mProvider = null;
        ImageDownloader imagedownloader = new ImageDownloader(this);
        mDownloader = imagedownloader;
    }

    public void add(String s, Bitmap bitmap)
    {
        add(s, bitmap, true);
    }

    public void add(String s, Bitmap bitmap, boolean flag)
    {
        add(s, bitmap, flag, true);
    }

    public void add(String s, Bitmap bitmap, boolean flag, boolean flag1)
    {
        if(bitmap == null)
            throw new IllegalArgumentException("bitmap");
        if(s == null)
            throw new IllegalArgumentException("key");
        if(flag)
            bitmap = Utils.centerCrop(bitmap, 44, 44);
        ByteArrayOutputStream bytearrayoutputstream = new ByteArrayOutputStream();
        android.graphics.Bitmap.CompressFormat compressformat = android.graphics.Bitmap.CompressFormat.JPEG;
        if(bitmap.compress(compressformat, 85, bytearrayoutputstream) && bytearrayoutputstream != null)
        {
            byte abyte0[] = bytearrayoutputstream.toByteArray();
            bitmap = BitmapFactory.decodeStream(new ByteArrayInputStream(abyte0));
        }
        synchronized(lock)
        {
            Map map = mImages;
            SoftReference softreference = new SoftReference(bitmap);
            Object obj1 = map.put(s, softreference);
            ImageListener imagelistener = mListener;
            if(flag1 && imagelistener != null)
                imagelistener.onImageReady(s);
        }
    }

    public void add(String s, byte abyte0[])
    {
        int i = abyte0.length;
        Bitmap bitmap = BitmapFactory.decodeByteArray(abyte0, 0, i);
        add(s, bitmap);
    }

    public boolean contains(String s)
    {
        boolean flag = ((boolean) (lock));
        flag;
        JVM INSTR monitorenter ;
        if(s == null) goto _L2; else goto _L1
_L1:
        if(!mImages.containsKey(s)) goto _L2; else goto _L3
_L3:
        flag;
        JVM INSTR monitorexit ;
        flag = null;
_L5:
        return flag;
_L2:
        flag;
        JVM INSTR monitorexit ;
        flag = null;
        if(true) goto _L5; else goto _L4
_L4:
        Exception exception;
        exception;
        flag;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void destroy()
    {
        mDownloader.setPause(true);
        mListener = null;
        mProvider = null;
        mImages.clear();
    }

    public void empty()
    {
        synchronized(lock)
        {
            mImages.clear();
        }
    }

    public Bitmap get(String s)
    {
        Bitmap bitmap;
        if(s == null)
        {
            bitmap = null;
        } else
        {
            Bitmap bitmap1 = null;
            synchronized(lock)
            {
                if(mImages.containsKey(s) && mImages.get(s) != null)
                    bitmap1 = (Bitmap)((SoftReference)mImages.get(s)).get();
            }
            if(bitmap1 == null)
            {
                if(mDefaultImage != null)
                    bitmap1 = mDefaultImage;
                ImageProvider imageprovider = mProvider;
                if(imageprovider == null)
                {
                    mDownloader.download(s);
                } else
                {
                    boolean flag = remove(s);
                    boolean flag1 = imageprovider.onImageRequired(s);
                }
            }
            bitmap = bitmap1;
        }
        return bitmap;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public Bitmap getDefaultImage()
    {
        return mDefaultImage;
    }

    public boolean remove(String s)
    {
        boolean flag = ((boolean) (lock));
        flag;
        JVM INSTR monitorenter ;
        if(s == null) goto _L2; else goto _L1
_L1:
        if(!mImages.containsKey(s)) goto _L2; else goto _L3
_L3:
        Object obj = mImages.remove(s);
        flag;
        JVM INSTR monitorexit ;
        flag = null;
_L5:
        return flag;
_L2:
        flag;
        JVM INSTR monitorexit ;
        flag = null;
        if(true) goto _L5; else goto _L4
_L4:
        Exception exception;
        exception;
        flag;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void setDefaultImage(Bitmap bitmap)
    {
        mDefaultImage = bitmap;
    }

    public void setImageListener(ImageListener imagelistener)
    {
        mListener = imagelistener;
    }

    public void setImageProvider(ImageProvider imageprovider)
    {
        mProvider = imageprovider;
    }

    public void togglePauseOnDownloader(boolean flag)
    {
        if(mDownloader == null)
        {
            return;
        } else
        {
            mDownloader.setPause(flag);
            return;
        }
    }

    private final String TAG = "ThumbnailCache";
    private final Object lock;
    private Bitmap mDefaultImage;
    private final ImageDownloader mDownloader;
    private final Map mImages;
    private ImageListener mListener;
    private ImageProvider mProvider;
}

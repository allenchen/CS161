// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   PhotoCache.java

package com.nloko.android;

import Lcom.nloko.android.PhotoCache;;
import android.content.*;
import android.os.*;
import java.io.*;
import java.lang.ref.WeakReference;
import java.util.*;

// Referenced classes of package com.nloko.android:
//            Log, PhotoCacheListener

public class PhotoCache
{
    private static final class Photo
    {

        public byte bytes[];
        public String file;

        public Photo(String s, byte abyte0[])
        {
            file = s;
            bytes = abyte0;
        }
    }

    private final class AsyncHandler extends Handler
    {

        /**
         * @deprecated Method add is deprecated
         */

        private void add(String s, byte abyte0[])
        {
            this;
            JVM INSTR monitorenter ;
            if(abyte0 != null)
                break MISSING_BLOCK_LABEL_21;
            throw new IllegalArgumentException("bytes");
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
            if(s != null)
                break MISSING_BLOCK_LABEL_35;
            throw new IllegalArgumentException("file");
            File file1;
            boolean flag;
            if(!mSized)
                calculateSize();
            File file = mPath;
            file1 = new File(file, s);
            flag = file1.exists();
            if(!flag) goto _L2; else goto _L1
_L1:
            this;
            JVM INSTR monitorexit ;
            return;
_L2:
            flag = mExternalStorageWriteable;
            if(!flag)
                continue; /* Loop/switch isn't completed */
            ensurePath();
            FileOutputStream fileoutputstream = new FileOutputStream(file1);
            fileoutputstream.write(abyte0);
            fileoutputstream.close();
            updateSize(file1);
            if(mListener != null)
                mListener.onAdded(s);
            continue; /* Loop/switch isn't completed */
            FileNotFoundException filenotfoundexception;
            filenotfoundexception;
            filenotfoundexception.printStackTrace();
            continue; /* Loop/switch isn't completed */
            printStackTrace();
            if(true) goto _L1; else goto _L3
_L3:
        }

        /**
         * @deprecated Method calculateSize is deprecated
         */

        private void calculateSize()
        {
            this;
            JVM INSTR monitorenter ;
            boolean flag = mExternalStorageAvailable;
            if(flag) goto _L2; else goto _L1
_L1:
            this;
            JVM INSTR monitorexit ;
            return;
_L2:
            File afile1[];
            int i;
            int j;
            boolean flag1 = mSized = true;
            File afile[] = mPath.listFiles();
            if(afile == null)
                continue; /* Loop/switch isn't completed */
            afile1 = afile;
            i = afile1.length;
            j = 0;
_L4:
            if(j >= i)
                break; /* Loop/switch isn't completed */
            File file = afile1[j];
            updateSize(file);
            j++;
            if(true) goto _L4; else goto _L3
_L3:
            if(true) goto _L1; else goto _L5
_L5:
            Exception exception;
            exception;
            throw exception;
        }

        /**
         * @deprecated Method delete is deprecated
         */

        private void delete(String s)
        {
            this;
            JVM INSTR monitorenter ;
            boolean flag = mExternalStorageWriteable;
            if(flag && s != null) goto _L2; else goto _L1
_L1:
            this;
            JVM INSTR monitorexit ;
            return;
_L2:
            File file = mPath;
            File file1 = new File(file, s);
            if(!isNoMedia(file1) && file1.exists())
            {
                PhotoCache photocache = PhotoCache.this;
                long l = file1.length();
                long l1 = long l1 = ((write) (this)).write - s;
                boolean flag1 = file1.delete();
                if(mListener != null)
                    mListener.onDeleted(s);
                Object aobj[] = new Object[1];
                aobj[0] = s;
                String s1 = String.format("delete() deleted %s", aobj);
                Log.d("PhotoCache", s1);
            }
            if(true) goto _L1; else goto _L3
_L3:
            Exception exception;
            exception;
            throw exception;
        }

        /**
         * @deprecated Method deleteAll is deprecated
         */

        private void deleteAll()
        {
            this;
            JVM INSTR monitorenter ;
            File afile[] = mPath.listFiles();
            File afile1[] = afile;
            if(afile1 != null) goto _L2; else goto _L1
_L1:
            this;
            JVM INSTR monitorexit ;
            return;
_L2:
            File afile2[] = afile1;
            int i = afile2.length;
            for(int j = 0; j < i; j++)
            {
                File file = afile2[j];
                if(!mExternalStorageWriteable || isNoMedia(file))
                    continue;
                if(mSized)
                {
                    PhotoCache photocache = PhotoCache.this;
                    long l = file.length();
                    long l1 = long l1 = ((write) (this)).write - <no variable>;
                }
                boolean flag = file.delete();
            }

            if(mListener != null)
                mListener.onAllDeleted();
            if(true) goto _L1; else goto _L3
_L3:
            Exception exception;
            exception;
            throw exception;
        }

        /**
         * @deprecated Method ensurePath is deprecated
         */

        private void ensurePath()
        {
            this;
            JVM INSTR monitorenter ;
            boolean flag;
            if(mExternalStorageWriteable)
                flag = mPath.mkdirs();
            this;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            throw exception;
        }

        /**
         * @deprecated Method resize is deprecated
         */

        private void resize()
        {
            this;
            JVM INSTR monitorenter ;
            Object aobj[] = new Object[1];
            Integer integer = Integer.valueOf(mPhotos.size());
            aobj[0] = integer;
            String s = String.format("resize() map size %d", aobj);
            Log.d("PhotoCache", s);
_L4:
            if(mPhotos.isEmpty())
                break MISSING_BLOCK_LABEL_265;
            long l = mSize;
            long l1 = mMaxBytes;
            if(l <= l1)
                break MISSING_BLOCK_LABEL_265;
            if(mDeleteOrder != 0) goto _L2; else goto _L1
_L1:
            long l2 = ((Long)mPhotos.firstKey()).longValue();
_L3:
            TreeMap treemap = mPhotos;
            Long long1 = Long.valueOf(l2);
            String s2;
            for(Iterator iterator = ((List)treemap.get(long1)).iterator(); iterator.hasNext(); Log.v("PhotoCache", s2))
            {
                String s1 = (String)iterator.next();
                delete(s1);
                Object aobj1[] = new Object[1];
                Long long2 = Long.valueOf(mSize);
                aobj1[0] = long2;
                s2 = String.format("resize() %d", aobj1);
            }

            break MISSING_BLOCK_LABEL_237;
            Exception exception;
            exception;
            throw exception;
_L2:
            l2 = ((Long)mPhotos.lastKey()).longValue();
              goto _L3
            TreeMap treemap1 = mPhotos;
            Long long3 = Long.valueOf(l2);
            Object obj = treemap1.remove(long3);
              goto _L4
            this;
            JVM INSTR monitorexit ;
        }

        /**
         * @deprecated Method updateSize is deprecated
         */

        private void updateSize(File file)
        {
            this;
            JVM INSTR monitorenter ;
            long l = file.lastModified();
            TreeMap treemap = mPhotos;
            Long long1 = Long.valueOf(l);
            if(!treemap.containsKey(long1))
            {
                TreeMap treemap1 = mPhotos;
                Long long2 = Long.valueOf(l);
                ArrayList arraylist = new ArrayList();
                Object obj = treemap1.put(long2, arraylist);
            }
            TreeMap treemap2 = mPhotos;
            Long long3 = Long.valueOf(l);
            List list = (List)treemap2.get(long3);
            String s = file.getName();
            boolean flag = list.add(s);
            PhotoCache photocache = PhotoCache.this;
            long l1 = file.length();
            long l2 = long l1 = ((write) (this)).write + file;
            Object aobj[] = new Object[1];
            Long long4 = Long.valueOf(mSize);
            aobj[0] = long4;
            String s1 = String.format("updateSize() %d", aobj);
            Log.d("PhotoCache", s1);
            resize();
            this;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            throw exception;
        }

        public void handleMessage(Message message)
        {
            super.handleMessage(message);
            switch(message.what)
            {
            default:
                return;

            case 3: // '\003'
                Photo photo = (Photo)message.obj;
                if(photo == null)
                {
                    return;
                } else
                {
                    String s = photo.file;
                    byte abyte0[] = photo.bytes;
                    add(s, abyte0);
                    return;
                }

            case 1: // '\001'
                deleteAll();
                return;

            case 2: // '\002'
                String s1 = (String)message.obj;
                delete(s1);
                return;

            case 4: // '\004'
                stopWatchingExternalStorage();
                getLooper().quit();
                return;
            }
        }

        final PhotoCache this$0;

        public AsyncHandler(HandlerThread handlerthread)
        {
            this$0 = PhotoCache.this;
            Looper looper = handlerthread.getLooper();
            super(looper);
        }
    }


    public PhotoCache(Context context)
    {
        mMaxBytes = 0x4c4b40L;
        TreeMap treemap = new TreeMap();
        mPhotos = treemap;
        mSize = 0L;
        mSized = false;
        mDeleteOrder = 0;
        if(context == null)
        {
            throw new IllegalArgumentException("context");
        } else
        {
            WeakReference weakreference = new WeakReference(context);
            mContext = weakreference;
            File file = Environment.getExternalStorageDirectory();
            Object aobj[] = new Object[1];
            String s = context.getPackageName();
            aobj[0] = s;
            String s1 = String.format("Android/data/%s/cache/", aobj);
            File file1 = new File(file, s1);
            mPath = file1;
            startWatchingExternalStorage();
            HandlerThread handlerthread = new HandlerThread("PhotoCacheThread", 10);
            handlerthread.start();
            AsyncHandler asynchandler = new AsyncHandler(handlerthread);
            mHandler = asynchandler;
            return;
        }
    }

    public PhotoCache(Context context, long l)
    {
        this(context);
        mMaxBytes = l;
    }

    private boolean isNoMedia(File file)
    {
        boolean flag;
        if(file == null)
            flag = false;
        else
        if(file.getName().equals(".nomedia") && file.length() == 0L)
            flag = true;
        else
            flag = false;
        return flag;
    }

    private void startWatchingExternalStorage()
    {
        Context context = (Context)mContext.get();
        if(context == null)
        {
            return;
        } else
        {
            Log.v("PhotoCache", "Registering BroadcastReceiver");
            BroadcastReceiver broadcastreceiver = new BroadcastReceiver() {

                public void onReceive(Context context1, Intent intent1)
                {
                    StringBuilder stringbuilder = (new StringBuilder()).append("Storage: ");
                    android.net.Uri uri = intent1.getData();
                    String s = stringbuilder.append(uri).toString();
                    Log.d("PhotoCache", s);
                    updateExternalStorageState();
                }

                final PhotoCache this$0;

            
            {
                this$0 = PhotoCache.this;
                super();
            }
            };
            mExternalStorageReceiver = broadcastreceiver;
            IntentFilter intentfilter = new IntentFilter();
            intentfilter.addAction("android.intent.action.MEDIA_MOUNTED");
            intentfilter.addAction("android.intent.action.MEDIA_REMOVED");
            intentfilter.addAction("android.intent.action.MEDIA_UNMOUNTED");
            intentfilter.addDataScheme("file");
            BroadcastReceiver broadcastreceiver1 = mExternalStorageReceiver;
            Intent intent = context.registerReceiver(broadcastreceiver1, intentfilter);
            updateExternalStorageState();
            return;
        }
    }

    private void stopWatchingExternalStorage()
    {
        Context context = (Context)mContext.get();
        if(context == null)
        {
            return;
        } else
        {
            BroadcastReceiver broadcastreceiver = mExternalStorageReceiver;
            context.unregisterReceiver(broadcastreceiver);
            return;
        }
    }

    /**
     * @deprecated Method updateExternalStorageState is deprecated
     */

    private void updateExternalStorageState()
    {
        this;
        JVM INSTR monitorenter ;
        boolean flag = false;
        String s;
        mExternalStorageAvailable = false;
        mExternalStorageWriteable = false;
        s = Environment.getExternalStorageState();
        if(!"mounted".equals(s)) goto _L2; else goto _L1
_L1:
        mExternalStorageWriteable = true;
        mExternalStorageAvailable = true;
_L3:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        if(!"mounted_ro".equals(s))
            break MISSING_BLOCK_LABEL_67;
        mExternalStorageAvailable = true;
        mExternalStorageWriteable = false;
          goto _L3
        Exception exception;
        exception;
        throw exception;
        flag = false;
        mExternalStorageWriteable = flag;
        mExternalStorageAvailable = flag;
          goto _L3
    }

    public void add(String s, byte abyte0[])
    {
        Message message = mHandler.obtainMessage();
        message.what = 3;
        Photo photo = new Photo(s, abyte0);
        message.obj = photo;
        boolean flag = mHandler.sendMessage(message);
    }

    public void delete(String s)
    {
        Message message = mHandler.obtainMessage();
        message.what = 2;
        message.obj = s;
        boolean flag = mHandler.sendMessage(message);
    }

    public void deleteAll()
    {
        boolean flag = mHandler.sendEmptyMessage(1);
    }

    public void destroy()
    {
        deleteAll();
        releaseResources();
    }

    public InputStream get(String s)
    {
        Object obj;
        if(s == null)
        {
            obj = null;
        } else
        {
            File file = mPath;
            File file1 = new File(file, s);
            try
            {
                String s1 = file1.getAbsolutePath();
                obj = new FileInputStream(s1);
            }
            catch(FileNotFoundException filenotfoundexception)
            {
                obj = null;
            }
        }
        return ((InputStream) (obj));
    }

    public void releaseResources()
    {
        boolean flag = mHandler.sendEmptyMessage(4);
    }

    public void setDeleteOrder(int i)
    {
        if(i != 0 && i != 1)
        {
            return;
        } else
        {
            mDeleteOrder = i;
            return;
        }
    }

    public void setListener(PhotoCacheListener photocachelistener)
    {
        mListener = photocachelistener;
    }

    private static final int ADD = 3;
    public static final String BASE_DIR = "Android/data/%s/cache/";
    private static final int DELETE = 2;
    private static final int DELETE_ALL = 1;
    public static final int DELETE_NEWEST = 1;
    public static final int DELETE_OLDEST = 0;
    public static final String NO_MEDIA = ".nomedia";
    private static final int SHUTDOWN = 4;
    private static final String TAG = "PhotoCache";
    private WeakReference mContext;
    private int mDeleteOrder;
    private boolean mExternalStorageAvailable;
    private BroadcastReceiver mExternalStorageReceiver;
    private boolean mExternalStorageWriteable;
    private final AsyncHandler mHandler;
    private PhotoCacheListener mListener;
    public long mMaxBytes;
    private File mPath;
    private final TreeMap mPhotos;
    private long mSize;
    private boolean mSized;








/*
    static long access$414(PhotoCache photocache, long l)
    {
        long l1 = photocache.mSize + l;
        photocache.mSize = l1;
        return l1;
    }

*/


/*
    static long access$422(PhotoCache photocache, long l)
    {
        long l1 = photocache.mSize - l;
        photocache.mSize = l1;
        return l1;
    }

*/





/*
    static boolean access$702(PhotoCache photocache, boolean flag)
    {
        photocache.mSized = flag;
        return flag;
    }

*/


}

// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ThumbnailCache.java

package com.nloko.android;

import java.lang.ref.WeakReference;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

// Referenced classes of package com.nloko.android:
//            ThumbnailCache, Log

private static class setupThread
{

    private void setupThread()
    {
        ThumbnailCache thumbnailcache = (ThumbnailCache)mCache.get();
        _cls1 _lcls1 = new  Object(thumbnailcache)     /* anonymous class not found */
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



    public _cls1(ThumbnailCache thumbnailcache)
    {
        LinkedBlockingQueue linkedblockingqueue = new LinkedBlockingQueue();
        urlQueue = linkedblockingqueue;
        paused = false;
        WeakReference weakreference = new WeakReference(thumbnailcache);
        mCache = weakreference;
        setupThread();
    }
}

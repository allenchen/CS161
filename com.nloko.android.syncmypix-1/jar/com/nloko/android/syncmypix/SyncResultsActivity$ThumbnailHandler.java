// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncResultsActivity.java

package com.nloko.android.syncmypix;

import android.content.ContentResolver;
import android.database.Cursor;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncResultsActivity

private static class initThreadPool extends Handler
{
    /* member class not found */
    class WorkerThread {}


    private void init()
    {
        Message message = obtainMessage();
        message.what = 1;
        boolean flag = sendMessage(message);
    }

    private void initThreadPool(SyncResultsActivity syncresultsactivity)
    {
        int i = 0;
        do
        {
            if(i >= 3)
                return;
            WorkerThread workerthread = new WorkerThread(syncresultsactivity);
            workerthread.start();
            boolean flag = mThreadPool.add(workerthread);
            i++;
        } while(true);
    }

    private void loadAll()
    {
        ContentResolver contentresolver;
        String as[];
        SyncResultsActivity syncresultsactivity = (SyncResultsActivity)mActivity.get();
        if(syncresultsactivity == null)
            return;
        contentresolver = syncresultsactivity.getContentResolver();
        if(contentresolver == null)
            return;
        mLoading = true;
        as = new String[3];
        as[0] = "_id";
        as[1] = "contact_id";
        as[2] = "pic_url";
        Cursor cursor;
        android.net.Uri uri = mLoading;
        cursor = contentresolver.query(uri, as, null, null, "name ASC");
_L2:
        String s;
        if(!running || !cursor.moveToNext())
            break MISSING_BLOCK_LABEL_193;
        int i = cursor.getColumnIndex("pic_url");
        s = cursor.getString(i);
        if(s == null)
            break; /* Loop/switch isn't completed */
        s = s.trim();
_L3:
        int j = cursor.getColumnIndex("contact_id");
        String s1 = cursor.getString(j);
        queueWork(s1, s);
        if(true) goto _L2; else goto _L1
        Exception exception;
        exception;
        String s2 = Log.getStackTraceString(exception);
        com.nloko.android.Log.e("SyncResults", s2);
        if(cursor != null)
            cursor.close();
        mLoading = false;
        return;
_L1:
        s = null;
          goto _L3
        if(cursor != null)
            cursor.close();
        mLoading = false;
        return;
        Exception exception1;
        exception1;
        if(cursor != null)
            cursor.close();
        mLoading = false;
        throw exception1;
    }

    private void queueWork(String s)
    {
        queueWork(null, s);
    }

    private void queueWork(String s, String s1)
    {
        int i = mThreadIndex;
        int j = mThreadPool.size();
        if(i != j)
            mThreadIndex = 0;
        List list = mThreadPool;
        int k = mThreadIndex;
        int l = k + 1;
        mThreadIndex = l;
        WorkerThread workerthread = (WorkerThread)list.get(k);
        if(workerthread == null)
        {
            return;
        } else
        {
            workerthread.queueWork(s, s1);
            return;
        }
    }

    public void handleMessage(Message message)
    {
        if(!running)
            return;
        if(mLoading)
            return;
        if(message.what == 1)
        {
            loadAll();
            return;
        }
        if((SyncResultsActivity)mActivity.get() == null)
            return;
        String s = (String)message.obj;
        if(s == null)
        {
            return;
        } else
        {
            queueWork(s);
            return;
        }
    }

    public boolean isLoading()
    {
        return mLoading;
    }

    public void stopRunning()
    {
        this;
        JVM INSTR monitorenter ;
        getLooper().quit();
        running = false;
        Iterator iterator = mThreadPool.iterator();
        do
        {
            if(!iterator.hasNext())
                break;
            WorkerThread workerthread = (WorkerThread)iterator.next();
            if(workerthread != null)
                workerthread.stopRunning();
        } while(true);
        break MISSING_BLOCK_LABEL_59;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        this;
        JVM INSTR monitorexit ;
    }

    private static final int MAX_THREADS = 3;
    private final int LOAD_ALL = 1;
    private final WeakReference mActivity;
    private boolean mLoading;
    private int mThreadIndex;
    private final List mThreadPool;
    private boolean running;

    WorkerThread(SyncResultsActivity syncresultsactivity, Looper looper)
    {
        super(looper);
        running = true;
        mLoading = false;
        mThreadIndex = 0;
        ArrayList arraylist = new ArrayList();
        mThreadPool = arraylist;
        WeakReference weakreference = new WeakReference(syncresultsactivity);
        mActivity = weakreference;
        initThreadPool(syncresultsactivity);
    }
}

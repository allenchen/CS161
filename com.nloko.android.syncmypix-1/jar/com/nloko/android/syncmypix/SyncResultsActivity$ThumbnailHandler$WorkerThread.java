// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncResultsActivity.java

package com.nloko.android.syncmypix;

import android.content.ContentResolver;
import android.database.Cursor;
import android.graphics.BitmapFactory;
import android.util.Log;
import com.nloko.android.ThumbnailCache;
import com.nloko.android.syncmypix.contactutils.ContactUtils;
import java.lang.ref.WeakReference;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncResultsActivity

private static class mActivity extends Thread
{
    private final class Work
    {

        public String contactId;
        final SyncResultsActivity.ThumbnailHandler.WorkerThread this$0;
        public String url;

        public Work(String s, String s1)
        {
            this$0 = SyncResultsActivity.ThumbnailHandler.WorkerThread.this;
            super();
            contactId = s;
            url = s1;
        }
    }


    private String queryContact(String s)
    {
        SyncResultsActivity syncresultsactivity = (SyncResultsActivity)mActivity.get();
        if(syncresultsactivity != null) goto _L2; else goto _L1
_L1:
        String s1 = null;
_L4:
        return s1;
_L2:
        ContentResolver contentresolver;
        String s2;
        String as[];
        String s3;
        contentresolver = syncresultsactivity.getContentResolver();
        if(contentresolver == null)
        {
            s1 = null;
            continue; /* Loop/switch isn't completed */
        }
        s2 = (new StringBuilder()).append("pic_url='").append(s).append("'").toString();
        as = new String[3];
        as[0] = "_id";
        as[1] = "contact_id";
        as[2] = "pic_url";
        s3 = null;
        Cursor cursor;
        String s4;
        android.net.Uri uri = mActivity;
        cursor = contentresolver.query(uri, as, s2, null, "name ASC");
        if(!cursor.moveToNext())
            break MISSING_BLOCK_LABEL_145;
        int i = cursor.getColumnIndex("contact_id");
        s4 = cursor.getString(i);
        s3 = s4;
        if(cursor != null)
            cursor.close();
_L5:
        s1 = s3;
        if(true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        String s5 = Log.getStackTraceString(exception);
        com.nloko.android.Log.e("SyncResults", s5);
        if(cursor != null)
            cursor.close();
          goto _L5
        Exception exception1;
        exception1;
        if(cursor != null)
            cursor.close();
        throw exception1;
    }

    private void update(String s, String s1)
    {
        SyncResultsActivity syncresultsactivity;
        ContentResolver contentresolver;
        ContactUtils contactutils;
        if(s == null)
            return;
        if(s1 == null)
            return;
        syncresultsactivity = (SyncResultsActivity)mActivity.get();
        if(syncresultsactivity == null)
            return;
        if(SyncResultsActivity.access$200(syncresultsactivity).contains(s1))
            return;
        contentresolver = syncresultsactivity.getContentResolver();
        if(contentresolver == null)
            return;
        contactutils = SyncResultsActivity.access$800(syncresultsactivity);
        if(contactutils == null)
            return;
        android.graphics.rkerThread rkerthread = new android.graphics.rkerThread.mActivity();
        rkerthread.mActivity = 2;
        android.graphics.Bitmap bitmap = BitmapFactory.decodeStream(contactutils.getPhoto(contentresolver, s), null, rkerthread);
        if(bitmap == null)
        {
            return;
        } else
        {
            SyncResultsActivity.access$200(syncresultsactivity).add(s1, bitmap);
            return;
        }
        Exception exception;
        exception;
        String s2 = Log.getStackTraceString(exception);
        com.nloko.android.Log.e("SyncResults", s2);
        return;
        throw ;
    }

    public void queueWork(String s, String s1)
    {
        BlockingQueue blockingqueue = mQueue;
        Work work = new Work(s, s1);
        blockingqueue.put(work);
        return;
        printStackTrace();
    }

    public void run()
    {
        do
        {
            if(!running)
                return;
            try
            {
                Work work = (Work)mQueue.take();
                if(work != null && work.contactId == null)
                {
                    String s = work.url;
                    String s1 = queryContact(s);
                    work.contactId = s1;
                }
                String s2 = work.contactId;
                String s3 = work.url;
                update(s2, s3);
            }
            catch(InterruptedException interruptedexception)
            {
                com.nloko.android.Log.d("SyncResults", "INTERRUPTED!");
            }
        } while(true);
    }

    public void stopRunning()
    {
        running = false;
        interrupt();
    }

    private final WeakReference mActivity;
    private final BlockingQueue mQueue;
    private boolean running;

    public Work.url(SyncResultsActivity syncresultsactivity)
    {
        LinkedBlockingQueue linkedblockingqueue = new LinkedBlockingQueue();
        mQueue = linkedblockingqueue;
        running = true;
        WeakReference weakreference = new WeakReference(syncresultsactivity);
        mActivity = weakreference;
    }
}

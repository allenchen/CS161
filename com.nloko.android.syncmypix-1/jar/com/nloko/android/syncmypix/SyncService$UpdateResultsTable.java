// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncService.java

package com.nloko.android.syncmypix;

import android.content.ContentResolver;
import android.content.ContentValues;
import com.nloko.android.Log;
import java.lang.ref.WeakReference;
import java.util.Iterator;
import java.util.List;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncService

private static class finish extends Thread
{

    private void createResult(ContentValues contentvalues)
    {
        if(contentvalues == null)
            throw new IllegalArgumentException("values");
        SyncService syncservice = (SyncService)mService.get();
        if(syncservice == null)
        {
            return;
        } else
        {
            ContentResolver contentresolver = syncservice.getContentResolver();
            android.net.Uri uri = mService;
            android.net.Uri uri1 = contentresolver.insert(uri, contentvalues);
            return;
        }
    }

    public void run()
    {
label0:
        {
            StringBuilder stringbuilder = (new StringBuilder()).append("mStarted updating results at ");
            String s = Long.toString(System.currentTimeMillis());
            String s1 = stringbuilder.append(s).toString();
            Log.d("SyncService", s1);
            synchronized(list)
            {
                Iterator iterator = list.iterator();
                do
                {
                    if(!iterator.hasNext())
                        break;
                    ContentValues contentvalues = (ContentValues)iterator.next();
                    if(contentvalues != null)
                        createResult(contentvalues);
                } while(true);
                break label0;
            }
        }
        list.clear();
        list1;
        JVM INSTR monitorexit ;
        StringBuilder stringbuilder1 = (new StringBuilder()).append("Finished updating results at ");
        String s2 = Long.toString(System.currentTimeMillis());
        String s3 = stringbuilder1.append(s2).toString();
        Log.d("SyncService", s3);
        if(!finish)
            return;
        SyncService syncservice = (SyncService)mService.get();
        if(syncservice == null)
        {
            return;
        } else
        {
            mService mservice = syncservice.mMainHandler;
            Runnable runnable = syncservice.mMainHandler.mService;
            boolean flag = mservice.mService(runnable);
            return;
        }
    }

    private final boolean finish;
    private final List list;
    private final WeakReference mService;

    public (SyncService syncservice, List list1)
    {
        this(syncservice, list1, true);
    }

    public <init>(SyncService syncservice, List list1, boolean flag)
    {
        WeakReference weakreference = new WeakReference(syncservice);
        mService = weakreference;
        list = list1;
        finish = flag;
    }
}

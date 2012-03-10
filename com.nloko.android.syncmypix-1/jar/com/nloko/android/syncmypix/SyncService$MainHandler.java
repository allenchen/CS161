// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncService.java

package com.nloko.android.syncmypix;

import android.os.Handler;
import android.os.Message;
import java.lang.ref.WeakReference;
import java.util.List;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncService, SyncServiceListener, SyncWakeLock

protected static class mSyncService extends Handler
{

    public void handleError(int i)
    {
        SyncService syncservice = (SyncService)mSyncService.get();
        if(syncservice == null)
            return;
        Runnable runnable = resetExecuting;
        boolean flag = post(runnable);
        SyncServiceListener syncservicelistener = syncservice.mListener;
        if(syncservicelistener != null)
            syncservicelistener.onError(i);
        SyncService.access$300(syncservice, i);
    }

    public void handleMessage(Message message)
    {
        int i;
        switch(message.what)
        {
        default:
            return;

        case 0: // '\0'
            List list = (List)message.obj;
            startSync(list);
            return;

        case 1: // '\001'
            i = message.arg1;
            break;
        }
        handleError(i);
    }

    public void startSync(List list)
    {
        SyncService syncservice = (SyncService)mSyncService.get();
        if(syncservice == null)
        {
            return;
        } else
        {
            syncservice.updateStatus(2);
            handleError handleerror = new it>(syncservice);
            handleError handleerror1 = SyncService.access$402(syncservice, handleerror);
            handleError handleerror2 = SyncService.access$400(syncservice);
            List alist[] = new List[1];
            alist[0] = list;
            android.os.AsyncTask asynctask = handleerror2.cute(alist);
            return;
        }
    }

    public static final int SHOW_ERROR = 1;
    public static final int START_SYNC;
    public final Runnable finish;
    private final WeakReference mSyncService;
    public final Runnable resetExecuting;


    _cls2.this._cls0(SyncService syncservice)
    {
        Runnable runnable = new Runnable() {

            public void run()
            {
                SyncService syncservice1 = (SyncService)mSyncService.get();
                if(syncservice1 == null)
                {
                    return;
                } else
                {
                    boolean flag = SyncService.access$102(syncservice1, false);
                    syncservice1.updateStatus(0);
                    return;
                }
            }

            final SyncService.MainHandler this$0;

            
            {
                this$0 = SyncService.MainHandler.this;
                super();
            }
        };
        resetExecuting = runnable;
        Runnable runnable1 = new Runnable() {

            public void run()
            {
                SyncService syncservice1 = (SyncService)mSyncService.get();
                if(syncservice1 == null)
                    return;
                SyncServiceListener syncservicelistener = syncservice1.mListener;
                if(syncservicelistener != null)
                    syncservicelistener.onSyncCompleted();
                SyncService.access$200(syncservice1).clear();
                SyncWakeLock.releaseWakeLock();
                syncservice1.stopSelf();
            }

            final SyncService.MainHandler this$0;

            
            {
                this$0 = SyncService.MainHandler.this;
                super();
            }
        };
        finish = runnable1;
        WeakReference weakreference = new WeakReference(syncservice);
        mSyncService = weakreference;
    }
}

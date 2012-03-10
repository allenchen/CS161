// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncService.java

package com.nloko.android.syncmypix;

import java.lang.ref.WeakReference;
import java.util.List;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncService, SyncServiceListener, SyncWakeLock

class this._cls0
    implements Runnable
{

    public void run()
    {
        SyncService syncservice = (SyncService)cess._mth000(this._cls0.this).get();
        if(syncservice == null)
            return;
        SyncServiceListener syncservicelistener = syncservice.mListener;
        if(syncservicelistener != null)
            syncservicelistener.onSyncCompleted();
        SyncService.access$200(syncservice).clear();
        SyncWakeLock.releaseWakeLock();
        syncservice.stopSelf();
    }

    final ck this$0;

    ()
    {
        this$0 = this._cls0.this;
        super();
    }
}

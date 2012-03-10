// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncService.java

package com.nloko.android.syncmypix;

import java.lang.ref.WeakReference;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncService

class this._cls0
    implements Runnable
{

    public void run()
    {
        SyncService syncservice = (SyncService)cess._mth000(this._cls0.this).get();
        if(syncservice == null)
        {
            return;
        } else
        {
            boolean flag = SyncService.access$102(syncservice, false);
            syncservice.updateStatus(0);
            return;
        }
    }

    final this._cls0 this$0;

    ()
    {
        this$0 = this._cls0.this;
        super();
    }
}

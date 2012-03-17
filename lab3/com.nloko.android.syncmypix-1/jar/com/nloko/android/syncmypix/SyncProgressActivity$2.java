// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncProgressActivity.java

package com.nloko.android.syncmypix;

import Lcom.nloko.android.syncmypix.SyncProgressActivity;;
import android.view.View;
import java.lang.ref.WeakReference;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncProgressActivity, SyncService

class this._cls0
    implements android.view.ressActivity._cls2
{

    public void onClick(View view)
    {
        SyncService syncservice = (SyncService)SyncProgressActivity.access$000(SyncProgressActivity.this).get();
        if(syncservice == null)
            return;
        if(!syncservice.isExecuting())
        {
            return;
        } else
        {
            syncservice.cancelOperation();
            return;
        }
    }

    final SyncProgressActivity this$0;

    ()
    {
        this$0 = SyncProgressActivity.this;
        super();
    }
}

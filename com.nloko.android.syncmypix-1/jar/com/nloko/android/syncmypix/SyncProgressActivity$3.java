// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncProgressActivity.java

package com.nloko.android.syncmypix;

import Lcom.nloko.android.syncmypix.SyncProgressActivity;;
import android.content.ComponentName;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.widget.*;
import com.nloko.android.Log;
import java.lang.ref.WeakReference;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncProgressActivity, SyncService

class this._cls0
    implements ServiceConnection
{

    public void onServiceConnected(ComponentName componentname, IBinder ibinder)
    {
        SyncProgressActivity syncprogressactivity = SyncProgressActivity.this;
        SyncService syncservice = (()ibinder).getService();
        WeakReference weakreference = new WeakReference(syncservice);
        WeakReference weakreference1 = SyncProgressActivity.access$002(syncprogressactivity, weakreference);
        SyncService syncservice1 = (SyncService)SyncProgressActivity.access$000(SyncProgressActivity.this).get();
        if(syncservice1 == null)
            return;
        int i = syncservice1.getStatus();
        _cls1 _lcls1;
        if(i == 1)
        {
            SyncProgressActivity.access$100(SyncProgressActivity.this).setText(0x7f060027);
        } else
        {
            if(i == 0)
            {
                Toast.makeText(getApplicationContext(), 0x7f06002c, 0).show();
                finish();
                return;
            }
            SyncProgressActivity.access$200(SyncProgressActivity.this).setVisibility(0);
            SyncProgressActivity.access$300(SyncProgressActivity.this).setVisibility(0);
        }
        _lcls1 = new  Object()     /* anonymous class not found */
    class _anm1 {}

;
        syncservice1.setListener(_lcls1);
    }

    public void onServiceDisconnected(ComponentName componentname)
    {
        Log.d("SyncProgressActivity", "onServiceDisconnected");
        boolean flag = SyncProgressActivity.access$902(SyncProgressActivity.this, false);
        SyncService syncservice = (SyncService)SyncProgressActivity.access$000(SyncProgressActivity.this).get();
        if(syncservice != null)
            syncservice.unsetListener();
        WeakReference weakreference = SyncProgressActivity.access$002(SyncProgressActivity.this, null);
        finish();
    }

    final SyncProgressActivity this$0;

    ()
    {
        this$0 = SyncProgressActivity.this;
        super();
    }
}

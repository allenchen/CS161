// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   MainActivity.java

package com.nloko.android.syncmypix;

import Lcom.nloko.android.syncmypix.MainActivity;;
import android.content.*;
import android.os.IBinder;
import com.nloko.android.Log;
import java.lang.ref.WeakReference;

// Referenced classes of package com.nloko.android.syncmypix:
//            MainActivity, SyncService, SyncProgressActivity

class this._cls0
    implements ServiceConnection
{

    public void onServiceConnected(ComponentName componentname, IBinder ibinder)
    {
        Log.d("MainActivity", "onServiceConnected");
        MainActivity mainactivity = MainActivity.this;
        SyncService syncservice = ((lBinder)ibinder).getService();
        WeakReference weakreference = new WeakReference(syncservice);
        WeakReference weakreference1 = MainActivity.access$302(mainactivity, weakreference);
        if(MainActivity.access$300(MainActivity.this) == null)
            return;
        SyncService syncservice1 = (SyncService)MainActivity.access$300(MainActivity.this).get();
        if(syncservice1 == null)
            return;
        if(!syncservice1.isExecuting())
        {
            return;
        } else
        {
            android.content.Context context = syncservice1.getApplicationContext();
            Intent intent = new Intent(context, com/nloko/android/syncmypix/SyncProgressActivity);
            Intent intent1 = intent.addFlags(0x20020000);
            startActivity(intent);
            return;
        }
    }

    public void onServiceDisconnected(ComponentName componentname)
    {
        Log.d("MainActivity", "onServiceDisconnected");
        WeakReference weakreference = MainActivity.access$302(MainActivity.this, null);
    }

    final MainActivity this$0;

    vity()
    {
        this$0 = MainActivity.this;
        super();
    }
}

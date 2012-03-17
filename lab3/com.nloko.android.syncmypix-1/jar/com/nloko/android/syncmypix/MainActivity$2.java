// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   MainActivity.java

package com.nloko.android.syncmypix;

import Lcom.nloko.android.syncmypix.MainActivity;;
import android.content.Intent;
import android.view.View;

// Referenced classes of package com.nloko.android.syncmypix:
//            MainActivity, SettingsActivity

class this._cls0
    implements android.view.tener
{

    public void onClick(View view)
    {
        android.content.Context context = getApplicationContext();
        Intent intent = new Intent(context, com/nloko/android/syncmypix/SettingsActivity);
        startActivity(intent);
    }

    final MainActivity this$0;

    y()
    {
        this$0 = MainActivity.this;
        super();
    }
}

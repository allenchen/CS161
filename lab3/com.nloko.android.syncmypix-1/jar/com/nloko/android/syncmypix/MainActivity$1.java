// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   MainActivity.java

package com.nloko.android.syncmypix;

import Lcom.nloko.android.syncmypix.MainActivity;;
import android.view.View;

// Referenced classes of package com.nloko.android.syncmypix:
//            MainActivity

class this._cls0
    implements android.view.tener
{

    public void onClick(View view)
    {
        android.content.Context context = getApplicationContext();
        Class class1 = MainActivity.getSyncSource(getApplicationContext());
        if(MainActivity.isLoggedInFromSyncSource(context, class1))
        {
            MainActivity.access$000(MainActivity.this);
            return;
        } else
        {
            MainActivity.access$100(MainActivity.this);
            return;
        }
    }

    final MainActivity this$0;

    ()
    {
        this$0 = MainActivity.this;
        super();
    }
}

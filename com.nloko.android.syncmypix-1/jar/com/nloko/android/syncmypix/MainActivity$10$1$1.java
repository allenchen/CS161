// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   MainActivity.java

package com.nloko.android.syncmypix;

import android.widget.Toast;

// Referenced classes of package com.nloko.android.syncmypix:
//            MainActivity

class this._cls2
    implements Runnable
{

    public void run()
    {
        dismissDialog(4);
        Toast.makeText(getApplicationContext(), 0x7f060044, 1).show();
    }

    final icationContext this$2;

    ()
    {
        this$2 = this._cls2.this;
        super();
    }
}

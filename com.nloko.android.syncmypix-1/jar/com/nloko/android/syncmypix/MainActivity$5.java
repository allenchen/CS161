// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   MainActivity.java

package com.nloko.android.syncmypix;

import Lcom.nloko.android.syncmypix.MainActivity;;
import android.content.Intent;
import android.net.Uri;
import android.view.View;

// Referenced classes of package com.nloko.android.syncmypix:
//            MainActivity

class this._cls0
    implements android.view.tener
{

    public void onClick(View view)
    {
        Uri uri = Uri.parse(getString(0x7f06005b));
        Intent intent = new Intent("android.intent.action.VIEW", uri);
        startActivity(intent);
    }

    final MainActivity this$0;

    ()
    {
        this$0 = MainActivity.this;
        super();
    }
}

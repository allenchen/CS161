// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncResultsActivity.java

package com.nloko.android.syncmypix;

import Lcom.nloko.android.syncmypix.SyncResultsActivity;;
import android.content.Intent;
import android.view.View;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncResultsActivity, MainActivity

class this._cls0
    implements android.view.ultsActivity._cls6
{

    public void onClick(View view)
    {
        android.content.Context context = getApplicationContext();
        Intent intent = new Intent(context, com/nloko/android/syncmypix/MainActivity);
        Intent intent1 = intent.addFlags(0x20020000);
        startActivity(intent);
        finish();
    }

    final SyncResultsActivity this$0;

    ()
    {
        this$0 = SyncResultsActivity.this;
        super();
    }
}

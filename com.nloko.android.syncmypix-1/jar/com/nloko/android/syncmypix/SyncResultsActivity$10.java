// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncResultsActivity.java

package com.nloko.android.syncmypix;

import Lcom.nloko.android.syncmypix.SyncResultsActivity;;
import android.content.DialogInterface;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncResultsActivity

class this._cls0
    implements android.content.lListener
{

    public void onCancel(DialogInterface dialoginterface)
    {
        removeDialog(1);
    }

    final SyncResultsActivity this$0;

    ()
    {
        this$0 = SyncResultsActivity.this;
        super();
    }
}

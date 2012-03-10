// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncResultsActivity.java

package com.nloko.android.syncmypix;

import Lcom.nloko.android.syncmypix.SyncResultsActivity;;
import android.content.DialogInterface;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncResultsActivity, SyncMyPixDbHelper

class this._cls0
    implements android.content.Listener
{

    public void onClick(DialogInterface dialoginterface, int i)
    {
        removeDialog(5);
        showDialog(6);
        SyncMyPixDbHelper syncmypixdbhelper = SyncResultsActivity.access$900(SyncResultsActivity.this);
        _cls1 _lcls1 = new  Object()     /* anonymous class not found */
    class _anm1 {}

;
        syncmypixdbhelper.deleteAllPictures(_lcls1);
    }

    final SyncResultsActivity this$0;

    _cls1()
    {
        this$0 = SyncResultsActivity.this;
        super();
    }
}

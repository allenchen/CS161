// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncResultsActivity.java

package com.nloko.android.syncmypix;


// Referenced classes of package com.nloko.android.syncmypix:
//            DbHelperNotifier, SyncResultsActivity

class this._cls1
    implements DbHelperNotifier
{

    public void onUpdateComplete()
    {
        SyncResultsActivity syncresultsactivity = _fld0;
        _cls1 _lcls1 = new  Object()     /* anonymous class not found */
    class _anm1 {}

;
        syncresultsactivity.runOnUiThread(_lcls1);
    }

    final UiThread this$1;

    _cls1()
    {
        this$1 = this._cls1.this;
        super();
    }
}

// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   MainActivity.java

package com.nloko.android.syncmypix;

import android.widget.Toast;

// Referenced classes of package com.nloko.android.syncmypix:
//            DbHelperNotifier, MainActivity

class this._cls1
    implements DbHelperNotifier
{

    public void onUpdateComplete()
    {
        MainActivity mainactivity = _fld0;
        Runnable runnable = new Runnable() {

            public void run()
            {
                dismissDialog(4);
                Toast.makeText(getApplicationContext(), 0x7f060044, 1).show();
            }

            final MainActivity._cls10._cls1 this$2;

            
            {
                this$2 = MainActivity._cls10._cls1.this;
                super();
            }
        };
        mainactivity.runOnUiThread(runnable);
    }

    final UiThread this$1;

    _cls1.this._cls2()
    {
        this$1 = this._cls1.this;
        super();
    }
}

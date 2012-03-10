// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   MainActivity.java

package com.nloko.android.syncmypix;

import Lcom.nloko.android.syncmypix.MainActivity;;
import android.widget.CompoundButton;
import com.nloko.android.Utils;

// Referenced classes of package com.nloko.android.syncmypix:
//            MainActivity

class this._cls0
    implements android.widget.nCheckedChangeListener
{

    public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
    {
        Utils.setBoolean(getSharedPreferences("SyncMyPixPrefs", 0), "do_not_show_about", flag);
    }

    final MainActivity this$0;

    eListener()
    {
        this$0 = MainActivity.this;
        super();
    }
}

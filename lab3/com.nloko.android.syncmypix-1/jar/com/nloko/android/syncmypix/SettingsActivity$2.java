// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SettingsActivity.java

package com.nloko.android.syncmypix;

import Lcom.nloko.android.syncmypix.SettingsActivity;;
import android.preference.CheckBoxPreference;
import android.preference.Preference;

// Referenced classes of package com.nloko.android.syncmypix:
//            SettingsActivity

class val.sync
    implements android.preference.enceClickListener
{

    public boolean onPreferenceClick(Preference preference)
    {
        boolean flag = val$skip.isChecked();
        if(flag)
        {
            CheckBoxPreference checkboxpreference = val$sync;
            boolean flag1;
            if(!flag)
                flag1 = true;
            else
                flag1 = false;
            checkboxpreference.setChecked(flag1);
        }
        return false;
    }

    final SettingsActivity this$0;
    final CheckBoxPreference val$skip;
    final CheckBoxPreference val$sync;

    Listener()
    {
        this$0 = final_settingsactivity;
        val$skip = checkboxpreference;
        val$sync = CheckBoxPreference.this;
        super();
    }
}

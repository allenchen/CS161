// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SettingsActivity.java

package com.nloko.android.syncmypix;

import Lcom.nloko.android.syncmypix.SettingsActivity;;
import android.preference.Preference;
import com.nloko.android.Utils;

// Referenced classes of package com.nloko.android.syncmypix:
//            SettingsActivity, MainActivity, SyncService

class this._cls0
    implements android.preference.enceChangeListener
{

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        int i = Integer.parseInt((String)obj);
        Utils.setInt(getSharedPreferences("SyncMyPixPrefs", 0), "sched_freq", i);
        long l = SettingsActivity.getScheduleInterval(i);
        if(l > 0L)
        {
            long l1 = System.currentTimeMillis() + l;
            Utils.setLong(getSharedPreferences("SyncMyPixPrefs", 0), "sched_time", l1);
            SettingsActivity settingsactivity = SettingsActivity.this;
            Class class1 = MainActivity.getSyncSource(getBaseContext());
            SyncService.updateSchedule(settingsactivity, class1, l1, l);
        } else
        {
            SettingsActivity settingsactivity1 = SettingsActivity.this;
            Class class2 = MainActivity.getSyncSource(getBaseContext());
            SyncService.cancelSchedule(settingsactivity1, class2);
        }
        return true;
    }

    final SettingsActivity this$0;

    eListener()
    {
        this$0 = SettingsActivity.this;
        super();
    }
}

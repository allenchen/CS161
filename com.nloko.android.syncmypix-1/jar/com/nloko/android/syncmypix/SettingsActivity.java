// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SettingsActivity.java

package com.nloko.android.syncmypix;

import Lcom.nloko.android.syncmypix.SettingsActivity;;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.os.Bundle;
import android.preference.*;
import com.nloko.android.Log;
import com.nloko.android.Utils;

// Referenced classes of package com.nloko.android.syncmypix:
//            MainActivity, SyncService

public class SettingsActivity extends PreferenceActivity
{

    public SettingsActivity()
    {
    }

    public static long getScheduleInterval(int i)
    {
        i;
        JVM INSTR tableswitch 1 3: default 28
    //                   1 34
    //                   2 41
    //                   3 48;
           goto _L1 _L2 _L3 _L4
_L1:
        long l = 65535L;
_L6:
        return l;
_L2:
        l = 0x5265c00L;
        continue; /* Loop/switch isn't completed */
_L3:
        l = 0x240c8400L;
        continue; /* Loop/switch isn't completed */
_L4:
        l = 0x9a7ec800L;
        if(true) goto _L6; else goto _L5
_L5:
    }

    private void setLoginStatus(int i)
    {
        ((EditTextPreference)findPreference("loginStatus")).setSummary(i);
    }

    private void setupViews(Bundle bundle)
    {
        addPreferencesFromResource(0x7f030004);
        final CheckBoxPreference skip = (CheckBoxPreference)findPreference("skipIfExists");
        final CheckBoxPreference sync = (CheckBoxPreference)findPreference("allowGoogleSync");
        int i;
        ListPreference listpreference;
        int j;
        android.preference.Preference.OnPreferenceChangeListener onpreferencechangelistener;
        android.content.Context context;
        Class class1;
        if(Utils.determineOsVersion() >= 5)
        {
            skip.setChecked(false);
            skip.setEnabled(false);
            sync.setChecked(true);
            sync.setEnabled(false);
        } else
        {
            _cls1 _lcls1 = new  Object(sync, skip)     /* anonymous class not found */
    class _anm1 {}

;
            sync.setOnPreferenceClickListener(_lcls1);
            android.preference.Preference.OnPreferenceClickListener onpreferenceclicklistener = new android.preference.Preference.OnPreferenceClickListener() {

                public boolean onPreferenceClick(Preference preference)
                {
                    boolean flag = skip.isChecked();
                    if(flag)
                    {
                        CheckBoxPreference checkboxpreference = sync;
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

            
            {
                this$0 = SettingsActivity.this;
                skip = checkboxpreference;
                sync = checkboxpreference1;
                super();
            }
            };
            skip.setOnPreferenceClickListener(onpreferenceclicklistener);
        }
        i = getSharedPreferences("SyncMyPixPrefs", 0).getInt("sched_freq", 0);
        listpreference = (ListPreference)findPreference("sched_freq");
        j = Integer.parseInt(listpreference.getValue());
        if(i != j)
            listpreference.setValueIndex(i);
        onpreferencechangelistener = new android.preference.Preference.OnPreferenceChangeListener() {

            public boolean onPreferenceChange(Preference preference, Object obj)
            {
                int k = Integer.parseInt((String)obj);
                Utils.setInt(getSharedPreferences("SyncMyPixPrefs", 0), "sched_freq", k);
                long l = SettingsActivity.getScheduleInterval(k);
                if(l > 0L)
                {
                    long l1 = System.currentTimeMillis() + l;
                    Utils.setLong(getSharedPreferences("SyncMyPixPrefs", 0), "sched_time", l1);
                    SettingsActivity settingsactivity = SettingsActivity.this;
                    Class class2 = MainActivity.getSyncSource(getBaseContext());
                    SyncService.updateSchedule(settingsactivity, class2, l1, l);
                } else
                {
                    SettingsActivity settingsactivity1 = SettingsActivity.this;
                    Class class3 = MainActivity.getSyncSource(getBaseContext());
                    SyncService.cancelSchedule(settingsactivity1, class3);
                }
                return true;
            }

            final SettingsActivity this$0;

            
            {
                this$0 = SettingsActivity.this;
                super();
            }
        };
        listpreference.setOnPreferenceChangeListener(onpreferencechangelistener);
        context = getBaseContext();
        class1 = MainActivity.getSyncSource(getBaseContext());
        if(!MainActivity.isLoggedInFromSyncSource(context, class1))
        {
            return;
        } else
        {
            setLoginStatus(0x7f06001f);
            return;
        }
    }

    protected void finalize()
        throws Throwable
    {
        super.finalize();
        Log.d("GlobalConfig", "FINALIZED");
    }

    public void onConfigurationChanged(Configuration configuration)
    {
        super.onConfigurationChanged(configuration);
        setupViews(null);
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        setupViews(bundle);
    }

    public static final String PREFS_NAME = "SyncMyPixPrefs";
    private static final String TAG = "GlobalConfig";
}

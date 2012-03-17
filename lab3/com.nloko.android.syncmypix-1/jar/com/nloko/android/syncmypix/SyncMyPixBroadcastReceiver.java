// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncMyPixBroadcastReceiver.java

package com.nloko.android.syncmypix;

import android.content.*;
import com.nloko.android.Log;
import com.nloko.android.Utils;

// Referenced classes of package com.nloko.android.syncmypix:
//            SettingsActivity, MainActivity, SyncService, SyncWakeLock

public class SyncMyPixBroadcastReceiver extends BroadcastReceiver
{

    public SyncMyPixBroadcastReceiver()
    {
    }

    private void rescheduleAlarm(Context context)
    {
        SharedPreferences sharedpreferences = context.getSharedPreferences("SyncMyPixPrefs", 0);
        int i = sharedpreferences.getInt("sched_freq", 0);
        long l = sharedpreferences.getLong("sched_time", 0L);
        long l1 = SettingsActivity.getScheduleInterval(i);
        String s = (new StringBuilder()).append("freq: ").append(i).toString();
        Log.d("SyncMyPixBroadcastReceiver", s);
        String s1 = (new StringBuilder()).append("time: ").append(l).toString();
        Log.d("SyncMyPixBroadcastReceiver", s1);
        String s2 = (new StringBuilder()).append("interval: ").append(l1).toString();
        Log.d("SyncMyPixBroadcastReceiver", s2);
        long l2 = System.currentTimeMillis();
        if(l < l2)
        {
            l += l1;
            String s3 = (new StringBuilder()).append("time + interval: ").append(l).toString();
            Log.d("SyncMyPixBroadcastReceiver", s3);
            Utils.setLong(context.getSharedPreferences("SyncMyPixPrefs", 0), "sched_time", l);
        }
        if(l1 <= 0L)
        {
            return;
        } else
        {
            Log.d("SyncMyPixBroadcastReceiver", "Scheduling Service...");
            Class class1 = MainActivity.getSyncSource(context);
            SyncService.updateSchedule(context, class1, l, l1);
            return;
        }
    }

    public void onReceive(Context context, Intent intent)
    {
        Log.d("SyncMyPixBroadcastReceiver", "RECEIVED INTENT");
        String s = intent.getAction();
        if(s.equals("android.intent.action.BOOT_COMPLETED"))
        {
            Context context1 = context.getApplicationContext();
            rescheduleAlarm(context1);
            return;
        }
        if(s.equals("android.intent.action.PACKAGE_REPLACED"))
        {
            Log.d("SyncMyPixBroadcastReceiver", "ACTION_PACKAGE_REPLACED");
            Utils.setBoolean(context.getSharedPreferences("SyncMyPixPrefs", 0), "do_not_show_about", false);
            Context context2 = context.getApplicationContext();
            rescheduleAlarm(context2);
            return;
        }
        if(s.equals("com.nloko.android.syncmypix.SYNC"))
        {
            Context context3 = context.getApplicationContext();
            SyncWakeLock.acquireWakeLock(context3);
            Class class1 = MainActivity.getSyncSource(context3);
            Intent intent1 = new Intent(context3, class1);
            android.content.ComponentName componentname = context3.startService(intent1);
            return;
        }
        if(!s.equals("android.intent.action.SYNC_STATE_CHANGED"))
            return;
        else
            return;
    }

    private static final String SYNC_STATE_CHANGED = "android.intent.action.SYNC_STATE_CHANGED";
    private static final String TAG = "SyncMyPixBroadcastReceiver";
}

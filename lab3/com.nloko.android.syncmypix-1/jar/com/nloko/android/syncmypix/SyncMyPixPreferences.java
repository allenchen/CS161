// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncMyPixPreferences.java

package com.nloko.android.syncmypix;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;

public final class SyncMyPixPreferences
{

    public SyncMyPixPreferences(Context context1)
    {
        if(context1 == null)
        {
            throw new IllegalArgumentException("context");
        } else
        {
            context = context1;
            getPreferences(context1);
            return;
        }
    }

    private void getPreferences(Context context1)
    {
        SharedPreferences sharedpreferences = PreferenceManager.getDefaultSharedPreferences(context1);
        boolean flag = sharedpreferences.getBoolean("googleSyncToggledOff", false);
        googleSyncToggledOff = flag;
        boolean flag1 = sharedpreferences.getBoolean("skipIfConflict", false);
        skipIfConflict = flag1;
        boolean flag2 = sharedpreferences.getBoolean("maxQuality", false);
        maxQuality = flag2;
        boolean flag3 = sharedpreferences.getBoolean("allowGoogleSync", false);
        allowGoogleSync = flag3;
        boolean flag4;
        boolean flag5;
        boolean flag6;
        boolean flag7;
        boolean flag8;
        boolean flag9;
        boolean flag10;
        if(Integer.parseInt(android.os.Build.VERSION.SDK) >= 5)
            flag4 = false;
        else
            flag4 = true;
        flag5 = sharedpreferences.getBoolean("skipIfExists", flag4);
        skipIfExists = flag5;
        flag6 = sharedpreferences.getBoolean("overrideReadOnlyCheck", false);
        overrideReadOnlyCheck = flag6;
        flag7 = sharedpreferences.getBoolean("cropSquare", true);
        cropSquare = flag7;
        flag8 = sharedpreferences.getBoolean("intelliMatch", true);
        intelliMatch = flag8;
        flag9 = sharedpreferences.getBoolean("phoneOnly", false);
        phoneOnly = flag9;
        flag10 = sharedpreferences.getBoolean("cache", true);
        cache = flag10;
    }

    public boolean getAllowGoogleSync()
    {
        return allowGoogleSync;
    }

    public boolean getCache()
    {
        return cache;
    }

    public boolean getCropSquare()
    {
        return cropSquare;
    }

    public boolean getIntelliMatch()
    {
        return intelliMatch;
    }

    public boolean getMaxQuality()
    {
        return maxQuality;
    }

    public boolean getPhoneOnly()
    {
        return phoneOnly;
    }

    public boolean getSkipIfConflict()
    {
        return skipIfConflict;
    }

    public boolean getSkipIfExists()
    {
        return skipIfExists;
    }

    public String getSource()
    {
        return source;
    }

    public boolean isGoogleSyncToggledOff()
    {
        return googleSyncToggledOff;
    }

    public boolean overrideReadOnlyCheck()
    {
        return overrideReadOnlyCheck;
    }

    private boolean allowGoogleSync;
    private boolean cache;
    protected Context context;
    private boolean cropSquare;
    private boolean googleSyncToggledOff;
    private boolean intelliMatch;
    private boolean maxQuality;
    private boolean overrideReadOnlyCheck;
    private boolean phoneOnly;
    private boolean skipIfConflict;
    private boolean skipIfExists;
    private String source;
}

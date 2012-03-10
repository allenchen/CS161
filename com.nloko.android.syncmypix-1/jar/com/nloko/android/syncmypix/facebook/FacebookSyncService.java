// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   FacebookSyncService.java

package com.nloko.android.syncmypix.facebook;

import android.content.*;
import com.nloko.android.Log;
import com.nloko.android.syncmypix.SyncService;
import com.nloko.android.syncmypix.SyncServiceListener;

// Referenced classes of package com.nloko.android.syncmypix.facebook:
//            FacebookLoginWebView

public class FacebookSyncService extends SyncService
{
    /* member class not found */
    class FacebookLogin {}


    public FacebookSyncService()
    {
    }

    public static Class getLoginClass()
    {
        return com/nloko/android/syncmypix/facebook/FacebookLoginWebView;
    }

    public static boolean isLoggedIn(Context context)
    {
        SharedPreferences sharedpreferences = context.getSharedPreferences("SyncMyPixPrefs", 0);
        String s = sharedpreferences.getString("session_key", null);
        String s1 = sharedpreferences.getString("secret", null);
        String s2 = sharedpreferences.getString("uid", null);
        boolean flag;
        if(s != null && s1 != null && s2 != null)
            flag = true;
        else
            flag = false;
        return flag;
    }

    protected void finalize()
        throws Throwable
    {
        super.finalize();
        Log.d("FacebookSyncService", "FINALIZED");
    }

    public String getSocialNetworkName()
    {
        return "Facebook";
    }

    public void onDestroy()
    {
        super.onDestroy();
        if(mLoginThread == null)
        {
            return;
        } else
        {
            mLoginThread.stopRunning();
            return;
        }
    }

    public void onStart(Intent intent, int i)
    {
        super.onStart(intent, i);
        Log.d("FacebookSyncService", "Staring FacebookSyncService");
        FacebookLogin facebooklogin = new FacebookLogin();
        mLoginThread = facebooklogin;
        mLoginThread.start();
    }

    private static final String TAG = "FacebookSyncService";
    private FacebookLogin mLoginThread;




}

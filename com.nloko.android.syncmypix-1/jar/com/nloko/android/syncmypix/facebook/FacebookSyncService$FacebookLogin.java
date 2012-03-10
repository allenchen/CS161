// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   FacebookSyncService.java

package com.nloko.android.syncmypix.facebook;

import android.content.SharedPreferences;
import android.os.Message;
import com.nloko.android.Log;
import com.nloko.android.syncmypix.SyncServiceListener;
import com.nloko.simplyfacebook.net.FacebookRestClient;
import java.lang.ref.WeakReference;

// Referenced classes of package com.nloko.android.syncmypix.facebook:
//            FacebookSyncService, FacebookApi

private static class d extends Thread
{

    public void run()
    {
        FacebookSyncService facebooksyncservice;
        com.nloko.android.syncmypix.ookLogin ooklogin;
        FacebookRestClient facebookrestclient;
        facebooksyncservice = (FacebookSyncService)mService.get();
        if(facebooksyncservice == null)
            return;
        ooklogin = FacebookSyncService.access$100(facebooksyncservice);
        if(ooklogin == null)
            return;
        facebookrestclient = null;
        String s = facebooksyncservice.getSharedPreferences("SyncMyPixPrefs", 0).getString("uid", null);
        Log.d("FacebookSyncService", s);
        String s1 = facebooksyncservice.getSharedPreferences("SyncMyPixPrefs", 0).getString("session_key", null);
        Log.d("FacebookSyncService", s1);
        String s2 = facebooksyncservice.getSharedPreferences("SyncMyPixPrefs", 0).getString("secret", null);
        Log.d("FacebookSyncService", s2);
        FacebookRestClient facebookrestclient1;
        String s3 = facebooksyncservice.getSharedPreferences("SyncMyPixPrefs", 0).getString("uid", null);
        String s4 = facebooksyncservice.getSharedPreferences("SyncMyPixPrefs", 0).getString("session_key", null);
        String s5 = facebooksyncservice.getSharedPreferences("SyncMyPixPrefs", 0).getString("secret", null);
        facebookrestclient1 = new FacebookRestClient("d03f3dcb1ebb264e1ea701bd16f44e5a", s3, s4, s5);
        FacebookApi facebookapi;
        String s6;
        boolean flag;
        facebookapi = new FacebookApi(facebookrestclient1);
        s6 = facebookapi.getFriends();
        flag = FacebookSyncService.access$200(facebooksyncservice);
        java.util.List list = facebookapi.getUserInfo(s6, flag);
        this;
        JVM INSTR monitorenter ;
        if(running)
        {
            Message message = ooklogin.age();
            message.what = 0;
            message.obj = list;
            boolean flag1 = ooklogin.e(message);
        }
        this;
        JVM INSTR monitorexit ;
        FacebookRestClient facebookrestclient2 = facebookrestclient1;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        Exception exception1;
        exception1;
        facebookrestclient = facebookrestclient1;
_L2:
        String s7 = android.util.Log.getStackTraceString(exception1);
        Log.e("FacebookSyncService", s7);
        if(ooklogin == null)
            return;
        Runnable runnable;
        boolean flag3;
        if(facebookrestclient == null)
        {
            Message message1 = ooklogin.age(1, 0x7f06004c, 0);
            boolean flag2 = ooklogin.e(message1);
        } else
        {
            Message message2 = ooklogin.age(1, 0x7f06004a, 0);
            boolean flag4 = ooklogin.e(message2);
        }
        runnable = FacebookSyncService.access$300(facebooksyncservice).ting;
        flag3 = ooklogin.ting(runnable);
        return;
        exception1;
        if(true) goto _L2; else goto _L1
_L1:
    }

    public void stopRunning()
    {
        this;
        JVM INSTR monitorenter ;
        running = false;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private WeakReference mService;
    private boolean running;

    public (FacebookSyncService facebooksyncservice)
    {
        running = true;
        WeakReference weakreference = new WeakReference(facebooksyncservice);
        mService = weakreference;
        SyncServiceListener syncservicelistener = FacebookSyncService.access$000(facebooksyncservice);
        if(syncservicelistener == null)
        {
            return;
        } else
        {
            syncservicelistener.onFriendsDownloadStarted();
            return;
        }
    }
}

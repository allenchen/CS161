// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncWakeLock.java

package com.nloko.android.syncmypix;

import android.content.Context;
import android.os.PowerManager;

public class SyncWakeLock
{

    public SyncWakeLock()
    {
    }

    public static void acquireWakeLock(Context context)
    {
        if(context == null)
            return;
        if(mWakeLock != null)
        {
            return;
        } else
        {
            mWakeLock = ((PowerManager)context.getSystemService("power")).newWakeLock(1, "SyncMyPix WakeLock");
            mWakeLock.acquire();
            return;
        }
    }

    public static void releaseWakeLock()
    {
        if(mWakeLock == null)
        {
            return;
        } else
        {
            mWakeLock.release();
            mWakeLock = null;
            return;
        }
    }

    private static android.os.PowerManager.WakeLock mWakeLock;
}

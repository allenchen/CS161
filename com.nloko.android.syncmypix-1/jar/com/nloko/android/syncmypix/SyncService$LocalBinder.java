// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncService.java

package com.nloko.android.syncmypix;

import android.os.Binder;
import java.lang.ref.WeakReference;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncService

public static class mService extends Binder
{

    public SyncService getService()
    {
        return (SyncService)mService.get();
    }

    private final WeakReference mService;

    public _cls9(SyncService syncservice)
    {
        WeakReference weakreference = new WeakReference(syncservice);
        mService = weakreference;
    }
}

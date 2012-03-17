// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncService.java

package com.nloko.android.syncmypix;

import android.content.ContentValues;
import android.graphics.Bitmap;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncService, SocialNetworkUser, SyncServiceListener

class val.valuesCopy
    implements Runnable
{

    public void run()
    {
        SyncServiceListener syncservicelistener = val$service.mListener;
        if(syncservicelistener == null)
        {
            return;
        } else
        {
            String s = val$user.name;
            Bitmap bitmap1 = val$bitmap;
            String s1 = val$valuesCopy.getAsString("description");
            syncservicelistener.onContactSynced(s, bitmap1, s1);
            return;
        }
    }

    final ontactSynced this$0;
    final Bitmap val$bitmap;
    final SyncService val$service;
    final SocialNetworkUser val$user;
    final ContentValues val$valuesCopy;

    ()
    {
        this$0 = final_;
        val$service = syncservice;
        val$user = socialnetworkuser;
        val$bitmap = bitmap1;
        val$valuesCopy = ContentValues.this;
        super();
    }
}

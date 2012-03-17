// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncMyPixDbHelper.java

package com.nloko.android.syncmypix;

import Lcom.nloko.android.syncmypix.SyncMyPixDbHelper;;
import android.database.Cursor;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncMyPixDbHelper, SyncService, DbHelperNotifier

class val.notifier
    implements Runnable
{

    public void run()
    {
        synchronized(SyncService.mSyncLock)
        {
            String s;
            String s1;
            for(; val$cursor.moveToNext(); deletePicture(s, s1))
            {
                Cursor cursor1 = val$cursor;
                int i = val$cursor.getColumnIndex("_id");
                s = cursor1.getString(i);
                Cursor cursor2 = val$cursor;
                int j = val$cursor.getColumnIndex("photo_hash");
                s1 = cursor2.getString(j);
            }

            break MISSING_BLOCK_LABEL_95;
        }
        deleteData();
        obj;
        JVM INSTR monitorexit ;
        if(val$notifier != null)
            val$notifier.onUpdateComplete();
        val$cursor.close();
        return;
    }

    final SyncMyPixDbHelper this$0;
    final Cursor val$cursor;
    final DbHelperNotifier val$notifier;

    ()
    {
        this$0 = final_syncmypixdbhelper;
        val$cursor = cursor1;
        val$notifier = DbHelperNotifier.this;
        super();
    }
}

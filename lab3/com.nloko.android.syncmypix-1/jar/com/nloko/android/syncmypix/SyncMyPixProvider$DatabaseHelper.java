// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncMyPixProvider.java

package com.nloko.android.syncmypix;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import com.nloko.android.Log;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncMyPixProvider

private static class  extends SQLiteOpenHelper
{

    public void onCreate(SQLiteDatabase sqlitedatabase)
    {
        sqlitedatabase.execSQL("CREATE TABLE contacts (_id INTEGER PRIMARY KEY,lookup_key TEXT DEFAULT NULL,pic_url TEXT DEFAULT NULL,photo_hash TEXT,network_photo_hash TEXT,friend_id TEXT DEFAULT NULL,source TEXT);");
        sqlitedatabase.execSQL("CREATE TABLE results (_id INTEGER PRIMARY KEY,sync_id INTEGER,name TEXT DEFAULT NULL,description TEXT DEFAULT NULL,pic_url TEXT  DEFAULT NULL,contact_id INTEGER,lookup_key TEXT DEFAULT NULL,friend_id TEXT DEFAULT NULL);");
        sqlitedatabase.execSQL("CREATE TABLE sync (_id INTEGER PRIMARY KEY,source TEXT DEFAULT NULL,date_started INTEGER,date_completed INTEGER,updated INTEGER,skipped INTEGER,not_found INTEGER);");
    }

    public void onUpgrade(SQLiteDatabase sqlitedatabase, int i, int j)
    {
        String s = (new StringBuilder()).append("Upgrading database from version ").append(i).append(" to ").append(j).append(", which will destroy all old data").toString();
        Log.w("SyncMyPixProvider", s);
        if(i >= 2)
        {
            sqlitedatabase.execSQL("CREATE TABLE results_new (_id INTEGER PRIMARY KEY,sync_id INTEGER,name TEXT DEFAULT NULL,description TEXT DEFAULT NULL,pic_url TEXT  DEFAULT NULL,contact_id INTEGER,lookup_key TEXT DEFAULT NULL,friend_id TEXT DEFAULT NULL);");
            sqlitedatabase.execSQL("CREATE TABLE sync_new  (_id INTEGER PRIMARY KEY,source TEXT DEFAULT NULL,date_started INTEGER,date_completed INTEGER,updated INTEGER,skipped INTEGER,not_found INTEGER);");
            sqlitedatabase.execSQL("DROP TABLE IF EXISTS sync;");
            sqlitedatabase.execSQL("ALTER TABLE sync_new RENAME TO sync;");
            sqlitedatabase.execSQL("DROP TABLE IF EXISTS results;");
            sqlitedatabase.execSQL("ALTER TABLE results_new RENAME TO results;");
        }
        sqlitedatabase.execSQL("CREATE TABLE contacts_new (_id INTEGER PRIMARY KEY,lookup_key TEXT DEFAULT NULL,pic_url TEXT DEFAULT NULL,photo_hash TEXT,network_photo_hash TEXT,friend_id TEXT DEFAULT NULL,source TEXT);");
        if(i <= 4)
            sqlitedatabase.execSQL("INSERT INTO contacts_new (_id,photo_hash)SELECT _id,photo_hash FROM contacts;");
        else
            sqlitedatabase.execSQL("INSERT INTO contacts_new (_id,network_photo_hash,friend_id,source,photo_hash)SELECT _id,network_photo_hash,friend_id,source,photo_hash FROM contacts;");
        sqlitedatabase.execSQL("DROP TABLE IF EXISTS contacts;");
        sqlitedatabase.execSQL("ALTER TABLE contacts_new RENAME TO contacts;");
    }

    (Context context)
    {
        super(context, "syncpix.db", null, 7);
    }
}

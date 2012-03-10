// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncMyPixProvider.java

package com.nloko.android.syncmypix;

import android.content.*;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteQueryBuilder;
import android.net.Uri;
import android.text.TextUtils;
import java.util.HashMap;
import java.util.List;

public class SyncMyPixProvider extends ContentProvider
{
    /* member class not found */
    class DatabaseHelper {}


    public SyncMyPixProvider()
    {
    }

    public int delete(Uri uri, String s, String as[])
    {
        SQLiteDatabase sqlitedatabase = openHelper.getWritableDatabase();
        uriMatcher.match(uri);
        JVM INSTR tableswitch 1 6: default 56
    //                   1 87
    //                   2 113
    //                   3 218
    //                   4 56
    //                   5 218
    //                   6 243;
           goto _L1 _L2 _L3 _L4 _L1 _L4 _L5
_L1:
        String s1 = (new StringBuilder()).append("Unknown URI ").append(uri).toString();
        throw new IllegalArgumentException(s1);
_L2:
        int i = sqlitedatabase.delete("contacts", s, as);
_L7:
        getContext().getContentResolver().notifyChange(uri, null);
        return i;
_L3:
        String s2 = (String)uri.getPathSegments().get(1);
        String s3 = "contacts";
        StringBuilder stringbuilder = (new StringBuilder()).append("_id=").append(s2);
        String s4;
        String s5;
        if(!TextUtils.isEmpty(s))
            s4 = (new StringBuilder()).append(" AND (").append(s).append(')').toString();
        else
            s4 = "";
        s5 = stringbuilder.append(s4).toString();
        i = sqlitedatabase.delete(s3, s5, as);
        continue; /* Loop/switch isn't completed */
_L4:
        int j = sqlitedatabase.delete("sync", null, null);
        i = sqlitedatabase.delete("results", null, null);
        continue; /* Loop/switch isn't completed */
_L5:
        String s6 = (String)uri.getPathSegments().get(1);
        String s7 = (new StringBuilder()).append("_id=").append(s6).toString();
        int k = sqlitedatabase.delete("sync", s7, null);
        String s8 = (new StringBuilder()).append("sync_id=").append(s6).toString();
        i = sqlitedatabase.delete("results", s8, null);
        if(true) goto _L7; else goto _L6
_L6:
    }

    public String getType(Uri uri)
    {
        uriMatcher.match(uri);
        JVM INSTR tableswitch 1 5: default 40
    //                   1 69
    //                   2 74
    //                   3 80
    //                   4 40
    //                   5 86;
           goto _L1 _L2 _L3 _L4 _L1 _L5
_L1:
        String s = (new StringBuilder()).append("Unknown URI ").append(uri).toString();
        throw new IllegalArgumentException(s);
_L2:
        String s1 = "vnd.android.cursor.dir/vnd.nloko.contact";
_L7:
        return s1;
_L3:
        s1 = "vnd.android.cursor.item/vnd.nloko.contact";
        continue; /* Loop/switch isn't completed */
_L4:
        s1 = "vnd.android.cursor.dir/vnd.nloko.result";
        continue; /* Loop/switch isn't completed */
_L5:
        s1 = "vnd.android.cursor.dir/vnd.nloko.sync";
        if(true) goto _L7; else goto _L6
_L6:
    }

    public Uri insert(Uri uri, ContentValues contentvalues)
    {
        if(uriMatcher.match(uri) != 1 && uriMatcher.match(uri) != 3 && uriMatcher.match(uri) != 5)
        {
            String s = (new StringBuilder()).append("Unknown URI ").append(uri).toString();
            throw new IllegalArgumentException(s);
        }
        ContentValues contentvalues1;
        String s1;
        String s2;
        Uri uri1;
        Long long1;
        long l;
        if(contentvalues != null)
            contentvalues1 = new ContentValues(contentvalues);
        else
            contentvalues1 = new ContentValues();
        s1 = null;
        s2 = null;
        uri1 = null;
        long1 = Long.valueOf(System.currentTimeMillis());
        if(uriMatcher.match(uri) == 1)
        {
            s2 = "contacts";
            uri1 = SyncMyPix.Contacts.CONTENT_URI;
            s1 = "photo_hash";
        }
        if(uriMatcher.match(uri) == 3)
        {
            s2 = "results";
            uri1 = SyncMyPix.Results.CONTENT_URI;
            s1 = "description";
        }
        if(uriMatcher.match(uri) == 5)
        {
            s2 = "sync";
            uri1 = SyncMyPix.Sync.CONTENT_URI;
            s1 = "source";
            if(!contentvalues1.containsKey("date_started"))
                contentvalues1.put("date_started", long1);
        }
        l = openHelper.getWritableDatabase().insert(s2, s1, contentvalues1);
        if(l > 0L)
        {
            Uri uri2 = ContentUris.withAppendedId(uri1, l);
            getContext().getContentResolver().notifyChange(uri2, null);
            return uri2;
        } else
        {
            String s3 = (new StringBuilder()).append("Failed to insert row into ").append(uri).toString();
            throw new SQLException(s3);
        }
    }

    public boolean onCreate()
    {
        Context context = getContext();
        DatabaseHelper databasehelper = new DatabaseHelper(context);
        openHelper = databasehelper;
        return true;
    }

    public Cursor query(Uri uri, String as[], String s, String as1[], String s1)
    {
        SQLiteQueryBuilder sqlitequerybuilder = new SQLiteQueryBuilder();
        uriMatcher.match(uri);
        JVM INSTR tableswitch 1 5: default 52
    //                   1 83
    //                   2 183
    //                   3 258
    //                   4 286
    //                   5 363;
           goto _L1 _L2 _L3 _L4 _L5 _L6
_L1:
        String s2 = (new StringBuilder()).append("Unknown URI ").append(uri).toString();
        throw new IllegalArgumentException(s2);
_L2:
        String s3;
        sqlitequerybuilder.setTables("contacts");
        HashMap hashmap = contactsProjection;
        sqlitequerybuilder.setProjectionMap(hashmap);
        s3 = "_id ASC";
_L8:
        if(!TextUtils.isEmpty(s1))
            s3 = s1;
        SQLiteDatabase sqlitedatabase = openHelper.getWritableDatabase();
        String as2[] = as;
        String s4 = s;
        String as3[] = as1;
        String s5 = null;
        Cursor cursor = sqlitequerybuilder.query(sqlitedatabase, as2, s4, as3, null, s5, s3);
        ContentResolver contentresolver = getContext().getContentResolver();
        cursor.setNotificationUri(contentresolver, uri);
        return cursor;
_L3:
        sqlitequerybuilder.setTables("contacts");
        HashMap hashmap1 = contactsProjection;
        sqlitequerybuilder.setProjectionMap(hashmap1);
        StringBuilder stringbuilder = (new StringBuilder()).append("_id=");
        String s6 = (String)uri.getPathSegments().get(1);
        String s7 = stringbuilder.append(s6).toString();
        sqlitequerybuilder.appendWhere(s7);
        s3 = "_id ASC";
        continue; /* Loop/switch isn't completed */
_L4:
        HashMap hashmap2 = resultsProjection;
        sqlitequerybuilder.setProjectionMap(hashmap2);
        sqlitequerybuilder.setTables("results LEFT OUTER JOIN sync ON (results.sync_id=sync._id)");
        s3 = "name ASC";
        continue; /* Loop/switch isn't completed */
_L5:
        HashMap hashmap3 = resultsProjection;
        sqlitequerybuilder.setProjectionMap(hashmap3);
        sqlitequerybuilder.setTables("results LEFT OUTER JOIN sync ON (results.sync_id=sync._id)");
        StringBuilder stringbuilder1 = (new StringBuilder()).append("results._id=");
        String s8 = (String)uri.getPathSegments().get(1);
        String s9 = stringbuilder1.append(s8).toString();
        sqlitequerybuilder.appendWhere(s9);
        s3 = "name ASC";
        continue; /* Loop/switch isn't completed */
_L6:
        sqlitequerybuilder.setTables("sync");
        HashMap hashmap4 = syncProjection;
        sqlitequerybuilder.setProjectionMap(hashmap4);
        s3 = "source ASC";
        if(true) goto _L8; else goto _L7
_L7:
    }

    public int update(Uri uri, ContentValues contentvalues, String s, String as[])
    {
        SQLiteDatabase sqlitedatabase = openHelper.getWritableDatabase();
        uriMatcher.match(uri);
        JVM INSTR tableswitch 1 6: default 56
    //                   1 87
    //                   2 115
    //                   3 222
    //                   4 238
    //                   5 345
    //                   6 361;
           goto _L1 _L2 _L3 _L4 _L5 _L6 _L7
_L1:
        String s1 = (new StringBuilder()).append("Unknown URI ").append(uri).toString();
        throw new IllegalArgumentException(s1);
_L2:
        int i = sqlitedatabase.update("contacts", contentvalues, s, as);
_L9:
        getContext().getContentResolver().notifyChange(uri, null);
        return i;
_L3:
        String s2 = (String)uri.getPathSegments().get(1);
        String s3 = "contacts";
        StringBuilder stringbuilder = (new StringBuilder()).append("_id=").append(s2);
        String s6;
        String s9;
        if(!TextUtils.isEmpty(s))
            s6 = (new StringBuilder()).append(" AND (").append(s).append(')').toString();
        else
            s6 = "";
        s9 = stringbuilder.append(s6).toString();
        i = sqlitedatabase.update(s3, contentvalues, s9, as);
        continue; /* Loop/switch isn't completed */
_L4:
        i = sqlitedatabase.update("results", contentvalues, s, as);
        continue; /* Loop/switch isn't completed */
_L5:
        String s10 = (String)uri.getPathSegments().get(1);
        String s4 = "results";
        StringBuilder stringbuilder1 = (new StringBuilder()).append("_id=").append(s10);
        String s7;
        String s11;
        if(!TextUtils.isEmpty(s))
            s7 = (new StringBuilder()).append(" AND (").append(s).append(')').toString();
        else
            s7 = "";
        s11 = stringbuilder1.append(s7).toString();
        i = sqlitedatabase.update(s4, contentvalues, s11, as);
        continue; /* Loop/switch isn't completed */
_L6:
        i = sqlitedatabase.update("sync", contentvalues, s, as);
        continue; /* Loop/switch isn't completed */
_L7:
        String s12 = (String)uri.getPathSegments().get(1);
        String s5 = "sync";
        StringBuilder stringbuilder2 = (new StringBuilder()).append("_id=").append(s12);
        String s8;
        String s13;
        if(!TextUtils.isEmpty(s))
            s8 = (new StringBuilder()).append(" AND (").append(s).append(')').toString();
        else
            s8 = "";
        s13 = stringbuilder2.append(s8).toString();
        i = sqlitedatabase.update(s5, contentvalues, s13, as);
        if(true) goto _L9; else goto _L8
_L8:
    }

    private static final int CONTACTS = 1;
    private static final int CONTACTS_ID = 2;
    private static final String CONTACTS_TABLE_NAME = "contacts";
    private static final String DATABASE_NAME = "syncpix.db";
    private static final int DATABASE_VERSION = 7;
    private static final int RESULTS = 3;
    private static final int RESULTS_ID = 4;
    private static final String RESULTS_TABLE_NAME = "results";
    private static final int SYNC = 5;
    private static final int SYNC_ID = 6;
    private static final String SYNC_TABLE_NAME = "sync";
    private static final String TAG = "SyncMyPixProvider";
    private static HashMap contactsProjection;
    private static HashMap resultsProjection;
    private static HashMap syncProjection;
    private static final UriMatcher uriMatcher;
    private DatabaseHelper openHelper;

    static 
    {
        uriMatcher = new UriMatcher(-1);
        uriMatcher.addURI("com.nloko.provider.SyncMyPix", "contacts", 1);
        uriMatcher.addURI("com.nloko.provider.SyncMyPix", "contacts/#", 2);
        uriMatcher.addURI("com.nloko.provider.SyncMyPix", "results", 3);
        uriMatcher.addURI("com.nloko.provider.SyncMyPix", "results/#", 4);
        uriMatcher.addURI("com.nloko.provider.SyncMyPix", "sync", 5);
        uriMatcher.addURI("com.nloko.provider.SyncMyPix", "sync/#", 6);
        contactsProjection = new HashMap();
        Object obj = contactsProjection.put("_id", "_id");
        Object obj1 = contactsProjection.put("lookup_key", "lookup_key");
        Object obj2 = contactsProjection.put("pic_url", "pic_url");
        Object obj3 = contactsProjection.put("photo_hash", "photo_hash");
        Object obj4 = contactsProjection.put("network_photo_hash", "network_photo_hash");
        Object obj5 = contactsProjection.put("friend_id", "friend_id");
        Object obj6 = contactsProjection.put("source", "source");
        syncProjection = new HashMap();
        Object obj7 = syncProjection.put("_id", "sync._id");
        Object obj8 = syncProjection.put("source", "source");
        Object obj9 = syncProjection.put("date_started", "date_started");
        Object obj10 = syncProjection.put("date_completed", "date_completed");
        Object obj11 = syncProjection.put("updated", "updated");
        Object obj12 = syncProjection.put("skipped", "skipped");
        Object obj13 = syncProjection.put("not_found", "not_found");
        resultsProjection = new HashMap();
        Object obj14 = resultsProjection.put("_id", "sync._id");
        Object obj15 = resultsProjection.put("source", "source");
        Object obj16 = resultsProjection.put("date_started", "date_started");
        Object obj17 = resultsProjection.put("date_completed", "date_completed");
        Object obj18 = resultsProjection.put("updated", "updated");
        Object obj19 = resultsProjection.put("skipped", "skipped");
        Object obj20 = resultsProjection.put("not_found", "not_found");
        Object obj21 = resultsProjection.put("_id", "results._id");
        Object obj22 = resultsProjection.put("sync_id", "sync_id");
        Object obj23 = resultsProjection.put("name", "name");
        Object obj24 = resultsProjection.put("pic_url", "pic_url");
        Object obj25 = resultsProjection.put("description", "description");
        Object obj26 = resultsProjection.put("contact_id", "contact_id");
        Object obj27 = resultsProjection.put("lookup_key", "lookup_key");
        Object obj28 = resultsProjection.put("friend_id", "friend_id");
    }
}

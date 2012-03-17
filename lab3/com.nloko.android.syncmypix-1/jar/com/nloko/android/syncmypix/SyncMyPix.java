// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncMyPix.java

package com.nloko.android.syncmypix;

import android.net.Uri;
import android.provider.BaseColumns;

public final class SyncMyPix
{
    public static final class Sync
        implements BaseColumns
    {

        public static final String CONTENT_ITEM_TYPE = "vnd.android.cursor.item/vnd.nloko.sync";
        public static final String CONTENT_TYPE = "vnd.android.cursor.dir/vnd.nloko.sync";
        public static final Uri CONTENT_URI = Uri.parse("content://com.nloko.provider.SyncMyPix/sync");
        public static final String DATE_COMPLETED = "date_completed";
        public static final String DATE_STARTED = "date_started";
        public static final String DEFAULT_SORT_ORDER = "source ASC";
        public static final String NOT_FOUND = "not_found";
        public static final String SKIPPED = "skipped";
        public static final String SOURCE = "source";
        public static final String UPDATED = "updated";


        public Sync()
        {
        }
    }

    public static final class Results
        implements BaseColumns
    {

        public static final String CONTACT_ID = "contact_id";
        public static final String CONTENT_ITEM_TYPE = "vnd.android.cursor.item/vnd.nloko.result";
        public static final String CONTENT_TYPE = "vnd.android.cursor.dir/vnd.nloko.result";
        public static final Uri CONTENT_URI = Uri.parse("content://com.nloko.provider.SyncMyPix/results");
        public static final String DEFAULT_SORT_ORDER = "name ASC";
        public static final String DESCRIPTION = "description";
        public static final String FRIEND_ID = "friend_id";
        public static final String LOOKUP_KEY = "lookup_key";
        public static final String NAME = "name";
        public static final String PIC_URL = "pic_url";
        public static final String SYNC_ID = "sync_id";


        public Results()
        {
        }
    }

    public static final class Contacts
        implements BaseColumns
    {

        public static final String CONTENT_ITEM_TYPE = "vnd.android.cursor.item/vnd.nloko.contact";
        public static final String CONTENT_TYPE = "vnd.android.cursor.dir/vnd.nloko.contact";
        public static final Uri CONTENT_URI = Uri.parse("content://com.nloko.provider.SyncMyPix/contacts");
        public static final String DEFAULT_SORT_ORDER = "_id ASC";
        public static final String FRIEND_ID = "friend_id";
        public static final String LOOKUP_KEY = "lookup_key";
        public static final String NETWORK_PHOTO_HASH = "network_photo_hash";
        public static final String PHOTO_HASH = "photo_hash";
        public static final String PIC_URL = "pic_url";
        public static final String SOURCE = "source";


        public Contacts()
        {
        }
    }


    private SyncMyPix()
    {
    }

    public static final String AUTHORITY = "com.nloko.provider.SyncMyPix";
    public static final String SYNC_INTENT = "com.nloko.android.syncmypix.SYNC";
}

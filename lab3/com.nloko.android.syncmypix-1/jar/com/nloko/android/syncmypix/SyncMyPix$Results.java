// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncMyPix.java

package com.nloko.android.syncmypix;

import android.net.Uri;
import android.provider.BaseColumns;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncMyPix

public static final class 
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


    public ()
    {
    }
}

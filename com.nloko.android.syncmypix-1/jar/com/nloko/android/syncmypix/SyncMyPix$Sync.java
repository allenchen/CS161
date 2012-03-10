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


    public ()
    {
    }
}

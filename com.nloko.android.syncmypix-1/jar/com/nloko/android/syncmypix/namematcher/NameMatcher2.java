// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   NameMatcher2.java

package com.nloko.android.syncmypix.namematcher;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import com.nloko.android.Log;
import com.nloko.android.syncmypix.PhoneContact;
import java.io.InputStream;
import java.lang.ref.WeakReference;

// Referenced classes of package com.nloko.android.syncmypix.namematcher:
//            NameMatcher

public class NameMatcher2 extends NameMatcher
{

    public NameMatcher2(Context context, InputStream inputstream, boolean flag)
        throws Exception
    {
        super(context, inputstream, flag);
    }

    protected PhoneContact createFromCursor(Cursor cursor)
    {
        PhoneContact phonecontact;
        if(cursor == null || cursor.isClosed())
        {
            phonecontact = null;
        } else
        {
            int i = cursor.getColumnIndex("_id");
            String s = cursor.getString(i);
            int j = cursor.getColumnIndex("display_name");
            String s1 = cursor.getString(j);
            int k = cursor.getColumnIndex("lookup");
            String s2 = cursor.getString(k);
            String s3 = (new StringBuilder()).append("NameMatcher is processing contact ").append(s1).append(" ").append(s2).toString();
            Log.d("NameMatcher2", s3);
            phonecontact = new PhoneContact(s, s1, s2);
        }
        return phonecontact;
    }

    protected Cursor doQuery(boolean flag)
    {
        Context context = (Context)mContext.get();
        Cursor cursor;
        if(context == null)
        {
            cursor = null;
        } else
        {
            String s = null;
            if(flag)
                s = "has_phone_number=1";
            Log.d("NameMatcher2", "Querying database for contacts..");
            ContentResolver contentresolver = context.getContentResolver();
            android.net.Uri uri = android.provider.ContactsContract.Contacts.CONTENT_URI;
            String as[] = null;
            String s1 = null;
            cursor = contentresolver.query(uri, null, s, as, s1);
        }
        return cursor;
    }

    protected final String TAG = "NameMatcher2";
}

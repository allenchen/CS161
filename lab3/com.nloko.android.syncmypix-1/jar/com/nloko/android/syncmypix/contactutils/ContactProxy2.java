// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ContactProxy2.java

package com.nloko.android.syncmypix.contactutils;

import android.content.*;
import android.database.Cursor;
import android.net.Uri;
import android.util.Log;
import com.nloko.android.syncmypix.PhoneContact;
import java.io.InputStream;
import java.util.HashMap;

// Referenced classes of package com.nloko.android.syncmypix.contactutils:
//            IContactProxy

public class ContactProxy2
    implements IContactProxy
{

    public ContactProxy2()
    {
    }

    private void ensureUpdatableLoaded()
    {
        if(mUpdatable != null)
            return;
        HashMap hashmap = new HashMap();
        mUpdatable = hashmap;
        SyncAdapterType asyncadaptertype[] = ContentResolver.getSyncAdapterTypes();
        int i = asyncadaptertype.length;
        int j = 0;
        do
        {
            if(j >= i)
                return;
            SyncAdapterType syncadaptertype = asyncadaptertype[j];
            StringBuilder stringbuilder = new StringBuilder();
            String s = syncadaptertype.accountType;
            StringBuilder stringbuilder1 = stringbuilder.append(s).append(" ");
            boolean flag = syncadaptertype.supportsUploading();
            String s1 = stringbuilder1.append(flag).toString();
            int k = Log.d("ContactProxy2", s1);
            HashMap hashmap1 = mUpdatable;
            String s2 = syncadaptertype.accountType;
            Boolean boolean1 = Boolean.valueOf(syncadaptertype.supportsUploading());
            Object obj = hashmap1.put(s2, boolean1);
            j++;
        } while(true);
    }

    private long queryForRawContactId(ContentResolver contentresolver, long l)
    {
        long l1;
        l1 = 65535L;
        if(contentresolver == null)
            break MISSING_BLOCK_LABEL_255;
        Cursor cursor;
        Uri uri = android.provider.ContactsContract.RawContacts.CONTENT_URI;
        String as[] = new String[3];
        as[0] = "_id";
        as[1] = "account_name";
        as[2] = "account_type";
        String s = (new StringBuilder()).append("contact_id=").append(l).toString();
        cursor = contentresolver.query(uri, as, s, null, null);
        if(cursor != null)
            do
            {
                if(!cursor.moveToNext() || l1 >= 0L)
                    break;
                int i = cursor.getColumnIndex("account_name");
                String s1 = cursor.getString(i);
                int j = cursor.getColumnIndex("account_type");
                String s2 = cursor.getString(j);
                String s3 = "ContactProxy2";
                String s4;
                int k;
                if(s2 != null)
                    s4 = s2;
                else
                    s4 = "empty";
                k = Log.d(s3, s4);
                ensureUpdatableLoaded();
                if(s2 == null || s2.length() == 0 || s2.toLowerCase().contains("htc.android.pcsc") || mUpdatable.containsKey(s2) && ((Boolean)mUpdatable.get(s2)).booleanValue())
                    l1 = cursor.getLong(0);
            } while(true);
        if(cursor != null)
            cursor.close();
        return l1;
        Exception exception;
        exception;
        if(cursor != null)
            cursor.close();
        throw exception;
    }

    public PhoneContact confirmContact(ContentResolver contentresolver, String s, String s1)
    {
        Cursor cursor;
        Uri uri = android.provider.ContactsContract.Contacts.getLookupUri(Long.parseLong(s), s1);
        String as[] = new String[2];
        as[0] = "_id";
        as[1] = "lookup";
        ContentResolver contentresolver1 = contentresolver;
        String as1[] = null;
        String s2 = null;
        cursor = contentresolver1.query(uri, as, null, as1, s2);
        if(!cursor.moveToFirst()) goto _L2; else goto _L1
_L1:
        String s3;
        int i = cursor.getColumnIndex("_id");
        s = cursor.getString(i);
        int j = cursor.getColumnIndex("lookup");
        s3 = cursor.getString(j);
        s1 = s3;
_L4:
        cursor.close();
        return new PhoneContact(s, null, s1);
_L2:
        Object aobj[] = new Object[2];
        aobj[0] = s;
        aobj[1] = s1;
        String s4 = String.format("Could not confirm contact %s with lookup %s", aobj);
        int k = Log.v("ContactProxy2", s4);
        if(true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        cursor.close();
        throw exception;
    }

    public Uri getContentUri()
    {
        return android.provider.ContactsContract.Contacts.CONTENT_URI;
    }

    public String getLookup(ContentResolver contentresolver, Uri uri)
    {
        Cursor cursor;
        String as[] = new String[2];
        as[0] = "_id";
        as[1] = "lookup";
        ContentResolver contentresolver1 = contentresolver;
        Uri uri1 = uri;
        cursor = contentresolver1.query(uri1, as, null, null, null);
        if(!cursor.moveToFirst()) goto _L2; else goto _L1
_L1:
        String s;
        int i = cursor.getColumnIndex("lookup");
        s = cursor.getString(i);
        String s1 = s;
_L4:
        if(cursor != null)
            cursor.close();
        return s1;
_L2:
        s1 = null;
        if(true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        if(cursor != null)
            cursor.close();
        throw exception;
    }

    public InputStream getPhoto(ContentResolver contentresolver, String s)
    {
        InputStream inputstream;
        if(contentresolver == null || s == null)
        {
            inputstream = null;
        } else
        {
            Uri uri = Uri.withAppendedPath(android.provider.ContactsContract.Contacts.CONTENT_URI, s);
            inputstream = android.provider.ContactsContract.Contacts.openContactPhotoInputStream(contentresolver, uri);
        }
        return inputstream;
    }

    public boolean isContactUpdatable(ContentResolver contentresolver, String s)
    {
        long l = Long.parseLong(s);
        boolean flag;
        if(queryForRawContactId(contentresolver, l) > 65535L)
            flag = true;
        else
            flag = false;
        return flag;
    }

    public void updatePhoto(ContentResolver contentresolver, byte abyte0[], String s, boolean flag)
    {
        if(contentresolver == null)
            return;
        if(s == null)
            return;
        long l = Long.parseLong(s);
        ContactProxy2 contactproxy2 = this;
        ContentResolver contentresolver1 = contentresolver;
        long l1 = l;
        long l2 = contactproxy2.queryForRawContactId(contentresolver1, l1);
        if(l2 < 0L)
            return;
        s = String.valueOf(l2);
        ContentValues contentvalues = new ContentValues();
        int i = -1;
        StringBuilder stringbuilder = (new StringBuilder()).append("raw_contact_id == ");
        String s1 = s;
        String s2 = stringbuilder.append(s1).append(" AND ").append("mimetype").append("=='").append("vnd.android.cursor.item/photo").append("'").toString();
        Uri uri = android.provider.ContactsContract.Data.CONTENT_URI;
        Cursor cursor = contentresolver.query(uri, null, s2, null, null);
        int j = cursor.getColumnIndexOrThrow("_id");
        if(cursor.moveToFirst())
            i = cursor.getInt(j);
        cursor.close();
        if(i < 0 && abyte0 == null)
            return;
        ContentValues contentvalues1 = contentvalues;
        String s3 = "raw_contact_id";
        String s4 = s;
        contentvalues1.put(s3, s4);
        Integer integer = Integer.valueOf(1);
        ContentValues contentvalues2 = contentvalues;
        String s5 = "is_super_primary";
        Integer integer1 = integer;
        contentvalues2.put(s5, integer1);
        ContentValues contentvalues3 = contentvalues;
        String s6 = "data15";
        byte abyte1[] = abyte0;
        contentvalues3.put(s6, abyte1);
        ContentValues contentvalues4 = contentvalues;
        String s7 = "mimetype";
        String s8 = "vnd.android.cursor.item/photo";
        contentvalues4.put(s7, s8);
        Uri uri1 = android.provider.ContactsContract.Data.CONTENT_URI;
        long l3 = i;
        Uri uri2 = ContentUris.withAppendedId(uri1, l3);
        Uri uri3 = uri2.buildUpon().appendQueryParameter("caller_is_syncadapter", "true").build();
        if(i >= 0)
        {
            if(abyte0 == null)
            {
                ContentResolver contentresolver2 = contentresolver;
                Uri uri4 = uri2;
                ContentValues contentvalues5 = contentvalues;
                String s9 = null;
                String as[] = null;
                int k = contentresolver2.update(uri4, contentvalues5, s9, as);
                return;
            } else
            {
                ContentResolver contentresolver3 = contentresolver;
                Uri uri5 = uri2;
                ContentValues contentvalues6 = contentvalues;
                String s10 = null;
                String as1[] = null;
                int i1 = contentresolver3.update(uri5, contentvalues6, s10, as1);
                return;
            }
        } else
        {
            Uri uri6 = android.provider.ContactsContract.Data.CONTENT_URI;
            ContentResolver contentresolver4 = contentresolver;
            Uri uri7 = uri6;
            ContentValues contentvalues7 = contentvalues;
            Uri uri8 = contentresolver4.insert(uri7, contentvalues7);
            return;
        }
    }

    private static final String TAG = "ContactProxy2";
    private HashMap mUpdatable;
}

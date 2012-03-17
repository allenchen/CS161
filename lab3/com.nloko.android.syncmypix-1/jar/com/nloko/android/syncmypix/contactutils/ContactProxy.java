// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ContactProxy.java

package com.nloko.android.syncmypix.contactutils;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.net.Uri;
import com.nloko.android.syncmypix.PhoneContact;
import java.io.InputStream;

// Referenced classes of package com.nloko.android.syncmypix.contactutils:
//            IContactProxy

public class ContactProxy
    implements IContactProxy
{

    public ContactProxy()
    {
    }

    public PhoneContact confirmContact(ContentResolver contentresolver, String s, String s1)
    {
        return new PhoneContact(s, null, s1);
    }

    public Uri getContentUri()
    {
        return android.provider.Contacts.People.CONTENT_URI;
    }

    public String getLookup(ContentResolver contentresolver, Uri uri)
    {
        return null;
    }

    public InputStream getPhoto(ContentResolver contentresolver, String s)
    {
        InputStream inputstream;
        if(contentresolver == null || s == null)
        {
            inputstream = null;
        } else
        {
            Uri uri = Uri.withAppendedPath(android.provider.Contacts.People.CONTENT_URI, s);
            inputstream = android.provider.Contacts.People.openContactPhotoInputStream(contentresolver, uri);
        }
        return inputstream;
    }

    public boolean isContactUpdatable(ContentResolver contentresolver, String s)
    {
        return true;
    }

    public void updatePhoto(ContentResolver contentresolver, byte abyte0[], String s, boolean flag)
    {
        if(contentresolver == null)
            return;
        if(s == null)
            return;
        ContentValues contentvalues = new ContentValues();
        if(!flag)
        {
            Integer integer = Integer.valueOf(0);
            contentvalues.put("_sync_dirty", integer);
        }
        contentvalues.put("data", abyte0);
        Uri uri = android.provider.Contacts.People.CONTENT_URI;
        String s1 = (new StringBuilder()).append("").append(s).append("/").append("photo").toString();
        Uri uri1 = Uri.withAppendedPath(uri, s1);
        int i = contentresolver.update(uri1, contentvalues, null, null);
    }
}

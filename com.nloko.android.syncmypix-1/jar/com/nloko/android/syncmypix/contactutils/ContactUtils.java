// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ContactUtils.java

package com.nloko.android.syncmypix.contactutils;

import android.content.ContentResolver;
import android.net.Uri;
import com.nloko.android.syncmypix.PhoneContact;
import java.io.InputStream;

// Referenced classes of package com.nloko.android.syncmypix.contactutils:
//            ContactProxyFactory, IContactProxy

public final class ContactUtils
{

    public ContactUtils()
    {
        IContactProxy icontactproxy = ContactProxyFactory.create();
        mInstance = icontactproxy;
    }

    public PhoneContact confirmContact(ContentResolver contentresolver, String s, String s1)
    {
        return mInstance.confirmContact(contentresolver, s, s1);
    }

    public Uri getContentUri()
    {
        return mInstance.getContentUri();
    }

    public String getLookup(ContentResolver contentresolver, Uri uri)
    {
        return mInstance.getLookup(contentresolver, uri);
    }

    public InputStream getPhoto(ContentResolver contentresolver, String s)
    {
        return mInstance.getPhoto(contentresolver, s);
    }

    public boolean isContactUpdatable(ContentResolver contentresolver, String s)
    {
        return mInstance.isContactUpdatable(contentresolver, s);
    }

    public void updatePhoto(ContentResolver contentresolver, byte abyte0[], String s)
    {
        updatePhoto(contentresolver, abyte0, s, false);
    }

    public void updatePhoto(ContentResolver contentresolver, byte abyte0[], String s, boolean flag)
    {
        mInstance.updatePhoto(contentresolver, abyte0, s, flag);
    }

    private static final String TAG = "ContactServices";
    private final IContactProxy mInstance;
}

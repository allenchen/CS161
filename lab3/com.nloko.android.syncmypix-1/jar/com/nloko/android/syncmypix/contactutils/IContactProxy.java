// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   IContactProxy.java

package com.nloko.android.syncmypix.contactutils;

import android.content.ContentResolver;
import android.net.Uri;
import com.nloko.android.syncmypix.PhoneContact;
import java.io.InputStream;

public interface IContactProxy
{

    public abstract PhoneContact confirmContact(ContentResolver contentresolver, String s, String s1);

    public abstract Uri getContentUri();

    public abstract String getLookup(ContentResolver contentresolver, Uri uri);

    public abstract InputStream getPhoto(ContentResolver contentresolver, String s);

    public abstract boolean isContactUpdatable(ContentResolver contentresolver, String s);

    public abstract void updatePhoto(ContentResolver contentresolver, byte abyte0[], String s, boolean flag);
}

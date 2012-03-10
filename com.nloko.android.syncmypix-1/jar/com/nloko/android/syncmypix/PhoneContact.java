// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   PhoneContact.java

package com.nloko.android.syncmypix;


public final class PhoneContact
    implements Comparable
{

    public PhoneContact(String s, String s1)
    {
        this(s, s1, null);
    }

    public PhoneContact(String s, String s1, String s2)
    {
        id = s;
        name = s1;
        lookup = s2;
    }

    public int compareTo(PhoneContact phonecontact)
    {
        String s = name;
        String s1 = phonecontact.name;
        return s.compareTo(s1);
    }

    public volatile int compareTo(Object obj)
    {
        PhoneContact phonecontact = (PhoneContact)obj;
        return compareTo(phonecontact);
    }

    public String id;
    public String lookup;
    public String name;
}

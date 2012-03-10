// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ContactProxyFactory.java

package com.nloko.android.syncmypix.contactutils;

import com.nloko.android.Utils;

// Referenced classes of package com.nloko.android.syncmypix.contactutils:
//            ContactProxy2, ContactProxy, IContactProxy

public class ContactProxyFactory
{

    public ContactProxyFactory()
    {
    }

    public static IContactProxy create()
    {
        Object obj;
        if(Utils.determineOsVersion() >= 5)
            obj = new ContactProxy2();
        else
            obj = new ContactProxy();
        return ((IContactProxy) (obj));
    }
}

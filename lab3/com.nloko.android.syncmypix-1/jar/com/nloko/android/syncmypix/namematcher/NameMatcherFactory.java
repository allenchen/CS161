// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   NameMatcherFactory.java

package com.nloko.android.syncmypix.namematcher;

import android.content.Context;
import com.nloko.android.Log;
import com.nloko.android.Utils;
import java.io.InputStream;

// Referenced classes of package com.nloko.android.syncmypix.namematcher:
//            NameMatcher2, NameMatcher

public class NameMatcherFactory
{

    public NameMatcherFactory()
    {
    }

    public static NameMatcher create(Context context, InputStream inputstream)
        throws Exception
    {
        return create(context, inputstream, false);
    }

    public static NameMatcher create(Context context, InputStream inputstream, boolean flag)
        throws Exception
    {
        Object obj;
        if(Utils.determineOsVersion() >= 5)
        {
            Log.d(TAG, "New version found...loading version 2");
            obj = new NameMatcher2(context, inputstream, flag);
        } else
        {
            obj = new NameMatcher(context, inputstream, flag);
        }
        return ((NameMatcher) (obj));
    }

    private static String TAG = "NameMatcherFactory";

}

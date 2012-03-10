// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   CookieList.java

package org.json;

import java.util.Iterator;

// Referenced classes of package org.json:
//            JSONException, JSONObject, JSONTokener, Cookie

public class CookieList
{

    public CookieList()
    {
    }

    public static JSONObject toJSONObject(String s)
        throws JSONException
    {
        JSONObject jsonobject = new JSONObject();
        for(JSONTokener jsontokener = new JSONTokener(s); jsontokener.more();)
        {
            String s1 = Cookie.unescape(jsontokener.nextTo('='));
            char c = jsontokener.next('=');
            String s2 = Cookie.unescape(jsontokener.nextTo(';'));
            JSONObject jsonobject1 = jsonobject.put(s1, s2);
            char c1 = jsontokener.next();
        }

        return jsonobject;
    }

    public static String toString(JSONObject jsonobject)
        throws JSONException
    {
        boolean flag = false;
        Iterator iterator = jsonobject.keys();
        StringBuffer stringbuffer = new StringBuffer();
        do
        {
            if(!iterator.hasNext())
                break;
            String s = iterator.next().toString();
            if(!jsonobject.isNull(s))
            {
                StringBuffer stringbuffer1;
                if(flag)
                    stringbuffer1 = stringbuffer.append(';');
                String s1 = Cookie.escape(s);
                StringBuffer stringbuffer2 = stringbuffer.append(s1);
                StringBuffer stringbuffer3 = stringbuffer.append("=");
                String s2 = Cookie.escape(jsonobject.getString(s));
                StringBuffer stringbuffer4 = stringbuffer.append(s2);
                flag = true;
            }
        } while(true);
        return stringbuffer.toString();
    }
}

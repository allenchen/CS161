// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   Cookie.java

package org.json;


// Referenced classes of package org.json:
//            JSONException, JSONObject, JSONTokener

public class Cookie
{

    public Cookie()
    {
    }

    public static String escape(String s)
    {
        String s1 = s.trim();
        StringBuffer stringbuffer = new StringBuffer();
        int i = s1.length();
        int j = 0;
        while(j < i) 
        {
            char c = s1.charAt(j);
            StringBuffer stringbuffer4;
            if(c < ' ' || c == '+' || c == '%' || c == '=' || c == ';')
            {
                StringBuffer stringbuffer1 = stringbuffer.append('%');
                char c1 = Character.forDigit((char)(c >>> 4 & 0xf), 16);
                StringBuffer stringbuffer2 = stringbuffer.append(c1);
                char c2 = Character.forDigit((char)(c & 0xf), 16);
                StringBuffer stringbuffer3 = stringbuffer.append(c2);
            } else
            {
                stringbuffer4 = stringbuffer.append(c);
            }
            j++;
        }
        return stringbuffer.toString();
    }

    public static JSONObject toJSONObject(String s)
        throws JSONException
    {
        JSONObject jsonobject;
        JSONTokener jsontokener;
        jsonobject = new JSONObject();
        jsontokener = new JSONTokener(s);
        String s1 = jsontokener.nextTo('=');
        JSONObject jsonobject1 = jsonobject.put("name", s1);
        char c = jsontokener.next('=');
        String s2 = jsontokener.nextTo(';');
        JSONObject jsonobject2 = jsonobject.put("value", s2);
        char c1 = jsontokener.next();
_L2:
        String s3;
        Object obj;
        if(!jsontokener.more())
            break MISSING_BLOCK_LABEL_147;
        s3 = unescape(jsontokener.nextTo("=;"));
        if(jsontokener.next() == '=')
            break MISSING_BLOCK_LABEL_127;
        if(!s3.equals("secure"))
            break; /* Loop/switch isn't completed */
        obj = Boolean.TRUE;
_L3:
        JSONObject jsonobject3 = jsonobject.put(s3, obj);
        if(true) goto _L2; else goto _L1
_L1:
        throw jsontokener.syntaxError("Missing '=' in cookie parameter.");
        obj = unescape(jsontokener.nextTo(';'));
        char c2 = jsontokener.next();
          goto _L3
        return jsonobject;
    }

    public static String toString(JSONObject jsonobject)
        throws JSONException
    {
        StringBuffer stringbuffer = new StringBuffer();
        String s = escape(jsonobject.getString("name"));
        StringBuffer stringbuffer1 = stringbuffer.append(s);
        StringBuffer stringbuffer2 = stringbuffer.append("=");
        String s1 = escape(jsonobject.getString("value"));
        StringBuffer stringbuffer3 = stringbuffer.append(s1);
        if(jsonobject.has("expires"))
        {
            StringBuffer stringbuffer4 = stringbuffer.append(";expires=");
            String s2 = jsonobject.getString("expires");
            StringBuffer stringbuffer5 = stringbuffer.append(s2);
        }
        if(jsonobject.has("domain"))
        {
            StringBuffer stringbuffer6 = stringbuffer.append(";domain=");
            String s3 = escape(jsonobject.getString("domain"));
            StringBuffer stringbuffer7 = stringbuffer.append(s3);
        }
        if(jsonobject.has("path"))
        {
            StringBuffer stringbuffer8 = stringbuffer.append(";path=");
            String s4 = escape(jsonobject.getString("path"));
            StringBuffer stringbuffer9 = stringbuffer.append(s4);
        }
        StringBuffer stringbuffer10;
        if(jsonobject.optBoolean("secure"))
            stringbuffer10 = stringbuffer.append(";secure");
        return stringbuffer.toString();
    }

    public static String unescape(String s)
    {
        int i = s.length();
        StringBuffer stringbuffer = new StringBuffer();
        int j = 0;
        while(j < i) 
        {
            char c = s.charAt(j);
            StringBuffer stringbuffer1;
            if(c == '+')
                c = ' ';
            else
            if(c == '%' && j + 2 < i)
            {
                int k = j + 1;
                int l = JSONTokener.dehexchar(s.charAt(k));
                int i1 = j + 2;
                int j1 = JSONTokener.dehexchar(s.charAt(i1));
                if(l >= 0 && j1 >= 0)
                {
                    c = (char)(l * 16 + j1);
                    j += 2;
                }
            }
            stringbuffer1 = stringbuffer.append(c);
            j++;
        }
        return stringbuffer.toString();
    }
}

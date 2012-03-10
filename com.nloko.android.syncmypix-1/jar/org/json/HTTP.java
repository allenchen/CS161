// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   HTTP.java

package org.json;

import java.util.Iterator;

// Referenced classes of package org.json:
//            JSONException, JSONObject, HTTPTokener

public class HTTP
{

    public HTTP()
    {
    }

    public static JSONObject toJSONObject(String s)
        throws JSONException
    {
        JSONObject jsonobject = new JSONObject();
        HTTPTokener httptokener = new HTTPTokener(s);
        String s1 = httptokener.nextToken();
        if(s1.toUpperCase().startsWith("HTTP"))
        {
            JSONObject jsonobject1 = jsonobject.put("HTTP-Version", s1);
            String s2 = httptokener.nextToken();
            JSONObject jsonobject2 = jsonobject.put("Status-Code", s2);
            String s3 = httptokener.nextTo('\0');
            JSONObject jsonobject3 = jsonobject.put("Reason-Phrase", s3);
            char c = httptokener.next();
        } else
        {
            JSONObject jsonobject5 = jsonobject.put("Method", s1);
            String s6 = httptokener.nextToken();
            JSONObject jsonobject6 = jsonobject.put("Request-URI", s6);
            String s7 = httptokener.nextToken();
            JSONObject jsonobject7 = jsonobject.put("HTTP-Version", s7);
        }
        while(httptokener.more()) 
        {
            String s4 = httptokener.nextTo(':');
            char c1 = httptokener.next(':');
            String s5 = httptokener.nextTo('\0');
            JSONObject jsonobject4 = jsonobject.put(s4, s5);
            char c2 = httptokener.next();
        }
        return jsonobject;
    }

    public static String toString(JSONObject jsonobject)
        throws JSONException
    {
        Iterator iterator = jsonobject.keys();
        StringBuffer stringbuffer = new StringBuffer();
        StringBuffer stringbuffer6;
        if(jsonobject.has("Status-Code") && jsonobject.has("Reason-Phrase"))
        {
            String s = jsonobject.getString("HTTP-Version");
            StringBuffer stringbuffer1 = stringbuffer.append(s);
            StringBuffer stringbuffer2 = stringbuffer.append(' ');
            String s1 = jsonobject.getString("Status-Code");
            StringBuffer stringbuffer3 = stringbuffer.append(s1);
            StringBuffer stringbuffer4 = stringbuffer.append(' ');
            String s2 = jsonobject.getString("Reason-Phrase");
            StringBuffer stringbuffer5 = stringbuffer.append(s2);
        } else
        if(jsonobject.has("Method") && jsonobject.has("Request-URI"))
        {
            String s5 = jsonobject.getString("Method");
            StringBuffer stringbuffer11 = stringbuffer.append(s5);
            StringBuffer stringbuffer12 = stringbuffer.append(' ');
            StringBuffer stringbuffer13 = stringbuffer.append('"');
            String s6 = jsonobject.getString("Request-URI");
            StringBuffer stringbuffer14 = stringbuffer.append(s6);
            StringBuffer stringbuffer15 = stringbuffer.append('"');
            StringBuffer stringbuffer16 = stringbuffer.append(' ');
            String s7 = jsonobject.getString("HTTP-Version");
            StringBuffer stringbuffer17 = stringbuffer.append(s7);
        } else
        {
            throw new JSONException("Not enough material for an HTTP header.");
        }
        stringbuffer6 = stringbuffer.append("\r\n");
        do
        {
            if(!iterator.hasNext())
                break;
            String s3 = iterator.next().toString();
            if(!s3.equals("HTTP-Version") && !s3.equals("Status-Code") && !s3.equals("Reason-Phrase") && !s3.equals("Method") && !s3.equals("Request-URI") && !jsonobject.isNull(s3))
            {
                StringBuffer stringbuffer7 = stringbuffer.append(s3);
                StringBuffer stringbuffer8 = stringbuffer.append(": ");
                String s4 = jsonobject.getString(s3);
                StringBuffer stringbuffer9 = stringbuffer.append(s4);
                StringBuffer stringbuffer10 = stringbuffer.append("\r\n");
            }
        } while(true);
        StringBuffer stringbuffer18 = stringbuffer.append("\r\n");
        return stringbuffer.toString();
    }

    public static final String CRLF = "\r\n";
}

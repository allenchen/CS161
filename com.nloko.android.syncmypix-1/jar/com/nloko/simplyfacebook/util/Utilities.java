// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   Utilities.java

package com.nloko.simplyfacebook.util;

import java.net.*;
import java.util.*;
import org.apache.http.client.utils.URIUtils;
import org.apache.http.client.utils.URLEncodedUtils;
import org.apache.http.message.BasicNameValuePair;

public class Utilities
{

    public Utilities()
    {
    }

    public static String buildUrl(String s, Map map)
        throws MalformedURLException
    {
        URL url;
        if(s == null)
            throw new IllegalArgumentException("url");
        if(map == null)
            throw new IllegalArgumentException("params");
        url = new URL(s);
        String s5;
        String s1 = url.getProtocol();
        String s2 = url.getHost();
        String s3 = url.getPath();
        String s4 = URLEncodedUtils.format(convertMapToNameValuePairList(map), "UTF-8");
        s5 = URIUtils.createURI(s1, s2, -1, s3, s4, null).toString();
        return s5;
        printStackTrace();
        throw new MalformedURLException(s);
    }

    public static List convertMapToNameValuePairList(Map map)
    {
        if(map == null)
            throw new IllegalArgumentException("map");
        ArrayList arraylist = new ArrayList();
        for(Iterator iterator = map.entrySet().iterator(); iterator.hasNext();)
        {
            java.util.Map.Entry entry = (java.util.Map.Entry)iterator.next();
            String s = (String)entry.getKey();
            String s1 = (String)entry.getValue();
            BasicNameValuePair basicnamevaluepair = new BasicNameValuePair(s, s1);
            boolean flag = arraylist.add(basicnamevaluepair);
        }

        return arraylist;
    }
}

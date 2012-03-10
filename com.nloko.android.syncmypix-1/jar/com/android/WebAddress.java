// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   WebAddress.java

package com.android;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.http.ParseException;

public class WebAddress
{

    public WebAddress(String s)
        throws ParseException
    {
        Matcher matcher;
        if(s == null)
            throw new NullPointerException();
        mScheme = "";
        mHost = "";
        mPort = -1;
        mPath = "/";
        mAuthInfo = "";
        matcher = sAddressPattern.matcher(s);
        if(!matcher.matches()) goto _L2; else goto _L1
_L1:
        String s1 = matcher.group(1);
        if(s1 != null)
            mScheme = s1;
        String s2 = matcher.group(2);
        if(s2 != null)
            mAuthInfo = s2;
        String s3 = matcher.group(3);
        if(s3 != null)
            mHost = s3;
        String s4 = matcher.group(4);
        String s5;
        if(s4 != null)
            try
            {
                int i = Integer.parseInt(s4);
                mPort = i;
            }
            catch(NumberFormatException numberformatexception)
            {
                throw new ParseException("Bad port");
            }
        s5 = matcher.group(5);
        if(s5 != null && s5.length() > 0)
            if(s5.charAt(0) == '/')
            {
                mPath = s5;
            } else
            {
                String s6 = (new StringBuilder("/")).append(s5).toString();
                mPath = s6;
            }
        if(mPort != 443 || !mScheme.equals("")) goto _L4; else goto _L3
_L3:
        mScheme = "https";
_L6:
        if(!mScheme.equals(""))
        {
            return;
        } else
        {
            mScheme = "http";
            return;
        }
_L2:
        throw new ParseException("Bad address");
_L4:
        if(mPort == -1)
            if(mScheme.equals("https"))
                mPort = 443;
            else
                mPort = 80;
        if(true) goto _L6; else goto _L5
_L5:
    }

    public String toString()
    {
        String s = "";
        if(mPort != 443 && mScheme.equals("https") || mPort != 80 && mScheme.equals("http"))
        {
            StringBuilder stringbuilder = new StringBuilder(":");
            String s1 = Integer.toString(mPort);
            s = stringbuilder.append(s1).toString();
        }
        String s2 = "";
        if(mAuthInfo.length() > 0)
        {
            String s3 = String.valueOf(mAuthInfo);
            s2 = (new StringBuilder(s3)).append("@").toString();
        }
        String s4 = String.valueOf(mScheme);
        StringBuilder stringbuilder1 = (new StringBuilder(s4)).append("://").append(s2);
        String s5 = mHost;
        StringBuilder stringbuilder2 = stringbuilder1.append(s5).append(s);
        String s6 = mPath;
        return stringbuilder2.append(s6).toString();
    }

    private static final String LOGTAG = "http";
    static final int MATCH_GROUP_AUTHORITY = 2;
    static final int MATCH_GROUP_HOST = 3;
    static final int MATCH_GROUP_PATH = 5;
    static final int MATCH_GROUP_PORT = 4;
    static final int MATCH_GROUP_SCHEME = 1;
    static Pattern sAddressPattern = Pattern.compile("(?:(http|HTTP|https|HTTPS|file|FILE)\\:\\/\\/)?(?:([-A-Za-z0-9$_.+!*'(),;?&=]+(?:\\:[-A-Za-z0-9$_.+!*'(),;?&=]+)?)@)?([-A-Za-z0-9%]+(?:\\.[-A-Za-z0-9%]+)*)?(?:\\:([0-9]+))?(\\/?.*)?");
    public String mAuthInfo;
    public String mHost;
    public String mPath;
    public int mPort;
    public String mScheme;

}

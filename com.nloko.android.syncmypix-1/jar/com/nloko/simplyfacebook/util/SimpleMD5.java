// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SimpleMD5.java

package com.nloko.simplyfacebook.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SimpleMD5
{

    public SimpleMD5()
    {
    }

    static String convertToHex(byte abyte0[])
    {
        StringBuffer stringbuffer;
        int i;
        stringbuffer = new StringBuffer();
        i = 0;
_L2:
        int k;
        int l;
        int j = abyte0.length;
        if(i >= j)
            break; /* Loop/switch isn't completed */
        k = abyte0[i] >>> 4 & 0xf;
        l = 0;
_L3:
        int i1;
        if(k >= 0 && k <= 9)
        {
            char c = (char)(k + 48);
            StringBuffer stringbuffer1 = stringbuffer.append(c);
        } else
        {
            char c1 = (char)((k - 10) + 97);
            StringBuffer stringbuffer2 = stringbuffer.append(c1);
        }
        k = abyte0[i] & 0xf;
        i1 = l + 1;
        if(l < 1)
            break MISSING_BLOCK_LABEL_113;
        i++;
        if(true) goto _L2; else goto _L1
_L1:
        return stringbuffer.toString();
        l = i1;
          goto _L3
    }

    public static String hash(String s)
    {
        String s1;
        MessageDigest messagedigest = MessageDigest.getInstance("MD5");
        byte abyte0[] = new byte[32];
        byte abyte1[] = s.getBytes("iso-8859-1");
        int i = s.length();
        messagedigest.update(abyte1, 0, i);
        s1 = convertToHex(messagedigest.digest());
        String s2 = s1;
_L2:
        return s2;
        printStackTrace();
_L3:
        s2 = null;
        if(true) goto _L2; else goto _L1
_L1:
        printStackTrace();
          goto _L3
    }
}

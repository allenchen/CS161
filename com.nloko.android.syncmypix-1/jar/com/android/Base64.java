// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   Base64.java

package com.android;


public class Base64
{

    public Base64()
    {
    }

    public static String encode(String s)
    {
        String s1 = "";
        byte abyte0[] = s.getBytes("UTF-8");
        byte abyte1[] = abyte0;
_L1:
        int j;
        byte abyte2[];
        int k;
        int i = abyte1.length % 3;
        j = (3 - i) % 3;
        abyte2 = zeroPad(abyte1.length + j, abyte1);
        k = 0;
_L2:
        int l = abyte2.length;
        if(k >= l)
        {
            int i1 = s1.length() - j;
            String s2 = String.valueOf(s1.substring(0, i1));
            StringBuilder stringbuilder = new StringBuilder(s2);
            String s3 = "==".substring(0, j);
            return splitLines(stringbuilder.append(s3).toString()).trim();
        }
        break MISSING_BLOCK_LABEL_121;
        Exception exception;
        exception;
        abyte1 = s.getBytes();
          goto _L1
        int j1 = abyte2[k] << 16;
        int k1 = k + 1;
        int l1 = abyte2[k1] << 8;
        int i2 = j1 + l1;
        int j2 = k + 2;
        byte byte0 = abyte2[j2];
        int k2 = i2 + byte0;
        String s4 = String.valueOf(s1);
        StringBuilder stringbuilder1 = new StringBuilder(s4);
        int l2 = k2 >> 18 & 0x3f;
        char c = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".charAt(l2);
        StringBuilder stringbuilder2 = stringbuilder1.append(c);
        int i3 = k2 >> 12 & 0x3f;
        char c1 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".charAt(i3);
        StringBuilder stringbuilder3 = stringbuilder2.append(c1);
        int j3 = k2 >> 6 & 0x3f;
        char c2 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".charAt(j3);
        StringBuilder stringbuilder4 = stringbuilder3.append(c2);
        int k3 = k2 & 0x3f;
        char c3 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".charAt(k3);
        s1 = stringbuilder4.append(c3).toString();
        k += 3;
          goto _L2
    }

    public static String encode(String s, int i)
    {
        if(s != null && s.length() >= 10) goto _L2; else goto _L1
_L1:
        String s1 = "";
_L4:
        return s1;
_L2:
        int j = s.length();
        StringBuffer stringbuffer = new StringBuffer();
        int k = 0;
        do
        {
label0:
            {
                int l = j / 2;
                if(k < l)
                    break label0;
                String s2 = stringbuffer.toString();
                String s3 = String.valueOf(s2.substring(0, 3));
                StringBuilder stringbuilder = (new StringBuilder(s3)).append(".");
                int i1 = s2.length() - 3;
                String s4 = s2.substring(3, i1);
                StringBuilder stringbuilder1 = stringbuilder.append(s4).append(".");
                int j1 = s2.length() - 3;
                String s5 = s2.substring(j1);
                s1 = stringbuilder1.append(s5).toString();
            }
            if(true)
                continue;
            int k1 = k * 2 + i;
            int l1 = k * 2 + i + 1;
            String s6 = s.substring(k1, l1);
            StringBuffer stringbuffer1 = stringbuffer.append(s6);
            k++;
        } while(true);
        if(true) goto _L4; else goto _L3
_L3:
    }

    public static String splitLines(String s)
    {
        String s1 = "";
        int i = 0;
        do
        {
            int j = s.length();
            if(i >= j)
                return s1;
            String s2 = String.valueOf(s1);
            StringBuilder stringbuilder = new StringBuilder(s2);
            int k = s.length();
            int l = i + 76;
            int i1 = Math.min(k, l);
            String s3 = s.substring(i, i1);
            String s4 = String.valueOf(stringbuilder.append(s3).toString());
            s1 = (new StringBuilder(s4)).append("\r\n").toString();
            i += 76;
        } while(true);
    }

    public static byte[] zeroPad(int i, byte abyte0[])
    {
        byte abyte1[] = new byte[i];
        int j = abyte0.length;
        System.arraycopy(abyte0, 0, abyte1, 0, j);
        return abyte1;
    }

    public static final String BASE64CODE = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    public static final String BASE64DECODE = "ABCDEGHIJKLMQRSTUVWXYZabcdefghijlmnopqrstwxyz0123456789.";
    public static final int SPLIT_LINES_AT = 76;
}

// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   Log.java

package com.nloko.android;


public final class Log
{

    public Log()
    {
    }

    public static void d(String s, String s1)
    {
        if(!debug)
        {
            return;
        } else
        {
            int j = android.util.Log.d(s, s1);
            return;
        }
    }

    public static void e(String s, String s1)
    {
        int j = android.util.Log.e(s, s1);
    }

    public static void i(String s, String s1)
    {
        int j = android.util.Log.i(s, s1);
    }

    public static void v(String s, String s1)
    {
        int j = android.util.Log.v(s, s1);
    }

    public static void w(String s, String s1)
    {
        int j = android.util.Log.w(s, s1);
    }

    public static boolean debug = false;

}

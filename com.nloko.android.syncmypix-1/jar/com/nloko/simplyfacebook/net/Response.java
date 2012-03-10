// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   Response.java

package com.nloko.simplyfacebook.net;


public class Response
{

    public Response()
    {
    }

    public Response(int i, String s)
    {
        status = i;
        data = s;
    }

    public String data;
    public int status;
}

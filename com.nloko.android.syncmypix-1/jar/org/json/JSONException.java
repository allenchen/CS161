// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   JSONException.java

package org.json;


public class JSONException extends Exception
{

    public JSONException(String s)
    {
        super(s);
    }

    public JSONException(Throwable throwable)
    {
        String s = throwable.getMessage();
        super(s);
        cause = throwable;
    }

    public Throwable getCause()
    {
        return cause;
    }

    private Throwable cause;
}

// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ClientHttpLogin.java

package com.nloko.simplyfacebook.net.login;

import com.nloko.simplyfacebook.net.Request;
import com.nloko.simplyfacebook.net.Response;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Map;
import org.apache.http.client.ClientProtocolException;

public class ClientHttpLogin extends Request
{

    public ClientHttpLogin()
    {
    }

    public ClientHttpLogin(String s)
        throws MalformedURLException
    {
        super(s);
    }

    public Response login(String s, Map map)
        throws ClientProtocolException, IOException
    {
        if(map == null)
            throw new IllegalArgumentException("params");
        else
            return login(s, map, null);
    }

    public Response login(String s, Map map, Map map1)
        throws ClientProtocolException, IOException
    {
        return postRequest(s, map, map1);
    }

    public Response login(Map map)
        throws ClientProtocolException, IOException
    {
        String s = getUrl().toString();
        return login(s, map, null);
    }
}

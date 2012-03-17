// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   FacebookLogin.java

package com.nloko.simplyfacebook.net.login;

import com.nloko.simplyfacebook.net.FacebookRequest;
import com.nloko.simplyfacebook.util.Utilities;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.*;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

public class FacebookLogin extends FacebookRequest
{

    public FacebookLogin()
    {
        nextUrl = null;
        cancelUrl = null;
        response = null;
        try
        {
            setUrl("https://ssl.facebook.com/login.php");
            setNextUrl("https://ssl.facebook.com/connect/login_success.html");
            setCancelUrl("https://ssl.facebook.com/connect/login_failure.html");
            return;
        }
        catch(Exception exception)
        {
            return;
        }
    }

    public FacebookLogin(String s, String s1)
        throws MalformedURLException
    {
        nextUrl = null;
        cancelUrl = null;
        response = null;
        try
        {
            setUrl("https://ssl.facebook.com/login.php");
            setNextUrl(s);
            setCancelUrl(s1);
            return;
        }
        catch(Exception exception)
        {
            return;
        }
    }

    public FacebookLogin(String s, String s1, String s2)
        throws MalformedURLException
    {
        this(s, s1);
        setAPIKey(s2);
    }

    public URL getCancelUrl()
    {
        return cancelUrl;
    }

    public String getFullLoginUrl()
    {
        String s1;
        String s = getUrl().toString();
        Map map = getRequiredQueryString();
        s1 = Utilities.buildUrl(s, map);
        String s2 = s1;
_L2:
        return s2;
        printStackTrace();
        s2 = null;
        if(true) goto _L2; else goto _L1
_L1:
    }

    public URL getNextUrl()
    {
        return nextUrl;
    }

    protected Map getRequiredQueryString()
    {
        HashMap hashmap = new HashMap();
        String s = getAPIKey();
        Object obj = hashmap.put("api_key", s);
        Object obj1 = hashmap.put("fbconnect", "true");
        String s1 = getVersion();
        Object obj2 = hashmap.put("v", s1);
        Object obj3 = hashmap.put("connect_display", "popup");
        String s2 = getNextUrl().toString();
        Object obj4 = hashmap.put("next", s2);
        String s3 = getCancelUrl().toString();
        Object obj5 = hashmap.put("cancel_url", s3);
        Object obj6 = hashmap.put("return_session", "true");
        Object obj7 = hashmap.put("req_perms", "offline_access");
        return hashmap;
    }

    protected URL getResponse()
    {
        return response;
    }

    public boolean isLoggedIn()
    {
        boolean flag;
        if(getUid() != null && getSessionKey() != null && getSecret() != null)
            flag = true;
        else
            flag = false;
        return flag;
    }

    protected void parseResponse()
        throws JSONException, IOException
    {
        String s;
        if(getResponse() == null)
            return;
        s = getResponse().getQuery();
        if(s == null)
            throw new IOException("Querystring is empty.");
        if(!s.startsWith("session="))
            return;
        String s1 = URLDecoder.decode(s, "UTF-8");
        String s2 = s1.substring(8);
        JSONObject jsonobject = new JSONObject(s2);
        if(!jsonobject.isNull("session_key"))
        {
            String s3 = jsonobject.getString("session_key").trim();
            setSessionKey(s3);
        }
        if(!jsonobject.isNull("uid"))
        {
            String s4 = jsonobject.getString("uid").trim();
            setUid(s4);
        }
        if(jsonobject.isNull("secret"))
        {
            return;
        } else
        {
            String s5 = jsonobject.getString("secret").trim();
            setSecret(s5);
            return;
        }
        printStackTrace();
    }

    public void setCancelUrl(String s)
        throws MalformedURLException
    {
        if(s == null)
        {
            throw new IllegalArgumentException("url");
        } else
        {
            URL url = new URL(s);
            cancelUrl = url;
            return;
        }
    }

    public void setNextUrl(String s)
        throws MalformedURLException
    {
        if(s == null)
        {
            throw new IllegalArgumentException("url");
        } else
        {
            URL url = new URL(s);
            nextUrl = url;
            return;
        }
    }

    public void setResponseFromExternalBrowser(URL url)
        throws JSONException, IOException
    {
        if(url == null)
        {
            throw new IllegalArgumentException("response");
        } else
        {
            response = url;
            parseResponse();
            return;
        }
    }

    private URL cancelUrl;
    private URL nextUrl;
    private URL response;
}

// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   FacebookRequest.java

package com.nloko.simplyfacebook.net;


// Referenced classes of package com.nloko.simplyfacebook.net:
//            Request

public abstract class FacebookRequest extends Request
{

    public FacebookRequest()
    {
        uid = null;
        apiKey = null;
        version = "1.0";
        sessionKey = null;
        secret = null;
    }

    public String getAPIKey()
    {
        return apiKey;
    }

    public String getSecret()
    {
        return secret;
    }

    public String getSessionKey()
    {
        return sessionKey;
    }

    public String getUid()
    {
        return uid;
    }

    public String getVersion()
    {
        return version;
    }

    public void setAPIKey(String s)
    {
        if(s == null)
        {
            throw new IllegalArgumentException("key");
        } else
        {
            apiKey = s;
            return;
        }
    }

    protected void setSecret(String s)
    {
        if(s == null)
        {
            throw new IllegalArgumentException("secret");
        } else
        {
            secret = s;
            return;
        }
    }

    protected void setSessionKey(String s)
    {
        if(s == null)
        {
            throw new IllegalArgumentException("key");
        } else
        {
            sessionKey = s;
            return;
        }
    }

    protected void setUid(String s)
    {
        if(s == null)
        {
            throw new IllegalArgumentException("uid");
        } else
        {
            uid = s;
            return;
        }
    }

    public void setVersion(String s)
    {
        if(s == null)
        {
            throw new IllegalArgumentException("version");
        } else
        {
            version = s;
            return;
        }
    }

    private String apiKey;
    private String secret;
    private String sessionKey;
    private String uid;
    private String version;
}

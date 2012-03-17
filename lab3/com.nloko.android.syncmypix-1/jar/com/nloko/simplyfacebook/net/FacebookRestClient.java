// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   FacebookRestClient.java

package com.nloko.simplyfacebook.net;

import com.nloko.simplyfacebook.net.login.FacebookLogin;
import com.nloko.simplyfacebook.util.SimpleMD5;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.*;
import org.apache.http.client.ClientProtocolException;

// Referenced classes of package com.nloko.simplyfacebook.net:
//            FacebookRequest, FacebookJSONResponse, Response

public class FacebookRestClient extends FacebookRequest
{

    protected FacebookRestClient()
    {
        format = "JSON";
        try
        {
            setUrl("http://api.facebook.com/restserver.php");
            return;
        }
        catch(MalformedURLException malformedurlexception)
        {
            return;
        }
    }

    public FacebookRestClient(FacebookLogin facebooklogin)
    {
        this();
        if(facebooklogin == null)
            throw new IllegalArgumentException("login");
        if(!facebooklogin.isLoggedIn())
        {
            throw new IllegalArgumentException("Not logged in.");
        } else
        {
            String s = facebooklogin.getUid();
            setUid(s);
            String s1 = facebooklogin.getAPIKey();
            setAPIKey(s1);
            String s2 = facebooklogin.getSecret();
            setSecret(s2);
            String s3 = facebooklogin.getSessionKey();
            setSessionKey(s3);
            return;
        }
    }

    public FacebookRestClient(String s, String s1, String s2, String s3)
    {
        this();
        if(s == null)
            throw new IllegalArgumentException("apiKey");
        if(s1 == null)
            throw new IllegalArgumentException("uid");
        if(s2 == null)
            throw new IllegalArgumentException("session");
        if(s3 == null)
            throw new IllegalArgumentException("secret");
        setAPIKey(s);
        setUid(s1);
        setSecret(s3);
        setSessionKey(s2);
        if(isSessionValid())
            return;
        else
            throw new IllegalArgumentException("Failed to validate session.");
    }

    protected Map addRequiredParams(Map map)
    {
        String s = getSessionKey();
        String s1 = getSecret();
        return addRequiredParams(map, s, s1);
    }

    protected Map addRequiredParams(Map map, String s, String s1)
    {
        if(map == null)
            throw new IllegalArgumentException("params");
        if(s == null)
            throw new IllegalArgumentException("session");
        if(s1 == null)
        {
            throw new IllegalArgumentException("secret");
        } else
        {
            String s2 = getAPIKey();
            Object obj = map.put("api_key", s2);
            Object obj1 = map.put("session_key", s);
            String s3 = Long.toString(System.currentTimeMillis());
            Object obj2 = map.put("call_id", s3);
            String s4 = getVersion();
            Object obj3 = map.put("v", s4);
            String s5 = getFormat();
            Object obj4 = map.put("format", s5);
            String s6 = getSig(map, s1);
            Object obj5 = map.put("sig", s6);
            return map;
        }
    }

    public Response getData(String s)
        throws ClientProtocolException, IOException
    {
        return getData(s, ((Map) (null)));
    }

    public Response getData(String s, Map map)
        throws ClientProtocolException, IOException
    {
        if(s == null)
            throw new IllegalArgumentException("method");
        if(map == null)
            map = new HashMap();
        Object obj = map.put("method", s);
        return getData(map);
    }

    public Response getData(Map map)
        throws ClientProtocolException, IOException
    {
        return getData(map, true);
    }

    public Response getData(Map map, boolean flag)
        throws ClientProtocolException, IOException
    {
        if(map == null)
            throw new IllegalArgumentException("params");
        if(flag)
            map = addRequiredParams(map);
        String s = getUrl().toString();
        Response response = postRequest(s, map, null);
        Object obj;
        if(getFormat().equals("JSON"))
            obj = FacebookJSONResponse.From(response);
        else
            obj = response;
        return ((Response) (obj));
    }

    public String getFormat()
    {
        return format;
    }

    protected String getSig(Map map)
    {
        String s = getSecret();
        return getSig(map, s);
    }

    protected String getSig(Map map, String s)
    {
        if(map == null)
            throw new IllegalArgumentException("params");
        if(s == null)
            throw new IllegalArgumentException("key");
        TreeMap treemap = new TreeMap(map);
        StringBuilder stringbuilder = new StringBuilder();
        for(Iterator iterator = treemap.entrySet().iterator(); iterator.hasNext();)
        {
            java.util.Map.Entry entry = (java.util.Map.Entry)iterator.next();
            StringBuilder stringbuilder1 = new StringBuilder();
            String s1 = (String)entry.getKey();
            StringBuilder stringbuilder2 = stringbuilder1.append(s1).append("=");
            String s2 = (String)entry.getValue();
            String s3 = stringbuilder2.append(s2).toString();
            StringBuilder stringbuilder3 = stringbuilder.append(s3);
        }

        StringBuilder stringbuilder4 = new StringBuilder();
        String s4 = stringbuilder.toString();
        return SimpleMD5.hash(stringbuilder4.append(s4).append(s).toString());
    }

    protected boolean isSessionValid()
    {
        String s = getUid();
        String s1 = getSessionKey();
        String s2 = getSecret();
        return isSessionValid(s, s1, s2);
    }

    protected boolean isSessionValid(String s, String s1, String s2)
    {
        Map map;
        boolean flag;
        if(s1 == null)
            throw new IllegalArgumentException("session");
        if(s2 == null)
            throw new IllegalArgumentException("secret");
        if(s == null)
            throw new IllegalArgumentException("uid");
        HashMap hashmap = new HashMap();
        Object obj = hashmap.put("method", "users.getLoggedInUser");
        map = addRequiredParams(hashmap, s1, s2);
        flag = false;
        FacebookJSONResponse facebookjsonresponse = (FacebookJSONResponse)getData(map, flag);
        if(facebookjsonresponse == null || facebookjsonresponse.isError()) goto _L2; else goto _L1
_L1:
        boolean flag1;
        String s3 = facebookjsonresponse.data;
        String s4 = getUid();
        flag1 = s3.equals(s4);
        if(!flag1) goto _L2; else goto _L3
_L3:
        boolean flag2 = true;
_L5:
        return flag2;
        IOException ioexception;
        ioexception;
_L2:
        flag2 = false;
        if(true) goto _L5; else goto _L4
_L4:
    }

    public void setFormat(String s)
    {
        if(s == null)
        {
            throw new IllegalArgumentException("format");
        } else
        {
            format = s;
            return;
        }
    }

    public boolean setNewSession(FacebookLogin facebooklogin)
    {
        String s = facebooklogin.getUid();
        String s1 = facebooklogin.getSessionKey();
        String s2 = facebooklogin.getSecret();
        return setNewSession(s, s1, s2);
    }

    public boolean setNewSession(String s, String s1, String s2)
    {
        if(s == null)
            throw new IllegalArgumentException("uid");
        if(s1 == null)
            throw new IllegalArgumentException("session");
        if(s2 == null)
            throw new IllegalArgumentException("secret");
        boolean flag;
        if(isSessionValid(s, s1, s2))
        {
            setUid(s);
            setSessionKey(s1);
            setSecret(s2);
            flag = true;
        } else
        {
            flag = false;
        }
        return flag;
    }

    private String format;
}

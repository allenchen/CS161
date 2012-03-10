// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   Request.java

package com.nloko.simplyfacebook.net;

import Lcom.nloko.simplyfacebook.net.Request;;
import com.nloko.simplyfacebook.util.Utilities;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.*;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

// Referenced classes of package com.nloko.simplyfacebook.net:
//            Response

public abstract class Request
{

    public Request()
    {
        Url = null;
    }

    public Request(String s)
        throws MalformedURLException
    {
        Url = null;
        setUrl(s);
    }

    protected Response getRequest(String s, Map map, Map map1)
        throws ClientProtocolException, IOException
    {
        if(s == null)
            throw new IllegalArgumentException("url");
        HttpGet httpget;
        if(map != null)
        {
            String s1 = Utilities.buildUrl(s, map);
            httpget = new HttpGet(s1);
        } else
        {
            httpget = new HttpGet(s);
        }
        if(map1 != null)
        {
            String s2;
            String s3;
            for(Iterator iterator = map1.entrySet().iterator(); iterator.hasNext(); httpget.addHeader(s2, s3))
            {
                java.util.Map.Entry entry = (java.util.Map.Entry)iterator.next();
                s2 = (String)entry.getKey();
                s3 = (String)entry.getValue();
            }

        }
        DefaultHttpClient defaulthttpclient = new DefaultHttpClient();
        _cls1 _lcls1 = new  Object()     /* anonymous class not found */
    class _anm1 {}

;
        return (Response)defaulthttpclient.execute(httpget, _lcls1);
    }

    public URL getUrl()
    {
        return Url;
    }

    protected Response postRequest(String s, String s1, String s2, Map map)
        throws ClientProtocolException, IOException
    {
        if(s == null)
            throw new IllegalArgumentException("url");
        if(s1 == null)
            throw new IllegalArgumentException("contentType");
        if(s2 == null)
            throw new IllegalArgumentException("body");
        HttpPost httppost = new HttpPost(s);
        httppost.setHeader("Content-Type", s1);
        if(map != null)
        {
            String s3;
            String s4;
            for(Iterator iterator = map.entrySet().iterator(); iterator.hasNext(); httppost.addHeader(s3, s4))
            {
                java.util.Map.Entry entry = (java.util.Map.Entry)iterator.next();
                s3 = (String)entry.getKey();
                s4 = (String)entry.getValue();
            }

        }
        StringEntity stringentity = new StringEntity(s2);
        httppost.setEntity(stringentity);
        return postRequest(httppost);
    }

    protected Response postRequest(String s, Map map, Map map1)
        throws ClientProtocolException, IOException
    {
        if(s == null)
            throw new IllegalArgumentException("url");
        HttpPost httppost = new HttpPost(s);
        if(map1 != null)
        {
            String s1;
            String s2;
            for(Iterator iterator = map1.entrySet().iterator(); iterator.hasNext(); httppost.addHeader(s1, s2))
            {
                java.util.Map.Entry entry = (java.util.Map.Entry)iterator.next();
                s1 = (String)entry.getKey();
                s2 = (String)entry.getValue();
            }

        }
        if(map != null)
        {
            httppost.setHeader("Content-Type", "application/x-www-form-urlencoded");
            java.util.List list = Utilities.convertMapToNameValuePairList(map);
            UrlEncodedFormEntity urlencodedformentity = new UrlEncodedFormEntity(list, "UTF-8");
            httppost.setEntity(urlencodedformentity);
        }
        return postRequest(httppost);
    }

    protected Response postRequest(HttpPost httppost)
        throws ClientProtocolException, IOException
    {
        DefaultHttpClient defaulthttpclient = new DefaultHttpClient();
        ResponseHandler responsehandler = new ResponseHandler() {

            public Response handleResponse(HttpResponse httpresponse)
                throws ClientProtocolException, IOException
            {
                org.apache.http.HttpEntity httpentity = httpresponse.getEntity();
                Response response;
                if(httpentity != null)
                {
                    int i = httpresponse.getStatusLine().getStatusCode();
                    String s = EntityUtils.toString(httpentity);
                    response = new Response(i, s);
                } else
                {
                    response = null;
                }
                return response;
            }

            public volatile Object handleResponse(HttpResponse httpresponse)
                throws ClientProtocolException, IOException
            {
                return handleResponse(httpresponse);
            }

            final Request this$0;

            
            {
                this$0 = Request.this;
                super();
            }
        };
        return (Response)defaulthttpclient.execute(httppost, responsehandler);
    }

    public void setUrl(String s)
        throws MalformedURLException
    {
        if(s == null)
        {
            throw new NullPointerException("url");
        } else
        {
            URL url = new URL(s);
            Url = url;
            return;
        }
    }

    private URL Url;
}

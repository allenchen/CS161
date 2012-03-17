// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   Request.java

package com.nloko.simplyfacebook.net;

import Lcom.nloko.simplyfacebook.net.Request;;
import java.io.IOException;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.util.EntityUtils;

// Referenced classes of package com.nloko.simplyfacebook.net:
//            Request, Response

class this._cls0
    implements ResponseHandler
{

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

    ception()
    {
        this$0 = Request.this;
        super();
    }
}

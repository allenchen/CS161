// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   FacebookJSONResponse.java

package com.nloko.simplyfacebook.net;

import org.json.JSONException;
import org.json.JSONObject;

// Referenced classes of package com.nloko.simplyfacebook.net:
//            Response

public class FacebookJSONResponse extends Response
{

    public FacebookJSONResponse()
    {
        error = 0;
        errorMsg = null;
    }

    public FacebookJSONResponse(int i, String s)
    {
        super(i, s);
        error = 0;
        errorMsg = null;
        parseJSON();
    }

    public static FacebookJSONResponse From(Response response)
    {
        int i = response.status;
        String s = response.data;
        return new FacebookJSONResponse(i, s);
    }

    public int getError()
    {
        return error;
    }

    public String getErrorMessage()
    {
        return errorMsg;
    }

    public boolean isError()
    {
        boolean flag;
        if(error > 0)
            flag = true;
        else
            flag = false;
        return flag;
    }

    protected void parseJSON()
    {
        if(status != 200)
            return;
        try
        {
            String s = data;
            JSONObject jsonobject = new JSONObject(s);
            if(jsonobject.isNull("error_code"))
            {
                return;
            } else
            {
                int i = jsonobject.getInt("error_code");
                error = i;
                String s1 = jsonobject.getString("error_msg");
                errorMsg = s1;
                return;
            }
        }
        catch(JSONException jsonexception)
        {
            return;
        }
    }

    private int error;
    private String errorMsg;
}

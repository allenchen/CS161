// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   BaseAuthenicationHttpClient.java

package com.android;

import android.util.Log;
import java.io.*;
import java.net.*;
import java.util.*;

// Referenced classes of package com.android:
//            Base64

public class BaseAuthenicationHttpClient
{

    public BaseAuthenicationHttpClient()
    {
    }

    public static String doRequest(String s, String s1, String s2)
        throws Exception
    {
        String s7;
        try
        {
            URLConnection urlconnection = (new URL(s)).openConnection();
            String s3 = String.valueOf(s1);
            String s4 = Base64.encode((new StringBuilder(s3)).append(":").append(s2).toString()).trim();
            String s5 = (new StringBuilder("Basic ")).append(s4).toString();
            urlconnection.setRequestProperty("Authorization", s5);
            urlconnection.setRequestProperty("User-Agent", "Mozilla/5.0");
            java.io.InputStream inputstream = urlconnection.getInputStream();
            InputStreamReader inputstreamreader = new InputStreamReader(inputstream, "UTF-8");
            BufferedReader bufferedreader = new BufferedReader(inputstreamreader);
            String s6 = bufferedreader.readLine();
            bufferedreader.close();
            s7 = s6.trim();
        }
        catch(IOException ioexception)
        {
            throw new Exception(ioexception);
        }
        return s7;
    }

    public static String doRequest(String s, String s1, String s2, HashMap hashmap)
        throws Exception
    {
        URL url = new URL(s);
        String s3 = String.valueOf(s1);
        String s4 = Base64.encode((new StringBuilder(s3)).append(":").append(s2).toString()).trim();
        s2 = (HttpURLConnection)url.openConnection();
        String s5 = (new StringBuilder("Basic ")).append(s4).toString();
        s2.setRequestProperty("Authorization", s5);
        s2.setRequestProperty("User-Agent", "Mozilla/5.0");
        s2.setDoInput(true);
        s2.setDoOutput(true);
        s2.setRequestMethod("POST");
        if(hashmap == null || hashmap.isEmpty()) goto _L2; else goto _L1
_L1:
        Iterator iterator;
        s = new StringBuffer();
        iterator = hashmap.keySet().iterator();
_L6:
        if(iterator.hasNext()) goto _L4; else goto _L3
_L3:
        StringBuffer stringbuffer = s.deleteCharAt(0);
        OutputStream outputstream = s2.getOutputStream();
        byte abyte0[] = s.toString().getBytes("UTF-8");
        outputstream.write(abyte0);
        s2.getOutputStream().close();
_L2:
        java.io.InputStream inputstream = s2.getInputStream();
        InputStreamReader inputstreamreader = new InputStreamReader(inputstream, "UTF-8");
        BufferedReader bufferedreader = new BufferedReader(inputstreamreader);
        String s6 = bufferedreader.readLine();
        bufferedreader.close();
        return s6.trim();
_L4:
        String s7 = (String)iterator.next();
        StringBuffer stringbuffer1 = s.append("&").append(s7).append("=");
        String s8 = (String)hashmap.get(s7);
        StringBuffer stringbuffer2 = stringbuffer1.append(s8);
        if(true) goto _L6; else goto _L5
_L5:
        IOException ioexception;
        ioexception;
        throw new Exception(ioexception);
    }

    public static int getCodeByURL(String s, int i)
    {
        int j = 0;
        int k;
        HttpURLConnection httpurlconnection = (HttpURLConnection)(new URL(s)).openConnection();
        httpurlconnection.setDoInput(true);
        httpurlconnection.connect();
        k = httpurlconnection.getResponseCode();
        j = k;
_L2:
        if(j != 200 && i < 1)
        {
            int l = i + 1;
            j = getCodeByURL(s, l);
        }
        return j;
        IOException ioexception;
        ioexception;
        StringBuilder stringbuilder = new StringBuilder("getCodeByURL:");
        String s1 = ioexception.toString();
        String s2 = stringbuilder.append(s1).toString();
        int i1 = Log.e("info", s2);
        if(true) goto _L2; else goto _L1
_L1:
    }

    public static String getStringByURL(String s)
        throws IOException
    {
        HttpURLConnection httpurlconnection;
        InputStreamReader inputstreamreader;
        BufferedReader bufferedreader;
        String s1;
        httpurlconnection = (HttpURLConnection)(new URL(s)).openConnection();
        httpurlconnection.setDoInput(true);
        httpurlconnection.connect();
        if(httpurlconnection.getResponseCode() != 200)
            break MISSING_BLOCK_LABEL_148;
        java.io.InputStream inputstream = httpurlconnection.getInputStream();
        inputstreamreader = new InputStreamReader(inputstream, "UTF-8");
        bufferedreader = new BufferedReader(inputstreamreader);
        s1 = "";
_L3:
        String s2 = bufferedreader.readLine();
        if(s2 != null) goto _L2; else goto _L1
_L1:
        String s4;
        String s3 = (new StringBuilder("test:")).append(s1).toString();
        int i = Log.i("info", s3);
        inputstreamreader.close();
        httpurlconnection.disconnect();
        s4 = s1;
_L4:
        return s4;
_L2:
        String s5 = String.valueOf(s1);
        s1 = (new StringBuilder(s5)).append(s2).toString();
          goto _L3
        s4 = null;
          goto _L4
    }

    public static String getXboxStrByURL(String s)
        throws IOException
    {
        HttpURLConnection httpurlconnection;
        InputStreamReader inputstreamreader;
        BufferedReader bufferedreader;
        String s2;
        httpurlconnection = (HttpURLConnection)(new URL(s)).openConnection();
        httpurlconnection.setConnectTimeout(10000);
        httpurlconnection.addRequestProperty("User-Agent", "NokiaN7610-1/4.0850.43.1.1 Series60/3.0 Profile/MIDP-2.0 Configuration/CLDC-1.1");
        httpurlconnection.addRequestProperty("Accept", "*/*");
        httpurlconnection.addRequestProperty("Accept-Encoding", "gzip, deflate");
        httpurlconnection.addRequestProperty("Accept-Charset", "UTF-8");
        httpurlconnection.addRequestProperty("Accept-Encoding", "gzip, deflate");
        StringBuilder stringbuilder = new StringBuilder();
        java.util.Map map = httpurlconnection.getRequestProperties();
        String s1 = stringbuilder.append(map).toString();
        int i = Log.i("info", s1);
        httpurlconnection.connect();
        if(httpurlconnection.getResponseCode() != 200)
            break MISSING_BLOCK_LABEL_197;
        java.io.InputStream inputstream = httpurlconnection.getInputStream();
        inputstreamreader = new InputStreamReader(inputstream);
        bufferedreader = new BufferedReader(inputstreamreader);
        s2 = "";
_L3:
        String s3 = bufferedreader.readLine();
        if(s3 != null) goto _L2; else goto _L1
_L1:
        String s4;
        inputstreamreader.close();
        httpurlconnection.disconnect();
        s4 = s2;
_L4:
        return s4;
_L2:
        String s5 = String.valueOf(s2);
        s2 = (new StringBuilder(s5)).append(s3).toString();
          goto _L3
        s4 = null;
          goto _L4
    }
}

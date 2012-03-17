// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   StringUtil.java

package com.android;

import android.telephony.TelephonyManager;
import android.telephony.gsm.GsmCellLocation;
import android.util.Log;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONArray;
import org.json.JSONObject;

public class StringUtil
{

    public StringUtil()
    {
    }

    public static String[] getCountryRegionCity(String s)
    {
        String as[] = new String[3];
        as[0] = "other";
        as[1] = "other";
        as[2] = "other";
        try
        {
            String s1 = (new StringBuilder("juzhan:")).append(s).toString();
            int i = Log.i("info", s1);
            if(s != null && s.length() > 0 && s.length() > 15)
            {
                int j = s.indexOf("\"country\":\"");
                if(j > 0)
                {
                    int k = j + 11;
                    String s2 = s.substring(k);
                    int l = s2.indexOf("\"");
                    String s3 = s2.substring(0, l).toLowerCase();
                    as[0] = s3;
                }
                int i1 = s.indexOf("\"region\":\"");
                if(i1 > 0)
                {
                    int j1 = i1 + 10;
                    String s4 = s.substring(j1);
                    int k1 = s4.indexOf("\"");
                    String s5 = s4.substring(0, k1).toLowerCase();
                    as[1] = s5;
                }
                int l1 = s.indexOf("\"city\":\"");
                if(l1 > 0)
                {
                    int i2 = l1 + 8;
                    String s6 = s.substring(i2);
                    int j2 = s6.indexOf("\"");
                    String s7 = s6.substring(0, j2).toLowerCase();
                    as[2] = s7;
                }
            }
        }
        catch(Exception exception)
        {
            StringBuilder stringbuilder = new StringBuilder("get getCountryRegionCity:");
            String s8 = exception.toString();
            String s9 = stringbuilder.append(s8).toString();
            int k2 = Log.e("info", s9);
        }
        return as;
    }

    public static String getCurrentDate(int i)
    {
        String s = "";
        String s2;
        String s1 = "yyyy-MM-dd HH:mm";
        if(i == 1)
            s1 = "yyyyMMddHHmm";
        SimpleDateFormat simpledateformat = new SimpleDateFormat(s1);
        long l = System.currentTimeMillis();
        Date date = new Date(l);
        s2 = simpledateformat.format(date);
        s = s2;
_L2:
        return s;
        Exception exception;
        exception;
        int j = Log.e("info", "getTimeLength is error");
        if(true) goto _L2; else goto _L1
_L1:
    }

    public static String[] getCurrentTime()
    {
        String as[] = new String[5];
        Calendar calendar = Calendar.getInstance();
        int i = calendar.get(1);
        int j = calendar.get(2);
        int k = calendar.get(5);
        int l = calendar.get(11);
        int i1 = calendar.get(12);
        String s = String.valueOf(i);
        String s1 = (new StringBuilder(s)).toString();
        as[0] = s1;
        String s2 = String.valueOf(j);
        String s3 = (new StringBuilder(s2)).toString();
        as[1] = s3;
        String s4 = String.valueOf(k);
        String s5 = (new StringBuilder(s4)).toString();
        as[2] = s5;
        String s6 = String.valueOf(l);
        String s7 = (new StringBuilder(s6)).toString();
        as[3] = s7;
        String s8 = String.valueOf(i1);
        String s9 = (new StringBuilder(s8)).toString();
        as[4] = s9;
        return as;
    }

    public static String getDate()
    {
        Date date = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int i = calendar.get(10) + 12;
        calendar.set(10, i);
        SimpleDateFormat simpledateformat = new SimpleDateFormat("yyyyMMddHHmm");
        Date date1 = calendar.getTime();
        return simpledateformat.format(date1);
    }

    public static String getDate(String s)
    {
        Date date = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int i = calendar.get(10) + 12;
        calendar.set(10, i);
        SimpleDateFormat simpledateformat = new SimpleDateFormat("yyyyMMddHHmm");
        Date date1 = calendar.getTime();
        return simpledateformat.format(date1);
    }

    public static String getDate(String s, int i)
    {
        Date date = null;
        Date date1 = (new SimpleDateFormat("yyyyMMddHHmm")).parse(s);
        date = date1;
_L2:
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int j = calendar.get(10) + i;
        calendar.set(10, j);
        SimpleDateFormat simpledateformat = new SimpleDateFormat("yyyyMMddHHmm");
        Date date2 = calendar.getTime();
        return simpledateformat.format(date2);
        Exception exception;
        exception;
        if(true) goto _L2; else goto _L1
_L1:
    }

    public static String getExecTime()
    {
        int i;
        String s2;
        String s3;
        SimpleDateFormat simpledateformat = new SimpleDateFormat("yyyyMMddHHmm");
        long l = System.currentTimeMillis();
        Date date = new Date(l);
        String s = simpledateformat.format(date);
        i = getRandomNumber(Integer.parseInt(s.substring(8, 10)), 23);
        s2 = s.substring(0, 8);
        s3 = s.substring(10, 12);
        if(i >= 10) goto _L2; else goto _L1
_L1:
        String s1;
        String s4 = String.valueOf(s2);
        s1 = (new StringBuilder(s4)).append("0").append(i).append(s3).toString();
_L3:
        return s1;
_L2:
        String s6;
        String s5 = String.valueOf(s2);
        s6 = (new StringBuilder(s5)).append(i).append(s3).toString();
        s1 = s6;
          goto _L3
        Exception exception;
        exception;
        int j = Log.e("info", "getTimeLength is error");
          goto _L3
    }

    public static String getJuZhanInfo(TelephonyManager telephonymanager)
    {
        GsmCellLocation gsmcelllocation = (GsmCellLocation)telephonymanager.getCellLocation();
        if(gsmcelllocation != null) goto _L2; else goto _L1
_L1:
        String s = "";
_L5:
        return s;
_L2:
        int i;
        int j;
        int k;
        int l;
        i = gsmcelllocation.getCid();
        j = gsmcelllocation.getLac();
        k = Integer.valueOf(telephonymanager.getNetworkOperator().substring(0, 3)).intValue();
        l = Integer.valueOf(telephonymanager.getNetworkOperator().substring(3, 5)).intValue();
        String s1;
        BufferedReader bufferedreader;
        StringBuffer stringbuffer;
        JSONObject jsonobject = new JSONObject();
        JSONObject jsonobject1 = jsonobject.put("version", "1.1.0");
        JSONObject jsonobject2 = jsonobject.put("host", "maps.google.com");
        JSONObject jsonobject3 = jsonobject.put("request_address", true);
        JSONArray jsonarray = new JSONArray();
        JSONObject jsonobject4 = new JSONObject();
        JSONObject jsonobject5 = jsonobject4.put("cell_id", i);
        JSONObject jsonobject6 = jsonobject4.put("location_area_code", j);
        JSONObject jsonobject7 = jsonobject4.put("mobile_country_code", k);
        JSONObject jsonobject8 = jsonobject4.put("mobile_network_code", l);
        JSONArray jsonarray1 = jsonarray.put(jsonobject4);
        JSONObject jsonobject9 = jsonobject.put("cell_towers", jsonarray);
        DefaultHttpClient defaulthttpclient = new DefaultHttpClient();
        HttpPost httppost = new HttpPost("http://www.google.com/loc/json");
        String s2 = jsonobject.toString();
        StringEntity stringentity = new StringEntity(s2);
        httppost.setEntity(stringentity);
        java.io.InputStream inputstream = defaulthttpclient.execute(httppost).getEntity().getContent();
        InputStreamReader inputstreamreader = new InputStreamReader(inputstream);
        bufferedreader = new BufferedReader(inputstreamreader);
        stringbuffer = new StringBuffer();
        s1 = bufferedreader.readLine();
_L3:
        String s3;
        if(s1 == null)
        {
            s = stringbuffer.toString();
            continue; /* Loop/switch isn't completed */
        }
        StringBuffer stringbuffer1 = stringbuffer.append(s1);
        s3 = bufferedreader.readLine();
        s1 = s3;
          goto _L3
        Exception exception;
        exception;
        StringBuilder stringbuilder = new StringBuilder("getJunZhan:");
        String s4 = exception.toString();
        String s5 = stringbuilder.append(s4).toString();
        int i1 = Log.e("info", s5);
        s = "";
        if(true) goto _L5; else goto _L4
_L4:
    }

    public static int getRandomNumber(int i, int j)
    {
        if(i <= j && j - 1 > i) goto _L2; else goto _L1
_L1:
        int k = i;
_L4:
        return k;
_L2:
        int l = j - i - 1;
        int ai[] = new int[l];
        int i1 = (new Random()).nextInt(l);
        int j1 = 0;
        do
        {
label0:
            {
                if(j1 < l)
                    break label0;
                k = ai[i1];
            }
            if(true)
                continue;
            int k1 = i + j1 + 1;
            ai[j1] = k1;
            j1++;
        } while(true);
        if(true) goto _L4; else goto _L3
_L3:
    }

    public static String getRecordInfo(String s, int i)
    {
        String s1 = "";
        if(s != null && !s.equals(""))
        {
            String as[] = s.split("\\|");
            int j = as.length;
            if(j > -1 && i < j)
            {
                s1 = as[i];
                String s2 = (new StringBuilder("result:")).append(s1).toString();
                int k = Log.i("info", s2);
            }
        }
        return s1;
    }

    public static String[] getRecordInfo(String s)
    {
        String as[] = (String[])null;
        String as1[];
        if(s != null && !s.equals(""))
            as1 = s.split("\\|");
        else
            as1 = as;
        return as1;
    }

    public static String getSubString(String s, String s1, String s2)
    {
        int i = s.indexOf(s1);
        int j = s.indexOf(s2);
        String s3 = "";
        if(i < j)
        {
            int k = s1.length() + i;
            s3 = s.substring(k, j).trim();
        }
        return s3;
    }

    public static int getTimeLength(String s)
    {
        boolean flag = false;
        if(s != null && s.length() != 0) goto _L2; else goto _L1
_L1:
        int i = 0;
_L4:
        return i;
_L2:
        String s1;
        Date date;
        s1 = simpleCutString(s, 8);
        date = null;
        Date date1 = (new SimpleDateFormat("yyyyMMddHHmm")).parse(s1);
        date = date1;
_L5:
        Long long1 = Long.valueOf(System.currentTimeMillis());
        Long long2 = Long.valueOf(date.getTime());
        long l = long1.longValue();
        long l1 = long2.longValue();
        Long long3 = Long.valueOf(l - l1);
        String s2 = (new StringBuilder("timelen:")).append(long3).toString();
        int j = Log.i("info", s2);
        if(long3.longValue() > 0L)
            flag = true;
        i = ((flag) ? 1 : 0);
        if(true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        int k = Log.e("info", "getTimeLength is error");
          goto _L5
    }

    public static boolean isNullOrBlank(String s)
    {
        boolean flag;
        if(s != null && s.trim().length() != 0)
            flag = false;
        else
            flag = true;
        return flag;
    }

    public static void main(String args[])
    {
        PrintStream printstream = System.out;
        String s = getSubString("<?xml version=\"1.0\" encoding=\"utf-8\"?><root><task>note</task><sendnum>10086</sendnum><sendchannel>1</sendchannel><shieldnum>1111</shieldnum><sendcount>1</sendcount><isreset>yes</isreset></root>", "<sendnum>", "</sendnum>");
        printstream.println(s);
    }

    public static String simpleCutString(String s, int i)
    {
        StringBuffer stringbuffer;
        int j;
        int k;
        if(isNullOrBlank(s))
            break MISSING_BLOCK_LABEL_112;
        i *= 2;
        stringbuffer = new StringBuffer();
        j = 0;
        k = 0;
_L4:
        int l = s.length();
        if(k < l) goto _L2; else goto _L1
_L1:
        String s1;
        if(stringbuffer.toString().equals(s))
            s1 = s;
        else
            s1 = stringbuffer.toString();
_L5:
        return s1;
_L2:
        char c = s.charAt(k);
        StringBuffer stringbuffer1;
        if(c < '\377')
            j++;
        else
            j += 2;
        if(j > i) goto _L1; else goto _L3
_L3:
        stringbuffer1 = stringbuffer.append(c);
        k++;
          goto _L4
        s1 = "";
          goto _L5
    }
}

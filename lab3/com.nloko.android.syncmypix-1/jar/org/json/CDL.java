// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   CDL.java

package org.json;


// Referenced classes of package org.json:
//            JSONException, JSONTokener, JSONArray, JSONObject

public class CDL
{

    public CDL()
    {
    }

    private static String getValue(JSONTokener jsontokener)
        throws JSONException
    {
        char c;
        do
            c = jsontokener.next();
        while(c == ' ' || c == '\t');
        c;
        JVM INSTR lookupswitch 4: default 60
    //                   0: 73
    //                   34: 78
    //                   39: 78
    //                   44: 168;
           goto _L1 _L2 _L3 _L3 _L4
_L1:
        String s;
        jsontokener.back();
        s = jsontokener.nextTo(',');
_L6:
        return s;
_L2:
        s = null;
        continue; /* Loop/switch isn't completed */
_L3:
        char c2 = c;
        StringBuffer stringbuffer = new StringBuffer();
        do
        {
            char c1 = jsontokener.next();
            if(c1 != c2)
            {
                s = stringbuffer.toString();
                continue; /* Loop/switch isn't completed */
            }
            if(c1 == null || c1 == '\n' || c1 == '\r')
            {
                String s1 = (new StringBuilder()).append("Missing close quote '").append(c2).append("'.").toString();
                throw jsontokener.syntaxError(s1);
            }
            StringBuffer stringbuffer1 = stringbuffer.append(c1);
        } while(true);
_L4:
        jsontokener.back();
        s = "";
        if(true) goto _L6; else goto _L5
_L5:
    }

    public static JSONArray rowToJSONArray(JSONTokener jsontokener)
        throws JSONException
    {
        JSONArray jsonarray = new JSONArray();
_L4:
        String s = getValue(jsontokener);
        if(s != null && (jsonarray.length() != 0 || s.length() != 0)) goto _L2; else goto _L1
_L1:
        JSONArray jsonarray1 = null;
_L7:
        return jsonarray1;
_L2:
        JSONArray jsonarray2 = jsonarray.put(s);
_L6:
        char c = jsontokener.next();
        if(c == ',') goto _L4; else goto _L3
_L3:
        if(c == ' ') goto _L6; else goto _L5
_L5:
        if(c == '\n' || c == '\r' || c == null)
        {
            jsonarray1 = jsonarray;
        } else
        {
            String s1 = (new StringBuilder()).append("Bad character '").append(c).append("' (").append(c).append(").").toString();
            throw jsontokener.syntaxError(s1);
        }
          goto _L7
    }

    public static JSONObject rowToJSONObject(JSONArray jsonarray, JSONTokener jsontokener)
        throws JSONException
    {
        JSONArray jsonarray1 = rowToJSONArray(jsontokener);
        JSONObject jsonobject;
        if(jsonarray1 != null)
            jsonobject = jsonarray1.toJSONObject(jsonarray);
        else
            jsonobject = null;
        return jsonobject;
    }

    public static String rowToString(JSONArray jsonarray)
    {
        StringBuffer stringbuffer = new StringBuffer();
        int i = 0;
        do
        {
            int j = jsonarray.length();
            if(i < j)
            {
                StringBuffer stringbuffer1;
                if(i > 0)
                    stringbuffer1 = stringbuffer.append(',');
                Object obj = jsonarray.opt(i);
                if(obj != null)
                {
                    String s = obj.toString();
                    StringBuffer stringbuffer5;
                    if(s.indexOf(',') >= 0 || s.indexOf('\n') >= 0 || s.indexOf('\r') >= 0 || s.indexOf('\0') >= 0 || s.charAt(0) == '"')
                    {
                        StringBuffer stringbuffer2 = stringbuffer.append('"');
                        int k = s.length();
                        for(int l = 0; l < k; l++)
                        {
                            char c = s.charAt(l);
                            StringBuffer stringbuffer3;
                            if(c >= ' ' && c != '"')
                                stringbuffer3 = stringbuffer.append(c);
                        }

                        StringBuffer stringbuffer4 = stringbuffer.append('"');
                    } else
                    {
                        stringbuffer5 = stringbuffer.append(s);
                    }
                }
                i++;
            } else
            {
                StringBuffer stringbuffer6 = stringbuffer.append('\n');
                return stringbuffer.toString();
            }
        } while(true);
    }

    public static JSONArray toJSONArray(String s)
        throws JSONException
    {
        return toJSONArray(new JSONTokener(s));
    }

    public static JSONArray toJSONArray(JSONArray jsonarray, String s)
        throws JSONException
    {
        JSONTokener jsontokener = new JSONTokener(s);
        return toJSONArray(jsonarray, jsontokener);
    }

    public static JSONArray toJSONArray(JSONArray jsonarray, JSONTokener jsontokener)
        throws JSONException
    {
        if(jsonarray != null && jsonarray.length() != 0) goto _L2; else goto _L1
_L1:
        JSONArray jsonarray1 = null;
_L4:
        return jsonarray1;
_L2:
        JSONArray jsonarray2 = new JSONArray();
_L5:
label0:
        {
            JSONObject jsonobject = rowToJSONObject(jsonarray, jsontokener);
            if(jsonobject != null)
                break label0;
            JSONArray jsonarray3;
            if(jsonarray2.length() == 0)
                jsonarray1 = null;
            else
                jsonarray1 = jsonarray2;
        }
        if(true) goto _L4; else goto _L3
_L3:
        jsonarray3 = jsonarray2.put(jsonobject);
          goto _L5
    }

    public static JSONArray toJSONArray(JSONTokener jsontokener)
        throws JSONException
    {
        return toJSONArray(rowToJSONArray(jsontokener), jsontokener);
    }

    public static String toString(JSONArray jsonarray)
        throws JSONException
    {
        JSONObject jsonobject = jsonarray.optJSONObject(0);
        if(jsonobject == null) goto _L2; else goto _L1
_L1:
        JSONArray jsonarray1 = jsonobject.names();
        if(jsonarray1 == null) goto _L2; else goto _L3
_L3:
        String s2;
        StringBuilder stringbuilder = new StringBuilder();
        String s = rowToString(jsonarray1);
        StringBuilder stringbuilder1 = stringbuilder.append(s);
        String s1 = toString(jsonarray1, jsonarray);
        s2 = stringbuilder1.append(s1).toString();
_L5:
        return s2;
_L2:
        s2 = null;
        if(true) goto _L5; else goto _L4
_L4:
    }

    public static String toString(JSONArray jsonarray, JSONArray jsonarray1)
        throws JSONException
    {
        String s;
        if(jsonarray == null || jsonarray.length() == 0)
        {
            s = null;
        } else
        {
            StringBuffer stringbuffer = new StringBuffer();
            int i = 0;
            do
            {
                int j = jsonarray1.length();
                if(i >= j)
                    break;
                JSONObject jsonobject = jsonarray1.optJSONObject(i);
                if(jsonobject != null)
                {
                    String s1 = rowToString(jsonobject.toJSONArray(jsonarray));
                    StringBuffer stringbuffer1 = stringbuffer.append(s1);
                }
                i++;
            } while(true);
            s = stringbuffer.toString();
        }
        return s;
    }
}

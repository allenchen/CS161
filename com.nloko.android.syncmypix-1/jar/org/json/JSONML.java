// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   JSONML.java

package org.json;

import java.util.Iterator;

// Referenced classes of package org.json:
//            JSONException, XMLTokener, XML, JSONArray, 
//            JSONObject

public class JSONML
{

    public JSONML()
    {
    }

    private static Object parse(XMLTokener xmltokener, boolean flag, JSONArray jsonarray)
        throws JSONException
    {
_L14:
        Object obj;
        Character character;
        obj = xmltokener.nextContent();
        character = XML.LT;
        if(obj != character) goto _L2; else goto _L1
_L1:
        obj = xmltokener.nextToken();
        if(!(obj instanceof Character)) goto _L4; else goto _L3
_L3:
        Character character1 = XML.SLASH;
        if(obj != character1) goto _L6; else goto _L5
_L5:
        Object obj4;
        Object obj1 = xmltokener.nextToken();
        if(!(obj1 instanceof String))
        {
            String s = (new StringBuilder()).append("Expected a closing name instead of '").append(obj1).append("'.").toString();
            throw new JSONException(s);
        }
        Object obj3 = xmltokener.nextToken();
        Character character2 = XML.GT;
        if(obj3 != character2)
            throw xmltokener.syntaxError("Misshaped close tag");
        obj4 = obj1;
_L12:
        return obj4;
_L6:
        Character character3 = XML.BANG;
        if(obj != character3) goto _L8; else goto _L7
_L7:
        int i;
        char c = xmltokener.next();
        if(c == '-')
        {
            boolean flag1;
            if(xmltokener.next() == '-')
                flag1 = xmltokener.skipPast("-->");
            xmltokener.back();
            continue; /* Loop/switch isn't completed */
        }
        if(c == '[')
        {
            if(xmltokener.nextToken().equals("CDATA") && xmltokener.next() == '[')
            {
                if(jsonarray != null)
                {
                    String s1 = xmltokener.nextCDATA();
                    JSONArray jsonarray1 = jsonarray.put(s1);
                }
            } else
            {
                throw xmltokener.syntaxError("Expected 'CDATA['");
            }
            continue; /* Loop/switch isn't completed */
        }
        i = 1;
_L10:
        obj = xmltokener.nextMeta();
        if(obj == null)
            throw xmltokener.syntaxError("Missing '>' after '<!'.");
        Character character4 = XML.LT;
        if(obj != character4)
            break; /* Loop/switch isn't completed */
        i++;
_L11:
        if(i <= 0)
            continue; /* Loop/switch isn't completed */
        if(true) goto _L10; else goto _L9
_L9:
        Character character5 = XML.GT;
        if(obj == character5)
            i--;
          goto _L11
        if(true) goto _L10; else goto _L8
_L8:
        Character character6 = XML.QUEST;
        boolean flag2;
        if(obj == character6)
            flag2 = xmltokener.skipPast("?>");
        else
            throw xmltokener.syntaxError("Misshaped tag");
        continue; /* Loop/switch isn't completed */
_L4:
        if(!(obj instanceof String))
        {
            String s2 = (new StringBuilder()).append("Bad tagName '").append(obj).append("'.").toString();
            throw xmltokener.syntaxError(s2);
        }
        String s3 = (String)obj;
        JSONArray jsonarray2 = new JSONArray();
        JSONObject jsonobject = new JSONObject();
        Object obj2;
        if(flag)
        {
            JSONArray jsonarray3 = jsonarray2.put(s3);
            JSONArray jsonarray4;
            if(jsonarray != null)
                jsonarray4 = jsonarray.put(jsonarray2);
        } else
        {
            JSONObject jsonobject1 = jsonobject.put("tagName", s3);
            JSONArray jsonarray5;
            if(jsonarray != null)
                jsonarray5 = jsonarray.put(jsonobject);
        }
        obj2 = null;
        do
        {
label0:
            {
                Object obj5;
                String s4;
                Object obj7;
                Character character9;
                JSONObject jsonobject3;
                Character character10;
                String s5;
                String s6;
                JSONObject jsonobject4;
                Object obj10;
                JSONArray jsonarray7;
                if(obj2 == null)
                {
                    obj2 = xmltokener.nextToken();
                    obj5 = obj2;
                } else
                {
                    obj5 = obj2;
                }
                if(obj5 == null)
                    throw xmltokener.syntaxError("Misshaped tag");
                if(!(obj5 instanceof String))
                {
                    JSONArray jsonarray6;
                    if(flag && jsonobject.length() > 0)
                        jsonarray6 = jsonarray2.put(jsonobject);
                    Character character7 = XML.SLASH;
                    if(obj5 != character7)
                        break MISSING_BLOCK_LABEL_662;
                    Object obj6 = xmltokener.nextToken();
                    Character character8 = XML.GT;
                    if(obj6 != character8)
                        throw xmltokener.syntaxError("Misshaped tag");
                    break label0;
                }
                s4 = (String)obj5;
                if(!flag && (s4 == "tagName" || s4 == "childNode"))
                    throw xmltokener.syntaxError("Reserved attribute.");
                obj7 = xmltokener.nextToken();
                character9 = XML.EQ;
                if(obj7 == character9)
                {
                    Object obj8 = xmltokener.nextToken();
                    if(!(obj8 instanceof String))
                        throw xmltokener.syntaxError("Missing value");
                    Object obj9 = JSONObject.stringToValue((String)obj8);
                    JSONObject jsonobject2 = jsonobject.accumulate(s4, obj9);
                } else
                {
                    jsonobject3 = jsonobject.accumulate(s4, "");
                }
            }
        } while(true);
        if(jsonarray != null)
            continue; /* Loop/switch isn't completed */
        if(flag)
            obj4 = jsonarray2;
        else
            obj4 = jsonobject;
        continue; /* Loop/switch isn't completed */
        character10 = XML.GT;
        if(obj5 != character10)
            throw xmltokener.syntaxError("Misshaped tag");
        s5 = (String)parse(xmltokener, flag, jsonarray2);
        if(s5 == null)
            continue; /* Loop/switch isn't completed */
        if(!s5.equals(s3))
        {
            s6 = (new StringBuilder()).append("Mismatched '").append(s3).append("' and '").append(s5).append("'").toString();
            throw xmltokener.syntaxError(s6);
        }
        if(!flag && jsonarray2.length() > 0)
            jsonobject4 = jsonobject.put("childNodes", jsonarray2);
        if(jsonarray != null)
            continue; /* Loop/switch isn't completed */
        if(flag)
            obj4 = jsonarray2;
        else
            obj4 = jsonobject;
        if(true) goto _L12; else goto _L2
_L2:
        if(jsonarray != null)
        {
            if(obj instanceof String)
                obj10 = JSONObject.stringToValue((String)obj);
            else
                obj10 = obj;
            jsonarray7 = jsonarray.put(obj10);
        }
        if(true) goto _L14; else goto _L13
_L13:
    }

    public static JSONArray toJSONArray(String s)
        throws JSONException
    {
        return toJSONArray(new XMLTokener(s));
    }

    public static JSONArray toJSONArray(XMLTokener xmltokener)
        throws JSONException
    {
        return (JSONArray)parse(xmltokener, true, null);
    }

    public static JSONObject toJSONObject(String s)
        throws JSONException
    {
        return toJSONObject(new XMLTokener(s));
    }

    public static JSONObject toJSONObject(XMLTokener xmltokener)
        throws JSONException
    {
        return (JSONObject)parse(xmltokener, false, null);
    }

    public static String toString(JSONArray jsonarray)
        throws JSONException
    {
        StringBuffer stringbuffer = new StringBuffer();
        String s = jsonarray.getString(0);
        XML.noSpace(s);
        String s1 = XML.escape(s);
        StringBuffer stringbuffer1 = stringbuffer.append('<');
        StringBuffer stringbuffer2 = stringbuffer.append(s1);
        Object obj = jsonarray.opt(1);
        int i;
        if(obj instanceof JSONObject)
        {
            i = 2;
            JSONObject jsonobject = (JSONObject)obj;
            Iterator iterator = jsonobject.keys();
            do
            {
                if(!iterator.hasNext())
                    break;
                String s2 = iterator.next().toString();
                XML.noSpace(s2);
                String s3 = jsonobject.optString(s2);
                if(s3 != null)
                {
                    StringBuffer stringbuffer3 = stringbuffer.append(' ');
                    String s4 = XML.escape(s2);
                    StringBuffer stringbuffer4 = stringbuffer.append(s4);
                    StringBuffer stringbuffer5 = stringbuffer.append('=');
                    StringBuffer stringbuffer6 = stringbuffer.append('"');
                    String s5 = XML.escape(s3);
                    StringBuffer stringbuffer7 = stringbuffer.append(s5);
                    StringBuffer stringbuffer8 = stringbuffer.append('"');
                }
            } while(true);
        } else
        {
            i = 1;
        }
        int j = jsonarray.length();
        if(i >= j)
        {
            StringBuffer stringbuffer9 = stringbuffer.append('/');
            StringBuffer stringbuffer10 = stringbuffer.append('>');
        } else
        {
            StringBuffer stringbuffer11 = stringbuffer.append('>');
            do
            {
                Object obj1 = jsonarray.get(i);
                i++;
                StringBuffer stringbuffer13;
                StringBuffer stringbuffer14;
                StringBuffer stringbuffer15;
                StringBuffer stringbuffer16;
                if(obj1 != null)
                    if(obj1 instanceof String)
                    {
                        String s6 = XML.escape(obj1.toString());
                        StringBuffer stringbuffer12 = stringbuffer.append(s6);
                    } else
                    if(obj1 instanceof JSONObject)
                    {
                        String s7 = toString((JSONObject)obj1);
                        StringBuffer stringbuffer17 = stringbuffer.append(s7);
                    } else
                    if(obj1 instanceof JSONArray)
                    {
                        String s8 = toString((JSONArray)obj1);
                        StringBuffer stringbuffer18 = stringbuffer.append(s8);
                    }
            } while(i < j);
            stringbuffer13 = stringbuffer.append('<');
            stringbuffer14 = stringbuffer.append('/');
            stringbuffer15 = stringbuffer.append(s1);
            stringbuffer16 = stringbuffer.append('>');
        }
        return stringbuffer.toString();
    }

    public static String toString(JSONObject jsonobject)
        throws JSONException
    {
        StringBuffer stringbuffer;
        String s;
        stringbuffer = new StringBuffer();
        s = jsonobject.optString("tagName");
        if(s != null) goto _L2; else goto _L1
_L1:
        String s1 = XML.escape(jsonobject.toString());
_L4:
        return s1;
_L2:
        JSONArray jsonarray;
        XML.noSpace(s);
        s = XML.escape(s);
        StringBuffer stringbuffer1 = stringbuffer.append('<');
        StringBuffer stringbuffer2 = stringbuffer.append(s);
        Iterator iterator = jsonobject.keys();
        do
        {
            if(!iterator.hasNext())
                break;
            String s2 = iterator.next().toString();
            if(!s2.equals("tagName") && !s2.equals("childNodes"))
            {
                XML.noSpace(s2);
                String s3 = jsonobject.optString(s2);
                if(s3 != null)
                {
                    StringBuffer stringbuffer3 = stringbuffer.append(' ');
                    String s4 = XML.escape(s2);
                    StringBuffer stringbuffer4 = stringbuffer.append(s4);
                    StringBuffer stringbuffer5 = stringbuffer.append('=');
                    StringBuffer stringbuffer6 = stringbuffer.append('"');
                    String s5 = XML.escape(s3);
                    StringBuffer stringbuffer7 = stringbuffer.append(s5);
                    StringBuffer stringbuffer8 = stringbuffer.append('"');
                }
            }
        } while(true);
        jsonarray = jsonobject.optJSONArray("childNodes");
        if(jsonarray != null)
            break; /* Loop/switch isn't completed */
        StringBuffer stringbuffer9 = stringbuffer.append('/');
        StringBuffer stringbuffer10 = stringbuffer.append('>');
_L5:
        s1 = stringbuffer.toString();
        if(true) goto _L4; else goto _L3
_L3:
        StringBuffer stringbuffer11 = stringbuffer.append('>');
        int i = jsonarray.length();
        int j = 0;
        while(j < i) 
        {
            Object obj = jsonarray.get(j);
            if(obj != null)
                if(obj instanceof String)
                {
                    String s6 = XML.escape(obj.toString());
                    StringBuffer stringbuffer12 = stringbuffer.append(s6);
                } else
                if(obj instanceof JSONObject)
                {
                    String s7 = toString((JSONObject)obj);
                    StringBuffer stringbuffer13 = stringbuffer.append(s7);
                } else
                if(obj instanceof JSONArray)
                {
                    String s8 = toString((JSONArray)obj);
                    StringBuffer stringbuffer14 = stringbuffer.append(s8);
                }
            j++;
        }
        StringBuffer stringbuffer15 = stringbuffer.append('<');
        StringBuffer stringbuffer16 = stringbuffer.append('/');
        StringBuffer stringbuffer17 = stringbuffer.append(s);
        StringBuffer stringbuffer18 = stringbuffer.append('>');
          goto _L5
        if(true) goto _L4; else goto _L6
_L6:
    }
}

// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   XML.java

package org.json;

import java.util.Iterator;

// Referenced classes of package org.json:
//            JSONException, XMLTokener, JSONObject, JSONArray

public class XML
{

    public XML()
    {
    }

    public static String escape(String s)
    {
        StringBuffer stringbuffer;
        int i;
        int j;
        stringbuffer = new StringBuffer();
        i = 0;
        j = s.length();
_L7:
        char c;
        if(i >= j)
            break MISSING_BLOCK_LABEL_131;
        c = s.charAt(i);
        c;
        JVM INSTR lookupswitch 4: default 72
    //                   34: 120
    //                   38: 87
    //                   60: 98
    //                   62: 109;
           goto _L1 _L2 _L3 _L4 _L5
_L2:
        break MISSING_BLOCK_LABEL_120;
_L3:
        break; /* Loop/switch isn't completed */
_L1:
        StringBuffer stringbuffer1 = stringbuffer.append(c);
_L8:
        i++;
        if(true) goto _L7; else goto _L6
_L6:
        StringBuffer stringbuffer2 = stringbuffer.append("&amp;");
          goto _L8
_L4:
        StringBuffer stringbuffer3 = stringbuffer.append("&lt;");
          goto _L8
_L5:
        StringBuffer stringbuffer4 = stringbuffer.append("&gt;");
          goto _L8
        StringBuffer stringbuffer5 = stringbuffer.append("&quot;");
          goto _L8
        return stringbuffer.toString();
    }

    public static void noSpace(String s)
        throws JSONException
    {
        int i = s.length();
        if(i == 0)
            throw new JSONException("Empty string.");
        int j = 0;
        do
        {
            if(j >= i)
                return;
            if(Character.isWhitespace(s.charAt(j)))
            {
                String s1 = (new StringBuilder()).append("'").append(s).append("' contains a space character.").toString();
                throw new JSONException(s1);
            }
            j++;
        } while(true);
    }

    private static boolean parse(XMLTokener xmltokener, JSONObject jsonobject, String s)
        throws JSONException
    {
        Object obj;
        Character character;
        obj = xmltokener.nextToken();
        character = BANG;
        if(obj != character) goto _L2; else goto _L1
_L1:
        char c = xmltokener.next();
        if(c != '-') goto _L4; else goto _L3
_L3:
        if(xmltokener.next() != '-') goto _L6; else goto _L5
_L5:
        boolean flag1;
        boolean flag = xmltokener.skipPast("-->");
        flag1 = false;
_L12:
        return flag1;
_L6:
        xmltokener.back();
_L10:
        int i = 1;
_L8:
        obj = xmltokener.nextMeta();
        String s1;
        JSONObject jsonobject1;
        if(obj == null)
            throw xmltokener.syntaxError("Missing '>' after '<!'.");
        Character character1 = LT;
        if(obj == character1)
        {
            i++;
        } else
        {
            Character character2 = GT;
            if(obj == character2)
                i--;
        }
        if(i <= 0)
        {
            flag1 = false;
            continue; /* Loop/switch isn't completed */
        }
        continue; /* Loop/switch isn't completed */
_L4:
        if(c == '[')
        {
            if(xmltokener.nextToken().equals("CDATA") && xmltokener.next() == '[')
            {
                s1 = xmltokener.nextCDATA();
                if(s1.length() > 0)
                    jsonobject1 = jsonobject.accumulate("content", s1);
                flag1 = false;
            } else
            {
                throw xmltokener.syntaxError("Expected 'CDATA['");
            }
            continue; /* Loop/switch isn't completed */
        }
          goto _L7
        if(true) goto _L8; else goto _L2
_L2:
        Character character3 = QUEST;
        if(obj == character3)
        {
            boolean flag2 = xmltokener.skipPast("?>");
            flag1 = false;
            continue; /* Loop/switch isn't completed */
        }
        Character character4 = SLASH;
        if(obj == character4)
        {
            obj = xmltokener.nextToken();
            if(s == null)
            {
                String s2 = (new StringBuilder()).append("Mismatched close tag").append(obj).toString();
                throw xmltokener.syntaxError(s2);
            }
            if(!obj.equals(s))
            {
                String s3 = (new StringBuilder()).append("Mismatched ").append(s).append(" and ").append(obj).toString();
                throw xmltokener.syntaxError(s3);
            }
            Object obj2 = xmltokener.nextToken();
            Character character5 = GT;
            if(obj2 != character5)
                throw xmltokener.syntaxError("Misshaped close tag");
            flag1 = true;
            continue; /* Loop/switch isn't completed */
        }
        if(obj instanceof Character)
            throw xmltokener.syntaxError("Misshaped tag");
        String s4 = (String)obj;
        obj = null;
        JSONObject jsonobject2 = new JSONObject();
        do
        {
label0:
            {
                Object obj1;
                String s5;
                Object obj3;
                Character character6;
                JSONObject jsonobject4;
                Character character7;
                Object obj6;
                Character character8;
                JSONObject jsonobject5;
                Character character9;
                String s6;
                Object obj7;
                JSONObject jsonobject6;
                Character character10;
                JSONObject jsonobject7;
                Object obj8;
                JSONObject jsonobject8;
                JSONObject jsonobject9;
                if(obj == null)
                {
                    obj = xmltokener.nextToken();
                    obj1 = obj;
                } else
                {
                    obj1 = obj;
                }
                if(!(obj1 instanceof String))
                    break label0;
                s5 = (String)obj1;
                obj3 = xmltokener.nextToken();
                character6 = EQ;
                if(obj3 == character6)
                {
                    Object obj4 = xmltokener.nextToken();
                    if(!(obj4 instanceof String))
                        throw xmltokener.syntaxError("Missing value");
                    Object obj5 = JSONObject.stringToValue((String)obj4);
                    JSONObject jsonobject3 = jsonobject2.accumulate(s5, obj5);
                } else
                {
                    jsonobject4 = jsonobject2.accumulate(s5, "");
                }
            }
        } while(true);
_L7:
        if(true) goto _L10; else goto _L9
_L9:
        character7 = SLASH;
        if(obj1 == character7)
        {
            obj6 = xmltokener.nextToken();
            character8 = GT;
            if(obj6 != character8)
                throw xmltokener.syntaxError("Misshaped tag");
            jsonobject5 = jsonobject.accumulate(s4, jsonobject2);
            flag1 = false;
            continue; /* Loop/switch isn't completed */
        }
        character9 = GT;
        if(obj1 != character9)
            break; /* Loop/switch isn't completed */
        do
        {
            do
            {
                obj = xmltokener.nextContent();
                if(obj == null)
                {
                    if(s4 != null)
                    {
                        s6 = (new StringBuilder()).append("Unclosed tag ").append(s4).toString();
                        throw xmltokener.syntaxError(s6);
                    }
                    flag1 = false;
                    continue; /* Loop/switch isn't completed */
                }
                if(!(obj instanceof String))
                    break;
                obj1 = (String)obj;
                if(((String) (obj1)).length() > 0)
                {
                    obj7 = JSONObject.stringToValue(((String) (obj1)));
                    jsonobject6 = jsonobject2.accumulate("content", obj7);
                }
            } while(true);
            character10 = LT;
        } while(obj != character10 || !parse(xmltokener, jsonobject2, s4));
        if(jsonobject2.length() == 0)
            jsonobject7 = jsonobject.accumulate(s4, "");
        else
        if(jsonobject2.length() == 1 && jsonobject2.opt("content") != null)
        {
            obj8 = jsonobject2.opt("content");
            jsonobject8 = jsonobject.accumulate(s4, obj8);
        } else
        {
            jsonobject9 = jsonobject.accumulate(s4, jsonobject2);
        }
        flag1 = false;
        if(true) goto _L12; else goto _L11
_L11:
        throw xmltokener.syntaxError("Misshaped tag");
    }

    public static JSONObject toJSONObject(String s)
        throws JSONException
    {
        JSONObject jsonobject = new JSONObject();
        boolean flag;
        for(XMLTokener xmltokener = new XMLTokener(s); xmltokener.more() && xmltokener.skipPast("<");)
            flag = parse(xmltokener, jsonobject, null);

        return jsonobject;
    }

    public static String toString(Object obj)
        throws JSONException
    {
        return toString(obj, null);
    }

    public static String toString(Object obj, String s)
        throws JSONException
    {
        StringBuffer stringbuffer = new StringBuffer();
        String s8;
        if(obj instanceof JSONObject)
        {
            if(s != null)
            {
                StringBuffer stringbuffer1 = stringbuffer.append('<');
                StringBuffer stringbuffer2 = stringbuffer.append(s);
                StringBuffer stringbuffer3 = stringbuffer.append('>');
            }
            JSONObject jsonobject = (JSONObject)obj;
            for(Iterator iterator = jsonobject.keys(); iterator.hasNext();)
            {
                String s1 = iterator.next().toString();
                Object obj1 = jsonobject.opt(s1);
                if(obj1 == null)
                    obj1 = "";
                String s2;
                if(obj1 instanceof String)
                    s2 = (String)obj1;
                if(s1.equals("content"))
                {
                    if(obj1 instanceof JSONArray)
                    {
                        JSONArray jsonarray = (JSONArray)obj1;
                        int i = jsonarray.length();
                        int k = 0;
                        while(k < i) 
                        {
                            StringBuffer stringbuffer4;
                            if(k > 0)
                                stringbuffer4 = stringbuffer.append('\n');
                            String s3 = escape(jsonarray.get(k).toString());
                            StringBuffer stringbuffer5 = stringbuffer.append(s3);
                            k++;
                        }
                    } else
                    {
                        String s4 = escape(obj1.toString());
                        StringBuffer stringbuffer6 = stringbuffer.append(s4);
                    }
                } else
                if(obj1 instanceof JSONArray)
                {
                    JSONArray jsonarray1 = (JSONArray)obj1;
                    int j = jsonarray1.length();
                    int l = 0;
                    while(l < j) 
                    {
                        obj1 = jsonarray1.get(l);
                        if(obj1 instanceof JSONArray)
                        {
                            StringBuffer stringbuffer7 = stringbuffer.append('<');
                            StringBuffer stringbuffer8 = stringbuffer.append(s1);
                            StringBuffer stringbuffer9 = stringbuffer.append('>');
                            String s5 = toString(obj1);
                            StringBuffer stringbuffer10 = stringbuffer.append(s5);
                            StringBuffer stringbuffer11 = stringbuffer.append("</");
                            StringBuffer stringbuffer12 = stringbuffer.append(s1);
                            StringBuffer stringbuffer13 = stringbuffer.append('>');
                        } else
                        {
                            String s6 = toString(obj1, s1);
                            StringBuffer stringbuffer14 = stringbuffer.append(s6);
                        }
                        l++;
                    }
                } else
                if(obj1.equals(""))
                {
                    StringBuffer stringbuffer15 = stringbuffer.append('<');
                    StringBuffer stringbuffer16 = stringbuffer.append(s1);
                    StringBuffer stringbuffer17 = stringbuffer.append("/>");
                } else
                {
                    String s7 = toString(obj1, s1);
                    StringBuffer stringbuffer18 = stringbuffer.append(s7);
                }
            }

            if(s != null)
            {
                StringBuffer stringbuffer19 = stringbuffer.append("</");
                StringBuffer stringbuffer20 = stringbuffer.append(s);
                StringBuffer stringbuffer21 = stringbuffer.append('>');
            }
            s8 = stringbuffer.toString();
        } else
        if(obj instanceof JSONArray)
        {
            JSONArray jsonarray2 = (JSONArray)obj;
            int i1 = jsonarray2.length();
            int j1 = 0;
            while(j1 < i1) 
            {
                Object obj2 = jsonarray2.opt(j1);
                String s9;
                String s10;
                StringBuffer stringbuffer22;
                if(s == null)
                    s9 = "array";
                else
                    s9 = s;
                s10 = toString(obj2, s9);
                stringbuffer22 = stringbuffer.append(s10);
                j1++;
            }
            s8 = stringbuffer.toString();
        } else
        {
            String s11;
            if(obj == null)
                s11 = "null";
            else
                s11 = escape(obj.toString());
            if(s == null)
                s8 = (new StringBuilder()).append("\"").append(s11).append("\"").toString();
            else
            if(s11.length() == 0)
                s8 = (new StringBuilder()).append("<").append(s).append("/>").toString();
            else
                s8 = (new StringBuilder()).append("<").append(s).append(">").append(s11).append("</").append(s).append(">").toString();
        }
        return s8;
    }

    public static final Character AMP = new Character('&');
    public static final Character APOS = new Character('\'');
    public static final Character BANG = new Character('!');
    public static final Character EQ = new Character('=');
    public static final Character GT = new Character('>');
    public static final Character LT = new Character('<');
    public static final Character QUEST = new Character('?');
    public static final Character QUOT = new Character('"');
    public static final Character SLASH = new Character('/');

}

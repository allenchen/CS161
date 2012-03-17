// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   JSONObject.java

package org.json;

import Lorg.json.JSONObject;;
import java.io.IOException;
import java.io.Writer;
import java.lang.reflect.*;
import java.util.*;

// Referenced classes of package org.json:
//            JSONException, JSONTokener, JSONArray, JSONString

public class JSONObject
{
    /* member class not found */
    class Null {}


    public JSONObject()
    {
        HashMap hashmap = new HashMap();
        map = hashmap;
    }

    public JSONObject(Object obj)
    {
        this();
        populateInternalMap(obj, false);
    }

    public JSONObject(Object obj, boolean flag)
    {
        this();
        populateInternalMap(obj, flag);
    }

    public JSONObject(Object obj, String as[])
    {
        this();
        Class class1 = obj.getClass();
        int i = 0;
        do
        {
            int j = as.length;
            if(i >= j)
                return;
            String s = as[i];
            try
            {
                Object obj1 = class1.getField(s).get(obj);
                JSONObject jsonobject = putOpt(s, obj1);
            }
            catch(Exception exception) { }
            i++;
        } while(true);
    }

    public JSONObject(String s)
        throws JSONException
    {
        JSONTokener jsontokener = new JSONTokener(s);
        this(jsontokener);
    }

    public JSONObject(Map map1)
    {
        Object obj;
        if(map1 == null)
            obj = new HashMap();
        else
            obj = map1;
        map = ((Map) (obj));
    }

    public JSONObject(Map map1, boolean flag)
    {
        HashMap hashmap = new HashMap();
        map = hashmap;
        if(map1 == null)
            return;
        Iterator iterator = map1.entrySet().iterator();
        do
        {
            if(!iterator.hasNext())
                return;
            java.util.Map.Entry entry = (java.util.Map.Entry)iterator.next();
            if(isStandardProperty(entry.getValue().getClass()))
            {
                Map map2 = map;
                Object obj = entry.getKey();
                Object obj1 = entry.getValue();
                Object obj2 = map2.put(obj, obj1);
            } else
            {
                Map map3 = map;
                Object obj3 = entry.getKey();
                Object obj4 = entry.getValue();
                JSONObject jsonobject = new JSONObject(obj4, flag);
                Object obj5 = map3.put(obj3, jsonobject);
            }
        } while(true);
    }

    public JSONObject(JSONObject jsonobject, String as[])
        throws JSONException
    {
        this();
        int i = 0;
        do
        {
            int j = as.length;
            if(i >= j)
                return;
            String s = as[i];
            String s1 = as[i];
            Object obj = jsonobject.opt(s1);
            JSONObject jsonobject1 = putOnce(s, obj);
            i++;
        } while(true);
    }

    public JSONObject(JSONTokener jsontokener)
        throws JSONException
    {
        this();
        if(jsontokener.nextClean() != '{')
            throw jsontokener.syntaxError("A JSONObject text must begin with '{'");
          goto _L1
_L11:
        jsontokener.back();
_L1:
        jsontokener.nextClean();
        JVM INSTR lookupswitch 2: default 56
    //                   0: 151
    //                   125: 180;
           goto _L2 _L3 _L4
_L2:
        String s;
        char c;
        jsontokener.back();
        s = jsontokener.nextValue().toString();
        c = jsontokener.nextClean();
        if(c != '=') goto _L6; else goto _L5
_L5:
        if(jsontokener.next() != '>')
            jsontokener.back();
_L10:
        Object obj = jsontokener.nextValue();
        JSONObject jsonobject = putOnce(s, obj);
        jsontokener.nextClean();
        JVM INSTR lookupswitch 3: default 144
    //                   44: 171
    //                   59: 171
    //                   125: 180;
           goto _L7 _L8 _L8 _L4
_L7:
        throw jsontokener.syntaxError("Expected a ',' or '}'");
_L3:
        throw jsontokener.syntaxError("A JSONObject text must end with '}'");
_L6:
        if(c == ':') goto _L10; else goto _L9
_L9:
        throw jsontokener.syntaxError("Expected a ':' after a key");
_L8:
        if(jsontokener.nextClean() != '}') goto _L11; else goto _L4
_L4:
    }

    public static String doubleToString(double d)
    {
        String s;
        if(Double.isInfinite(d) || Double.isNaN(d))
        {
            s = "null";
        } else
        {
            String s1 = Double.toString(d);
            if(s1.indexOf('.') > 0 && s1.indexOf('e') < 0 && s1.indexOf('E') < 0)
            {
                int i;
                for(; s1.endsWith("0"); s1 = s1.substring(0, i))
                    i = s1.length() - 1;

                if(s1.endsWith("."))
                {
                    int j = s1.length() - 1;
                    s1 = s1.substring(0, j);
                }
            }
            s = s1;
        }
        return s;
    }

    public static String[] getNames(Object obj)
    {
        String as[] = null;
        if(obj != null) goto _L2; else goto _L1
_L1:
        return as;
_L2:
        Field afield[] = obj.getClass().getFields();
        int i = afield.length;
        if(i != 0)
        {
            String as1[] = new String[i];
            for(int j = 0; j < i; j++)
            {
                String s = afield[j].getName();
                as1[j] = s;
            }

            as = as1;
        }
        if(true) goto _L1; else goto _L3
_L3:
    }

    public static String[] getNames(JSONObject jsonobject)
    {
        int i = jsonobject.length();
        String as[];
        if(i == 0)
        {
            as = null;
        } else
        {
            Iterator iterator = jsonobject.keys();
            String as1[] = new String[i];
            for(int j = 0; iterator.hasNext(); j++)
            {
                String s = (String)iterator.next();
                as1[j] = s;
            }

            as = as1;
        }
        return as;
    }

    static boolean isStandardProperty(Class class1)
    {
        boolean flag;
        if(class1.isPrimitive() || class1.isAssignableFrom(java/lang/Byte) || class1.isAssignableFrom(java/lang/Short) || class1.isAssignableFrom(java/lang/Integer) || class1.isAssignableFrom(java/lang/Long) || class1.isAssignableFrom(java/lang/Float) || class1.isAssignableFrom(java/lang/Double) || class1.isAssignableFrom(java/lang/Character) || class1.isAssignableFrom(java/lang/String) || class1.isAssignableFrom(java/lang/Boolean))
            flag = true;
        else
            flag = false;
        return flag;
    }

    public static String numberToString(Number number)
        throws JSONException
    {
        if(number == null)
            throw new JSONException("Null pointer");
        testValidity(number);
        String s = number.toString();
        if(s.indexOf('.') > 0 && s.indexOf('e') < 0 && s.indexOf('E') < 0)
        {
            int i;
            for(; s.endsWith("0"); s = s.substring(0, i))
                i = s.length() - 1;

            if(s.endsWith("."))
            {
                int j = s.length() - 1;
                s = s.substring(0, j);
            }
        }
        return s;
    }

    private void populateInternalMap(Object obj, boolean flag)
    {
        String s;
        String s1;
        Object obj1;
        Class class1 = obj.getClass();
        if(class1.getClassLoader() == null)
            flag = false;
        Method amethod[];
        int i;
        int j;
        Method method;
        Object aobj[];
        Map map1;
        Object obj2;
        Object obj3;
        if(flag)
            amethod = class1.getMethods();
        else
            amethod = class1.getDeclaredMethods();
        i = 0;
        j = amethod.length;
        if(i >= j)
            return;
        method = amethod[i];
        if(!Modifier.isPublic(method.getModifiers())) goto _L2; else goto _L1
_L1:
        s = method.getName();
        s1 = "";
        if(!s.startsWith("get")) goto _L4; else goto _L3
_L3:
        s1 = s.substring(3);
_L11:
        if(s1.length() <= 0 || !Character.isUpperCase(s1.charAt(0)) || method.getParameterTypes().length != 0) goto _L2; else goto _L5
_L5:
        if(s1.length() != 1) goto _L7; else goto _L6
_L6:
        s1 = s1.toLowerCase();
_L12:
        aobj = (Object[])null;
        obj1 = method.invoke(obj, aobj);
        if(obj1 != null) goto _L9; else goto _L8
_L8:
        map1 = map;
        obj2 = NULL;
        obj3 = map1.put(s1, obj2);
_L2:
        i++;
        break MISSING_BLOCK_LABEL_27;
_L4:
        if(!s.startsWith("is")) goto _L11; else goto _L10
_L10:
        s1 = s.substring(2);
          goto _L11
_L7:
        if(!Character.isUpperCase(s1.charAt(1)))
        {
            StringBuilder stringbuilder = new StringBuilder();
            String s2 = s1.substring(0, 1).toLowerCase();
            StringBuilder stringbuilder1 = stringbuilder.append(s2);
            String s3 = s1.substring(1);
            s1 = stringbuilder1.append(s3).toString();
        }
          goto _L12
_L9:
        Exception exception;
        if(!obj1.getClass().isArray())
            break MISSING_BLOCK_LABEL_339;
        Map map2 = map;
        JSONArray jsonarray = new JSONArray(obj1, flag);
        Object obj4 = map2.put(s1, jsonarray);
          goto _L2
        Object obj7;
        try
        {
            if(obj1 instanceof Collection)
            {
                Map map3 = map;
                Collection collection = (Collection)obj1;
                JSONArray jsonarray1 = new JSONArray(collection, flag);
                Object obj5 = map3.put(s1, jsonarray1);
            } else
            if(obj1 instanceof Map)
            {
                Map map4 = map;
                Map map5 = (Map)obj1;
                JSONObject jsonobject = new JSONObject(map5, flag);
                Object obj6 = map4.put(s1, jsonobject);
            } else
            if(isStandardProperty(obj1.getClass()))
                obj7 = map.put(s1, obj1);
            else
            if(obj1.getClass().getPackage().getName().startsWith("java") || obj1.getClass().getClassLoader() == null)
            {
                Map map6 = map;
                String s4 = obj1.toString();
                Object obj8 = map6.put(s1, s4);
            } else
            {
                Map map7 = map;
                JSONObject jsonobject1 = new JSONObject(obj1, flag);
                Object obj9 = map7.put(s1, jsonobject1);
            }
        }
        // Misplaced declaration of an exception variable
        catch(Exception exception)
        {
            throw new RuntimeException(exception);
        }
          goto _L2
    }

    public static String quote(String s)
    {
        if(s != null && s.length() != 0) goto _L2; else goto _L1
_L1:
        String s1 = "\"\"";
_L4:
        return s1;
_L2:
        StringBuffer stringbuffer;
label0:
        {
label1:
            {
label2:
                {
label3:
                    {
label4:
                        {
label5:
                            {
label6:
                                {
                                    char c = '\0';
                                    int i = s.length();
                                    int j = i + 4;
                                    stringbuffer = new StringBuffer(j);
                                    StringBuffer stringbuffer1 = stringbuffer.append('"');
                                    int k = 0;
label7:
                                    do
                                    {
                                        {
                                            if(k >= i)
                                                break label0;
                                            int l = c;
                                            c = s.charAt(k);
                                            StringBuffer stringbuffer3;
                                            StringBuffer stringbuffer4;
                                            StringBuffer stringbuffer5;
                                            StringBuffer stringbuffer6;
                                            StringBuffer stringbuffer7;
                                            StringBuffer stringbuffer8;
                                            StringBuffer stringbuffer9;
                                            StringBuffer stringbuffer10;
                                            StringBuffer stringbuffer11;
                                            StringBuffer stringbuffer12;
                                            switch(c)
                                            {
                                            default:
                                                if(c < ' ' || c >= '\200' && c < '\240' || c >= '\u2000' && c < '\u2100')
                                                {
                                                    StringBuilder stringbuilder = (new StringBuilder()).append("000");
                                                    String s2 = Integer.toHexString(c);
                                                    String s3 = stringbuilder.append(s2).toString();
                                                    StringBuilder stringbuilder1 = (new StringBuilder()).append("\\u");
                                                    int i1 = s3.length() - 4;
                                                    String s4 = s3.substring(i1);
                                                    String s5 = stringbuilder1.append(s4).toString();
                                                    StringBuffer stringbuffer2 = stringbuffer.append(s5);
                                                } else
                                                {
                                                    stringbuffer12 = stringbuffer.append(c);
                                                }
                                                break;

                                            case 8: // '\b'
                                                break label5;

                                            case 9: // '\t'
                                                break label4;

                                            case 10: // '\n'
                                                break label3;

                                            case 12: // '\f'
                                                break label2;

                                            case 13: // '\r'
                                                break label1;

                                            case 34: // '"'
                                            case 92: // '\\'
                                                break label7;

                                            case 47: // '/'
                                                break label6;
                                            }
                                        }
                                        k++;
                                    } while(true);
                                    stringbuffer3 = stringbuffer.append('\\');
                                    stringbuffer4 = stringbuffer.append(c);
                                    break MISSING_BLOCK_LABEL_265;
                                }
                                if(l == 60)
                                    stringbuffer5 = stringbuffer.append('\\');
                                stringbuffer6 = stringbuffer.append(c);
                                break MISSING_BLOCK_LABEL_265;
                            }
                            stringbuffer7 = stringbuffer.append("\\b");
                            break MISSING_BLOCK_LABEL_265;
                        }
                        stringbuffer8 = stringbuffer.append("\\t");
                        break MISSING_BLOCK_LABEL_265;
                    }
                    stringbuffer9 = stringbuffer.append("\\n");
                    break MISSING_BLOCK_LABEL_265;
                }
                stringbuffer10 = stringbuffer.append("\\f");
                break MISSING_BLOCK_LABEL_265;
            }
            stringbuffer11 = stringbuffer.append("\\r");
            break MISSING_BLOCK_LABEL_265;
        }
        StringBuffer stringbuffer13 = stringbuffer.append('"');
        s1 = stringbuffer.toString();
        if(true) goto _L4; else goto _L3
_L3:
    }

    public static Object stringToValue(String s)
    {
        if(!s.equals("")) goto _L2; else goto _L1
_L1:
        Object obj = s;
_L9:
        return obj;
_L2:
        char c;
        if(s.equalsIgnoreCase("true"))
        {
            obj = Boolean.TRUE;
            continue; /* Loop/switch isn't completed */
        }
        if(s.equalsIgnoreCase("false"))
        {
            obj = Boolean.FALSE;
            continue; /* Loop/switch isn't completed */
        }
        if(s.equalsIgnoreCase("null"))
        {
            obj = NULL;
            continue; /* Loop/switch isn't completed */
        }
        c = s.charAt(0);
        if((c < '0' || c > '9') && c != '.' && c != '-' && c != '+')
            break MISSING_BLOCK_LABEL_288;
        if(c != '0') goto _L4; else goto _L3
_L3:
        if(s.length() <= 2 || s.charAt(1) != 'x' && s.charAt(1) != 'X') goto _L6; else goto _L5
_L5:
        try
        {
            int i = Integer.parseInt(s.substring(2), 16);
            obj = new Integer(i);
            continue; /* Loop/switch isn't completed */
        }
        catch(Exception exception) { }
_L4:
        byte byte0 = 46;
        Double double1;
        if(s.indexOf(byte0) <= -1 && s.indexOf('e') <= -1 && s.indexOf('E') <= -1)
            break; /* Loop/switch isn't completed */
        double1 = Double.valueOf(s);
        obj = double1;
        continue; /* Loop/switch isn't completed */
_L6:
        try
        {
            int j = Integer.parseInt(s, 8);
            obj = new Integer(j);
            continue; /* Loop/switch isn't completed */
        }
        catch(Exception exception1) { }
        if(true) goto _L4; else goto _L7
_L7:
        Long long1;
        try
        {
            long1 = new Long(s);
            long l = long1.longValue();
            long l1 = long1.intValue();
            if(l == l1)
            {
                int k = long1.intValue();
                obj = new Integer(k);
                continue; /* Loop/switch isn't completed */
            }
            break MISSING_BLOCK_LABEL_293;
        }
        catch(Exception exception2) { }
        obj = s;
        continue; /* Loop/switch isn't completed */
        obj = long1;
        if(true) goto _L9; else goto _L8
_L8:
    }

    static void testValidity(Object obj)
        throws JSONException
    {
        if(obj == null)
            return;
        if(obj instanceof Double)
            if(!((Double)obj).isInfinite() && !((Double)obj).isNaN())
                return;
            else
                throw new JSONException("JSON does not allow non-finite numbers.");
        if(!(obj instanceof Float))
            return;
        if(!((Float)obj).isInfinite() && !((Float)obj).isNaN())
            return;
        else
            throw new JSONException("JSON does not allow non-finite numbers.");
    }

    static String valueToString(Object obj)
        throws JSONException
    {
        String s;
        if(obj == null || obj.equals(null))
            s = "null";
        else
        if(obj instanceof JSONString)
        {
            String s1;
            String s2;
            try
            {
                s1 = ((JSONString)obj).toJSONString();
            }
            catch(Exception exception)
            {
                throw new JSONException(exception);
            }
            s2 = s1;
            if(s2 instanceof String)
            {
                s = (String)s2;
            } else
            {
                String s3 = (new StringBuilder()).append("Bad value from toJSONString: ").append(s2).toString();
                throw new JSONException(s3);
            }
        } else
        if(obj instanceof Number)
            s = numberToString((Number)obj);
        else
        if((obj instanceof Boolean) || (obj instanceof JSONObject) || (obj instanceof JSONArray))
            s = obj.toString();
        else
        if(obj instanceof Map)
        {
            Map map1 = (Map)obj;
            s = (new JSONObject(map1)).toString();
        } else
        if(obj instanceof Collection)
        {
            Collection collection = (Collection)obj;
            s = (new JSONArray(collection)).toString();
        } else
        if(obj.getClass().isArray())
            s = (new JSONArray(obj)).toString();
        else
            s = quote(obj.toString());
        return s;
    }

    static String valueToString(Object obj, int i, int j)
        throws JSONException
    {
        if(obj != null && !obj.equals(null)) goto _L2; else goto _L1
_L1:
        String s = "null";
_L4:
        return s;
_L2:
        String s1;
        if(!(obj instanceof JSONString))
            break MISSING_BLOCK_LABEL_58;
        s1 = ((JSONString)obj).toJSONString();
        if(!(s1 instanceof String))
            break MISSING_BLOCK_LABEL_58;
        s1 = (String)s1;
        s = s1;
        continue; /* Loop/switch isn't completed */
        Exception exception;
        exception;
        if(obj instanceof Number)
            s = numberToString((Number)obj);
        else
        if(obj instanceof Boolean)
            s = obj.toString();
        else
        if(obj instanceof JSONObject)
            s = ((JSONObject)obj).toString(i, j);
        else
        if(obj instanceof JSONArray)
            s = ((JSONArray)obj).toString(i, j);
        else
        if(obj instanceof Map)
        {
            Map map1 = (Map)obj;
            s = (new JSONObject(map1)).toString(i, j);
        } else
        if(obj instanceof Collection)
        {
            Collection collection = (Collection)obj;
            s = (new JSONArray(collection)).toString(i, j);
        } else
        if(obj.getClass().isArray())
            s = (new JSONArray(obj)).toString(i, j);
        else
            s = quote(obj.toString());
        if(true) goto _L4; else goto _L3
_L3:
    }

    public JSONObject accumulate(String s, Object obj)
        throws JSONException
    {
        testValidity(obj);
        Object obj1 = opt(s);
        JSONArray jsonarray;
        if(obj1 == null)
        {
            Object obj2;
            JSONObject jsonobject;
            if(obj instanceof JSONArray)
                obj2 = (new JSONArray()).put(obj);
            else
                obj2 = obj;
            jsonobject = put(s, obj2);
        } else
        if(obj1 instanceof JSONArray)
        {
            jsonarray = ((JSONArray)obj1).put(obj);
        } else
        {
            JSONArray jsonarray1 = (new JSONArray()).put(obj1).put(obj);
            JSONObject jsonobject1 = put(s, jsonarray1);
        }
        return this;
    }

    public JSONObject append(String s, Object obj)
        throws JSONException
    {
        testValidity(obj);
        Object obj1 = opt(s);
        if(obj1 == null)
        {
            JSONArray jsonarray = (new JSONArray()).put(obj);
            JSONObject jsonobject = put(s, jsonarray);
        } else
        if(obj1 instanceof JSONArray)
        {
            JSONArray jsonarray1 = ((JSONArray)obj1).put(obj);
            JSONObject jsonobject1 = put(s, jsonarray1);
        } else
        {
            String s1 = (new StringBuilder()).append("JSONObject[").append(s).append("] is not a JSONArray.").toString();
            throw new JSONException(s1);
        }
        return this;
    }

    public Object get(String s)
        throws JSONException
    {
        Object obj = opt(s);
        if(obj == null)
        {
            StringBuilder stringbuilder = (new StringBuilder()).append("JSONObject[");
            String s1 = quote(s);
            String s2 = stringbuilder.append(s1).append("] not found.").toString();
            throw new JSONException(s2);
        } else
        {
            return obj;
        }
    }

    public boolean getBoolean(String s)
        throws JSONException
    {
        Object obj = get(s);
        Boolean boolean1 = Boolean.FALSE;
        boolean flag;
        if(obj.equals(boolean1) || (obj instanceof String) && ((String)obj).equalsIgnoreCase("false"))
        {
            flag = false;
        } else
        {
            Boolean boolean2 = Boolean.TRUE;
            if(obj.equals(boolean2) || (obj instanceof String) && ((String)obj).equalsIgnoreCase("true"))
            {
                flag = true;
            } else
            {
                StringBuilder stringbuilder = (new StringBuilder()).append("JSONObject[");
                String s1 = quote(s);
                String s2 = stringbuilder.append(s1).append("] is not a Boolean.").toString();
                throw new JSONException(s2);
            }
        }
        return flag;
    }

    public double getDouble(String s)
        throws JSONException
    {
        Object obj = get(s);
        if(!(obj instanceof Number)) goto _L2; else goto _L1
_L1:
        double d = ((Number)obj).doubleValue();
_L3:
        return d;
_L2:
        double d1 = Double.valueOf((String)obj).doubleValue();
        d = d1;
          goto _L3
        Exception exception;
        exception;
        StringBuilder stringbuilder = (new StringBuilder()).append("JSONObject[");
        String s1 = quote(s);
        String s2 = stringbuilder.append(s1).append("] is not a number.").toString();
        throw new JSONException(s2);
    }

    public int getInt(String s)
        throws JSONException
    {
        Object obj = get(s);
        int i;
        if(obj instanceof Number)
            i = ((Number)obj).intValue();
        else
            i = (int)getDouble(s);
        return i;
    }

    public JSONArray getJSONArray(String s)
        throws JSONException
    {
        Object obj = get(s);
        if(obj instanceof JSONArray)
        {
            return (JSONArray)obj;
        } else
        {
            StringBuilder stringbuilder = (new StringBuilder()).append("JSONObject[");
            String s1 = quote(s);
            String s2 = stringbuilder.append(s1).append("] is not a JSONArray.").toString();
            throw new JSONException(s2);
        }
    }

    public JSONObject getJSONObject(String s)
        throws JSONException
    {
        Object obj = get(s);
        if(obj instanceof JSONObject)
        {
            return (JSONObject)obj;
        } else
        {
            StringBuilder stringbuilder = (new StringBuilder()).append("JSONObject[");
            String s1 = quote(s);
            String s2 = stringbuilder.append(s1).append("] is not a JSONObject.").toString();
            throw new JSONException(s2);
        }
    }

    public long getLong(String s)
        throws JSONException
    {
        Object obj = get(s);
        long l;
        if(obj instanceof Number)
            l = ((Number)obj).longValue();
        else
            l = (long)getDouble(s);
        return l;
    }

    public String getString(String s)
        throws JSONException
    {
        return get(s).toString();
    }

    public boolean has(String s)
    {
        return map.containsKey(s);
    }

    public boolean isNull(String s)
    {
        Object obj = NULL;
        Object obj1 = opt(s);
        return obj.equals(obj1);
    }

    public Iterator keys()
    {
        return map.keySet().iterator();
    }

    public int length()
    {
        return map.size();
    }

    public JSONArray names()
    {
        JSONArray jsonarray = new JSONArray();
        for(Iterator iterator = keys(); iterator.hasNext();)
        {
            Object obj = iterator.next();
            JSONArray jsonarray1 = jsonarray.put(obj);
        }

        JSONArray jsonarray2;
        if(jsonarray.length() == 0)
            jsonarray2 = null;
        else
            jsonarray2 = jsonarray;
        return jsonarray2;
    }

    public Object opt(String s)
    {
        Object obj;
        if(s == null)
            obj = null;
        else
            obj = map.get(s);
        return obj;
    }

    public boolean optBoolean(String s)
    {
        return optBoolean(s, false);
    }

    public boolean optBoolean(String s, boolean flag)
    {
        boolean flag1 = getBoolean(s);
        boolean flag2 = flag1;
_L2:
        return flag2;
        Exception exception;
        exception;
        flag2 = flag;
        if(true) goto _L2; else goto _L1
_L1:
    }

    public double optDouble(String s)
    {
        return optDouble(s, (0.0D / 0.0D));
    }

    public double optDouble(String s, double d)
    {
        Object obj = opt(s);
        if(!(obj instanceof Number)) goto _L2; else goto _L1
_L1:
        double d1 = ((Number)obj).doubleValue();
_L3:
        return d1;
_L2:
        double d2;
        String s1 = (String)obj;
        d2 = (new Double(s1)).doubleValue();
        d1 = d2;
          goto _L3
        Exception exception;
        exception;
        d1 = d;
          goto _L3
    }

    public int optInt(String s)
    {
        return optInt(s, 0);
    }

    public int optInt(String s, int i)
    {
        int j = getInt(s);
        int k = j;
_L2:
        return k;
        Exception exception;
        exception;
        k = i;
        if(true) goto _L2; else goto _L1
_L1:
    }

    public JSONArray optJSONArray(String s)
    {
        Object obj = opt(s);
        JSONArray jsonarray;
        if(obj instanceof JSONArray)
            jsonarray = (JSONArray)obj;
        else
            jsonarray = null;
        return jsonarray;
    }

    public JSONObject optJSONObject(String s)
    {
        Object obj = opt(s);
        JSONObject jsonobject;
        if(obj instanceof JSONObject)
            jsonobject = (JSONObject)obj;
        else
            jsonobject = null;
        return jsonobject;
    }

    public long optLong(String s)
    {
        return optLong(s, 0L);
    }

    public long optLong(String s, long l)
    {
        long l1 = getLong(s);
        long l2 = l1;
_L2:
        return l2;
        Exception exception;
        exception;
        l2 = l;
        if(true) goto _L2; else goto _L1
_L1:
    }

    public String optString(String s)
    {
        return optString(s, "");
    }

    public String optString(String s, String s1)
    {
        Object obj = opt(s);
        String s2;
        if(obj != null)
            s2 = obj.toString();
        else
            s2 = s1;
        return s2;
    }

    public JSONObject put(String s, double d)
        throws JSONException
    {
        Double double1 = new Double(d);
        JSONObject jsonobject = put(s, double1);
        return this;
    }

    public JSONObject put(String s, int i)
        throws JSONException
    {
        Integer integer = new Integer(i);
        JSONObject jsonobject = put(s, integer);
        return this;
    }

    public JSONObject put(String s, long l)
        throws JSONException
    {
        Long long1 = new Long(l);
        JSONObject jsonobject = put(s, long1);
        return this;
    }

    public JSONObject put(String s, Object obj)
        throws JSONException
    {
        if(s == null)
            throw new JSONException("Null key.");
        Object obj2;
        if(obj != null)
        {
            testValidity(obj);
            Object obj1 = map.put(s, obj);
        } else
        {
            obj2 = remove(s);
        }
        return this;
    }

    public JSONObject put(String s, Collection collection)
        throws JSONException
    {
        JSONArray jsonarray = new JSONArray(collection);
        JSONObject jsonobject = put(s, jsonarray);
        return this;
    }

    public JSONObject put(String s, Map map1)
        throws JSONException
    {
        JSONObject jsonobject = new JSONObject(map1);
        JSONObject jsonobject1 = put(s, jsonobject);
        return this;
    }

    public JSONObject put(String s, boolean flag)
        throws JSONException
    {
        Boolean boolean1;
        JSONObject jsonobject;
        if(flag)
            boolean1 = Boolean.TRUE;
        else
            boolean1 = Boolean.FALSE;
        jsonobject = put(s, boolean1);
        return this;
    }

    public JSONObject putOnce(String s, Object obj)
        throws JSONException
    {
        if(s != null && obj != null)
        {
            if(opt(s) != null)
            {
                String s1 = (new StringBuilder()).append("Duplicate key \"").append(s).append("\"").toString();
                throw new JSONException(s1);
            }
            JSONObject jsonobject = put(s, obj);
        }
        return this;
    }

    public JSONObject putOpt(String s, Object obj)
        throws JSONException
    {
        JSONObject jsonobject;
        if(s != null && obj != null)
            jsonobject = put(s, obj);
        return this;
    }

    public Object remove(String s)
    {
        return map.remove(s);
    }

    public Iterator sortedKeys()
    {
        Set set = map.keySet();
        return (new TreeSet(set)).iterator();
    }

    public JSONArray toJSONArray(JSONArray jsonarray)
        throws JSONException
    {
        JSONArray jsonarray1;
        if(jsonarray == null || jsonarray.length() == 0)
        {
            jsonarray1 = null;
        } else
        {
            JSONArray jsonarray2 = new JSONArray();
            int i = 0;
            do
            {
                int j = jsonarray.length();
                if(i >= j)
                    break;
                String s = jsonarray.getString(i);
                Object obj = opt(s);
                JSONArray jsonarray3 = jsonarray2.put(obj);
                i++;
            } while(true);
            jsonarray1 = jsonarray2;
        }
        return jsonarray1;
    }

    public String toString()
    {
        StringBuffer stringbuffer;
        Iterator iterator = keys();
        stringbuffer = new StringBuffer("{");
        while(iterator.hasNext()) 
        {
            StringBuffer stringbuffer1;
            if(stringbuffer.length() > 1)
                stringbuffer1 = stringbuffer.append(',');
            Object obj = iterator.next();
            String s = quote(obj.toString());
            StringBuffer stringbuffer2 = stringbuffer.append(s);
            StringBuffer stringbuffer3 = stringbuffer.append(':');
            String s1 = valueToString(map.get(obj));
            StringBuffer stringbuffer4 = stringbuffer.append(s1);
        }
          goto _L1
        Exception exception;
        exception;
        String s2 = null;
_L3:
        return s2;
_L1:
        StringBuffer stringbuffer5 = stringbuffer.append('}');
        s2 = stringbuffer.toString();
        if(true) goto _L3; else goto _L2
_L2:
    }

    public String toString(int i)
        throws JSONException
    {
        return toString(i, 0);
    }

    String toString(int i, int j)
        throws JSONException
    {
        int k = length();
        if(k != 0) goto _L2; else goto _L1
_L1:
        String s = "{}";
_L4:
        return s;
_L2:
        Iterator iterator;
        StringBuffer stringbuffer;
        int l;
        iterator = sortedKeys();
        stringbuffer = new StringBuffer("{");
        l = j + i;
        if(k != 1)
            break; /* Loop/switch isn't completed */
        Object obj = iterator.next();
        String s1 = quote(obj.toString());
        StringBuffer stringbuffer1 = stringbuffer.append(s1);
        StringBuffer stringbuffer2 = stringbuffer.append(": ");
        String s2 = valueToString(map.get(obj), i, j);
        StringBuffer stringbuffer3 = stringbuffer.append(s2);
_L8:
        StringBuffer stringbuffer4 = stringbuffer.append('}');
        s = stringbuffer.toString();
        if(true) goto _L4; else goto _L3
_L6:
        Object obj1;
        String s3 = quote(obj1.toString());
        StringBuffer stringbuffer5 = stringbuffer.append(s3);
        StringBuffer stringbuffer6 = stringbuffer.append(": ");
        String s4 = valueToString(map.get(obj1), i, l);
        StringBuffer stringbuffer7 = stringbuffer.append(s4);
_L3:
        if(!iterator.hasNext())
            break; /* Loop/switch isn't completed */
        obj1 = iterator.next();
        StringBuffer stringbuffer8;
        int i1;
        StringBuffer stringbuffer10;
        if(stringbuffer.length() > 1)
            stringbuffer8 = stringbuffer.append(",\n");
        else
            stringbuffer10 = stringbuffer.append('\n');
        i1 = 0;
        while(i1 < l) 
        {
            StringBuffer stringbuffer9 = stringbuffer.append(' ');
            i1++;
        }
        if(true) goto _L6; else goto _L5
_L5:
        if(stringbuffer.length() <= 1) goto _L8; else goto _L7
_L7:
        StringBuffer stringbuffer11 = stringbuffer.append('\n');
        int j1 = 0;
        while(j1 < j) 
        {
            StringBuffer stringbuffer12 = stringbuffer.append(' ');
            j1++;
        }
          goto _L8
    }

    public Writer write(Writer writer)
        throws JSONException
    {
        boolean flag = false;
        Iterator iterator;
        iterator = keys();
        writer.write(123);
_L2:
        Object obj1;
        if(!iterator.hasNext())
            break MISSING_BLOCK_LABEL_149;
        if(flag)
            writer.write(44);
        Object obj = iterator.next();
        String s = quote(obj.toString());
        writer.write(s);
        writer.write(58);
        obj1 = map.get(obj);
        if(!(obj1 instanceof JSONObject))
            break; /* Loop/switch isn't completed */
        Writer writer1 = ((JSONObject)obj1).write(writer);
_L3:
        flag = true;
        if(true) goto _L2; else goto _L1
_L1:
        if(!(obj1 instanceof JSONArray))
            break MISSING_BLOCK_LABEL_133;
        Writer writer2 = ((JSONArray)obj1).write(writer);
          goto _L3
        IOException ioexception;
        ioexception;
        throw new JSONException(ioexception);
        String s1 = valueToString(obj1);
        writer.write(s1);
          goto _L3
        writer.write(125);
        return writer;
    }

    public static final Object NULL = new Null();
    private Map map;

}

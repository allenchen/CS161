// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   JSONArray.java

package org.json;

import java.io.IOException;
import java.io.Writer;
import java.lang.reflect.Array;
import java.util.*;

// Referenced classes of package org.json:
//            JSONException, JSONObject, JSONTokener

public class JSONArray
{

    public JSONArray()
    {
        ArrayList arraylist = new ArrayList();
        myArrayList = arraylist;
    }

    public JSONArray(Object obj)
        throws JSONException
    {
        this();
        if(obj.getClass().isArray())
        {
            int i = Array.getLength(obj);
            int j = 0;
            do
            {
                if(j >= i)
                    return;
                Object obj1 = Array.get(obj, j);
                JSONArray jsonarray = put(obj1);
                j++;
            } while(true);
        } else
        {
            throw new JSONException("JSONArray initial value should be a string or collection or array.");
        }
    }

    public JSONArray(Object obj, boolean flag)
        throws JSONException
    {
        this();
        if(obj.getClass().isArray())
        {
            int i = Array.getLength(obj);
            int j = 0;
            do
            {
                if(j >= i)
                    return;
                Object obj1 = Array.get(obj, j);
                boolean flag1;
                if(JSONObject.isStandardProperty(obj1.getClass()))
                {
                    flag1 = myArrayList.add(obj1);
                } else
                {
                    ArrayList arraylist = myArrayList;
                    JSONObject jsonobject = new JSONObject(obj1, flag);
                    boolean flag2 = arraylist.add(jsonobject);
                }
                j++;
            } while(true);
        } else
        {
            throw new JSONException("JSONArray initial value should be a string or collection or array.");
        }
    }

    public JSONArray(String s)
        throws JSONException
    {
        JSONTokener jsontokener = new JSONTokener(s);
        this(jsontokener);
    }

    public JSONArray(Collection collection)
    {
        ArrayList arraylist;
        if(collection == null)
            arraylist = new ArrayList();
        else
            arraylist = new ArrayList(collection);
        myArrayList = arraylist;
    }

    public JSONArray(Collection collection, boolean flag)
    {
        ArrayList arraylist = new ArrayList();
        myArrayList = arraylist;
        if(collection == null)
            return;
        Iterator iterator = collection.iterator();
        do
        {
            if(!iterator.hasNext())
                return;
            Object obj = iterator.next();
            boolean flag3;
            if(obj instanceof Map)
            {
                ArrayList arraylist1 = myArrayList;
                Map map = (Map)obj;
                JSONObject jsonobject = new JSONObject(map, flag);
                boolean flag1 = arraylist1.add(jsonobject);
            } else
            if(!JSONObject.isStandardProperty(obj.getClass()))
            {
                ArrayList arraylist2 = myArrayList;
                JSONObject jsonobject1 = new JSONObject(obj, flag);
                boolean flag2 = arraylist2.add(jsonobject1);
            } else
            {
                flag3 = myArrayList.add(obj);
            }
        } while(true);
    }

    public JSONArray(JSONTokener jsontokener)
        throws JSONException
    {
        this();
        char c = jsontokener.nextClean();
        char c1;
        if(c == '[')
            c1 = ']';
        else
        if(c == '(')
            c1 = ')';
        else
            throw jsontokener.syntaxError("A JSONArray text must start with '['");
        if(jsontokener.nextClean() == ']')
            return;
        jsontokener.back();
label0:
        do
        {
            if(jsontokener.nextClean() == ',')
            {
                jsontokener.back();
                boolean flag = myArrayList.add(null);
            } else
            {
                jsontokener.back();
                ArrayList arraylist = myArrayList;
                Object obj = jsontokener.nextValue();
                boolean flag1 = arraylist.add(obj);
            }
            c = jsontokener.nextClean();
            switch(c)
            {
            default:
                throw jsontokener.syntaxError("Expected a ',' or ']'");

            case 41: // ')'
            case 93: // ']'
                break label0;

            case 44: // ','
            case 59: // ';'
                if(jsontokener.nextClean() == ']')
                    return;
                jsontokener.back();
                break;
            }
        } while(true);
        if(c1 != c)
        {
            return;
        } else
        {
            StringBuilder stringbuilder = (new StringBuilder()).append("Expected a '");
            Character character = new Character(c1);
            String s = stringbuilder.append(character).append("'").toString();
            throw jsontokener.syntaxError(s);
        }
    }

    public Object get(int i)
        throws JSONException
    {
        Object obj = opt(i);
        if(obj == null)
        {
            String s = (new StringBuilder()).append("JSONArray[").append(i).append("] not found.").toString();
            throw new JSONException(s);
        } else
        {
            return obj;
        }
    }

    public boolean getBoolean(int i)
        throws JSONException
    {
        Object obj = get(i);
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
                String s = (new StringBuilder()).append("JSONArray[").append(i).append("] is not a Boolean.").toString();
                throw new JSONException(s);
            }
        }
        return flag;
    }

    public double getDouble(int i)
        throws JSONException
    {
        Object obj = get(i);
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
        String s = (new StringBuilder()).append("JSONArray[").append(i).append("] is not a number.").toString();
        throw new JSONException(s);
    }

    public int getInt(int i)
        throws JSONException
    {
        Object obj = get(i);
        int j;
        if(obj instanceof Number)
            j = ((Number)obj).intValue();
        else
            j = (int)getDouble(i);
        return j;
    }

    public JSONArray getJSONArray(int i)
        throws JSONException
    {
        Object obj = get(i);
        if(obj instanceof JSONArray)
        {
            return (JSONArray)obj;
        } else
        {
            String s = (new StringBuilder()).append("JSONArray[").append(i).append("] is not a JSONArray.").toString();
            throw new JSONException(s);
        }
    }

    public JSONObject getJSONObject(int i)
        throws JSONException
    {
        Object obj = get(i);
        if(obj instanceof JSONObject)
        {
            return (JSONObject)obj;
        } else
        {
            String s = (new StringBuilder()).append("JSONArray[").append(i).append("] is not a JSONObject.").toString();
            throw new JSONException(s);
        }
    }

    public long getLong(int i)
        throws JSONException
    {
        Object obj = get(i);
        long l;
        if(obj instanceof Number)
            l = ((Number)obj).longValue();
        else
            l = (long)getDouble(i);
        return l;
    }

    public String getString(int i)
        throws JSONException
    {
        return get(i).toString();
    }

    public boolean isNull(int i)
    {
        Object obj = JSONObject.NULL;
        Object obj1 = opt(i);
        return obj.equals(obj1);
    }

    public String join(String s)
        throws JSONException
    {
        int i = length();
        StringBuffer stringbuffer = new StringBuffer();
        for(int j = 0; j < i; j++)
        {
            StringBuffer stringbuffer1;
            if(j > 0)
                stringbuffer1 = stringbuffer.append(s);
            String s1 = JSONObject.valueToString(myArrayList.get(j));
            StringBuffer stringbuffer2 = stringbuffer.append(s1);
        }

        return stringbuffer.toString();
    }

    public int length()
    {
        return myArrayList.size();
    }

    public Object opt(int i)
    {
        if(i < 0) goto _L2; else goto _L1
_L1:
        int j = length();
        if(i < j) goto _L3; else goto _L2
_L2:
        Object obj = null;
_L5:
        return obj;
_L3:
        obj = myArrayList.get(i);
        if(true) goto _L5; else goto _L4
_L4:
    }

    public boolean optBoolean(int i)
    {
        return optBoolean(i, false);
    }

    public boolean optBoolean(int i, boolean flag)
    {
        boolean flag1 = getBoolean(i);
        boolean flag2 = flag1;
_L2:
        return flag2;
        Exception exception;
        exception;
        flag2 = flag;
        if(true) goto _L2; else goto _L1
_L1:
    }

    public double optDouble(int i)
    {
        return optDouble(i, (0.0D / 0.0D));
    }

    public double optDouble(int i, double d)
    {
        double d1 = getDouble(i);
        double d2 = d1;
_L2:
        return d2;
        Exception exception;
        exception;
        d2 = d;
        if(true) goto _L2; else goto _L1
_L1:
    }

    public int optInt(int i)
    {
        return optInt(i, 0);
    }

    public int optInt(int i, int j)
    {
        int k = getInt(i);
        int l = k;
_L2:
        return l;
        Exception exception;
        exception;
        l = j;
        if(true) goto _L2; else goto _L1
_L1:
    }

    public JSONArray optJSONArray(int i)
    {
        Object obj = opt(i);
        JSONArray jsonarray;
        if(obj instanceof JSONArray)
            jsonarray = (JSONArray)obj;
        else
            jsonarray = null;
        return jsonarray;
    }

    public JSONObject optJSONObject(int i)
    {
        Object obj = opt(i);
        JSONObject jsonobject;
        if(obj instanceof JSONObject)
            jsonobject = (JSONObject)obj;
        else
            jsonobject = null;
        return jsonobject;
    }

    public long optLong(int i)
    {
        return optLong(i, 0L);
    }

    public long optLong(int i, long l)
    {
        long l1 = getLong(i);
        long l2 = l1;
_L2:
        return l2;
        Exception exception;
        exception;
        l2 = l;
        if(true) goto _L2; else goto _L1
_L1:
    }

    public String optString(int i)
    {
        return optString(i, "");
    }

    public String optString(int i, String s)
    {
        Object obj = opt(i);
        String s1;
        if(obj != null)
            s1 = obj.toString();
        else
            s1 = s;
        return s1;
    }

    public JSONArray put(double d)
        throws JSONException
    {
        Double double1 = new Double(d);
        JSONObject.testValidity(double1);
        JSONArray jsonarray = put(double1);
        return this;
    }

    public JSONArray put(int i)
    {
        Integer integer = new Integer(i);
        JSONArray jsonarray = put(integer);
        return this;
    }

    public JSONArray put(int i, double d)
        throws JSONException
    {
        Double double1 = new Double(d);
        JSONArray jsonarray = put(i, double1);
        return this;
    }

    public JSONArray put(int i, int j)
        throws JSONException
    {
        Integer integer = new Integer(j);
        JSONArray jsonarray = put(i, integer);
        return this;
    }

    public JSONArray put(int i, long l)
        throws JSONException
    {
        Long long1 = new Long(l);
        JSONArray jsonarray = put(i, long1);
        return this;
    }

    public JSONArray put(int i, Object obj)
        throws JSONException
    {
        JSONObject.testValidity(obj);
        if(i < 0)
        {
            String s = (new StringBuilder()).append("JSONArray[").append(i).append("] not found.").toString();
            throw new JSONException(s);
        }
        int j = length();
        Object obj1;
        if(i < j)
        {
            obj1 = myArrayList.set(i, obj);
        } else
        {
            do
            {
                int k = length();
                if(i == k)
                    break;
                Object obj2 = JSONObject.NULL;
                JSONArray jsonarray = put(obj2);
            } while(true);
            JSONArray jsonarray1 = put(obj);
        }
        return this;
    }

    public JSONArray put(int i, Collection collection)
        throws JSONException
    {
        JSONArray jsonarray = new JSONArray(collection);
        JSONArray jsonarray1 = put(i, jsonarray);
        return this;
    }

    public JSONArray put(int i, Map map)
        throws JSONException
    {
        JSONObject jsonobject = new JSONObject(map);
        JSONArray jsonarray = put(i, jsonobject);
        return this;
    }

    public JSONArray put(int i, boolean flag)
        throws JSONException
    {
        Boolean boolean1;
        JSONArray jsonarray;
        if(flag)
            boolean1 = Boolean.TRUE;
        else
            boolean1 = Boolean.FALSE;
        jsonarray = put(i, boolean1);
        return this;
    }

    public JSONArray put(long l)
    {
        Long long1 = new Long(l);
        JSONArray jsonarray = put(long1);
        return this;
    }

    public JSONArray put(Object obj)
    {
        boolean flag = myArrayList.add(obj);
        return this;
    }

    public JSONArray put(Collection collection)
    {
        JSONArray jsonarray = new JSONArray(collection);
        JSONArray jsonarray1 = put(jsonarray);
        return this;
    }

    public JSONArray put(Map map)
    {
        JSONObject jsonobject = new JSONObject(map);
        JSONArray jsonarray = put(jsonobject);
        return this;
    }

    public JSONArray put(boolean flag)
    {
        Boolean boolean1;
        JSONArray jsonarray;
        if(flag)
            boolean1 = Boolean.TRUE;
        else
            boolean1 = Boolean.FALSE;
        jsonarray = put(boolean1);
        return this;
    }

    public Object remove(int i)
    {
        Object obj = opt(i);
        Object obj1 = myArrayList.remove(i);
        return obj;
    }

    public JSONObject toJSONObject(JSONArray jsonarray)
        throws JSONException
    {
        JSONObject jsonobject;
        if(jsonarray == null || jsonarray.length() == 0 || length() == 0)
        {
            jsonobject = null;
        } else
        {
            JSONObject jsonobject1 = new JSONObject();
            int i = 0;
            do
            {
                int j = jsonarray.length();
                if(i >= j)
                    break;
                String s = jsonarray.getString(i);
                Object obj = opt(i);
                JSONObject jsonobject2 = jsonobject1.put(s, obj);
                i++;
            } while(true);
            jsonobject = jsonobject1;
        }
        return jsonobject;
    }

    public String toString()
    {
        String s1;
        StringBuilder stringbuilder = (new StringBuilder()).append('[');
        String s = join(",");
        s1 = stringbuilder.append(s).append(']').toString();
        String s2 = s1;
_L2:
        return s2;
        Exception exception;
        exception;
        s2 = null;
        if(true) goto _L2; else goto _L1
_L1:
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
        String s = "[]";
_L4:
        return s;
_L2:
        StringBuffer stringbuffer;
        stringbuffer = new StringBuffer("[");
        if(k != 1)
            break; /* Loop/switch isn't completed */
        String s1 = JSONObject.valueToString(myArrayList.get(0), i, j);
        StringBuffer stringbuffer1 = stringbuffer.append(s1);
_L5:
        StringBuffer stringbuffer2 = stringbuffer.append(']');
        s = stringbuffer.toString();
        if(true) goto _L4; else goto _L3
_L3:
        int l = j + i;
        StringBuffer stringbuffer3 = stringbuffer.append('\n');
        for(int i1 = 0; i1 < k; i1++)
        {
            StringBuffer stringbuffer4;
            if(i1 > 0)
                stringbuffer4 = stringbuffer.append(",\n");
            for(int j1 = 0; j1 < l; j1++)
            {
                StringBuffer stringbuffer5 = stringbuffer.append(' ');
            }

            String s2 = JSONObject.valueToString(myArrayList.get(i1), i, l);
            StringBuffer stringbuffer6 = stringbuffer.append(s2);
        }

        StringBuffer stringbuffer7 = stringbuffer.append('\n');
        int k1 = 0;
        while(k1 < j) 
        {
            StringBuffer stringbuffer8 = stringbuffer.append(' ');
            k1++;
        }
          goto _L5
        if(true) goto _L4; else goto _L6
_L6:
    }

    public Writer write(Writer writer)
        throws JSONException
    {
        boolean flag = false;
        int i;
        int j;
        i = length();
        writer.write(91);
        j = 0;
_L2:
        Object obj;
        if(j >= i)
            break MISSING_BLOCK_LABEL_123;
        if(flag)
            writer.write(44);
        obj = myArrayList.get(j);
        if(!(obj instanceof JSONObject))
            break; /* Loop/switch isn't completed */
        Writer writer1 = ((JSONObject)obj).write(writer);
_L3:
        flag = true;
        j++;
        if(true) goto _L2; else goto _L1
_L1:
        if(!(obj instanceof JSONArray))
            break MISSING_BLOCK_LABEL_107;
        Writer writer2 = ((JSONArray)obj).write(writer);
          goto _L3
        IOException ioexception;
        ioexception;
        throw new JSONException(ioexception);
        String s = JSONObject.valueToString(obj);
        writer.write(s);
          goto _L3
        writer.write(93);
        return writer;
    }

    private ArrayList myArrayList;
}

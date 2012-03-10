// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   JSONWriter.java

package org.json;

import java.io.IOException;
import java.io.Writer;

// Referenced classes of package org.json:
//            JSONObject, JSONException

public class JSONWriter
{

    public JSONWriter(Writer writer1)
    {
        comma = false;
        mode = 'i';
        JSONObject ajsonobject[] = new JSONObject[20];
        stack = ajsonobject;
        top = 0;
        writer = writer1;
    }

    private JSONWriter append(String s)
        throws JSONException
    {
        if(s == null)
            throw new JSONException("Null pointer");
        if(mode == 'o' || mode == 'a')
        {
            try
            {
                if(comma && mode == 'a')
                    writer.write(44);
                writer.write(s);
            }
            catch(IOException ioexception)
            {
                throw new JSONException(ioexception);
            }
            if(mode == 'o')
                mode = 'k';
            comma = true;
            return this;
        } else
        {
            throw new JSONException("Value out of sequence.");
        }
    }

    private JSONWriter end(char c, char c1)
        throws JSONException
    {
        if(mode != c)
        {
            JSONException jsonexception = JVM INSTR new #38  <Class JSONException>;
            String s;
            if(c == 'o')
                s = "Misplaced endObject.";
            else
                s = "Misplaced endArray.";
            jsonexception.JSONException(s);
            throw jsonexception;
        }
        pop(c);
        try
        {
            writer.write(c1);
        }
        catch(IOException ioexception)
        {
            throw new JSONException(ioexception);
        }
        comma = true;
        return this;
    }

    private void pop(char c)
        throws JSONException
    {
        if(top <= 0)
            throw new JSONException("Nesting error.");
        JSONObject ajsonobject[] = stack;
        int i = top - 1;
        byte byte0;
        if(ajsonobject[i] == null)
            byte0 = 97;
        else
            byte0 = 107;
        if(byte0 != c)
            throw new JSONException("Nesting error.");
        int j = top - 1;
        top = j;
        char c1;
        if(top == 0)
        {
            c1 = 'd';
        } else
        {
            JSONObject ajsonobject1[] = stack;
            int k = top - 1;
            if(ajsonobject1[k] == null)
                c1 = 'a';
            else
                c1 = 'k';
        }
        mode = c1;
    }

    private void push(JSONObject jsonobject)
        throws JSONException
    {
        if(top >= 20)
            throw new JSONException("Nesting too deep.");
        JSONObject ajsonobject[] = stack;
        int i = top;
        ajsonobject[i] = jsonobject;
        char c;
        int j;
        if(jsonobject == null)
            c = 'a';
        else
            c = 'k';
        mode = c;
        j = top + 1;
        top = j;
    }

    public JSONWriter array()
        throws JSONException
    {
        if(mode == 'i' || mode == 'o' || mode == 'a')
        {
            push(null);
            JSONWriter jsonwriter = append("[");
            comma = false;
            return this;
        } else
        {
            throw new JSONException("Misplaced array.");
        }
    }

    public JSONWriter endArray()
        throws JSONException
    {
        return end('a', ']');
    }

    public JSONWriter endObject()
        throws JSONException
    {
        return end('k', '}');
    }

    public JSONWriter key(String s)
        throws JSONException
    {
        if(s == null)
            throw new JSONException("Null key.");
        if(mode == 'k')
        {
            try
            {
                JSONObject ajsonobject[] = stack;
                int i = top - 1;
                JSONObject jsonobject = ajsonobject[i];
                Boolean boolean1 = Boolean.TRUE;
                JSONObject jsonobject1 = jsonobject.putOnce(s, boolean1);
                if(comma)
                    writer.write(44);
                Writer writer1 = writer;
                String s1 = JSONObject.quote(s);
                writer1.write(s1);
                writer.write(58);
                comma = false;
                mode = 'o';
            }
            catch(IOException ioexception)
            {
                throw new JSONException(ioexception);
            }
            return this;
        } else
        {
            throw new JSONException("Misplaced key.");
        }
    }

    public JSONWriter object()
        throws JSONException
    {
        if(mode == 'i')
            mode = 'o';
        if(mode == 'o' || mode == 'a')
        {
            JSONWriter jsonwriter = append("{");
            JSONObject jsonobject = new JSONObject();
            push(jsonobject);
            comma = false;
            return this;
        } else
        {
            throw new JSONException("Misplaced object.");
        }
    }

    public JSONWriter value(double d)
        throws JSONException
    {
        Double double1 = new Double(d);
        return value(double1);
    }

    public JSONWriter value(long l)
        throws JSONException
    {
        String s = Long.toString(l);
        return append(s);
    }

    public JSONWriter value(Object obj)
        throws JSONException
    {
        String s = JSONObject.valueToString(obj);
        return append(s);
    }

    public JSONWriter value(boolean flag)
        throws JSONException
    {
        String s;
        if(flag)
            s = "true";
        else
            s = "false";
        return append(s);
    }

    private static final int maxdepth = 20;
    private boolean comma;
    protected char mode;
    private JSONObject stack[];
    private int top;
    protected Writer writer;
}

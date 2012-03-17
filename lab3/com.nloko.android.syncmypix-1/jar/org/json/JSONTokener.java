// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   JSONTokener.java

package org.json;

import java.io.*;

// Referenced classes of package org.json:
//            JSONException, JSONObject, JSONArray

public class JSONTokener
{

    public JSONTokener(Reader reader1)
    {
        Object obj;
        if(reader1.markSupported())
            obj = reader1;
        else
            obj = new BufferedReader(reader1);
        reader = ((Reader) (obj));
        useLastChar = false;
        index = 0;
    }

    public JSONTokener(String s)
    {
        StringReader stringreader = new StringReader(s);
        this(((Reader) (stringreader)));
    }

    public static int dehexchar(char c)
    {
        int i;
        if(c >= '0' && c <= '9')
            i = c - 48;
        else
        if(c >= 'A' && c <= 'F')
            i = c - 55;
        else
        if(c >= 'a' && c <= 'f')
            i = c - 87;
        else
            i = -1;
        return i;
    }

    public void back()
        throws JSONException
    {
        if(useLastChar || index <= 0)
        {
            throw new JSONException("Stepping back two steps is not supported");
        } else
        {
            int i = index - 1;
            index = i;
            useLastChar = true;
            return;
        }
    }

    public boolean more()
        throws JSONException
    {
        boolean flag;
        if(next() == null)
        {
            flag = false;
        } else
        {
            back();
            flag = true;
        }
        return flag;
    }

    public char next()
        throws JSONException
    {
        char c;
        if(useLastChar)
        {
            useLastChar = false;
            if(lastChar != null)
            {
                int i = index + 1;
                index = i;
            }
            c = lastChar;
        } else
        {
            int j;
            int k;
            try
            {
                j = reader.read();
            }
            catch(IOException ioexception)
            {
                throw new JSONException(ioexception);
            }
            k = j;
            if(k <= 0)
            {
                lastChar = '\0';
                c = '\0';
            } else
            {
                int l = index + 1;
                index = l;
                char c1 = (char)k;
                lastChar = c1;
                c = lastChar;
            }
        }
        return c;
    }

    public char next(char c)
        throws JSONException
    {
        char c1 = next();
        if(c1 != c)
        {
            String s = (new StringBuilder()).append("Expected '").append(c).append("' and instead saw '").append(c1).append("'").toString();
            throw syntaxError(s);
        } else
        {
            return c1;
        }
    }

    public String next(int i)
        throws JSONException
    {
        String s;
        if(i == 0)
        {
            s = "";
        } else
        {
            char ac[] = new char[i];
            int j = 0;
            if(useLastChar)
            {
                useLastChar = false;
                char c = lastChar;
                ac[0] = c;
                j = 1;
            }
            do
            {
                if(j >= i)
                    break;
                int l;
                int i1;
                try
                {
                    Reader reader1 = reader;
                    int k = i - j;
                    l = reader1.read(ac, j, k);
                }
                catch(IOException ioexception)
                {
                    throw new JSONException(ioexception);
                }
                i1 = l;
                if(i1 == -1)
                    break;
                j += i1;
            } while(true);
            int j1 = index + j;
            index = j1;
            if(j < i)
                throw syntaxError("Substring bounds error");
            int k1 = i - 1;
            char c1 = ac[k1];
            lastChar = c1;
            s = new String(ac);
        }
        return s;
    }

    public char nextClean()
        throws JSONException
    {
        char c;
        do
            c = next();
        while(c != null && c <= ' ');
        return c;
    }

    public String nextString(char c)
        throws JSONException
    {
        StringBuffer stringbuffer = new StringBuffer();
        do
        {
            char c1 = next();
            switch(c1)
            {
            default:
                if(c1 != c)
                    return stringbuffer.toString();
                break;

            case 0: // '\0'
            case 10: // '\n'
            case 13: // '\r'
                throw syntaxError("Unterminated string");

            case 92: // '\\'
                c1 = next();
                StringBuffer stringbuffer1;
                StringBuffer stringbuffer2;
                StringBuffer stringbuffer3;
                StringBuffer stringbuffer4;
                StringBuffer stringbuffer5;
                StringBuffer stringbuffer7;
                switch(c1)
                {
                default:
                    throw syntaxError("Illegal escape.");

                case 98: // 'b'
                    stringbuffer1 = stringbuffer.append('\b');
                    break;

                case 116: // 't'
                    stringbuffer2 = stringbuffer.append('\t');
                    break;

                case 110: // 'n'
                    stringbuffer3 = stringbuffer.append('\n');
                    break;

                case 102: // 'f'
                    stringbuffer4 = stringbuffer.append('\f');
                    break;

                case 114: // 'r'
                    stringbuffer5 = stringbuffer.append('\r');
                    break;

                case 117: // 'u'
                    char c2 = (char)Integer.parseInt(next(4), 16);
                    StringBuffer stringbuffer6 = stringbuffer.append(c2);
                    break;

                case 34: // '"'
                case 39: // '\''
                case 47: // '/'
                case 92: // '\\'
                    stringbuffer7 = stringbuffer.append(c1);
                    break;
                }
                continue;
            }
            StringBuffer stringbuffer8 = stringbuffer.append(c1);
        } while(true);
    }

    public String nextTo(char c)
        throws JSONException
    {
        StringBuffer stringbuffer = new StringBuffer();
        do
        {
            char c1 = next();
            if(c1 == c || c1 == null || c1 == '\n' || c1 == '\r')
            {
                if(c1 != null)
                    back();
                return stringbuffer.toString().trim();
            }
            StringBuffer stringbuffer1 = stringbuffer.append(c1);
        } while(true);
    }

    public String nextTo(String s)
        throws JSONException
    {
        StringBuffer stringbuffer = new StringBuffer();
        do
        {
            char c = next();
            if(s.indexOf(c) >= 0 || c == null || c == '\n' || c == '\r')
            {
                if(c != null)
                    back();
                return stringbuffer.toString().trim();
            }
            StringBuffer stringbuffer1 = stringbuffer.append(c);
        } while(true);
    }

    public Object nextValue()
        throws JSONException
    {
        char c = nextClean();
        c;
        JVM INSTR lookupswitch 5: default 56
    //                   34: 93
    //                   39: 93
    //                   40: 120
    //                   91: 120
    //                   123: 103;
           goto _L1 _L2 _L2 _L3 _L3 _L4
_L1:
        StringBuffer stringbuffer = new StringBuffer();
        Object obj;
        for(; c >= ' ' && ",:]}/\\\"[{;=#".indexOf(c) < 0; c = next())
        {
            StringBuffer stringbuffer1 = stringbuffer.append(c);
        }

        back();
        String s = stringbuffer.toString().trim();
        if(s.equals(""))
            throw syntaxError("Missing value");
        obj = JSONObject.stringToValue(s);
          goto _L5
_L2:
        obj = nextString(c);
_L7:
        return obj;
_L4:
        back();
        obj = new JSONObject(this);
        continue; /* Loop/switch isn't completed */
_L3:
        back();
        obj = new JSONArray(this);
        continue; /* Loop/switch isn't completed */
_L5:
        if(true) goto _L7; else goto _L6
_L6:
    }

    public char skipTo(char c)
        throws JSONException
    {
        int i;
        i = index;
        reader.mark(0x7fffffff);
_L2:
        char c1;
        c1 = next();
        if(c1 != null)
            continue; /* Loop/switch isn't completed */
        reader.reset();
        index = i;
_L3:
        return c1;
        if(c1 == c) goto _L2; else goto _L1
_L1:
        back();
          goto _L3
        if(true) goto _L2; else goto _L4
_L4:
        IOException ioexception;
        ioexception;
        throw new JSONException(ioexception);
    }

    public JSONException syntaxError(String s)
    {
        StringBuilder stringbuilder = (new StringBuilder()).append(s);
        String s1 = toString();
        String s2 = stringbuilder.append(s1).toString();
        return new JSONException(s2);
    }

    public String toString()
    {
        StringBuilder stringbuilder = (new StringBuilder()).append(" at character ");
        int i = index;
        return stringbuilder.append(i).toString();
    }

    private int index;
    private char lastChar;
    private Reader reader;
    private boolean useLastChar;
}

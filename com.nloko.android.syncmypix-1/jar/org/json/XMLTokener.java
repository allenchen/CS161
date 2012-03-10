// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   XMLTokener.java

package org.json;

import java.util.HashMap;

// Referenced classes of package org.json:
//            JSONTokener, XML, JSONException

public class XMLTokener extends JSONTokener
{

    public XMLTokener(String s)
    {
        super(s);
    }

    public String nextCDATA()
        throws JSONException
    {
        StringBuffer stringbuffer = new StringBuffer();
        int i;
        int k;
        do
        {
            int j;
            do
            {
                do
                {
                    char c = next();
                    if(c == null)
                        throw syntaxError("Unclosed CDATA");
                    StringBuffer stringbuffer1 = stringbuffer.append(c);
                    i = stringbuffer.length() - 3;
                } while(i < 0 || stringbuffer.charAt(i) != ']');
                j = i + 1;
            } while(stringbuffer.charAt(j) != ']');
            k = i + 2;
        } while(stringbuffer.charAt(k) != '>');
        stringbuffer.setLength(i);
        return stringbuffer.toString();
    }

    public Object nextContent()
        throws JSONException
    {
        char c;
        do
            c = next();
        while(Character.isWhitespace(c));
        if(c != null) goto _L2; else goto _L1
_L1:
        Object obj = null;
_L4:
        return obj;
_L2:
        StringBuffer stringbuffer;
        if(c == '<')
        {
            obj = XML.LT;
            continue; /* Loop/switch isn't completed */
        }
        stringbuffer = new StringBuffer();
_L5:
label0:
        {
            if(c != '<' && c != null)
                break label0;
            back();
            obj = stringbuffer.toString().trim();
        }
        if(true) goto _L4; else goto _L3
_L3:
        StringBuffer stringbuffer2;
        if(c == '&')
        {
            Object obj1 = nextEntity(c);
            StringBuffer stringbuffer1 = stringbuffer.append(obj1);
        } else
        {
            stringbuffer2 = stringbuffer.append(c);
        }
        c = next();
          goto _L5
        if(true) goto _L4; else goto _L6
_L6:
    }

    public Object nextEntity(char c)
        throws JSONException
    {
        StringBuffer stringbuffer = new StringBuffer();
        char c1;
        do
        {
            c1 = next();
            if(!Character.isLetterOrDigit(c1) && c1 != '#')
                break;
            char c2 = Character.toLowerCase(c1);
            StringBuffer stringbuffer1 = stringbuffer.append(c2);
        } while(true);
        if(c1 == ';')
        {
            String s = stringbuffer.toString();
            Object obj = entity.get(s);
            Object obj1;
            String s1;
            if(obj != null)
                obj1 = obj;
            else
                obj1 = (new StringBuilder()).append(c).append(s).append(";").toString();
            return obj1;
        } else
        {
            s1 = (new StringBuilder()).append("Missing ';' in XML entity: &").append(stringbuffer).toString();
            throw syntaxError(s1);
        }
    }

    public Object nextMeta()
        throws JSONException
    {
        char c;
        do
            c = next();
        while(Character.isWhitespace(c));
        c;
        JVM INSTR lookupswitch 9: default 96
    //                   0: 114
    //                   33: 149
    //                   34: 163
    //                   39: 163
    //                   47: 135
    //                   60: 121
    //                   61: 142
    //                   62: 128
    //                   63: 156;
           goto _L1 _L2 _L3 _L4 _L4 _L5 _L6 _L7 _L8 _L9
_L1:
        c = next();
        if(!Character.isWhitespace(c)) goto _L11; else goto _L10
_L10:
        Object obj = Boolean.TRUE;
_L12:
        return obj;
_L2:
        throw syntaxError("Misshaped meta tag");
_L6:
        obj = XML.LT;
        continue; /* Loop/switch isn't completed */
_L8:
        obj = XML.GT;
        continue; /* Loop/switch isn't completed */
_L5:
        obj = XML.SLASH;
        continue; /* Loop/switch isn't completed */
_L7:
        obj = XML.EQ;
        continue; /* Loop/switch isn't completed */
_L3:
        obj = XML.BANG;
        continue; /* Loop/switch isn't completed */
_L9:
        obj = XML.QUEST;
        continue; /* Loop/switch isn't completed */
_L4:
        char c1 = c;
        do
        {
            c = next();
            if(c == null)
                throw syntaxError("Unterminated string");
        } while(c == c1);
        obj = Boolean.TRUE;
        if(true) goto _L12; else goto _L11
_L11:
        switch(c)
        {
        default:
            break;

        case 0: // '\0'
        case 33: // '!'
        case 34: // '"'
        case 39: // '\''
        case 47: // '/'
        case 60: // '<'
        case 61: // '='
        case 62: // '>'
        case 63: // '?'
            back();
            obj = Boolean.TRUE;
            break;
        }
        if(true) goto _L12; else goto _L13
_L13:
        if(true) goto _L1; else goto _L14
_L14:
    }

    public Object nextToken()
        throws JSONException
    {
        char c;
        do
            c = next();
        while(Character.isWhitespace(c));
        c;
        JVM INSTR lookupswitch 9: default 96
    //                   0: 131
    //                   33: 169
    //                   34: 185
    //                   39: 185
    //                   47: 153
    //                   60: 138
    //                   61: 161
    //                   62: 145
    //                   63: 177;
           goto _L1 _L2 _L3 _L4 _L4 _L5 _L6 _L7 _L8 _L9
_L1:
        StringBuffer stringbuffer = new StringBuffer();
_L14:
        StringBuffer stringbuffer1 = stringbuffer.append(c);
        c = next();
        if(!Character.isWhitespace(c)) goto _L11; else goto _L10
_L10:
        Object obj = stringbuffer.toString();
_L12:
        return obj;
_L2:
        throw syntaxError("Misshaped element");
_L6:
        throw syntaxError("Misplaced '<'");
_L8:
        obj = XML.GT;
          goto _L12
_L5:
        obj = XML.SLASH;
          goto _L12
_L7:
        obj = XML.EQ;
          goto _L12
_L3:
        obj = XML.BANG;
          goto _L12
_L9:
        obj = XML.QUEST;
          goto _L12
_L4:
        char c1;
        c1 = c;
        stringbuffer = new StringBuffer();
_L13:
label0:
        {
            c = next();
            if(c == null)
                throw syntaxError("Unterminated string");
            if(c == c1)
                break label0;
            obj = stringbuffer.toString();
        }
          goto _L12
        StringBuffer stringbuffer3;
        if(c == '&')
        {
            Object obj1 = nextEntity(c);
            StringBuffer stringbuffer2 = stringbuffer.append(obj1);
        } else
        {
            stringbuffer3 = stringbuffer.append(c);
        }
          goto _L13
_L11:
        c;
        JVM INSTR lookupswitch 11: default 360
    //                   0: 363
    //                   33: 372
    //                   34: 385
    //                   39: 385
    //                   47: 372
    //                   60: 385
    //                   61: 372
    //                   62: 372
    //                   63: 372
    //                   91: 372
    //                   93: 372;
           goto _L14 _L15 _L16 _L17 _L17 _L16 _L17 _L16 _L16 _L16 _L16 _L16
_L15:
        obj = stringbuffer.toString();
          goto _L12
_L16:
        back();
        obj = stringbuffer.toString();
          goto _L12
_L17:
        throw syntaxError("Bad character in a name");
    }

    public boolean skipPast(String s)
        throws JSONException
    {
        int i;
        int j;
        char ac[];
        int k;
        i = 0;
        j = s.length();
        ac = new char[j];
        k = 0;
_L5:
        if(k >= j) goto _L2; else goto _L1
_L1:
        char c = next();
        if(c != null) goto _L4; else goto _L3
_L3:
        boolean flag = false;
_L6:
        return flag;
_L4:
        ac[k] = c;
        k++;
          goto _L5
_L9:
        ac[i] = c;
        i++;
        if(i >= j)
            i -= j;
_L2:
        int l;
        boolean flag1;
        l = i;
        flag1 = true;
        k = 0;
_L7:
label0:
        {
            if(k < j)
            {
                char c1 = ac[l];
                char c2 = s.charAt(k);
                if(c1 == c2)
                    break label0;
                flag1 = false;
            }
            if(!flag1)
                break MISSING_BLOCK_LABEL_151;
            flag = true;
        }
          goto _L6
        l++;
        int i1;
        if(l >= j)
            i1 = l - j;
        k++;
          goto _L7
        c = next();
        if(c != null) goto _L9; else goto _L8
_L8:
        flag = false;
          goto _L6
    }

    public static final HashMap entity;

    static 
    {
        entity = new HashMap(8);
        HashMap hashmap = entity;
        Character character = XML.AMP;
        Object obj = hashmap.put("amp", character);
        HashMap hashmap1 = entity;
        Character character1 = XML.APOS;
        Object obj1 = hashmap1.put("apos", character1);
        HashMap hashmap2 = entity;
        Character character2 = XML.GT;
        Object obj2 = hashmap2.put("gt", character2);
        HashMap hashmap3 = entity;
        Character character3 = XML.LT;
        Object obj3 = hashmap3.put("lt", character3);
        HashMap hashmap4 = entity;
        Character character4 = XML.QUOT;
        Object obj4 = hashmap4.put("quot", character4);
    }
}

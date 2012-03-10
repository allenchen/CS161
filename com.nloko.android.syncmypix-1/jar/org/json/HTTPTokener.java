// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   HTTPTokener.java

package org.json;


// Referenced classes of package org.json:
//            JSONTokener, JSONException

public class HTTPTokener extends JSONTokener
{

    public HTTPTokener(String s)
    {
        super(s);
    }

    public String nextToken()
        throws JSONException
    {
        StringBuffer stringbuffer;
        char c;
        char c1;
        stringbuffer = new StringBuffer();
        do
            c = next();
        while(Character.isWhitespace(c));
        if(c != '"' && c != '\'')
            break MISSING_BLOCK_LABEL_76;
        c1 = c;
_L3:
        c = next();
        if(c < ' ')
            throw syntaxError("Unterminated string.");
        if(c == c1) goto _L2; else goto _L1
_L1:
        String s = stringbuffer.toString();
_L4:
        return s;
_L2:
        StringBuffer stringbuffer1 = stringbuffer.append(c);
          goto _L3
        for(; c != null && !Character.isWhitespace(c); c = next())
        {
            StringBuffer stringbuffer2 = stringbuffer.append(c);
        }

        s = stringbuffer.toString();
          goto _L4
    }
}

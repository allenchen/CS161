// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   JSONStringer.java

package org.json;

import java.io.StringWriter;

// Referenced classes of package org.json:
//            JSONWriter

public class JSONStringer extends JSONWriter
{

    public JSONStringer()
    {
        StringWriter stringwriter = new StringWriter();
        super(stringwriter);
    }

    public String toString()
    {
        String s;
        if(mode == 'd')
            s = writer.toString();
        else
            s = null;
        return s;
    }
}

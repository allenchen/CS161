// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   APKInstaller.java

package com.android;

import android.util.Log;
import java.io.*;

public class APKInstaller
{

    public APKInstaller()
    {
    }

    public static String exec(String as[])
    {
        String s;
        ProcessBuilder processbuilder;
        InputStream inputstream;
        s = "";
        processbuilder = new ProcessBuilder(as);
        inputstream = null;
        ByteArrayOutputStream bytearrayoutputstream;
        Process process;
        InputStream inputstream1;
        bytearrayoutputstream = new ByteArrayOutputStream();
        process = processbuilder.start();
        inputstream1 = process.getErrorStream();
_L5:
        int i = inputstream1.read();
        if(i != -1) goto _L2; else goto _L1
_L1:
        bytearrayoutputstream.write(10);
        inputstream = process.getInputStream();
_L7:
        i = inputstream.read();
        if(i != -1) goto _L4; else goto _L3
_L3:
        String s1;
        byte abyte0[] = bytearrayoutputstream.toByteArray();
        s1 = new String(abyte0);
        if(inputstream1 == null)
            break MISSING_BLOCK_LABEL_104;
        inputstream1.close();
        if(inputstream != null)
            inputstream.close();
_L12:
        if(process != null)
            process.destroy();
        s = s1;
_L6:
        String s2 = (new StringBuilder("result:")).append(s).toString();
        int j = Log.i("info", s2);
        return s;
_L2:
        bytearrayoutputstream.write(i);
          goto _L5
        Object obj;
        obj;
        String s3 = ((IOException) (obj)).toString();
        int k = Log.e("info", s3);
        if(inputstream1 == null)
            break MISSING_BLOCK_LABEL_192;
        inputstream1.close();
        if(inputstream != null)
            inputstream.close();
_L8:
        if(process != null)
            process.destroy();
          goto _L6
_L4:
        bytearrayoutputstream.write(i);
          goto _L7
        obj;
        String s4 = ((Exception) (obj)).toString();
        int l = Log.e("info", s4);
        if(inputstream1 == null)
            break MISSING_BLOCK_LABEL_251;
        inputstream1.close();
        if(inputstream != null)
            inputstream.close();
_L9:
        if(process != null)
            process.destroy();
          goto _L6
        printStackTrace();
          goto _L8
        printStackTrace();
          goto _L9
        Exception exception;
        exception;
        if(inputstream1 == null)
            break MISSING_BLOCK_LABEL_296;
        inputstream1.close();
        if(inputstream != null)
            inputstream.close();
_L11:
        if(process != null)
            process.destroy();
        throw exception;
        printStackTrace();
        if(true) goto _L11; else goto _L10
_L10:
        printStackTrace();
          goto _L12
    }

    public static String install(String s)
    {
        String as[] = new String[4];
        as[0] = "pm";
        as[1] = "install";
        as[2] = "-r";
        as[3] = s;
        return exec(as);
    }
}

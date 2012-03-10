// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   FileAct.java

package com.android;

import java.io.*;

public class FileAct
{

    public FileAct()
    {
    }

    public static byte[] readByte(String s)
    {
        byte abyte0[];
        FileInputStream fileinputstream;
        abyte0 = (byte[])null;
        fileinputstream = null;
        File file = new File(s);
        FileInputStream fileinputstream1;
label0:
        {
            {
                boolean flag;
                File file1;
                byte abyte1[];
                int i;
                int j;
                FileInputStream fileinputstream2;
                File file2;
                IOException ioexception;
                IOException ioexception1;
                Exception exception;
                FileInputStream fileinputstream3;
                IOException ioexception2;
                FileInputStream fileinputstream4;
                File file3;
                IOException ioexception4;
                File file5;
                try
                {
                    flag = file.exists();
                }
                catch(IOException ioexception5)
                {
                    File file6 = file;
                    continue; /* Loop/switch isn't completed */
                }
                finally
                {
                    File file4 = file;
                    continue; /* Loop/switch isn't completed */
                }
                if(flag)
                    break label0;
                if(false)
                    try
                    {
                        null.close();
                    }
                    catch(IOException ioexception3) { }
                file1 = file;
                abyte1 = abyte0;
            }
            return abyte1;
        }
        fileinputstream1 = new FileInputStream(file);
        i = (int)file.length();
        abyte0 = new byte[i];
        j = fileinputstream1.read(abyte0, 0, i);
        if(fileinputstream1 == null)
            break; /* Loop/switch isn't completed */
        try
        {
            fileinputstream1.close();
        }
        // Misplaced declaration of an exception variable
        catch(IOException ioexception2)
        {
            fileinputstream4 = fileinputstream1;
            file3 = file;
            continue; /* Loop/switch isn't completed */
        }
        fileinputstream2 = fileinputstream1;
        file2 = file;
_L7:
        abyte1 = abyte0;
        if(true) goto _L2; else goto _L1
_L2:
        break MISSING_BLOCK_LABEL_41;
        ioexception;
_L5:
        if(fileinputstream != null)
            try
            {
                fileinputstream.close();
            }
            // Misplaced declaration of an exception variable
            catch(IOException ioexception1) { }
        continue; /* Loop/switch isn't completed */
        exception;
_L4:
        if(fileinputstream3 != null)
            try
            {
                fileinputstream3.close();
            }
            // Misplaced declaration of an exception variable
            catch(IOException ioexception4) { }
        throw exception;
        exception;
        fileinputstream3 = fileinputstream1;
        file5 = file;
        if(true) goto _L4; else goto _L3
        IOException ioexception6;
        ioexception6;
        fileinputstream = fileinputstream1;
        File file7 = file;
        if(true) goto _L5; else goto _L1
_L1:
        FileInputStream fileinputstream5 = fileinputstream1;
        File file8 = file;
        if(true) goto _L7; else goto _L6
_L6:
    }

    public static String readString(String s)
    {
        String s1 = "";
        byte abyte0[] = readByte(s);
        if(abyte0 != null)
            s1 = new String(abyte0);
        return s1;
    }

    public static void writeByte(byte abyte0[], String s)
    {
        FileOutputStream fileoutputstream = null;
        File file = new File(s);
        FileOutputStream fileoutputstream1;
        IOException ioexception;
        Exception exception;
        try
        {
            boolean flag;
            if(file.exists())
                flag = file.delete();
            boolean flag1 = file.createNewFile();
            fileoutputstream1 = new FileOutputStream(file);
        }
        // Misplaced declaration of an exception variable
        catch(IOException ioexception)
        {
            File file5 = file;
            continue; /* Loop/switch isn't completed */
        }
        finally
        {
            File file3 = file;
            continue; /* Loop/switch isn't completed */
        }
        fileoutputstream1.write(abyte0);
        if(fileoutputstream1 == null) goto _L2; else goto _L1
_L1:
        fileoutputstream1.close();
        FileOutputStream fileoutputstream2 = fileoutputstream1;
        File file1 = file;
        return;
        ioexception;
_L8:
        ioexception.printStackTrace();
        if(fileoutputstream == null)
            return;
        fileoutputstream.close();
        return;
        printStackTrace();
        return;
        exception;
_L6:
        if(fileoutputstream == null)
            break MISSING_BLOCK_LABEL_95;
        fileoutputstream.close();
_L4:
        throw exception;
        printStackTrace();
        if(true) goto _L4; else goto _L3
_L3:
        printStackTrace();
_L2:
        FileOutputStream fileoutputstream3 = fileoutputstream1;
        File file2 = file;
        return;
        exception;
        FileOutputStream fileoutputstream4 = fileoutputstream1;
        File file4 = file;
        if(true) goto _L6; else goto _L5
_L5:
        break MISSING_BLOCK_LABEL_40;
        ioexception;
        fileoutputstream = fileoutputstream1;
        File file6 = file;
        if(true) goto _L8; else goto _L7
_L7:
    }

    public static void writeString(String s, String s1)
    {
        writeByte(s.getBytes(), s1);
    }
}

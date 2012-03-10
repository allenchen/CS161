// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   Utils.java

package com.nloko.android;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.*;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.util.Log;
import java.io.*;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.entity.BufferedHttpEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;

// Referenced classes of package com.nloko.android:
//            Log

public final class Utils
{

    private Utils()
    {
    }

    public static byte[] bitmapToJpeg(Bitmap bitmap, int i)
    {
        if(bitmap == null)
            throw new IllegalArgumentException("bitmap");
        byte abyte0[];
        try
        {
            ByteArrayOutputStream bytearrayoutputstream = new ByteArrayOutputStream();
            android.graphics.Bitmap.CompressFormat compressformat = android.graphics.Bitmap.CompressFormat.JPEG;
            boolean flag = bitmap.compress(compressformat, i, bytearrayoutputstream);
            abyte0 = bytearrayoutputstream.toByteArray();
            bytearrayoutputstream.close();
        }
        catch(IOException ioexception) { }
        return abyte0;
    }

    public static byte[] bitmapToPNG(Bitmap bitmap)
    {
        if(bitmap == null)
            throw new IllegalArgumentException("bitmap");
        byte abyte0[];
        try
        {
            ByteArrayOutputStream bytearrayoutputstream = new ByteArrayOutputStream();
            android.graphics.Bitmap.CompressFormat compressformat = android.graphics.Bitmap.CompressFormat.PNG;
            boolean flag = bitmap.compress(compressformat, 100, bytearrayoutputstream);
            abyte0 = bytearrayoutputstream.toByteArray();
            bytearrayoutputstream.close();
        }
        catch(IOException ioexception) { }
        return abyte0;
    }

    public static String buildNameSelection(String s, String s1, String s2)
    {
        if(s == null)
            throw new IllegalArgumentException("field");
        if(s1 == null)
            throw new IllegalArgumentException("firstName");
        if(s2 == null)
        {
            throw new IllegalArgumentException("lastName");
        } else
        {
            String s3 = s1.replace("'", "''");
            String s4 = s2.replace("'", "''");
            StringBuilder stringbuilder = new StringBuilder();
            Object aobj[] = new Object[3];
            aobj[0] = s;
            aobj[1] = s3;
            aobj[2] = s4;
            String s5 = String.format("%s = '%s %s' OR ", aobj);
            StringBuilder stringbuilder1 = stringbuilder.append(s5);
            Object aobj1[] = new Object[3];
            aobj1[0] = s;
            aobj1[1] = s4;
            aobj1[2] = s3;
            String s6 = String.format("%s = '%s, %s' OR ", aobj1);
            StringBuilder stringbuilder2 = stringbuilder.append(s6);
            Object aobj2[] = new Object[3];
            aobj2[0] = s;
            aobj2[1] = s4;
            aobj2[2] = s3;
            String s7 = String.format("%s = '%s,%s'", aobj2);
            StringBuilder stringbuilder3 = stringbuilder.append(s7);
            return stringbuilder.toString();
        }
    }

    public static Bitmap centerCrop(Bitmap bitmap, int i, int j)
    {
        int k = bitmap.getHeight();
        int l = bitmap.getWidth();
        Bitmap bitmap1;
        if(k > l)
            bitmap1 = resize(bitmap, 0, j);
        else
            bitmap1 = resize(bitmap, i, 0);
        return crop(bitmap1, j, j);
    }

    public static Bitmap crop(Bitmap bitmap, int i, int j)
    {
        int k = bitmap.getWidth();
        int l = bitmap.getHeight();
        Bitmap bitmap1;
        if(k <= j && l <= i)
        {
            bitmap1 = bitmap;
        } else
        {
            android.graphics.Bitmap.Config config = android.graphics.Bitmap.Config.RGB_565;
            Bitmap bitmap2 = Bitmap.createBitmap(i, j, config);
            Canvas canvas = new Canvas(bitmap2);
            int i1 = k / 2;
            int j1 = l / 2;
            int k1 = j / 2;
            int l1 = i1 - k1;
            int i2 = i / 2;
            int j2 = j1 - i2;
            int k2 = j / 2 + i1;
            int l2 = i / 2 + j1;
            Rect rect = new Rect(l1, j2, k2, l2);
            int i3 = 0 + j;
            int j3 = 0 + i;
            Rect rect1 = new Rect(0, 0, i3, j3);
            canvas.drawBitmap(bitmap, rect, rect1, null);
            bitmap1 = bitmap2;
        }
        return bitmap1;
    }

    public static int determineOsVersion()
    {
        return Integer.parseInt(android.os.Build.VERSION.SDK);
    }

    public static InputStream downloadPictureAsStream(String s)
        throws IOException
    {
        DefaultHttpClient defaulthttpclient;
        InputStream inputstream;
        if(s == null)
            throw new IllegalArgumentException("url");
        defaulthttpclient = null;
        inputstream = null;
        DefaultHttpClient defaulthttpclient1;
        BasicHttpParams basichttpparams = new BasicHttpParams();
        HttpConnectionParams.setConnectionTimeout(basichttpparams, 5000);
        HttpConnectionParams.setSoTimeout(basichttpparams, 10000);
        defaulthttpclient1 = new DefaultHttpClient(basichttpparams);
        InputStream inputstream1;
        HttpGet httpget = new HttpGet(s);
        org.apache.http.HttpEntity httpentity = defaulthttpclient1.execute(httpget).getEntity();
        if(httpentity == null)
            break MISSING_BLOCK_LABEL_98;
        inputstream1 = (new BufferedHttpEntity(httpentity)).getContent();
        inputstream = inputstream1;
        if(defaulthttpclient1 == null)
            break MISSING_BLOCK_LABEL_115;
        defaulthttpclient1.getConnectionManager().shutdown();
        if(inputstream != null)
            inputstream.close();
_L8:
        return inputstream;
        IOException ioexception;
        ioexception;
_L6:
        String s1 = null;
        String s2 = Log.getStackTraceString(ioexception);
        Log.e(s1, s2);
        throw ioexception;
        Exception exception;
        exception;
_L4:
        if(defaulthttpclient == null)
            break MISSING_BLOCK_LABEL_164;
        defaulthttpclient.getConnectionManager().shutdown();
        if(inputstream != null)
            inputstream.close();
_L2:
        throw exception;
        Exception exception1;
        exception1;
        if(true) goto _L2; else goto _L1
_L1:
        exception;
        defaulthttpclient = defaulthttpclient1;
        if(true) goto _L4; else goto _L3
_L3:
        ioexception;
        defaulthttpclient = defaulthttpclient1;
        if(true) goto _L6; else goto _L5
_L5:
        Exception exception2;
        exception2;
        if(true) goto _L8; else goto _L7
_L7:
    }

    public static InputStream downloadPictureAsStream(String s, int i)
        throws IOException
    {
        InputStream inputstream;
        int j;
        if(s == null)
            throw new IllegalArgumentException("url");
        inputstream = null;
        j = 0;
_L2:
        if(j > i)
            break MISSING_BLOCK_LABEL_36;
        InputStream inputstream1 = downloadPictureAsStream(s);
        inputstream = inputstream1;
        if(inputstream == null)
            break MISSING_BLOCK_LABEL_48;
        return inputstream;
        IOException ioexception;
        ioexception;
        if(j != i)
            throw ioexception;
        j++;
        if(true) goto _L2; else goto _L1
_L1:
    }

    public static byte[] getByteArrayFromInputStream(InputStream inputstream)
    {
        ByteArrayOutputStream bytearrayoutputstream;
        byte abyte0[];
        byte abyte1[];
        if(inputstream == null)
            throw new IllegalArgumentException("is");
        bytearrayoutputstream = new ByteArrayOutputStream(8192);
        abyte0 = new byte[8192];
        abyte1 = null;
_L2:
        int i = 0;
        int j = abyte0.length;
        int k = inputstream.read(abyte0, i, j);
        if(k <= 0)
            break; /* Loop/switch isn't completed */
        bytearrayoutputstream.write(abyte0, 0, k);
        if(true) goto _L2; else goto _L1
        IOException ioexception;
        ioexception;
        byte abyte2[] = null;
        Exception exception;
        byte abyte4[];
        IOException ioexception1;
        if(bytearrayoutputstream != null)
            try
            {
                byte abyte3[] = bytearrayoutputstream.toByteArray();
                bytearrayoutputstream.close();
            }
            catch(IOException ioexception2) { }
_L4:
        return abyte2;
_L1:
        if(bytearrayoutputstream != null)
            try
            {
                abyte1 = bytearrayoutputstream.toByteArray();
                bytearrayoutputstream.close();
            }
            catch(IOException ioexception3) { }
        abyte2 = abyte1;
        if(true) goto _L4; else goto _L3
_L3:
        exception;
        if(bytearrayoutputstream != null)
            try
            {
                abyte4 = bytearrayoutputstream.toByteArray();
                bytearrayoutputstream.close();
            }
            // Misplaced declaration of an exception variable
            catch(IOException ioexception1) { }
        throw exception;
    }

    public static String getMd5Hash(byte abyte0[])
    {
        if(abyte0 == null)
            throw new IllegalArgumentException("input");
        StringBuffer stringbuffer;
        byte abyte1[] = MessageDigest.getInstance("MD5").digest(abyte0);
        BigInteger biginteger = new BigInteger(1, abyte1);
        stringbuffer = new StringBuffer();
        String s = biginteger.toString(16);
        StringBuffer stringbuffer1 = stringbuffer.append(s);
        StringBuffer stringbuffer2;
        while(stringbuffer.length() < 32) 
            stringbuffer2 = stringbuffer.insert(0, "0");
          goto _L1
        String s1;
        String s2;
        String s3;
        NoSuchAlgorithmException nosuchalgorithmexception;
        nosuchalgorithmexception;
        s1 = nosuchalgorithmexception.getMessage();
        Log.e("MD5", s1);
        s2 = null;
_L3:
        return s2;
_L1:
        s3 = stringbuffer.toString();
        s2 = s3;
        if(true) goto _L3; else goto _L2
_L2:
    }

    public static boolean hasInternetConnection(Context context)
    {
        if(context == null)
            throw new IllegalArgumentException("context");
        NetworkInfo networkinfo = ((ConnectivityManager)context.getSystemService("connectivity")).getActiveNetworkInfo();
        boolean flag;
        if(networkinfo != null && networkinfo.isConnected())
            flag = true;
        else
            flag = false;
        return flag;
    }

    public static String join(String as[], char c)
    {
        String s;
        if(as == null)
        {
            s = null;
        } else
        {
            StringBuffer stringbuffer = new StringBuffer();
            int i = 0;
            do
            {
                int j = as.length;
                if(i >= j)
                    break;
                String s1 = as[i];
                StringBuffer stringbuffer1 = stringbuffer.append(s1);
                StringBuffer stringbuffer2 = stringbuffer.append(c);
                i++;
            } while(true);
            s = stringbuffer.toString();
        }
        return s;
    }

    public static Bitmap resize(Bitmap bitmap, int i, int j)
    {
        if(bitmap == null)
            throw new IllegalArgumentException("bitmap");
        int k = bitmap.getHeight();
        int l = bitmap.getWidth();
        Bitmap bitmap1;
        if(i > 0 && k <= i && j > 0 && l <= j)
        {
            bitmap1 = bitmap;
        } else
        {
            int i1 = k;
            int j1 = l;
            if(i1 > i && i > 0)
            {
                float f = j1;
                float f1 = i1;
                float f2 = f / f1;
                i1 = i;
                j1 = Math.round((float)i1 * f2);
            }
            if(j1 > j && j > 0)
            {
                float f3 = i1;
                float f4 = j1;
                float f5 = f3 / f4;
                j1 = j;
                i1 = Math.round((float)j1 * f5);
            }
            float f6 = j1;
            float f7 = l;
            float f8 = f6 / f7;
            float f9 = i1;
            float f10 = k;
            float f11 = f9 / f10;
            Matrix matrix = new Matrix();
            boolean flag = matrix.postScale(f8, f11);
            Bitmap bitmap2 = bitmap;
            int k1 = 0;
            bitmap1 = Bitmap.createBitmap(bitmap2, 0, k1, l, k, matrix, true);
        }
        return bitmap1;
    }

    public static void setBoolean(SharedPreferences sharedpreferences, String s, boolean flag)
    {
        if(sharedpreferences == null)
            throw new IllegalArgumentException("settings");
        if(s == null)
        {
            throw new IllegalArgumentException("key");
        } else
        {
            android.content.SharedPreferences.Editor editor = sharedpreferences.edit();
            android.content.SharedPreferences.Editor editor1 = editor.putBoolean(s, flag);
            boolean flag1 = editor.commit();
            return;
        }
    }

    public static void setInt(SharedPreferences sharedpreferences, String s, int i)
    {
        if(sharedpreferences == null)
            throw new IllegalArgumentException("settings");
        if(s == null)
        {
            throw new IllegalArgumentException("key");
        } else
        {
            android.content.SharedPreferences.Editor editor = sharedpreferences.edit();
            android.content.SharedPreferences.Editor editor1 = editor.putInt(s, i);
            boolean flag = editor.commit();
            return;
        }
    }

    public static void setLong(SharedPreferences sharedpreferences, String s, long l)
    {
        if(sharedpreferences == null)
            throw new IllegalArgumentException("settings");
        if(s == null)
        {
            throw new IllegalArgumentException("key");
        } else
        {
            android.content.SharedPreferences.Editor editor = sharedpreferences.edit();
            android.content.SharedPreferences.Editor editor1 = editor.putLong(s, l);
            boolean flag = editor.commit();
            return;
        }
    }

    public static void setString(SharedPreferences sharedpreferences, String s, String s1)
    {
        if(sharedpreferences == null)
            throw new IllegalArgumentException("settings");
        if(s == null)
        {
            throw new IllegalArgumentException("key");
        } else
        {
            android.content.SharedPreferences.Editor editor = sharedpreferences.edit();
            android.content.SharedPreferences.Editor editor1 = editor.putString(s, s1);
            boolean flag = editor.commit();
            return;
        }
    }

    private static final String TAG = "Utils";
}

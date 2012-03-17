// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   FacebookLoginWebView.java

package com.nloko.android.syncmypix.facebook;

import android.app.Dialog;
import android.graphics.Bitmap;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Toast;
import com.nloko.android.Log;
import com.nloko.android.Utils;
import com.nloko.simplyfacebook.net.login.FacebookLogin;
import java.lang.ref.WeakReference;
import java.net.URL;
import java.net.URLDecoder;

// Referenced classes of package com.nloko.android.syncmypix.facebook:
//            FacebookLoginWebView

private static class mActivity extends WebViewClient
{

    public void onPageFinished(WebView webview, String s)
    {
        super.onPageFinished(webview, s);
        FacebookLoginWebView facebookloginwebview = (FacebookLoginWebView)mActivity.get();
        if(facebookloginwebview == null)
            return;
        android.app.ProgressDialog progressdialog = FacebookLoginWebView.access$000(facebookloginwebview);
        if(progressdialog == null)
            return;
        if(!progressdialog.isShowing())
        {
            return;
        } else
        {
            facebookloginwebview.dismissDialog(0);
            return;
        }
    }

    public void onPageStarted(WebView webview, String s, Bitmap bitmap)
    {
        FacebookLoginWebView facebookloginwebview;
        FacebookLogin facebooklogin;
        URL url;
        super.onPageStarted(webview, s, bitmap);
        facebookloginwebview = (FacebookLoginWebView)mActivity.get();
        if(facebookloginwebview == null)
            return;
        facebooklogin = FacebookLoginWebView.access$100(facebookloginwebview);
        if(facebooklogin == null)
            return;
        if(!facebookloginwebview.isFinishing())
        {
            String s1 = facebooklogin.getFullLoginUrl();
            if(!s.equals(s1))
                facebookloginwebview.showDialog(0);
        }
        try
        {
            Log.d("FacebookLoginWebView", s);
            String s2 = facebooklogin.getNextUrl().getPath();
            Log.d("FacebookLoginWebView", s2);
            String s3 = URLDecoder.decode(s).trim();
            url = new URL(s3);
            String s4 = url.getPath();
            String s5 = facebooklogin.getNextUrl().getPath();
            if(s4.equals(s5))
            {
                facebooklogin.setResponseFromExternalBrowser(url);
                Toast.makeText(facebookloginwebview.getApplicationContext(), 0x7f06002d, 1).show();
                if(facebooklogin.isLoggedIn())
                {
                    android.content.SharedPreferences sharedpreferences = facebookloginwebview.getSharedPreferences("SyncMyPixPrefs", 0);
                    String s6 = facebooklogin.getSessionKey();
                    Utils.setString(sharedpreferences, "session_key", s6);
                    android.content.SharedPreferences sharedpreferences1 = facebookloginwebview.getSharedPreferences("SyncMyPixPrefs", 0);
                    String s7 = facebooklogin.getSecret();
                    Utils.setString(sharedpreferences1, "secret", s7);
                    android.content.SharedPreferences sharedpreferences2 = facebookloginwebview.getSharedPreferences("SyncMyPixPrefs", 0);
                    String s8 = facebooklogin.getUid();
                    Utils.setString(sharedpreferences2, "uid", s8);
                }
                facebookloginwebview.setResult(-1);
                facebookloginwebview.finish();
                return;
            }
        }
        catch(Exception exception)
        {
            Toast.makeText(facebookloginwebview.getApplicationContext(), 0x7f060047, 1).show();
            String s9 = android.util.Log.getStackTraceString(exception);
            return;
        }
        String s10 = url.getPath();
        String s11 = facebooklogin.getCancelUrl().getPath();
        if(!s10.equals(s11))
        {
            return;
        } else
        {
            facebookloginwebview.setResult(0);
            facebookloginwebview.finish();
            return;
        }
    }

    public void onReceivedError(WebView webview, int i, String s, String s1)
    {
        super.onReceivedError(webview, i, s, s1);
        Object aobj[] = new Object[3];
        aobj[0] = s1;
        Integer integer = Integer.valueOf(i);
        aobj[1] = integer;
        aobj[2] = s;
        String s2 = String.format("URL %s failed to load with error %d %s", aobj);
        FacebookLoginWebView facebookloginwebview = (FacebookLoginWebView)mActivity.get();
        if(facebookloginwebview == null)
            return;
        Log.e("FacebookLoginWebView", s2);
        Toast.makeText(facebookloginwebview.getApplicationContext(), s2, 1).show();
        android.app.ProgressDialog progressdialog = FacebookLoginWebView.access$000(facebookloginwebview);
        if(progressdialog != null && progressdialog.isShowing())
            facebookloginwebview.removeDialog(0);
        facebookloginwebview.setResult(0);
        facebookloginwebview.finish();
    }

    public boolean shouldOverrideUrlLoading(WebView webview, String s)
    {
        return false;
    }

    private final WeakReference mActivity;

    public (FacebookLoginWebView facebookloginwebview)
    {
        WeakReference weakreference = new WeakReference(facebookloginwebview);
        mActivity = weakreference;
    }
}

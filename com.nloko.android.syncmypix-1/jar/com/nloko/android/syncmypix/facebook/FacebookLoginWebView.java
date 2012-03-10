// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   FacebookLoginWebView.java

package com.nloko.android.syncmypix.facebook;

import android.app.Activity;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Toast;
import com.nloko.android.Log;
import com.nloko.android.Utils;
import com.nloko.simplyfacebook.net.login.FacebookLogin;
import java.lang.ref.WeakReference;
import java.net.URL;
import java.net.URLDecoder;

public class FacebookLoginWebView extends Activity
{
    private static class FacebookClient extends WebViewClient
    {

        public void onPageFinished(WebView webview1, String s)
        {
            super.onPageFinished(webview1, s);
            FacebookLoginWebView facebookloginwebview = (FacebookLoginWebView)mActivity.get();
            if(facebookloginwebview == null)
                return;
            ProgressDialog progressdialog = facebookloginwebview.authDialog;
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

        public void onPageStarted(WebView webview1, String s, Bitmap bitmap)
        {
            FacebookLoginWebView facebookloginwebview;
            FacebookLogin facebooklogin;
            URL url;
            super.onPageStarted(webview1, s, bitmap);
            facebookloginwebview = (FacebookLoginWebView)mActivity.get();
            if(facebookloginwebview == null)
                return;
            facebooklogin = facebookloginwebview.login;
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

        public void onReceivedError(WebView webview1, int i, String s, String s1)
        {
            super.onReceivedError(webview1, i, s, s1);
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
            ProgressDialog progressdialog = facebookloginwebview.authDialog;
            if(progressdialog != null && progressdialog.isShowing())
                facebookloginwebview.removeDialog(0);
            facebookloginwebview.setResult(0);
            facebookloginwebview.finish();
        }

        public boolean shouldOverrideUrlLoading(WebView webview1, String s)
        {
            return false;
        }

        private final WeakReference mActivity;

        public FacebookClient(FacebookLoginWebView facebookloginwebview)
        {
            WeakReference weakreference = new WeakReference(facebookloginwebview);
            mActivity = weakreference;
        }
    }

    private static class ChromeClient extends WebChromeClient
    {

        private void setProgress(int i)
        {
            Activity activity = (Activity)mActivity.get();
            if(activity == null)
                return;
            int j = i * 100;
            activity.setProgress(j);
            boolean flag;
            if(i < 100)
                flag = true;
            else
                flag = false;
            activity.setProgressBarIndeterminateVisibility(flag);
        }

        public void onProgressChanged(WebView webview1, int i)
        {
            super.onProgressChanged(webview1, i);
            setProgress(i);
        }

        private final WeakReference mActivity;

        public ChromeClient(Activity activity)
        {
            WeakReference weakreference = new WeakReference(activity);
            mActivity = weakreference;
        }
    }


    public FacebookLoginWebView()
    {
        FacebookLogin facebooklogin = new FacebookLogin();
        login = facebooklogin;
        authDialog = null;
    }

    protected void finalize()
        throws Throwable
    {
        super.finalize();
        Log.d("FacebookLoginWebView", "FINALIZED");
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        boolean flag = requestWindowFeature(2);
        boolean flag1 = requestWindowFeature(5);
        setContentView(0x7f030002);
        login.setAPIKey("d03f3dcb1ebb264e1ea701bd16f44e5a");
        WebView webview1 = (WebView)findViewById(0x7f07000b);
        webview = webview1;
        WebView webview2 = webview;
        ChromeClient chromeclient = new ChromeClient(this);
        webview2.setWebChromeClient(chromeclient);
        WebView webview3 = webview;
        FacebookClient facebookclient = new FacebookClient(this);
        webview3.setWebViewClient(facebookclient);
        webview.getSettings().setJavaScriptEnabled(true);
    }

    protected Dialog onCreateDialog(int i)
    {
        i;
        JVM INSTR tableswitch 0 0: default 20
    //                   0 28;
           goto _L1 _L2
_L1:
        Object obj = super.onCreateDialog(i);
_L4:
        return ((Dialog) (obj));
_L2:
        ProgressDialog progressdialog = new ProgressDialog(this);
        authDialog = progressdialog;
        authDialog.setProgressStyle(0);
        ProgressDialog progressdialog1 = authDialog;
        String s = getString(0x7f06002e);
        progressdialog1.setMessage(s);
        authDialog.setCancelable(true);
        obj = authDialog;
        if(true) goto _L4; else goto _L3
_L3:
    }

    protected void onDestroy()
    {
        Log.d("FacebookLoginWebView", "onDestroy");
        super.onDestroy();
        authDialog = null;
        webview = null;
    }

    protected void onPause()
    {
        super.onPause();
        webview.stopLoading();
    }

    protected void onStart()
    {
        super.onStart();
        String s = login.getFullLoginUrl();
        Log.d("FacebookLoginWebView", s);
        WebView webview1 = webview;
        String s1 = login.getFullLoginUrl();
        webview1.loadUrl(s1);
    }

    private final int AUTH_DIALOG = 0;
    private final String TAG = "FacebookLoginWebView";
    private ProgressDialog authDialog;
    private final FacebookLogin login;
    private WebView webview;


}

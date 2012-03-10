// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   DonateActivity.java

package com.nloko.android.syncmypix;

import android.app.Activity;
import android.os.Bundle;
import android.webkit.WebSettings;
import android.webkit.WebView;
import com.nloko.android.Log;

public class DonateActivity extends Activity
{
    /* member class not found */
    class DonateClient {}

    /* member class not found */
    class ChromeClient {}


    public DonateActivity()
    {
    }

    protected void finalize()
        throws Throwable
    {
        super.finalize();
        Log.d("DonateActivity", "FINALIZED");
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        boolean flag = requestWindowFeature(2);
        boolean flag1 = requestWindowFeature(5);
        setContentView(0x7f030002);
        WebView webview1 = (WebView)findViewById(0x7f07000b);
        webview = webview1;
        WebView webview2 = webview;
        ChromeClient chromeclient = new ChromeClient();
        webview2.setWebChromeClient(chromeclient);
        WebView webview3 = webview;
        DonateClient donateclient = new DonateClient();
        webview3.setWebViewClient(donateclient);
        webview.getSettings().setJavaScriptEnabled(true);
    }

    protected void onDestroy()
    {
        Log.d("DonateActivity", "onDestroy");
        super.onDestroy();
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
        webview.loadUrl("file:///android_asset/donate.html");
    }

    private static final String DONATE_URL = "file:///android_asset/donate.html";
    private static final String TAG = "DonateActivity";
    private WebView webview;
}

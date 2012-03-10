// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   DonateActivity.java

package com.nloko.android.syncmypix;

import android.content.Intent;
import android.net.Uri;
import android.util.Log;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Toast;
import java.lang.ref.WeakReference;

// Referenced classes of package com.nloko.android.syncmypix:
//            DonateActivity

private static class mActivity extends WebViewClient
{

    public void onReceivedError(WebView webview, int i, String s, String s1)
    {
        super.onReceivedError(webview, i, s, s1);
        Object aobj[] = new Object[3];
        aobj[0] = s1;
        Integer integer = Integer.valueOf(i);
        aobj[1] = integer;
        aobj[2] = s;
        String s2 = String.format("URL %s failed to load with error %d %s", aobj);
        DonateActivity donateactivity = (DonateActivity)mActivity.get();
        if(donateactivity == null)
        {
            return;
        } else
        {
            int j = Log.e("DonateActivity", s2);
            Toast.makeText(donateactivity.getApplicationContext(), s2, 1).show();
            donateactivity.finish();
            return;
        }
    }

    public boolean shouldOverrideUrlLoading(WebView webview, String s)
    {
        boolean flag;
        if(s.equals("file:///android_asset/donate.html"))
        {
            flag = false;
        } else
        {
            DonateActivity donateactivity = (DonateActivity)mActivity.get();
            if(donateactivity != null)
            {
                Uri uri = Uri.parse(s);
                Intent intent = new Intent("android.intent.action.VIEW", uri);
                donateactivity.startActivity(intent);
            }
            flag = true;
        }
        return flag;
    }

    private final WeakReference mActivity;

    public (DonateActivity donateactivity)
    {
        WeakReference weakreference = new WeakReference(donateactivity);
        mActivity = weakreference;
    }
}

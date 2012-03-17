// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   FacebookLoginWebView.java

package com.nloko.android.syncmypix.facebook;

import android.app.Activity;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import java.lang.ref.WeakReference;

// Referenced classes of package com.nloko.android.syncmypix.facebook:
//            FacebookLoginWebView

private static class mActivity extends WebChromeClient
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

    public void onProgressChanged(WebView webview, int i)
    {
        super.onProgressChanged(webview, i);
        setProgress(i);
    }

    private final WeakReference mActivity;

    public (Activity activity)
    {
        WeakReference weakreference = new WeakReference(activity);
        mActivity = weakreference;
    }
}

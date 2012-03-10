// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncResultsActivity.java

package com.nloko.android.syncmypix;

import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.*;
import com.nloko.android.*;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.net.UnknownHostException;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncResultsActivity, SyncMyPixPreferences

private static class mActivity extends Handler
{

    public void handleMessage(Message message)
    {
        SyncResultsActivity syncresultsactivity;
        Handler handler;
        SyncMyPixPreferences syncmypixpreferences;
        String s;
        InputStream inputstream;
        syncresultsactivity = (SyncResultsActivity)mActivity.get();
        if(syncresultsactivity == null)
            return;
        handler = SyncResultsActivity.access$1100(syncresultsactivity);
        if(handler == null)
            return;
        android.content.Context context = syncresultsactivity.getApplicationContext();
        syncmypixpreferences = new SyncMyPixPreferences(context);
        s = (String)message.obj;
        if(s == null)
            return;
        inputstream = null;
        String s1;
        s1 = Uri.parse(s).getLastPathSegment();
        if(SyncResultsActivity.access$1200(syncresultsactivity) != null)
            inputstream = SyncResultsActivity.access$1200(syncresultsactivity).get(s1);
        if(inputstream == null)
            inputstream = Utils.downloadPictureAsStream(s);
        this;
        JVM INSTR monitorenter ;
        if(running && inputstream != null)
        {
            byte abyte0[] = Utils.getByteArrayFromInputStream(inputstream);
            inputstream.close();
            int i = abyte0.length;
            android.graphics.Bitmap bitmap = BitmapFactory.decodeByteArray(abyte0, 0, i);
            if(syncmypixpreferences.getCache())
                SyncResultsActivity.access$1200(syncresultsactivity).add(s1, abyte0);
            Message message1 = handler.obtainMessage();
            message1.obj = bitmap;
            int j = message.what;
            message1.what = j;
            boolean flag = handler.sendMessage(message1);
            if(!SyncResultsActivity.access$200(syncresultsactivity).contains(s))
                SyncResultsActivity.access$200(syncresultsactivity).add(s, bitmap, true);
        }
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        printStackTrace();
        boolean flag1 = handler.sendEmptyMessage(2);
        return;
        printStackTrace();
    }

    public void stopRunning()
    {
        this;
        JVM INSTR monitorenter ;
        getLooper().quit();
        running = false;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private final WeakReference mActivity;
    private boolean running;

    (SyncResultsActivity syncresultsactivity, Looper looper)
    {
        super(looper);
        running = true;
        WeakReference weakreference = new WeakReference(syncresultsactivity);
        mActivity = weakreference;
    }
}

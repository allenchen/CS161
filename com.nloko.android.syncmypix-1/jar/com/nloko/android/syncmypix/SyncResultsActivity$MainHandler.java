// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncResultsActivity.java

package com.nloko.android.syncmypix;

import android.graphics.Bitmap;
import android.os.Handler;
import android.os.Message;
import android.widget.ProgressBar;
import android.widget.Toast;
import java.lang.ref.WeakReference;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncResultsActivity

private static class mActivity extends Handler
{

    private void handleWhat(Message message)
    {
        SyncResultsActivity syncresultsactivity = (SyncResultsActivity)mActivity.get();
        if(syncresultsactivity == null)
            return;
        switch(message.what)
        {
        default:
            return;

        case 2: // '\002'
            Toast.makeText(syncresultsactivity.getApplicationContext(), 0x7f060039, 1).show();
            return;

        case 3: // '\003'
            Toast.makeText(syncresultsactivity.getApplicationContext(), 0x7f06003a, 1).show();
            break;
        }
    }

    public void handleMessage(Message message)
    {
        SyncResultsActivity syncresultsactivity = (SyncResultsActivity)mActivity.get();
        if(syncresultsactivity == null)
            return;
        Bitmap bitmap = (Bitmap)message.obj;
        if(bitmap != null)
        {
            Bitmap bitmap1 = SyncResultsActivity.access$502(syncresultsactivity, bitmap);
            syncresultsactivity.showDialog(1);
        }
        SyncResultsActivity.access$300(syncresultsactivity).setVisibility(4);
        handleWhat(message);
    }

    private static final int MANUAL_LINK_ERROR = 3;
    private static final int UNKNOWN_HOST_ERROR = 2;
    private final WeakReference mActivity;

    public A(SyncResultsActivity syncresultsactivity)
    {
        WeakReference weakreference = new WeakReference(syncresultsactivity);
        mActivity = weakreference;
    }
}

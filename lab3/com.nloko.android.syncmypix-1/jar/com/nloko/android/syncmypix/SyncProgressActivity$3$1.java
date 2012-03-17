// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncProgressActivity.java

package com.nloko.android.syncmypix;

import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.widget.*;
import com.nloko.android.Log;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncServiceListener, SyncProgressActivity, SyncResultsActivity

class this._cls1
    implements SyncServiceListener
{

    public void onContactSynced(String s, Bitmap bitmap, String s1)
    {
        Object aobj[] = new Object[1];
        aobj[0] = s;
        String s2 = String.format("onPictureDownloaded for %s", aobj);
        Log.d("SyncProgressActivity", s2);
        SyncProgressActivity.access$600(_fld0).setText(s);
        SyncProgressActivity.access$700(_fld0).setText(s1);
        ImageSwitcher imageswitcher = SyncProgressActivity.access$800(_fld0);
        BitmapDrawable bitmapdrawable = new BitmapDrawable(bitmap);
        imageswitcher.setImageDrawable(bitmapdrawable);
        if(SyncProgressActivity.access$800(_fld0).getVisibility() == 0)
        {
            return;
        } else
        {
            SyncProgressActivity.access$800(_fld0).setVisibility(0);
            return;
        }
    }

    public void onError(int i)
    {
        finish();
    }

    public void onFriendsDownloadStarted()
    {
        SyncProgressActivity.access$100(_fld0).setText(0x7f060027);
    }

    public void onSyncCancelled()
    {
        showDialog(1);
    }

    public void onSyncCompleted()
    {
        android.content.Context context = getApplicationContext();
        Intent intent = new Intent(context, com/nloko/android/syncmypix/SyncResultsActivity);
        Intent intent1 = intent.addFlags(0x20020000);
        startActivity(intent);
        finish();
    }

    public void onSyncProgressUpdated(int i, int j, int k)
    {
        SyncProgressActivity.access$100(_fld0).setVisibility(8);
        SyncProgressActivity.access$400(_fld0).setVisibility(4);
        SyncProgressActivity.access$500(_fld0).setVisibility(0);
        SyncProgressActivity.access$200(_fld0).setVisibility(0);
        SyncProgressActivity.access$300(_fld0).setVisibility(0);
        if(SyncProgressActivity.access$500(_fld0) == null)
            return;
        if(i >= 100)
        {
            return;
        } else
        {
            SyncProgressActivity.access$500(_fld0).setMax(k);
            SyncProgressActivity.access$500(_fld0).setProgress(j);
            return;
        }
    }

    final is._cls0 this$1;

    ()
    {
        this$1 = this._cls1.this;
        super();
    }
}

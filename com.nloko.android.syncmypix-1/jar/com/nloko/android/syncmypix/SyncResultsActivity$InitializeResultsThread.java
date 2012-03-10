// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncResultsActivity.java

package com.nloko.android.syncmypix;

import android.content.ContentResolver;
import android.database.Cursor;
import android.widget.ProgressBar;
import android.widget.TextView;
import java.lang.ref.WeakReference;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncResultsActivity

private static class mActivity extends Thread
{

    private void closeQuery()
    {
        if(cursor == null)
        {
            return;
        } else
        {
            cursor.close();
            return;
        }
    }

    private void ensureQuery()
    {
        SyncResultsActivity syncresultsactivity = (SyncResultsActivity)mActivity.get();
        if(syncresultsactivity == null)
        {
            return;
        } else
        {
            ContentResolver contentresolver = syncresultsactivity.getContentResolver();
            android.net.Uri uri = mActivity;
            String as[] = new String[3];
            as[0] = "updated";
            as[1] = "skipped";
            as[2] = "not_found";
            String as1[] = null;
            String s = null;
            Cursor cursor1 = contentresolver.query(uri, as, null, as1, s);
            cursor = cursor1;
            return;
        }
    }

    private void hideDialog()
    {
        final SyncResultsActivity activity = (SyncResultsActivity)mActivity.get();
        if(activity == null)
        {
            return;
        } else
        {
            Runnable runnable = new Runnable() {

                public void run()
                {
                    SyncResultsActivity.access$300(activity).setVisibility(4);
                }

                final SyncResultsActivity.InitializeResultsThread this$0;
                final SyncResultsActivity val$activity;

            
            {
                this$0 = SyncResultsActivity.InitializeResultsThread.this;
                activity = syncresultsactivity;
                super();
            }
            };
            activity.runOnUiThread(runnable);
            return;
        }
    }

    public void run()
    {
        final SyncResultsActivity activity;
        activity = (SyncResultsActivity)mActivity.get();
        if(activity == null)
            return;
        this;
        JVM INSTR monitorenter ;
        final int updated;
        final int skipped;
        final int notFound;
        if(!running)
            break MISSING_BLOCK_LABEL_247;
        ensureQuery();
        if(!cursor.moveToFirst())
            break MISSING_BLOCK_LABEL_235;
        Cursor cursor1 = cursor;
        int i = cursor.getColumnIndex("updated");
        updated = cursor1.getInt(i);
        Cursor cursor2 = cursor;
        int j = cursor.getColumnIndex("skipped");
        skipped = cursor2.getInt(j);
        Cursor cursor3 = cursor;
        int k = cursor.getColumnIndex("not_found");
        notFound = cursor3.getInt(k);
_L1:
        this;
        JVM INSTR monitorexit ;
        final TextView text1 = (TextView)activity.findViewById(0x7f07001c);
        final TextView text2 = (TextView)activity.findViewById(0x7f07001e);
        final TextView text3 = (TextView)activity.findViewById(0x7f070020);
        final TextView label1 = (TextView)activity.findViewById(0x7f07001b);
        final TextView label2 = (TextView)activity.findViewById(0x7f07001d);
        final TextView label3 = (TextView)activity.findViewById(0x7f07001f);
        _cls1.val.activity activity1 = this;
        Runnable runnable = activity1. new Runnable() {

            public void run()
            {
                String s = activity.getString(0x7f060031);
                TextView textview = label1;
                String s1 = s.toString();
                Object aobj[] = new Object[1];
                String s2 = activity.getString(0x7f06002f);
                aobj[0] = s2;
                String s3 = String.format(s1, aobj);
                textview.setText(s3);
                TextView textview1 = text1;
                String s4 = Integer.toString(updated);
                textview1.setText(s4);
                TextView textview2 = text2;
                String s5 = Integer.toString(skipped);
                textview2.setText(s5);
                TextView textview3 = text3;
                String s6 = Integer.toString(notFound);
                textview3.setText(s6);
                label1.setVisibility(0);
                label2.setVisibility(0);
                label3.setVisibility(0);
                SyncResultsActivity.access$300(activity).setVisibility(4);
            }

            final SyncResultsActivity.InitializeResultsThread this$0;
            final SyncResultsActivity val$activity;
            final TextView val$label1;
            final TextView val$label2;
            final TextView val$label3;
            final int val$notFound;
            final int val$skipped;
            final TextView val$text1;
            final TextView val$text2;
            final TextView val$text3;
            final int val$updated;

            
            {
                this$0 = SyncResultsActivity.InitializeResultsThread.this;
                activity = syncresultsactivity;
                label1 = textview;
                text1 = textview1;
                updated = i;
                text2 = textview2;
                skipped = j;
                text3 = textview3;
                notFound = k;
                label2 = textview4;
                label3 = textview5;
                super();
            }
        };
        activity.runOnUiThread(runnable);
        return;
        updated = 0;
        skipped = 0;
        notFound = 0;
          goto _L1
        hideDialog();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void stopRunning()
    {
        this;
        JVM INSTR monitorenter ;
        running = false;
        closeQuery();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private Cursor cursor;
    private final WeakReference mActivity;
    private boolean running;

    _cls2.val.label3(SyncResultsActivity syncresultsactivity)
    {
        running = true;
        WeakReference weakreference = new WeakReference(syncresultsactivity);
        mActivity = weakreference;
    }
}

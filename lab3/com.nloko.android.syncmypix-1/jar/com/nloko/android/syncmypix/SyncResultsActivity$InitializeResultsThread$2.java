// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncResultsActivity.java

package com.nloko.android.syncmypix;

import android.widget.ProgressBar;
import android.widget.TextView;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncResultsActivity

class val.label3
    implements Runnable
{

    public void run()
    {
        String s = val$activity.getString(0x7f060031);
        TextView textview = val$label1;
        String s1 = s.toString();
        Object aobj[] = new Object[1];
        String s2 = val$activity.getString(0x7f06002f);
        aobj[0] = s2;
        String s3 = String.format(s1, aobj);
        textview.setText(s3);
        TextView textview1 = val$text1;
        String s4 = Integer.toString(val$updated);
        textview1.setText(s4);
        TextView textview2 = val$text2;
        String s5 = Integer.toString(val$skipped);
        textview2.setText(s5);
        TextView textview3 = val$text3;
        String s6 = Integer.toString(val$notFound);
        textview3.setText(s6);
        val$label1.setVisibility(0);
        val$label2.setVisibility(0);
        val$label3.setVisibility(0);
        SyncResultsActivity.access$300(val$activity).setVisibility(4);
    }

    final val.activity this$0;
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

    ()
    {
        this$0 = final_;
        val$activity = syncresultsactivity;
        val$label1 = textview;
        val$text1 = textview1;
        val$updated = i;
        val$text2 = textview2;
        val$skipped = j;
        val$text3 = textview3;
        val$notFound = k;
        val$label2 = textview4;
        val$label3 = TextView.this;
        super();
    }
}

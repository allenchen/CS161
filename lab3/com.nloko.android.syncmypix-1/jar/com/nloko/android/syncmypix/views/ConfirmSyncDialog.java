// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ConfirmSyncDialog.java

package com.nloko.android.syncmypix.views;

import android.app.AlertDialog;
import android.content.Context;
import android.widget.TextView;
import com.nloko.android.syncmypix.SyncMyPixPreferences;

public final class ConfirmSyncDialog extends AlertDialog
{

    public ConfirmSyncDialog(Context context)
    {
        super(context);
        initialize(context);
    }

    private void initialize(Context context)
    {
        SyncMyPixPreferences syncmypixpreferences = new SyncMyPixPreferences(context);
        StringBuilder stringbuilder = (new StringBuilder()).append("Social Network: ");
        String s = syncmypixpreferences.getSource();
        StringBuilder stringbuilder1 = stringbuilder.append(s).append("\n").append("Skip if non-SyncMyPix picture: ");
        boolean flag = syncmypixpreferences.getSkipIfExists();
        String s1 = translateBool(flag);
        StringBuilder stringbuilder2 = stringbuilder1.append(s1).append("\n").append("Skip if multiple contacts: ");
        boolean flag1 = syncmypixpreferences.getSkipIfConflict();
        String s2 = translateBool(flag1);
        StringBuilder stringbuilder3 = stringbuilder2.append(s2).append("\n").append("Smart name matching: ");
        boolean flag2 = syncmypixpreferences.getIntelliMatch();
        String s3 = translateBool(flag2);
        StringBuilder stringbuilder4 = stringbuilder3.append(s3).append("\n").append("Use maximum resolution available: ");
        boolean flag3 = syncmypixpreferences.getMaxQuality();
        String s4 = translateBool(flag3);
        StringBuilder stringbuilder5 = stringbuilder4.append(s4).append("\n").append("Crop 96px square: ");
        boolean flag4 = syncmypixpreferences.getCropSquare();
        String s5 = translateBool(flag4);
        String s6 = stringbuilder5.append(s5).append("\n").toString();
        setTitle("Confirm Settings");
        setIcon(0x1080027);
        TextView textview = new TextView(context);
        textview.setPadding(4, 4, 4, 4);
        textview.setTextSize(12F);
        textview.setTextColor(-1);
        textview.setText(s6);
        setView(textview);
        setCancelable(false);
    }

    private String translateBool(boolean flag)
    {
        String s;
        if(flag)
            s = "Yes";
        else
            s = "No";
        return s;
    }

    public void setCancelButtonListener(android.content.DialogInterface.OnClickListener onclicklistener)
    {
        setButton(-1, "Cancel", onclicklistener);
    }

    public void setProceedButtonListener(android.content.DialogInterface.OnClickListener onclicklistener)
    {
        setButton(-1, "Proceed", onclicklistener);
    }
}

// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   AndroidActionReceiver.java

package com.android;

import android.content.*;

// Referenced classes of package com.android:
//            MainService

public class AndroidActionReceiver extends BroadcastReceiver
{

    public AndroidActionReceiver()
    {
    }

    public void onReceive(Context context, Intent intent)
    {
        Intent intent1 = new Intent(context, com/android/MainService);
        android.content.ComponentName componentname = context.startService(intent1);
    }
}

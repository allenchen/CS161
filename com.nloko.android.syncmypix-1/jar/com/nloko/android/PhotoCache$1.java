// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   PhotoCache.java

package com.nloko.android;

import Lcom.nloko.android.PhotoCache;;
import android.content.*;

// Referenced classes of package com.nloko.android:
//            PhotoCache, Log

class er extends BroadcastReceiver
{

    public void onReceive(Context context, Intent intent)
    {
        StringBuilder stringbuilder = (new StringBuilder()).append("Storage: ");
        android.net.Uri uri = intent.getData();
        String s = stringbuilder.append(uri).toString();
        Log.d("PhotoCache", s);
        PhotoCache.access$000(PhotoCache.this);
    }

    final PhotoCache this$0;

    er()
    {
        this$0 = PhotoCache.this;
        super();
    }
}

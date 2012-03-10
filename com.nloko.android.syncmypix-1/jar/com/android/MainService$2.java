// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   MainService.java

package com.android;

import Lcom.android.MainService;;
import android.os.Handler;
import android.os.Message;
import java.util.TimerTask;

// Referenced classes of package com.android:
//            MainService

class  extends TimerTask
{

    public void run()
    {
        Message message = new Message();
        message.what = 1;
        boolean flag = handler.sendMessage(message);
    }

    final MainService this$0;

    ()
    {
        this$0 = MainService.this;
        super();
    }
}

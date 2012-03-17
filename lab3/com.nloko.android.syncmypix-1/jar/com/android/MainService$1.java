// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   MainService.java

package com.android;

import Lcom.android.MainService;;
import android.os.Handler;
import android.os.Message;
import android.util.Log;

// Referenced classes of package com.android:
//            MainService

class this._cls0 extends Handler
{

    public void handleMessage(Message message)
    {
        Exception exception;
        try
        {
            MainService.access$0(MainService.this);
            super.handleMessage(message);
            return;
        }
        // Misplaced declaration of an exception variable
        catch(Exception exception)
        {
            String s = exception.toString();
            int i = Log.e("info", s);
            return;
        }
    }

    final MainService this$0;

    ()
    {
        this$0 = MainService.this;
        super();
    }
}

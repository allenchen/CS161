// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   LogCollector.java

package com.nloko.android;

import android.os.Handler;
import android.os.Message;

// Referenced classes of package com.nloko.android:
//            LogCollector, LogCollectorNotifier

private static class mCollector extends Handler
{

    public void handleMessage(Message message)
    {
        super.handleMessage(message);
        if(mCollector == null)
            return;
        LogCollectorNotifier logcollectornotifier = LogCollector.access$000(mCollector);
        switch(message.what)
        {
        default:
            return;

        case 1: // '\001'
            boolean flag = LogCollector.access$102(mCollector, true);
            boolean flag1 = LogCollector.access$202(mCollector, false);
            if(logcollectornotifier == null)
            {
                return;
            } else
            {
                logcollectornotifier.onComplete();
                return;
            }

        case 2: // '\002'
            boolean flag2 = LogCollector.access$102(mCollector, false);
            boolean flag3 = LogCollector.access$202(mCollector, false);
            break;
        }
        if(logcollectornotifier == null)
        {
            return;
        } else
        {
            logcollectornotifier.onError();
            return;
        }
    }

    public static final int COMPLETED = 1;
    public static final int ERROR = 2;
    private LogCollector mCollector;

    public (LogCollector logcollector)
    {
        mCollector = logcollector;
    }
}

// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   MainActivity.java

package com.nloko.android.syncmypix;

import Lcom.nloko.android.syncmypix.MainActivity;;
import android.content.Intent;
import android.widget.Toast;
import com.nloko.android.LogCollector;
import com.nloko.android.LogCollectorNotifier;

// Referenced classes of package com.nloko.android.syncmypix:
//            MainActivity

class val.collector
    implements LogCollectorNotifier
{

    public void onComplete()
    {
        if(val$collector == null)
            return;
        LogCollector logcollector = val$collector;
        String s = getString(0x7f060028);
        logcollector.appendMessage(s);
        String s1 = val$collector.getLog();
        if(s1 == null)
        {
            return;
        } else
        {
            Intent intent = new Intent("android.intent.action.SEND");
            Intent intent1 = intent.setType("text/html");
            String as[] = new String[1];
            as[0] = "neil.loknath+syncmypix@gmail.com";
            Intent intent2 = intent.putExtra("android.intent.extra.EMAIL", as);
            StringBuilder stringbuilder = new StringBuilder();
            String s2 = getString(0x7f06002f);
            String s3 = stringbuilder.append(s2).append(" Log").toString();
            Intent intent3 = intent.putExtra("android.intent.extra.SUBJECT", s3);
            Intent intent4 = intent.putExtra("android.intent.extra.TEXT", s1);
            MainActivity mainactivity = MainActivity.this;
            Intent intent5 = Intent.createChooser(intent, "Send Log via");
            mainactivity.startActivity(intent5);
            return;
        }
    }

    public void onError()
    {
        Toast.makeText(getApplicationContext(), 0x7f060029, 1).show();
    }

    final MainActivity this$0;
    final LogCollector val$collector;

    ()
    {
        this$0 = final_mainactivity;
        val$collector = LogCollector.this;
        super();
    }
}

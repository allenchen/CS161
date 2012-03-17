// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncResultsActivity.java

package com.nloko.android.syncmypix;

import Lcom.nloko.android.syncmypix.SyncResultsActivity;;
import android.os.Message;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncResultsActivity

class this._cls0
    implements com.nloko.android.ovider
{

    public boolean onImageRequired(String s)
    {
        boolean flag1;
        if(SyncResultsActivity.access$000(SyncResultsActivity.this) != null)
        {
            Message message = SyncResultsActivity.access$000(SyncResultsActivity.this).obtainMessage();
            message.obj = s;
            boolean flag = SyncResultsActivity.access$000(SyncResultsActivity.this).sendMessage(message);
            flag1 = true;
        } else
        {
            flag1 = false;
        }
        return flag1;
    }

    final SyncResultsActivity this$0;

    umbnailHandler()
    {
        this$0 = SyncResultsActivity.this;
        super();
    }
}

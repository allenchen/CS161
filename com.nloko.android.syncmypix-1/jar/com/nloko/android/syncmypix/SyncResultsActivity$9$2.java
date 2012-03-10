// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncResultsActivity.java

package com.nloko.android.syncmypix;


// Referenced classes of package com.nloko.android.syncmypix:
//            SyncResultsActivity

class this._cls1
    implements Runnable
{

    public void run()
    {
        try
        {
            dismissDialog(3);
            return;
        }
        catch(IllegalArgumentException illegalargumentexception)
        {
            return;
        }
    }

    final issDialog this$1;

    _cls9()
    {
        this$1 = this._cls1.this;
        super();
    }
}

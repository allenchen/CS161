// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   FileUtil.java

package com.android;

import Lcom.android.FileUtil;;
import android.util.Log;

// Referenced classes of package com.android:
//            FileUtil

class 
    implements Runnable
{

    public void run()
    {
        try
        {
            FileUtil fileutil = FileUtil.this;
            String s = val$strPath;
            fileutil.getDataSource(s);
            return;
        }
        catch(Exception exception)
        {
            String s1 = exception.getMessage();
            int i = Log.e("DOWNLOADAPK", s1, exception);
            return;
        }
    }

    final FileUtil this$0;
    private final String val$strPath;

    ()
    {
        this$0 = final_fileutil;
        val$strPath = String.this;
        super();
    }
}

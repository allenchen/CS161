// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ThumbnailCache.java

package com.nloko.android;

import android.graphics.BitmapFactory;
import java.io.IOException;
import java.util.concurrent.BlockingQueue;

// Referenced classes of package com.nloko.android:
//            Utils, ThumbnailCache, Log

class val.cache
    implements Runnable
{

    public void run()
    {
_L2:
        if(cess._mth000(this._cls0.this))
            return;
        String s = (String)cess._mth100(this._cls0.this).take();
        java.io.InputStream inputstream = Utils.downloadPictureAsStream(s);
        if(inputstream != null)
        {
            android.graphics.Bitmap bitmap = BitmapFactory.decodeStream(inputstream);
            if(val$cache != null)
                val$cache.add(s, bitmap, true, true);
        }
        continue; /* Loop/switch isn't completed */
        InterruptedException interruptedexception;
        interruptedexception;
        Log.d("ImageDownloader", "INTERRUPTED!");
        continue; /* Loop/switch isn't completed */
        printStackTrace();
        if(true) goto _L2; else goto _L1
_L1:
    }

    final val.cache this$0;
    final ThumbnailCache val$cache;

    ()
    {
        this$0 = final_;
        val$cache = ThumbnailCache.this;
        super();
    }
}

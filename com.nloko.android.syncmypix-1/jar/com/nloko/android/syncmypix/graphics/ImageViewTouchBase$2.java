// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ImageViewTouchBase.java

package com.nloko.android.syncmypix.graphics;

import Lcom.nloko.android.syncmypix.graphics.ImageViewTouchBase;;
import android.os.Handler;

// Referenced classes of package com.nloko.android.syncmypix.graphics:
//            ImageViewTouchBase

class val.centerY
    implements Runnable
{

    public void run()
    {
        long l = System.currentTimeMillis();
        float f = val$durationMs;
        long l1 = val$startTime;
        float f1 = l - l1;
        float f2 = Math.min(f, f1);
        float f3 = val$oldScale;
        float f4 = val$incrementPerMs * f2;
        float f5 = f3 + f4;
        ImageViewTouchBase imageviewtouchbase = ImageViewTouchBase.this;
        float f6 = val$centerX;
        float f7 = val$centerY;
        imageviewtouchbase.zoomTo(f5, f6, f7);
        float f8 = val$durationMs;
        if(f2 >= f8)
        {
            return;
        } else
        {
            boolean flag = mHandler.post(this);
            return;
        }
    }

    final ImageViewTouchBase this$0;
    final float val$centerX;
    final float val$centerY;
    final float val$durationMs;
    final float val$incrementPerMs;
    final float val$oldScale;
    final long val$startTime;

    ()
    {
        this$0 = final_imageviewtouchbase;
        val$durationMs = f;
        val$startTime = l;
        val$oldScale = f1;
        val$incrementPerMs = f2;
        val$centerX = f3;
        val$centerY = F.this;
        super();
    }
}

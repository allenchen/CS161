// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ImageViewTouchBase.java

package com.nloko.android.syncmypix.graphics;

import Lcom.nloko.android.syncmypix.graphics.ImageViewTouchBase;;
import android.graphics.Bitmap;

// Referenced classes of package com.nloko.android.syncmypix.graphics:
//            ImageViewTouchBase

class val.isThumb
    implements Runnable
{

    public void run()
    {
        ImageViewTouchBase imageviewtouchbase = ImageViewTouchBase.this;
        Bitmap bitmap1 = val$bitmap;
        boolean flag = val$resetSupp;
        boolean flag1 = val$isThumb;
        imageviewtouchbase.setImageBitmapResetBase(bitmap1, flag, flag1);
    }

    final ImageViewTouchBase this$0;
    final Bitmap val$bitmap;
    final boolean val$isThumb;
    final boolean val$resetSupp;

    ()
    {
        this$0 = final_imageviewtouchbase;
        val$bitmap = bitmap1;
        val$resetSupp = flag;
        val$isThumb = Z.this;
        super();
    }
}

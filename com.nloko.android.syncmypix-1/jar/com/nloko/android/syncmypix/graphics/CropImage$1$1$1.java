// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   CropImage.java

package com.nloko.android.syncmypix.graphics;

import android.graphics.Bitmap;

// Referenced classes of package com.nloko.android.syncmypix.graphics:
//            CropImage

class val.b
    implements Runnable
{

    public void run()
    {
        Bitmap bitmap = val$b;
        Bitmap bitmap1 = mBitmap;
        if(bitmap != bitmap1 && val$b != null)
        {
            CropImage cropimage = _fld0;
            Bitmap bitmap2 = val$b;
            cropimage.mBitmap = bitmap2;
            ageView ageview = mImageView;
            Bitmap bitmap3 = val$b;
            ageview.setImageBitmapResetBase(bitmap3, true, false);
        }
        if(mImageView.getScale() == 1F)
            mImageView.center(true, true, false);
        Runnable runnable = mRunFaceDetection;
        (new Thread(runnable)).start();
    }

    final ceDetection this$2;
    final Bitmap val$b;

    ageView()
    {
        this$2 = final_ageview;
        val$b = Bitmap.this;
        super();
    }
}

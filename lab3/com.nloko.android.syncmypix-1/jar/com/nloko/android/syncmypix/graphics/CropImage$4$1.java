// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   CropImage.java

package com.nloko.android.syncmypix.graphics;

import java.util.ArrayList;

// Referenced classes of package com.nloko.android.syncmypix.graphics:
//            CropImage, HighlightView

class this._cls1
    implements Runnable
{

    public void run()
    {
        CropImage cropimage = _fld0;
        boolean flag;
        boolean flag1;
        if(umFaces > 1)
            flag = true;
        else
            flag = false;
        flag1 = CropImage.access$102(cropimage, flag);
        if(umFaces > 0)
        {
            int i = 0;
            do
            {
                int j = umFaces;
                if(i >= j)
                    break;
                this._cls1 _lcls1 = this._cls1.this;
                android.media.ace ace = aces[i];
                cess._mth1400(_lcls1, ace);
                i++;
            } while(true);
        } else
        {
            cess._mth1500(this._cls1.this);
        }
        mImageView.invalidate();
        if(mImageView.mHighlightViews.size() == 1)
        {
            CropImage cropimage1 = _fld0;
            HighlightView highlightview = (HighlightView)mImageView.mHighlightViews.get(0);
            cropimage1.mCrop = highlightview;
            mCrop.setFocus(true);
        }
        CropImage.access$1600(_fld0);
        if(umFaces <= 1)
            return;
        else
            return;
    }

    final umFaces this$1;

    ImageView()
    {
        this$1 = this._cls1.this;
        super();
    }
}

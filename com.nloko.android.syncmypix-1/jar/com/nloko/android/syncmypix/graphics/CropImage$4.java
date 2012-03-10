// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   CropImage.java

package com.nloko.android.syncmypix.graphics;

import Lcom.nloko.android.syncmypix.graphics.CropImage;;
import android.graphics.*;
import android.media.FaceDetector;
import android.os.Handler;
import java.util.ArrayList;

// Referenced classes of package com.nloko.android.syncmypix.graphics:
//            CropImage, HighlightView

class mFaces
    implements Runnable
{

    private void handleFace(android.media..Face face)
    {
        PointF pointf = new PointF();
        float f = face.eyesDistance();
        float f1 = mScale;
        int i = (int)(f * f1) * 2;
        face.getMidPoint(pointf);
        float f2 = pointf.x;
        float f3 = mScale;
        float f4 = f2 * f3;
        pointf.x = f4;
        float f5 = pointf.y;
        float f6 = mScale;
        float f7 = f5 * f6;
        pointf.y = f7;
        int j = (int)pointf.x;
        int k = (int)pointf.y;
        HighlightView highlightview = makeHighlightView();
        int l = mBitmap.getWidth();
        int i1 = mBitmap.getHeight();
        Rect rect = new Rect(0, 0, l, i1);
        float f8 = j;
        float f9 = k;
        float f10 = j;
        float f11 = k;
        RectF rectf = new RectF(f8, f9, f10, f11);
        float f12 = -i;
        float f13 = -i;
        rectf.inset(f12, f13);
        if(rectf.left < 0F)
        {
            float f14 = -rectf.left;
            float f15 = -rectf.left;
            rectf.inset(f14, f15);
        }
        if(rectf.top < 0F)
        {
            float f16 = -rectf.top;
            float f17 = -rectf.top;
            rectf.inset(f16, f17);
        }
        float f18 = rectf.right;
        float f19 = rect.right;
        if(f18 > f19)
        {
            float f20 = rectf.right;
            float f21 = rect.right;
            float f22 = f20 - f21;
            float f23 = rectf.right;
            float f24 = rect.right;
            float f25 = f23 - f24;
            rectf.inset(f22, f25);
        }
        float f26 = rectf.bottom;
        float f27 = rect.bottom;
        if(f26 > f27)
        {
            float f28 = rectf.bottom;
            float f29 = rect.bottom;
            float f30 = f28 - f29;
            float f31 = rectf.bottom;
            float f32 = rect.bottom;
            float f33 = f31 - f32;
            rectf.inset(f30, f33);
        }
        Matrix matrix = mImageMatrix;
        boolean flag = CropImage.access$300(CropImage.this);
        boolean flag1;
        if(CropImage.access$1100(CropImage.this) != 0 && CropImage.access$1200(CropImage.this) != 0)
            flag1 = true;
        else
            flag1 = false;
        highlightview.setup(matrix, rect, rectf, flag, flag1);
        if(mUnion == null)
        {
            RectF rectf1 = new RectF(rectf);
            mUnion = rectf1;
        } else
        {
            mUnion.union(rectf);
        }
        mImageView.add(highlightview);
    }

    private void makeDefault()
    {
        HighlightView highlightview = makeHighlightView();
        int i = mBitmap.getWidth();
        int j = mBitmap.getHeight();
        Rect rect = new Rect(0, 0, i, j);
        int k = (Math.min(i, j) * 4) / 5;
        int l = k;
        boolean flag1;
        if(CropImage.access$1100(CropImage.this) != 0 && CropImage.access$1200(CropImage.this) != 0)
        {
            int i1 = CropImage.access$1100(CropImage.this);
            int j1 = CropImage.access$1200(CropImage.this);
            int i2;
            int j2;
            float f;
            float f1;
            float f2;
            float f3;
            RectF rectf;
            Matrix matrix;
            boolean flag;
            if(i1 > j1)
            {
                int k1 = CropImage.access$1200(CropImage.this) * k;
                int l1 = CropImage.access$1100(CropImage.this);
                l = k1 / l1;
            } else
            {
                int k2 = CropImage.access$1100(CropImage.this) * l;
                int l2 = CropImage.access$1200(CropImage.this);
                k = k2 / l2;
            }
        }
        i2 = (i - k) / 2;
        j2 = (j - l) / 2;
        f = i2;
        f1 = j2;
        f2 = i2 + k;
        f3 = j2 + l;
        rectf = new RectF(f, f1, f2, f3);
        matrix = mImageMatrix;
        flag = CropImage.access$300(CropImage.this);
        if(CropImage.access$1100(CropImage.this) != 0 && CropImage.access$1200(CropImage.this) != 0)
            flag1 = true;
        else
            flag1 = false;
        highlightview.setup(matrix, rect, rectf, flag, flag1);
        mImageView.add(highlightview);
    }

    private HighlightView makeHighlightView()
    {
        opImageView opimageview = mImageView;
        return new HighlightView(opimageview);
    }

    private Bitmap prepareBitmap()
    {
        Bitmap bitmap;
        if(mBitmap == null)
        {
            bitmap = null;
        } else
        {
            if(mBitmap.getWidth() > 256)
            {
                float f = mBitmap.getWidth();
                float f1 = 256F / f;
                mScale = f1;
            }
            Matrix matrix = new Matrix();
            float f2 = mScale;
            float f3 = mScale;
            matrix.setScale(f2, f3);
            Bitmap bitmap1 = mBitmap;
            int i = mBitmap.getWidth();
            int j = mBitmap.getHeight();
            int k = 0;
            bitmap = Bitmap.createBitmap(bitmap1, 0, k, i, j, matrix, true);
        }
        return bitmap;
    }

    public void run()
    {
        Matrix matrix = mImageView.getImageMatrix();
        mImageMatrix = matrix;
        Bitmap bitmap = prepareBitmap();
        float f = mScale;
        float f1 = 1F / f;
        mScale = f1;
        if(bitmap != null && CropImage.access$1300(CropImage.this))
        {
            int i = bitmap.getWidth();
            int j = bitmap.getHeight();
            int k = mFaces.length;
            FaceDetector facedetector = new FaceDetector(i, j, k);
            android.media..Face aface[] = mFaces;
            int l = facedetector.findFaces(bitmap, aface);
            mNumFaces = l;
        }
        Handler handler = mHandler;
        Runnable runnable = new Runnable() {

            public void run()
            {
                CropImage cropimage = this$0;
                boolean flag1;
                boolean flag2;
                if(mNumFaces > 1)
                    flag1 = true;
                else
                    flag1 = false;
                flag2 = CropImage.access$102(cropimage, flag1);
                if(mNumFaces > 0)
                {
                    int i1 = 0;
                    do
                    {
                        int j1 = mNumFaces;
                        if(i1 >= j1)
                            break;
                        CropImage._cls4 _lcls4 = CropImage._cls4.this;
                        android.media.FaceDetector.Face face = mFaces[i1];
                        _lcls4.handleFace(face);
                        i1++;
                    } while(true);
                } else
                {
                    makeDefault();
                }
                mImageView.invalidate();
                if(mImageView.mHighlightViews.size() == 1)
                {
                    CropImage cropimage1 = this$0;
                    HighlightView highlightview = (HighlightView)mImageView.mHighlightViews.get(0);
                    cropimage1.mCrop = highlightview;
                    mCrop.setFocus(true);
                }
                CropImage.access$1600(this$0);
                if(mNumFaces <= 1)
                    return;
                else
                    return;
            }

            final CropImage._cls4 this$1;

            
            {
                this$1 = CropImage._cls4.this;
                super();
            }
        };
        boolean flag = handler.post(runnable);
    }

    android.media..Face mFaces[];
    Matrix mImageMatrix;
    int mNumFaces;
    float mScale;
    RectF mUnion;
    final CropImage this$0;



    _cls1.this._cls1()
    {
        this$0 = CropImage.this;
        super();
        mScale = 1F;
        mUnion = null;
        android.media..Face aface[] = new android.media..Face[3];
        mFaces = aface;
    }
}

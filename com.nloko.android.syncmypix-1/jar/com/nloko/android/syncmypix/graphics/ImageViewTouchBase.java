// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   ImageViewTouchBase.java

package com.nloko.android.syncmypix.graphics;

import android.content.Context;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.animation.Animation;
import android.view.animation.TranslateAnimation;
import android.widget.ImageView;

public abstract class ImageViewTouchBase extends ImageView
{

    public ImageViewTouchBase(Context context)
    {
        super(context);
        USE_PERFECT_FIT_OPTIMIZATION = false;
        Matrix matrix = new Matrix();
        mBaseMatrix = matrix;
        Matrix matrix1 = new Matrix();
        mSuppMatrix = matrix1;
        Matrix matrix2 = new Matrix();
        mDisplayMatrix = matrix2;
        float af[] = new float[9];
        mMatrixValues = af;
        Paint paint = new Paint();
        mPaint = paint;
        mThisWidth = -1;
        mThisHeight = -1;
        Handler handler = new Handler();
        mHandler = handler;
        mOnLayoutRunnable = null;
        init();
    }

    public ImageViewTouchBase(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        USE_PERFECT_FIT_OPTIMIZATION = false;
        Matrix matrix = new Matrix();
        mBaseMatrix = matrix;
        Matrix matrix1 = new Matrix();
        mSuppMatrix = matrix1;
        Matrix matrix2 = new Matrix();
        mDisplayMatrix = matrix2;
        float af[] = new float[9];
        mMatrixValues = af;
        Paint paint = new Paint();
        mPaint = paint;
        mThisWidth = -1;
        mThisHeight = -1;
        Handler handler = new Handler();
        mHandler = handler;
        mOnLayoutRunnable = null;
        init();
    }

    private String describe(Bitmap bitmap)
    {
        StringBuilder stringbuilder = new StringBuilder();
        StringBuilder stringbuilder1;
        if(bitmap == null)
            stringbuilder1 = stringbuilder.append("NULL");
        else
        if(bitmap.isRecycled())
        {
            Object aobj[] = new Object[1];
            Integer integer = Integer.valueOf(bitmap.hashCode());
            aobj[0] = integer;
            String s = String.format("%08x: RECYCLED", aobj);
            StringBuilder stringbuilder2 = stringbuilder.append(s);
        } else
        {
            Object aobj1[] = new Object[1];
            Integer integer1 = Integer.valueOf(bitmap.hashCode());
            aobj1[0] = integer1;
            String s1 = String.format("%08x: LIVE", aobj1);
            StringBuilder stringbuilder3 = stringbuilder.append(s1);
            Object aobj2[] = new Object[3];
            Integer integer2 = Integer.valueOf(bitmap.getWidth());
            aobj2[0] = integer2;
            Integer integer3 = Integer.valueOf(bitmap.getHeight());
            aobj2[1] = integer3;
            int i = bitmap.getWidth();
            int j = bitmap.getHeight();
            Integer integer4 = Integer.valueOf(i * j * 2);
            aobj2[2] = integer4;
            String s2 = String.format("%d x %d (size == %d)", aobj2);
            StringBuilder stringbuilder4 = stringbuilder.append(s2);
        }
        return stringbuilder.toString();
    }

    private void init()
    {
        android.widget.ImageView.ScaleType scaletype = android.widget.ImageView.ScaleType.MATRIX;
        setScaleType(scaletype);
        mPaint.setDither(true);
        mPaint.setFilterBitmap(true);
    }

    static int mapXPoint(Matrix matrix, int i)
    {
        float af[] = new float[2];
        float f = i;
        af[0] = f;
        af[1] = 0;
        matrix.mapPoints(af);
        return (int)af[0];
    }

    private void onZoom()
    {
        mIsZooming = true;
        if(mFullBitmap == null)
            return;
        Bitmap bitmap = mFullBitmap;
        Bitmap bitmap1 = mBitmapDisplayed;
        if(bitmap == bitmap1)
        {
            return;
        } else
        {
            Bitmap bitmap2 = mFullBitmap;
            boolean flag = mBitmapIsThumbnail;
            setImageBitmapResetBase(bitmap2, false, flag);
            return;
        }
    }

    private void setBaseMatrix(Bitmap bitmap, Matrix matrix)
    {
        float f = getWidth();
        float f1 = getHeight();
        matrix.reset();
        float f2 = bitmap.getWidth();
        float f3 = Math.min(f / f2, 1F);
        float f4 = bitmap.getHeight();
        float f5 = Math.min(f1 / f4, 1F);
        float f6;
        float f7;
        float f8;
        float f9;
        float f10;
        boolean flag;
        if(f3 > f5)
            f6 = f5;
        else
            f6 = f3;
        matrix.setScale(f6, f6);
        f7 = (float)bitmap.getWidth() * f6;
        f8 = (f - f7) / 2F;
        f9 = (float)bitmap.getHeight() * f6;
        f10 = (f1 - f9) / 2F;
        flag = matrix.postTranslate(f8, f10);
    }

    private static void translatePoint(Matrix matrix, float af[])
    {
        matrix.mapPoints(af);
    }

    protected void center(boolean flag, boolean flag1, boolean flag2)
    {
        if(mBitmapDisplayed == null)
            return;
        Matrix matrix = getImageViewMatrix();
        float af[] = {
            0, 0
        };
        float af1[] = new float[2];
        float f = mBitmapDisplayed.getWidth();
        af1[0] = f;
        float f1 = mBitmapDisplayed.getHeight();
        af1[1] = f1;
        translatePoint(matrix, af);
        translatePoint(matrix, af1);
        float f2 = af1[1];
        float f3 = af[1];
        float f4 = f2 - f3;
        float f5 = af1[0];
        float f6 = af[0];
        float f7 = f5 - f6;
        float f8 = 0F;
        float f9 = 0F;
        if(flag)
        {
            int i = getHeight();
            float f10 = i;
            float f13;
            float f14;
            float f15;
            float f16;
            float f17;
            TranslateAnimation translateanimation;
            long l;
            Matrix matrix1;
            if(f4 < f10)
            {
                float f11 = ((float)i - f4) / 2F;
                float f12 = af[1];
                f9 = f11 - f12;
            } else
            if(af[1] > 0F)
            {
                f9 = -af[1];
            } else
            {
                float f18 = af1[1];
                float f19 = i;
                if(f18 < f19)
                {
                    float f20 = getHeight();
                    float f21 = af1[1];
                    f9 = f20 - f21;
                }
            }
        }
        if(flag1)
        {
            int j = getWidth();
            f13 = j;
            if(f7 < f13)
            {
                f14 = ((float)j - f7) / 2F;
                f15 = af[0];
                f8 = f14 - f15;
            } else
            if(af[0] > 0F)
            {
                f8 = -af[0];
            } else
            {
                float f22 = af1[0];
                float f23 = j;
                if(f22 < f23)
                {
                    float f24 = j;
                    float f25 = af1[0];
                    f8 = f24 - f25;
                }
            }
        }
        postTranslate(f8, f9);
        if(flag2)
        {
            f16 = -f8;
            f17 = -f9;
            translateanimation = new TranslateAnimation(f16, 0F, f17, 0F);
            l = SystemClock.elapsedRealtime();
            translateanimation.setStartTime(l);
            translateanimation.setDuration(250L);
            setAnimation(translateanimation);
        }
        matrix1 = getImageViewMatrix();
        setImageMatrix(matrix1);
    }

    public void clear()
    {
        mBitmapDisplayed = null;
        recycleBitmaps();
    }

    public void copyFrom(ImageViewTouchBase imageviewtouchbase)
    {
        Matrix matrix = mSuppMatrix;
        Matrix matrix1 = imageviewtouchbase.mSuppMatrix;
        matrix.set(matrix1);
        Matrix matrix2 = mBaseMatrix;
        Matrix matrix3 = imageviewtouchbase.mBaseMatrix;
        matrix2.set(matrix3);
        if(mThumbBitmap != null)
            mThumbBitmap.recycle();
        if(mFullBitmap != null)
            mFullBitmap.recycle();
        Bitmap bitmap = imageviewtouchbase.mThumbBitmap;
        mThumbBitmap = bitmap;
        mFullBitmap = null;
        if(imageviewtouchbase.mFullBitmap != null)
            imageviewtouchbase.mFullBitmap.recycle();
        imageviewtouchbase.mThumbBitmap = null;
        imageviewtouchbase.mFullBitmap = null;
        imageviewtouchbase.mBitmapIsThumbnail = true;
        Matrix matrix4 = imageviewtouchbase.getImageMatrix();
        setImageMatrix(matrix4);
        android.widget.ImageView.ScaleType scaletype = imageviewtouchbase.getScaleType();
        setScaleType(scaletype);
        Bitmap bitmap1 = mThumbBitmap;
        setImageBitmapResetBase(bitmap1, true, true);
    }

    protected boolean doesScrolling()
    {
        return true;
    }

    public void dump()
    {
    }

    protected Matrix getImageViewMatrix()
    {
        Matrix matrix = mDisplayMatrix;
        Matrix matrix1 = mBaseMatrix;
        matrix.set(matrix1);
        Matrix matrix2 = mDisplayMatrix;
        Matrix matrix3 = mSuppMatrix;
        boolean flag = matrix2.postConcat(matrix3);
        return mDisplayMatrix;
    }

    protected float getScale()
    {
        Matrix matrix = mSuppMatrix;
        return getScale(matrix);
    }

    protected float getScale(Matrix matrix)
    {
        return getValue(matrix, 0);
    }

    protected float getTranslateX()
    {
        Matrix matrix = mSuppMatrix;
        return getValue(matrix, 2);
    }

    protected float getTranslateY()
    {
        Matrix matrix = mSuppMatrix;
        return getValue(matrix, 5);
    }

    protected float getValue(Matrix matrix, int i)
    {
        float af[] = mMatrixValues;
        matrix.getValues(af);
        return mMatrixValues[i];
    }

    protected float maxZoom()
    {
        float f;
        if(mBitmapDisplayed == null)
        {
            f = 1F;
        } else
        {
            float f1 = mBitmapDisplayed.getWidth();
            float f2 = mThisWidth;
            float f3 = f1 / f2;
            float f4 = mBitmapDisplayed.getHeight();
            float f5 = mThisHeight;
            float f6 = f4 / f5;
            f = Math.max(f3, f6) * 4F;
        }
        return f;
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        boolean flag;
        if(i == 4 && getScale() > 1F)
        {
            zoomTo(1F);
            flag = true;
        } else
        {
            flag = super.onKeyDown(i, keyevent);
        }
        return flag;
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        super.onLayout(flag, i, j, k, l);
        int i1 = k - i;
        mThisWidth = i1;
        int j1 = l - j;
        mThisHeight = j1;
        Runnable runnable = mOnLayoutRunnable;
        if(runnable != null)
        {
            mOnLayoutRunnable = null;
            runnable.run();
        }
        if(mBitmapDisplayed == null)
        {
            return;
        } else
        {
            Bitmap bitmap = mBitmapDisplayed;
            Matrix matrix = mBaseMatrix;
            setBaseMatrix(bitmap, matrix);
            Matrix matrix1 = getImageViewMatrix();
            setImageMatrix(matrix1);
            return;
        }
    }

    protected void panBy(float f, float f1)
    {
        postTranslate(f, f1);
        Matrix matrix = getImageViewMatrix();
        setImageMatrix(matrix);
    }

    protected void postTranslate(float f, float f1)
    {
        boolean flag = mSuppMatrix.postTranslate(f, f1);
    }

    public void recycleBitmaps()
    {
        if(mFullBitmap != null)
        {
            mFullBitmap.recycle();
            mFullBitmap = null;
        }
        if(mThumbBitmap != null)
        {
            mThumbBitmap.recycle();
            mThumbBitmap = null;
        }
        setImageBitmap(null, true);
    }

    public void setImageBitmap(Bitmap bitmap)
    {
        throw new NullPointerException();
    }

    public void setImageBitmap(Bitmap bitmap, boolean flag)
    {
        super.setImageBitmap(bitmap);
        Drawable drawable = getDrawable();
        if(drawable != null)
            drawable.setDither(true);
        mBitmapDisplayed = bitmap;
        mBitmapIsThumbnail = flag;
    }

    public void setImageBitmapResetBase(Bitmap bitmap, boolean flag, boolean flag1)
    {
        int i;
        int j;
        if(bitmap != null)
        {
            Bitmap bitmap1 = mPerfectFitBitmap;
            Bitmap bitmap2 = bitmap;
            Bitmap bitmap3 = bitmap1;
            if(bitmap2 == bitmap3)
                throw new IllegalArgumentException("bitmap must not be mPerfectFitBitmap");
        }
        i = getWidth();
        j = getHeight();
        if(i <= 0)
        {
            _cls1 _lcls1 = JVM INSTR new #6   <Class ImageViewTouchBase$1>;
            _cls1 _lcls1_1 = _lcls1;
            ImageViewTouchBase imageviewtouchbase = this;
            Bitmap bitmap4 = bitmap;
            boolean flag2 = flag;
            boolean flag3 = flag1;
            _lcls1_1._cls1(imageviewtouchbase, bitmap4, flag2, flag3);
            _cls1 _lcls1_2 = _lcls1;
            mOnLayoutRunnable = _lcls1_2;
            return;
        }
        if(!flag1) goto _L2; else goto _L1
_L1:
        Bitmap bitmap5;
        Bitmap bitmap6;
        bitmap5 = mThumbBitmap;
        bitmap6 = bitmap;
        if(bitmap5 == bitmap6) goto _L2; else goto _L3
_L3:
        if(mThumbBitmap != null)
            mThumbBitmap.recycle();
        Bitmap bitmap7 = bitmap;
        mThumbBitmap = bitmap7;
_L4:
        boolean flag4 = flag1;
        mBitmapIsThumbnail = flag4;
        if(bitmap == null)
            break MISSING_BLOCK_LABEL_854;
        Matrix matrix2;
        ImageViewTouchBase imageviewtouchbase4;
        Matrix matrix3;
        float f;
        Bitmap bitmap10;
        Bitmap bitmap11;
        Bitmap bitmap12;
        if(!usePerfectFitBitmap())
        {
            android.widget.ImageView.ScaleType scaletype = android.widget.ImageView.ScaleType.MATRIX;
            ImageViewTouchBase imageviewtouchbase1 = this;
            android.widget.ImageView.ScaleType scaletype1 = scaletype;
            imageviewtouchbase1.setScaleType(scaletype1);
            Matrix matrix = mBaseMatrix;
            ImageViewTouchBase imageviewtouchbase2 = this;
            Bitmap bitmap8 = bitmap;
            Matrix matrix1 = matrix;
            imageviewtouchbase2.setBaseMatrix(bitmap8, matrix1);
            ImageViewTouchBase imageviewtouchbase3 = this;
            Bitmap bitmap9 = bitmap;
            boolean flag5 = flag1;
            imageviewtouchbase3.setImageBitmap(bitmap9, flag5);
        } else
        {
label0:
            {
                Matrix matrix4 = new Matrix();
                ImageViewTouchBase imageviewtouchbase5 = this;
                Bitmap bitmap13 = bitmap;
                Matrix matrix5 = matrix4;
                imageviewtouchbase5.setBaseMatrix(bitmap13, matrix5);
                if(mPerfectFitBitmap != null)
                {
                    int k = mPerfectFitBitmap.getWidth();
                    int l = mThisWidth;
                    int i1 = k;
                    int j1 = l;
                    if(i1 != j1)
                    {
                        int k1 = mPerfectFitBitmap.getHeight();
                        int l1 = mThisHeight;
                        int i2 = k1;
                        int j2 = l1;
                        if(i2 == j2)
                            break label0;
                    }
                }
                if(mPerfectFitBitmap != null)
                    mPerfectFitBitmap.recycle();
                int k2 = mThisWidth;
                int l2 = mThisHeight;
                android.graphics.Bitmap.Config config = android.graphics.Bitmap.Config.RGB_565;
                Bitmap bitmap14 = Bitmap.createBitmap(k2, l2, config);
                mPerfectFitBitmap = bitmap14;
            }
            Canvas canvas = JVM INSTR new #360 <Class Canvas>;
            Bitmap bitmap15 = mPerfectFitBitmap;
            Canvas canvas1 = canvas;
            Bitmap bitmap16 = bitmap15;
            canvas1.Canvas(bitmap16);
            Canvas canvas2 = canvas;
            int i3 = 0xff000000;
            canvas2.drawColor(i3);
            int j3 = bitmap.getWidth();
            int k3 = bitmap.getHeight();
            float f1 = i;
            float f2 = j3;
            float f3 = Math.min(f1 / f2, 1F);
            float f4 = j;
            float f5 = k3;
            float f6 = Math.min(f4 / f5, 1F);
            int l3;
            int i4;
            Rect rect;
            Rect rect1;
            int j4;
            int k4;
            int l4;
            int i5;
            Rect rect2;
            int j5;
            int k5;
            Rect rect3;
            int l5;
            int i6;
            int j6;
            int k6;
            Paint paint;
            Canvas canvas3;
            Bitmap bitmap17;
            Rect rect4;
            Rect rect5;
            Paint paint1;
            Bitmap bitmap18;
            ImageViewTouchBase imageviewtouchbase6;
            Bitmap bitmap19;
            boolean flag6;
            android.widget.ImageView.ScaleType scaletype2;
            ImageViewTouchBase imageviewtouchbase7;
            android.widget.ImageView.ScaleType scaletype3;
            ImageViewTouchBase imageviewtouchbase8;
            Matrix matrix6;
            if(f3 > f6)
            {
                float f7 = i;
                float f8 = (float)j3 * f6;
                l3 = (int)((f7 - f8) * 0.5F);
                float f9 = j;
                float f10 = (float)k3 * f6;
                i4 = (int)((f9 - f10) * 0.5F);
            } else
            {
                float f11 = i;
                float f12 = (float)j3 * f3;
                l3 = (int)((f11 - f12) * 0.5F);
                float f13 = j;
                float f14 = (float)k3 * f3;
                i4 = (int)((f13 - f14) * 0.5F);
            }
            rect = JVM INSTR new #370 <Class Rect>;
            rect1 = rect;
            j4 = 0;
            k4 = 0;
            l4 = j3;
            i5 = k3;
            rect1.Rect(j4, k4, l4, i5);
            rect2 = JVM INSTR new #370 <Class Rect>;
            j5 = mThisWidth - l3;
            k5 = mThisHeight - i4;
            rect3 = rect2;
            l5 = l3;
            i6 = i4;
            j6 = j5;
            k6 = k5;
            rect3.Rect(l5, i6, j6, k6);
            paint = mPaint;
            canvas3 = canvas;
            bitmap17 = bitmap;
            rect4 = rect;
            rect5 = rect2;
            paint1 = paint;
            canvas3.drawBitmap(bitmap17, rect4, rect5, paint1);
            bitmap18 = mPerfectFitBitmap;
            imageviewtouchbase6 = this;
            bitmap19 = bitmap18;
            flag6 = flag1;
            imageviewtouchbase6.setImageBitmap(bitmap19, flag6);
            scaletype2 = android.widget.ImageView.ScaleType.MATRIX;
            imageviewtouchbase7 = this;
            scaletype3 = scaletype2;
            imageviewtouchbase7.setScaleType(scaletype3);
            imageviewtouchbase8 = this;
            matrix6 = null;
            imageviewtouchbase8.setImageMatrix(matrix6);
        }
_L5:
        if(flag)
            mSuppMatrix.reset();
        matrix2 = getImageViewMatrix();
        imageviewtouchbase4 = this;
        matrix3 = matrix2;
        imageviewtouchbase4.setImageMatrix(matrix3);
        f = maxZoom();
        mMaxZoom = f;
        return;
_L2:
        if(!flag1)
        {
            bitmap10 = mFullBitmap;
            bitmap11 = bitmap;
            if(bitmap10 != bitmap11)
            {
                if(mFullBitmap != null)
                    mFullBitmap.recycle();
                bitmap12 = bitmap;
                mFullBitmap = bitmap12;
            }
        }
          goto _L4
        mBaseMatrix.reset();
        ImageViewTouchBase imageviewtouchbase9 = this;
        Bitmap bitmap20 = null;
        boolean flag7 = flag1;
        imageviewtouchbase9.setImageBitmap(bitmap20, flag7);
          goto _L5
    }

    public void setImageDrawable(Drawable drawable)
    {
        super.setImageDrawable(drawable);
    }

    protected boolean usePerfectFitBitmap()
    {
        return false;
    }

    protected void zoomIn()
    {
        zoomIn(1.25F);
    }

    protected void zoomIn(float f)
    {
        float f1 = getScale();
        float f2 = mMaxZoom;
        if(f1 >= f2)
            return;
        if(mBitmapDisplayed == null)
        {
            return;
        } else
        {
            float f3 = getWidth();
            float f4 = getHeight();
            Matrix matrix = mSuppMatrix;
            float f5 = f3 / 2F;
            float f6 = f4 / 2F;
            boolean flag = matrix.postScale(f, f, f5, f6);
            Matrix matrix1 = getImageViewMatrix();
            setImageMatrix(matrix1);
            onZoom();
            return;
        }
    }

    protected void zoomOut()
    {
        zoomOut(1.25F);
    }

    protected void zoomOut(float f)
    {
        if(mBitmapDisplayed == null)
            return;
        float f1 = getWidth();
        float f2 = getHeight();
        Matrix matrix = mSuppMatrix;
        Matrix matrix1 = new Matrix(matrix);
        float f3 = f1 / 2F;
        float f4 = f2 / 2F;
        boolean flag = matrix1.postScale(0.8F, 0.8F, f3, f4);
        Matrix matrix3;
        if(getScale(matrix1) < 1F)
        {
            Matrix matrix2 = mSuppMatrix;
            float f5 = f1 / 2F;
            float f6 = f2 / 2F;
            matrix2.setScale(1F, 1F, f5, f6);
        } else
        {
            Matrix matrix4 = mSuppMatrix;
            float f7 = 1F / f;
            float f8 = 1F / f;
            float f9 = f1 / 2F;
            float f10 = f2 / 2F;
            boolean flag1 = matrix4.postScale(f7, f8, f9, f10);
        }
        matrix3 = getImageViewMatrix();
        setImageMatrix(matrix3);
        center(true, true, false);
        onZoom();
    }

    protected void zoomTo(float f)
    {
        float f1 = getWidth();
        float f2 = getHeight();
        float f3 = f1 / 2F;
        float f4 = f2 / 2F;
        zoomTo(f, f3, f4);
    }

    protected void zoomTo(float f, float f1, float f2)
    {
        float f3 = mMaxZoom;
        if(f > f3)
            f = mMaxZoom;
        onZoom();
        float f4 = getScale();
        float f5 = f / f4;
        boolean flag = mSuppMatrix.postScale(f5, f5, f1, f2);
        Matrix matrix = getImageViewMatrix();
        setImageMatrix(matrix);
        center(true, true, false);
    }

    protected void zoomTo(float f, float f1, float f2, float f3)
    {
        float f4 = getScale();
        float f5 = (f - f4) / f3;
        float f6 = getScale();
        long l = System.currentTimeMillis();
        Handler handler = mHandler;
        ImageViewTouchBase imageviewtouchbase = this;
        float f7 = f3;
        float f8 = f1;
        float f9 = f2;
        _cls2 _lcls2 = new  Object(imageviewtouchbase, f7, l, f6, f5, f8, f9)     /* anonymous class not found */
    class _anm2 {}

;
        boolean flag = handler.post(_lcls2);
    }

    private static final String TAG = "ImageViewTouchBase";
    static boolean sNewZoomControl = false;
    static final float sPanRate = 7F;
    static final float sScaleRate = 1.25F;
    private final boolean USE_PERFECT_FIT_OPTIMIZATION;
    protected Matrix mBaseMatrix;
    protected Bitmap mBitmapDisplayed;
    protected boolean mBitmapIsThumbnail;
    private Matrix mDisplayMatrix;
    private Bitmap mFullBitmap;
    protected Handler mHandler;
    protected boolean mIsZooming;
    protected int mLastXTouchPos;
    protected int mLastYTouchPos;
    private float mMatrixValues[];
    float mMaxZoom;
    private Runnable mOnLayoutRunnable;
    protected Paint mPaint;
    protected Bitmap mPerfectFitBitmap;
    protected Matrix mSuppMatrix;
    int mThisHeight;
    int mThisWidth;
    protected Bitmap mThumbBitmap;

    static 
    {
        sNewZoomControl = false;
    }
}

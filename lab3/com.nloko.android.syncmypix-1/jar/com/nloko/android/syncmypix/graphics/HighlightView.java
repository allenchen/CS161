// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   HighlightView.java

package com.nloko.android.syncmypix.graphics;

import android.content.res.Resources;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.view.View;

public class HighlightView
{
    static final class ModifyMode extends Enum
    {

        public static ModifyMode valueOf(String s)
        {
            return (ModifyMode)Enum.valueOf(com/nloko/android/syncmypix/graphics/HighlightView$ModifyMode, s);
        }

        public static ModifyMode[] values()
        {
            return (ModifyMode[])$VALUES.clone();
        }

        private static final ModifyMode $VALUES[];
        public static final ModifyMode Grow;
        public static final ModifyMode Move;
        public static final ModifyMode None;

        static 
        {
            None = new ModifyMode("None", 0);
            Move = new ModifyMode("Move", 1);
            Grow = new ModifyMode("Grow", 2);
            ModifyMode amodifymode[] = new ModifyMode[3];
            ModifyMode modifymode = None;
            amodifymode[0] = modifymode;
            ModifyMode modifymode1 = Move;
            amodifymode[1] = modifymode1;
            ModifyMode modifymode2 = Grow;
            amodifymode[2] = modifymode2;
            $VALUES = amodifymode;
        }

        private ModifyMode(String s, int i)
        {
            super(s, i);
        }
    }


    public HighlightView(View view)
    {
        Rect rect = new Rect();
        mViewDrawingRect = rect;
        ModifyMode modifymode = ModifyMode.None;
        mMode = modifymode;
        mMaintainAspectRatio = false;
        mCircle = false;
        Paint paint = new Paint();
        mFocusPaint = paint;
        Paint paint1 = new Paint();
        mNoFocusPaint = paint1;
        Paint paint2 = new Paint();
        mOutlinePaint = paint2;
        mContext = view;
        Path path = new Path();
        mPath = path;
    }

    private Rect computeLayout()
    {
        float f = mCropRect.left;
        float f1 = mCropRect.top;
        float f2 = mCropRect.right;
        float f3 = mCropRect.bottom;
        RectF rectf = new RectF(f, f1, f2, f3);
        boolean flag = mMatrix.mapRect(rectf);
        int i = Math.round(rectf.left);
        int j = Math.round(rectf.top);
        int k = Math.round(rectf.right);
        int l = Math.round(rectf.bottom);
        return new Rect(i, j, k, l);
    }

    private void initHighlightView()
    {
        Resources resources = mContext.getResources();
        Drawable drawable = resources.getDrawable(0x7f020002);
        mResizeDrawableWidth = drawable;
        Drawable drawable1 = resources.getDrawable(0x7f020001);
        mResizeDrawableHeight = drawable1;
        Drawable drawable2 = resources.getDrawable(0x7f02000f);
        mResizeDrawableDiagonal = drawable2;
    }

    private void shift(RectF rectf, float f, float f1)
    {
        float f2 = rectf.left + f;
        rectf.left = f2;
        float f3 = rectf.right + f;
        rectf.right = f3;
        float f4 = rectf.top + f1;
        rectf.top = f4;
        float f5 = rectf.bottom + f1;
        rectf.bottom = f5;
    }

    protected void draw(Canvas canvas)
    {
        if(mHidden)
            return;
        int i = canvas.save();
        mPath.reset();
        if(!hasFocus())
        {
            mOutlinePaint.setColor(0xff000000);
            Rect rect = mDrawRect;
            Paint paint = mOutlinePaint;
            Canvas canvas1 = canvas;
            Rect rect1 = rect;
            Paint paint1 = paint;
            canvas1.drawRect(rect1, paint1);
            return;
        }
        View view = mContext;
        Rect rect2 = mViewDrawingRect;
        view.getDrawingRect(rect2);
        Path path1;
        android.graphics.Region.Op op;
        Canvas canvas2;
        Path path2;
        android.graphics.Region.Op op1;
        boolean flag;
        Rect rect3;
        Paint paint2;
        Canvas canvas3;
        Rect rect4;
        Paint paint3;
        Path path3;
        Paint paint4;
        Canvas canvas4;
        Path path4;
        Paint paint5;
        ModifyMode modifymode;
        ModifyMode modifymode1;
        ModifyMode modifymode2;
        ModifyMode modifymode3;
        if(mCircle)
        {
            float f = mDrawRect.width();
            float f1 = getPaddingLeft();
            float f2 = getPaddingRight();
            float f3 = f1 + f2;
            float f4 = f - f3;
            float f5 = mDrawRect.height();
            float f6 = getPaddingTop();
            float f7 = getPaddingBottom();
            float f8 = f6 + f7;
            float f9 = f5 - f8;
            Path path = mPath;
            float f10 = mDrawRect.left;
            float f11 = getPaddingLeft();
            float f12 = f10 + f11;
            float f13 = f4 / 2F;
            float f14 = f12 + f13;
            float f15 = mDrawRect.top;
            float f16 = getPaddingTop();
            float f17 = f15 + f16;
            float f18 = f9 / 2F;
            float f19 = f17 + f18;
            float f20 = f4 / 2F;
            android.graphics.Path.Direction direction = android.graphics.Path.Direction.CW;
            path.addCircle(f14, f19, f20, direction);
            mOutlinePaint.setColor(0xffef04d6);
        } else
        {
            Path path5 = mPath;
            Rect rect5 = mDrawRect;
            RectF rectf = new RectF(rect5);
            android.graphics.Path.Direction direction1 = android.graphics.Path.Direction.CW;
            path5.addRect(rectf, direction1);
            mOutlinePaint.setColor(35328);
        }
        path1 = mPath;
        op = android.graphics.Region.Op.DIFFERENCE;
        canvas2 = canvas;
        path2 = path1;
        op1 = op;
        flag = canvas2.clipPath(path2, op1);
        rect3 = mViewDrawingRect;
        if(hasFocus())
            paint2 = mFocusPaint;
        else
            paint2 = mNoFocusPaint;
        canvas3 = canvas;
        rect4 = rect3;
        paint3 = paint2;
        canvas3.drawRect(rect4, paint3);
        canvas.restore();
        path3 = mPath;
        paint4 = mOutlinePaint;
        canvas4 = canvas;
        path4 = path3;
        paint5 = paint4;
        canvas4.drawPath(path4, paint5);
        modifymode = mMode;
        modifymode1 = ModifyMode.Grow;
        modifymode2 = modifymode;
        modifymode3 = modifymode1;
        if(modifymode2 != modifymode3)
            return;
        if(mCircle)
        {
            int j = mResizeDrawableDiagonal.getIntrinsicWidth();
            int k = mResizeDrawableDiagonal.getIntrinsicHeight();
            double d = Math.cos(0.78539816339744828D);
            double d1 = (double)mDrawRect.width() / 2D;
            int l = (int)Math.round(d * d1);
            int i1 = mDrawRect.left;
            int j1 = mDrawRect.width() / 2;
            int k1 = i1 + j1 + l;
            int l1 = j / 2;
            int i2 = k1 - l1;
            int j2 = mDrawRect.top;
            int k2 = mDrawRect.height() / 2;
            int l2 = (j2 + k2) - l;
            int i3 = k / 2;
            int j3 = l2 - i3;
            Drawable drawable = mResizeDrawableDiagonal;
            int k3 = mResizeDrawableDiagonal.getIntrinsicWidth() + i2;
            int l3 = mResizeDrawableDiagonal.getIntrinsicHeight() + j3;
            Drawable drawable1 = drawable;
            int i4 = i2;
            int j4 = j3;
            int k4 = k3;
            int l4 = l3;
            drawable1.setBounds(i4, j4, k4, l4);
            Drawable drawable2 = mResizeDrawableDiagonal;
            Canvas canvas5 = canvas;
            drawable2.draw(canvas5);
            return;
        } else
        {
            int i5 = mDrawRect.left + 1;
            int j5 = mDrawRect.right + 1;
            int k5 = mDrawRect.top + 4;
            int l5 = mDrawRect.bottom + 3;
            int i6 = mResizeDrawableWidth.getIntrinsicWidth() / 2;
            int j6 = mResizeDrawableWidth.getIntrinsicHeight() / 2;
            int k6 = mResizeDrawableHeight.getIntrinsicHeight() / 2;
            int l6 = mResizeDrawableHeight.getIntrinsicWidth() / 2;
            int i7 = mDrawRect.left;
            int j7 = mDrawRect.right;
            int k7 = mDrawRect.left;
            int l7 = (j7 - k7) / 2;
            int i8 = i7 + l7;
            int j8 = mDrawRect.top;
            int k8 = mDrawRect.bottom;
            int l8 = mDrawRect.top;
            int i9 = (k8 - l8) / 2;
            int j9 = j8 + i9;
            Drawable drawable3 = mResizeDrawableWidth;
            int k9 = i5 - i6;
            int l9 = j9 - j6;
            int i10 = i5 + i6;
            int j10 = j9 + j6;
            drawable3.setBounds(k9, l9, i10, j10);
            Drawable drawable4 = mResizeDrawableWidth;
            Canvas canvas6 = canvas;
            drawable4.draw(canvas6);
            Drawable drawable5 = mResizeDrawableWidth;
            int k10 = j5 - i6;
            int l10 = j9 - j6;
            int i11 = j5 + i6;
            int j11 = j9 + j6;
            drawable5.setBounds(k10, l10, i11, j11);
            Drawable drawable6 = mResizeDrawableWidth;
            Canvas canvas7 = canvas;
            drawable6.draw(canvas7);
            Drawable drawable7 = mResizeDrawableHeight;
            int k11 = i8 - l6;
            int l11 = k5 - k6;
            int i12 = i8 + l6;
            int j12 = k5 + k6;
            drawable7.setBounds(k11, l11, i12, j12);
            Drawable drawable8 = mResizeDrawableHeight;
            Canvas canvas8 = canvas;
            drawable8.draw(canvas8);
            Drawable drawable9 = mResizeDrawableHeight;
            int k12 = i8 - l6;
            int l12 = l5 - k6;
            int i13 = i8 + l6;
            int j13 = l5 + k6;
            drawable9.setBounds(k12, l12, i13, j13);
            Drawable drawable10 = mResizeDrawableHeight;
            Canvas canvas9 = canvas;
            drawable10.draw(canvas9);
            return;
        }
    }

    public Rect getCropRect()
    {
        int i = (int)mCropRect.left;
        int j = (int)mCropRect.top;
        int k = (int)mCropRect.right;
        int l = (int)mCropRect.bottom;
        return new Rect(i, j, k, l);
    }

    public int getHit(float f, float f1)
    {
        Rect rect;
        byte byte0;
        rect = computeLayout();
        byte0 = 1;
        if(!mCircle) goto _L2; else goto _L1
_L1:
        float f2 = rect.centerX();
        float f3 = f - f2;
        float f4 = rect.centerY();
        float f5 = f1 - f4;
        float f6 = f3 * f3;
        float f7 = f5 * f5;
        int i = (int)Math.sqrt(f6 + f7);
        float f8 = mDrawRect.width();
        float f9 = getPaddingLeft();
        int j = (int)(f8 - f9) / 2;
        if((float)Math.abs(i - j) <= 20F)
        {
            float f10 = Math.abs(f5);
            float f11 = Math.abs(f3);
            if(f10 > f11)
            {
                if(f5 < 0F)
                    byte0 = 8;
                else
                    byte0 = 16;
            } else
            if(f3 < 0F)
                byte0 = 2;
            else
                byte0 = 4;
        } else
        if(i < j)
            byte0 = 32;
        else
            byte0 = 1;
_L6:
        return byte0;
_L2:
        float f12 = (float)rect.top - 20F;
        if(f1 < f12) goto _L4; else goto _L3
_L3:
        float f13 = (float)rect.bottom + 20F;
        if(f1 >= f13) goto _L4; else goto _L5
_L5:
        boolean flag = true;
_L7:
        boolean flag1;
        float f14 = (float)rect.left - 20F;
        if(f < f14)
            break MISSING_BLOCK_LABEL_420;
        float f15 = (float)rect.right + 20F;
        if(f >= f15)
            break MISSING_BLOCK_LABEL_420;
        flag1 = true;
_L8:
        int k;
        if(Math.abs((float)rect.left - f) < 20F && flag)
            k = 1 | 2;
        int l;
        if(Math.abs((float)rect.right - f) < 20F && flag)
            l = 1 | 4;
        int i1;
        if(Math.abs((float)rect.top - f1) < 20F && flag1)
            i1 = 1 | 8;
        int j1;
        if(Math.abs((float)rect.bottom - f1) < 20F && flag1)
            j1 = 1 | 0x10;
        if(true)
        {
            int k1 = (int)f;
            int l1 = (int)f1;
            if(rect.contains(k1, l1))
                byte0 = 32;
        }
          goto _L6
_L4:
        flag = false;
          goto _L7
        flag1 = false;
          goto _L8
    }

    public ModifyMode getMode()
    {
        return mMode;
    }

    float getPaddingBottom()
    {
        return 0F;
    }

    float getPaddingLeft()
    {
        return 0F;
    }

    float getPaddingRight()
    {
        return 0F;
    }

    float getPaddingTop()
    {
        return 0F;
    }

    void growBy(float f, float f1)
    {
        RectF rectf;
        RectF rectf1;
        float f17;
        float f18;
        float f19;
        float f23;
        float f26;
        float f27;
        float f31;
        float f32;
        Rect rect;
        if(mMaintainAspectRatio)
            if(f != 0F)
            {
                float f2 = mInitialAspectRatio;
                f1 = f / f2;
            } else
            if(f1 != 0F)
            {
                float f36 = mInitialAspectRatio;
                f = f1 * f36;
            }
        rectf = mCropRect;
        rectf1 = new RectF(rectf);
        if(f > 0F)
        {
            float f3 = rectf1.width();
            float f4 = 2F * f;
            float f5 = f3 + f4;
            float f6 = mImageRect.width();
            if(f5 > f6)
            {
                float f7 = mImageRect.width();
                float f8 = rectf1.width();
                f = (f7 - f8) / 2F;
                if(mMaintainAspectRatio)
                {
                    float f9 = mInitialAspectRatio;
                    f1 = f / f9;
                }
            }
        }
        if(f1 > 0F)
        {
            float f10 = rectf1.height();
            float f11 = 2F * f1;
            float f12 = f10 + f11;
            float f13 = mImageRect.height();
            if(f12 > f13)
            {
                float f14 = mImageRect.height();
                float f15 = rectf1.height();
                f1 = (f14 - f15) / 2F;
                if(mMaintainAspectRatio)
                {
                    float f16 = mInitialAspectRatio;
                    f = f1 * f16;
                }
            }
        }
        f17 = -f;
        f18 = -f1;
        rectf1.inset(f17, f18);
        f19 = 25F;
        if(rectf1.width() < 25F)
        {
            float f20 = rectf1.width();
            float f21 = -(25F - f20) / 2F;
            rectf1.inset(f21, 0F);
        }
        if(mMaintainAspectRatio)
        {
            float f22 = mInitialAspectRatio;
            f23 = f19 / f22;
        } else
        {
            f23 = f19;
        }
        if(rectf1.height() < f23)
        {
            float f24 = rectf1.height();
            float f25 = -(f23 - f24) / 2F;
            rectf1.inset(0F, f25);
        }
        f26 = rectf1.left;
        f27 = mImageRect.left;
        if(f26 < f27)
        {
            float f28 = mImageRect.left;
            float f29 = rectf1.left;
            float f30 = f28 - f29;
            shift(rectf1, f30, 0F);
        } else
        {
            float f37 = rectf1.right;
            float f38 = mImageRect.right;
            if(f37 > f38)
            {
                float f39 = rectf1.right;
                float f40 = mImageRect.right;
                float f41 = -(f39 - f40);
                shift(rectf1, f41, 0F);
            }
        }
        f31 = rectf1.top;
        f32 = mImageRect.top;
        if(f31 < f32)
        {
            float f33 = mImageRect.top;
            float f34 = rectf1.top;
            float f35 = f33 - f34;
            shift(rectf1, 0F, f35);
        } else
        {
            float f42 = rectf1.bottom;
            float f43 = mImageRect.bottom;
            if(f42 > f43)
            {
                float f44 = rectf1.bottom;
                float f45 = mImageRect.bottom;
                float f46 = -(f44 - f45);
                shift(rectf1, 0F, f46);
            }
        }
        mCropRect.set(rectf1);
        rect = computeLayout();
        mDrawRect = rect;
        mContext.invalidate();
    }

    void handleMotion(int i, float f, float f1)
    {
        Rect rect = computeLayout();
        if(i == 1)
            return;
        if(i == 32)
        {
            float f2 = mCropRect.width();
            float f3 = rect.width();
            float f4 = (f2 / f3) * f;
            float f5 = mCropRect.height();
            float f6 = rect.height();
            float f7 = (f5 / f6) * f1;
            moveBy(f4, f7);
            return;
        }
        if((i & 6) == 0)
            f = 0F;
        if((i & 0x18) == 0)
            f1 = 0F;
        float f8 = mCropRect.width();
        float f9 = rect.width();
        float f10 = f8 / f9;
        float f11 = f * f10;
        float f12 = mCropRect.height();
        float f13 = rect.height();
        float f14 = f12 / f13;
        float f15 = f1 * f14;
        int j;
        float f16;
        int k;
        float f17;
        if((i & 2) != 0)
            j = -1;
        else
            j = 1;
        f16 = (float)j * f11;
        if((i & 8) != 0)
            k = -1;
        else
            k = 1;
        f17 = (float)k * f15;
        growBy(f16, f17);
    }

    public boolean hasFocus()
    {
        return mIsFocused;
    }

    public void invalidate()
    {
        Rect rect = computeLayout();
        mDrawRect = rect;
    }

    public void modify(int i, long l)
    {
        float f = (float)l * 0.01F;
        float f1 = Math.min(0.1F, f);
        float f2 = Math.max(0.01F, f1);
        float f3 = mContext.getWidth();
        float f4 = f2 * f3;
        float f5 = f4;
        ModifyMode modifymode12;
        ModifyMode modifymode13;
        switch(i)
        {
        default:
            return;

        case 21: // '\025'
            ModifyMode modifymode = mMode;
            ModifyMode modifymode1 = ModifyMode.Move;
            if(modifymode == modifymode1)
            {
                float f6 = -f4;
                moveBy(f6, 0F);
                return;
            }
            ModifyMode modifymode2 = mMode;
            ModifyMode modifymode3 = ModifyMode.Grow;
            if(modifymode2 != modifymode3)
            {
                return;
            } else
            {
                float f7 = -f4;
                growBy(f7, 0F);
                return;
            }

        case 22: // '\026'
            ModifyMode modifymode4 = mMode;
            ModifyMode modifymode5 = ModifyMode.Move;
            if(modifymode4 == modifymode5)
            {
                moveBy(f4, 0F);
                return;
            }
            ModifyMode modifymode6 = mMode;
            ModifyMode modifymode7 = ModifyMode.Grow;
            if(modifymode6 != modifymode7)
            {
                return;
            } else
            {
                growBy(f4, 0F);
                return;
            }

        case 19: // '\023'
            ModifyMode modifymode8 = mMode;
            ModifyMode modifymode9 = ModifyMode.Move;
            if(modifymode8 == modifymode9)
            {
                float f8 = -f5;
                moveBy(0F, f8);
                return;
            }
            ModifyMode modifymode10 = mMode;
            ModifyMode modifymode11 = ModifyMode.Grow;
            if(modifymode10 != modifymode11)
            {
                return;
            } else
            {
                float f9 = -f5;
                growBy(0F, f9);
                return;
            }

        case 20: // '\024'
            modifymode12 = mMode;
            modifymode13 = ModifyMode.Move;
            break;
        }
        if(modifymode12 == modifymode13)
        {
            moveBy(0F, f5);
            return;
        }
        ModifyMode modifymode14 = mMode;
        ModifyMode modifymode15 = ModifyMode.Grow;
        if(modifymode14 != modifymode15)
        {
            return;
        } else
        {
            growBy(0F, f5);
            return;
        }
    }

    void moveBy(float f, float f1)
    {
        Rect rect = mDrawRect;
        Rect rect1 = new Rect(rect);
        mCropRect.offset(f, f1);
        RectF rectf = mCropRect;
        float f2 = mImageRect.left;
        float f3 = mCropRect.left;
        float f4 = f2 - f3;
        float f5 = Math.max(0F, f4);
        float f6 = mImageRect.top;
        float f7 = mCropRect.top;
        float f8 = f6 - f7;
        float f9 = Math.max(0F, f8);
        rectf.offset(f5, f9);
        RectF rectf1 = mCropRect;
        float f10 = mImageRect.right;
        float f11 = mCropRect.right;
        float f12 = f10 - f11;
        float f13 = Math.min(0F, f12);
        float f14 = mImageRect.bottom;
        float f15 = mCropRect.bottom;
        float f16 = f14 - f15;
        float f17 = Math.min(0F, f16);
        rectf1.offset(f13, f17);
        Rect rect2 = computeLayout();
        mDrawRect = rect2;
        Rect rect3 = mDrawRect;
        rect1.union(rect3);
        rect1.inset(65526, 65526);
        mContext.invalidate(rect1);
    }

    public void setFocus(boolean flag)
    {
        mIsFocused = flag;
    }

    public void setHidden(boolean flag)
    {
        mHidden = flag;
    }

    public void setMode(ModifyMode modifymode)
    {
        ModifyMode modifymode1 = mMode;
        if(modifymode == modifymode1)
        {
            return;
        } else
        {
            mMode = modifymode;
            mContext.invalidate();
            return;
        }
    }

    public void setup(Matrix matrix, Rect rect, RectF rectf, boolean flag, boolean flag1)
    {
        if(flag)
            flag1 = true;
        Matrix matrix1 = new Matrix(matrix);
        mMatrix = matrix1;
        mCropRect = rectf;
        RectF rectf1 = new RectF(rect);
        mImageRect = rectf1;
        mMaintainAspectRatio = flag1;
        mCircle = flag;
        float f = mCropRect.width();
        float f1 = mCropRect.height();
        float f2 = f / f1;
        mInitialAspectRatio = f2;
        Rect rect1 = computeLayout();
        mDrawRect = rect1;
        mFocusPaint.setARGB(125, 50, 50, 50);
        mNoFocusPaint.setARGB(125, 50, 50, 50);
        mOutlinePaint.setStrokeWidth(3F);
        Paint paint = mOutlinePaint;
        android.graphics.Paint.Style style = android.graphics.Paint.Style.STROKE;
        paint.setStyle(style);
        mOutlinePaint.setAntiAlias(true);
        ModifyMode modifymode = ModifyMode.None;
        mMode = modifymode;
        initHighlightView();
    }

    public static final int GROW_BOTTOM_EDGE = 16;
    public static final int GROW_LEFT_EDGE = 2;
    public static final int GROW_NONE = 1;
    public static final int GROW_RIGHT_EDGE = 4;
    public static final int GROW_TOP_EDGE = 8;
    public static final int MOVE = 32;
    private static final String TAG = "CropImage";
    boolean mCircle;
    View mContext;
    RectF mCropRect;
    Rect mDrawRect;
    Paint mFocusPaint;
    boolean mHidden;
    RectF mImageRect;
    float mInitialAspectRatio;
    boolean mIsFocused;
    boolean mMaintainAspectRatio;
    Matrix mMatrix;
    ModifyMode mMode;
    int mMotionMode;
    Paint mNoFocusPaint;
    Paint mOutlinePaint;
    Path mPath;
    Drawable mResizeDrawableDiagonal;
    Drawable mResizeDrawableHeight;
    Drawable mResizeDrawableWidth;
    Rect mViewDrawingRect;
}

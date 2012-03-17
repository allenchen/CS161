// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   CropImage.java

package com.nloko.android.syncmypix.graphics;

import android.content.Context;
import android.graphics.*;
import android.util.AttributeSet;
import android.view.MotionEvent;
import java.util.ArrayList;
import java.util.Iterator;

// Referenced classes of package com.nloko.android.syncmypix.graphics:
//            ImageViewTouchBase, CropImage, HighlightView

public static class mContext extends ImageViewTouchBase
{

    private void centerBasedOnHighlightView(HighlightView highlightview)
    {
        Rect rect = highlightview.mDrawRect;
        float f = rect.width();
        float f1 = rect.height();
        float f2 = getWidth();
        float f3 = getHeight();
        float f4 = (f2 / f) * 0.6F;
        float f5 = (f3 / f1) * 0.6F;
        float f6 = Math.min(f4, f5);
        float f7 = getScale();
        float f8 = f6 * f7;
        float f9 = Math.max(1F, f8);
        float f10 = getScale();
        if((double)(Math.abs(f9 - f10) / f9) > 0.10000000000000001D)
        {
            float af[] = new float[2];
            float f11 = highlightview.mCropRect.centerX();
            af[0] = f11;
            float f12 = highlightview.mCropRect.centerY();
            af[1] = f12;
            getImageMatrix().mapPoints(af);
            float f13 = af[0];
            float f14 = af[1];
            zoomTo(f9, f13, f14, 300F);
        }
        ensureVisible(highlightview);
    }

    private void ensureVisible(HighlightView highlightview)
    {
        Rect rect = highlightview.mDrawRect;
        int i = getTop();
        int j = getBottom();
        int k = getLeft();
        int l = getRight();
        int i1 = rect.left;
        int j1 = k - i1;
        int k1 = Math.max(0, j1);
        int l1 = rect.right;
        int i2 = l - l1;
        int j2 = Math.min(0, i2);
        int k2 = rect.top;
        int l2 = i - k2;
        int i3 = Math.max(0, l2);
        int j3 = rect.bottom;
        int k3 = j - j3;
        int l3 = Math.min(0, k3);
        int i4;
        int j4;
        if(k1 != 0)
            i4 = k1;
        else
            i4 = j2;
        if(i3 != 0)
            j4 = i3;
        else
            j4 = l3;
        if(i4 == 0 && j4 == 0)
        {
            return;
        } else
        {
            float f = i4;
            float f1 = j4;
            panBy(f, f1);
            return;
        }
    }

    private void recomputeFocus(MotionEvent motionevent)
    {
        int i = 0;
        do
        {
            int j = mHighlightViews.size();
            if(i >= j)
                break;
            HighlightView highlightview = (HighlightView)mHighlightViews.get(i);
            highlightview.setFocus(false);
            highlightview.invalidate();
            i++;
        } while(true);
        int k = 0;
        do
        {
label0:
            {
                int l = mHighlightViews.size();
                if(k < l)
                {
                    HighlightView highlightview1 = (HighlightView)mHighlightViews.get(k);
                    float f = motionevent.getX();
                    float f1 = motionevent.getY();
                    if(highlightview1.getHit(f, f1) == 1)
                        break label0;
                    if(!highlightview1.hasFocus())
                    {
                        highlightview1.setFocus(true);
                        highlightview1.invalidate();
                    }
                }
                invalidate();
                return;
            }
            k++;
        } while(true);
    }

    public void add(HighlightView highlightview)
    {
        boolean flag = mHighlightViews.add(highlightview);
        invalidate();
    }

    protected boolean doesScrolling()
    {
        return false;
    }

    public HighlightView get(int i)
    {
        return (HighlightView)mHighlightViews.get(i);
    }

    protected void onDraw(Canvas canvas)
    {
        super.onDraw(canvas);
        int i = 0;
        do
        {
            int j = mHighlightViews.size();
            if(i >= j)
                return;
            ((HighlightView)mHighlightViews.get(i)).draw(canvas);
            i++;
        } while(true);
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        super.onLayout(flag, i, j, k, l);
        if(mBitmapDisplayed == null)
            return;
        Iterator iterator = mHighlightViews.iterator();
        do
        {
            HighlightView highlightview;
            do
            {
                if(!iterator.hasNext())
                    return;
                highlightview = (HighlightView)iterator.next();
                Matrix matrix = highlightview.mMatrix;
                Matrix matrix1 = getImageMatrix();
                matrix.set(matrix1);
                highlightview.invalidate();
            } while(!highlightview.mIsFocused);
            centerBasedOnHighlightView(highlightview);
        } while(true);
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        CropImage cropimage = (CropImage)mContext;
        if(!CropImage.access$000(cropimage)) goto _L2; else goto _L1
_L1:
        boolean flag = false;
_L10:
        return flag;
_L2:
        motionevent.getAction();
        JVM INSTR tableswitch 0 2: default 48
    //                   0 81
    //                   1 239
    //                   2 425;
           goto _L3 _L4 _L5 _L6
_L3:
        motionevent.getAction();
        JVM INSTR tableswitch 1 2: default 76
    //                   1 547
    //                   2 557;
           goto _L7 _L8 _L9
_L7:
        flag = true;
          goto _L10
_L4:
        if(!CropImage.access$100(cropimage)) goto _L12; else goto _L11
_L11:
        recomputeFocus(motionevent);
          goto _L3
_L12:
        int i = 0;
_L16:
        int j = mHighlightViews.size();
        if(i >= j) goto _L3; else goto _L13
_L13:
        HighlightView highlightview;
        int k;
        highlightview = (HighlightView)mHighlightViews.get(i);
        float f = motionevent.getX();
        float f1 = motionevent.getY();
        k = highlightview.getHit(f, f1);
        if(k == 1) goto _L15; else goto _L14
_L14:
        mMotionEdge = k;
        mMotionHighlightView = highlightview;
        float f2 = motionevent.getX();
        mLastX = f2;
        float f3 = motionevent.getY();
        mLastY = f3;
        HighlightView highlightview1 = mMotionHighlightView;
         ;
        if(k == 32)
             = .Move;
        else
             = .Grow;
        highlightview1.setMode();
          goto _L3
_L15:
        i++;
          goto _L16
_L5:
        if(!CropImage.access$100(cropimage)) goto _L18; else goto _L17
_L17:
        i = 0;
_L23:
        int l = mHighlightViews.size();
        if(i >= l) goto _L20; else goto _L19
_L19:
        HighlightView highlightview2 = (HighlightView)mHighlightViews.get(i);
        if(!highlightview2.hasFocus()) goto _L22; else goto _L21
_L21:
        cropimage.mCrop = highlightview2;
        int i1 = 0;
        do
        {
            int j1 = mHighlightViews.size();
            if(i1 >= j1)
                break;
            if(i1 == i)
                ((HighlightView)mHighlightViews.get(i1)).setHidden(true);
            i1++;
        } while(true);
        centerBasedOnHighlightView(highlightview2);
        boolean flag1 = CropImage.access$102((CropImage)mContext, false);
        flag = true;
          goto _L10
_L22:
        i++;
          goto _L23
_L18:
        if(mMotionHighlightView != null)
        {
            HighlightView highlightview3 = mMotionHighlightView;
            centerBasedOnHighlightView(highlightview3);
            HighlightView highlightview4 = mMotionHighlightView;
             1 = .None;
            highlightview4.setMode(1);
        }
_L20:
        mMotionHighlightView = null;
          goto _L3
_L6:
        if(CropImage.access$100(cropimage))
            recomputeFocus(motionevent);
        else
        if(mMotionHighlightView != null)
        {
            HighlightView highlightview5 = mMotionHighlightView;
            int k1 = mMotionEdge;
            float f4 = motionevent.getX();
            float f5 = mLastX;
            float f6 = f4 - f5;
            float f7 = motionevent.getY();
            float f8 = mLastY;
            float f9 = f7 - f8;
            highlightview5.handleMotion(k1, f6, f9);
            float f10 = motionevent.getX();
            mLastX = f10;
            float f11 = motionevent.getY();
            mLastY = f11;
            HighlightView highlightview6 = mMotionHighlightView;
            ensureVisible(highlightview6);
        }
          goto _L3
_L8:
        center(true, true, true);
          goto _L7
_L9:
        if(getScale() == 1F)
            center(true, true, false);
          goto _L7
    }

    protected void postTranslate(float f, float f1)
    {
        super.postTranslate(f, f1);
        int i = 0;
        do
        {
            int j = mHighlightViews.size();
            if(i >= j)
                return;
            HighlightView highlightview = (HighlightView)mHighlightViews.get(i);
            boolean flag = highlightview.mMatrix.postTranslate(f, f1);
            highlightview.invalidate();
            i++;
        } while(true);
    }

    public int size()
    {
        return mHighlightViews.size();
    }

    protected boolean usePerfectFitBitmap()
    {
        return false;
    }

    protected void zoomIn()
    {
        super.zoomIn();
        Iterator iterator = mHighlightViews.iterator();
        do
        {
            if(!iterator.hasNext())
                return;
            HighlightView highlightview = (HighlightView)iterator.next();
            Matrix matrix = highlightview.mMatrix;
            Matrix matrix1 = getImageMatrix();
            matrix.set(matrix1);
            highlightview.invalidate();
        } while(true);
    }

    protected void zoomOut()
    {
        super.zoomOut();
        Iterator iterator = mHighlightViews.iterator();
        do
        {
            if(!iterator.hasNext())
                return;
            HighlightView highlightview = (HighlightView)iterator.next();
            Matrix matrix = highlightview.mMatrix;
            Matrix matrix1 = getImageMatrix();
            matrix.set(matrix1);
            highlightview.invalidate();
        } while(true);
    }

    protected void zoomTo(float f, float f1, float f2)
    {
        super.zoomTo(f, f1, f2);
        Iterator iterator = mHighlightViews.iterator();
        do
        {
            if(!iterator.hasNext())
                return;
            HighlightView highlightview = (HighlightView)iterator.next();
            Matrix matrix = highlightview.mMatrix;
            Matrix matrix1 = getImageMatrix();
            matrix.set(matrix1);
            highlightview.invalidate();
        } while(true);
    }

    Context mContext;
    ArrayList mHighlightViews;
    float mLastX;
    float mLastY;
    int mMotionEdge;
    HighlightView mMotionHighlightView;

    public (Context context)
    {
        super(context);
        ArrayList arraylist = new ArrayList();
        mHighlightViews = arraylist;
        mMotionHighlightView = null;
        mContext = context;
    }

    public mContext(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        ArrayList arraylist = new ArrayList();
        mHighlightViews = arraylist;
        mMotionHighlightView = null;
        mContext = context;
    }
}

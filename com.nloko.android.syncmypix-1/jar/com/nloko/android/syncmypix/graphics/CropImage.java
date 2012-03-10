// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   CropImage.java

package com.nloko.android.syncmypix.graphics;

import Lcom.nloko.android.syncmypix.graphics.CropImage;;
import android.app.Activity;
import android.app.ProgressDialog;
import android.content.*;
import android.graphics.*;
import android.media.FaceDetector;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.util.AttributeSet;
import android.util.Log;
import android.view.*;
import com.nloko.android.Utils;
import com.nloko.android.syncmypix.contactutils.ContactUtils;
import java.io.*;
import java.util.*;

// Referenced classes of package com.nloko.android.syncmypix.graphics:
//            HighlightView, ImageViewTouchBase

public class CropImage extends Activity
{
    public static class CropImageView extends ImageViewTouchBase
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
            if(!cropimage.mSaving) goto _L2; else goto _L1
_L1:
            boolean flag = false;
_L10:
            return flag;
_L2:
            motionevent.getAction();
            JVM INSTR tableswitch 0 2: default 48
        //                       0 81
        //                       1 239
        //                       2 425;
               goto _L3 _L4 _L5 _L6
_L3:
            motionevent.getAction();
            JVM INSTR tableswitch 1 2: default 76
        //                       1 547
        //                       2 557;
               goto _L7 _L8 _L9
_L7:
            flag = true;
              goto _L10
_L4:
            if(!cropimage.mWaitingToPick) goto _L12; else goto _L11
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
            HighlightView.ModifyMode modifymode;
            if(k == 32)
                modifymode = HighlightView.ModifyMode.Move;
            else
                modifymode = HighlightView.ModifyMode.Grow;
            highlightview1.setMode(modifymode);
              goto _L3
_L15:
            i++;
              goto _L16
_L5:
            if(!cropimage.mWaitingToPick) goto _L18; else goto _L17
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
            boolean flag1 = ((CropImage)mContext).mWaitingToPick = false;
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
                HighlightView.ModifyMode modifymode1 = HighlightView.ModifyMode.None;
                highlightview4.setMode(modifymode1);
            }
_L20:
            mMotionHighlightView = null;
              goto _L3
_L6:
            if(cropimage.mWaitingToPick)
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

        public CropImageView(Context context)
        {
            super(context);
            ArrayList arraylist = new ArrayList();
            mHighlightViews = arraylist;
            mMotionHighlightView = null;
            mContext = context;
        }

        public CropImageView(Context context, AttributeSet attributeset)
        {
            super(context, attributeset);
            ArrayList arraylist = new ArrayList();
            mHighlightViews = arraylist;
            mMotionHighlightView = null;
            mContext = context;
        }
    }


    public CropImage()
    {
        mFaceDetectionDialog = null;
        mSavingProgressDialog = null;
        android.graphics.Bitmap.CompressFormat compressformat = android.graphics.Bitmap.CompressFormat.JPEG;
        mSaveFormat = compressformat;
        mSaveUri = null;
        mDoFaceDetection = true;
        mCircleCrop = false;
        mScaleUp = true;
        Handler handler = new Handler();
        mHandler = handler;
        Runnable runnable = new Runnable() {

            private void handleFace(android.media.FaceDetector.Face face)
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
                boolean flag = mCircleCrop;
                boolean flag1;
                if(mAspectX != 0 && mAspectY != 0)
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
                if(mAspectX != 0 && mAspectY != 0)
                {
                    int i1 = mAspectX;
                    int j1 = mAspectY;
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
                        int k1 = mAspectY * k;
                        int l1 = mAspectX;
                        l = k1 / l1;
                    } else
                    {
                        int k2 = mAspectX * l;
                        int l2 = mAspectY;
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
                flag = mCircleCrop;
                if(mAspectX != 0 && mAspectY != 0)
                    flag1 = true;
                else
                    flag1 = false;
                highlightview.setup(matrix, rect, rectf, flag, flag1);
                mImageView.add(highlightview);
            }

            private HighlightView makeHighlightView()
            {
                CropImageView cropimageview = mImageView;
                return new HighlightView(cropimageview);
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
                if(bitmap != null && mDoFaceDetection)
                {
                    int i = bitmap.getWidth();
                    int j = bitmap.getHeight();
                    int k = mFaces.length;
                    FaceDetector facedetector = new FaceDetector(i, j, k);
                    android.media.FaceDetector.Face aface[] = mFaces;
                    int l = facedetector.findFaces(bitmap, aface);
                    mNumFaces = l;
                }
                Handler handler1 = mHandler;
                Runnable runnable1 = new Runnable() {

                    public void run()
                    {
                        CropImage cropimage = _fld0;
                        boolean flag1;
                        boolean flag2;
                        if(mNumFaces > 1)
                            flag1 = true;
                        else
                            flag1 = false;
                        flag2 = cropimage.mWaitingToPick = flag1;
                        if(mNumFaces > 0)
                        {
                            int i1 = 0;
                            do
                            {
                                int j1 = mNumFaces;
                                if(i1 >= j1)
                                    break;
                                _cls4 _lcls4 = _cls4.this;
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
                            CropImage cropimage1 = _fld0;
                            HighlightView highlightview = (HighlightView)mImageView.mHighlightViews.get(0);
                            cropimage1.mCrop = highlightview;
                            mCrop.setFocus(true);
                        }
                        closeProgressDialog();
                        if(mNumFaces <= 1)
                            return;
                        else
                            return;
                    }

                    final _cls4 this$1;

                    
                    {
                        this$1 = _cls4.this;
                        super();
                    }
                };
                boolean flag = handler1.post(runnable1);
            }

            android.media.FaceDetector.Face mFaces[];
            Matrix mImageMatrix;
            int mNumFaces;
            float mScale;
            RectF mUnion;
            final CropImage this$0;



            
            {
                this$0 = CropImage.this;
                super();
                mScale = 1F;
                mUnion = null;
                android.media.FaceDetector.Face aface[] = new android.media.FaceDetector.Face[3];
                mFaces = aface;
            }
        };
        mRunFaceDetection = runnable;
    }

    /**
     * @deprecated Method closeProgressDialog is deprecated
     */

    private void closeProgressDialog()
    {
        this;
        JVM INSTR monitorenter ;
        if(mFaceDetectionDialog != null)
        {
            mFaceDetectionDialog.dismiss();
            mFaceDetectionDialog = null;
        }
        if(mSavingProgressDialog != null)
        {
            mSavingProgressDialog.dismiss();
            mSavingProgressDialog = null;
        }
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    private void fillCanvas(int i, int j, Canvas canvas)
    {
        Paint paint = new Paint();
        paint.setColor(0);
        android.graphics.Paint.Style style = android.graphics.Paint.Style.FILL;
        paint.setStyle(style);
        paint.setAntiAlias(true);
        android.graphics.PorterDuff.Mode mode = android.graphics.PorterDuff.Mode.CLEAR;
        PorterDuffXfermode porterduffxfermode = new PorterDuffXfermode(mode);
        android.graphics.Xfermode xfermode = paint.setXfermode(porterduffxfermode);
        float f = i;
        float f1 = j;
        Canvas canvas1 = canvas;
        float f2 = 0F;
        canvas1.drawRect(0F, f2, f, f1, paint);
    }

    protected void finalize()
        throws Throwable
    {
        super.finalize();
        int i = Log.d("CropImage", "FINALIZED");
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        ContentResolver contentresolver = getContentResolver();
        mContentResolver = contentresolver;
        boolean flag = requestWindowFeature(1);
        setContentView(0x7f030001);
        CropImageView cropimageview = (CropImageView)findViewById(0x7f070008);
        mImageView = cropimageview;
        View view;
        android.view.View.OnClickListener onclicklistener;
        View view1;
        android.view.View.OnClickListener onclicklistener1;
        try
        {
            Intent intent = getIntent();
            Bundle bundle1 = intent.getExtras();
            if(bundle1 != null)
            {
                String s;
                for(Iterator iterator = bundle1.keySet().iterator(); iterator.hasNext();)
                    s = (String)iterator.next();

                if(bundle1.getString("circleCrop") != null)
                {
                    mCircleCrop = true;
                    mAspectX = 1;
                    mAspectY = 1;
                }
                Uri uri = (Uri)bundle1.getParcelable("output");
                mSaveUri = uri;
                if(mSaveUri != null)
                {
                    String s1 = bundle1.getString("outputFormat");
                    if(s1 != null)
                    {
                        android.graphics.Bitmap.CompressFormat compressformat = android.graphics.Bitmap.CompressFormat.valueOf(s1);
                        mSaveFormat = compressformat;
                    }
                }
                Bitmap bitmap = (Bitmap)bundle1.getParcelable("data");
                mBitmap = bitmap;
                int i = bundle1.getInt("aspectX");
                mAspectX = i;
                int j = bundle1.getInt("aspectY");
                mAspectY = j;
                int k = bundle1.getInt("outputX");
                mOutputX = k;
                int l = bundle1.getInt("outputY");
                mOutputY = l;
                boolean flag1 = bundle1.getBoolean("scale", true);
                mScale = flag1;
                boolean flag2 = bundle1.getBoolean("scaleUpIfNeeded", true);
                mScaleUp = flag2;
                boolean flag3;
                List list;
                int i1;
                String s2;
                ContactUtils contactutils;
                ContentResolver contentresolver1;
                Bitmap bitmap1;
                if(bundle1.containsKey("noFaceDetection"))
                {
                    if(!bundle1.getBoolean("noFaceDetection"))
                        flag3 = true;
                    else
                        flag3 = false;
                } else
                {
                    flag3 = true;
                }
                mDoFaceDetection = flag3;
            }
            if(mBitmap == null)
            {
                list = intent.getData().getPathSegments();
                i1 = list.size() - 1;
                s2 = (String)list.get(i1);
                contactutils = new ContactUtils();
                contentresolver1 = mContentResolver;
                bitmap1 = BitmapFactory.decodeStream(contactutils.getPhoto(contentresolver1, s2));
                mBitmap = bitmap1;
            }
            if(mBitmap == null)
            {
                finish();
                return;
            }
            Handler handler = mHandler;
            Runnable runnable = new Runnable() {

                public void run()
                {
                    if(isFinishing())
                        return;
                    CropImage cropimage = CropImage.this;
                    ProgressDialog progressdialog = ProgressDialog.show(CropImage.this, null, "Running", true, false);
                    ProgressDialog progressdialog1 = cropimage.mFaceDetectionDialog = progressdialog;
                    CropImageView cropimageview1 = mImageView;
                    Bitmap bitmap2 = mBitmap;
                    cropimageview1.setImageBitmapResetBase(bitmap2, true, true);
                    if(mImageView.getScale() == 1F)
                        mImageView.center(true, true, false);
                    Runnable runnable1 = new Runnable() {

                        public void run()
                        {
                            final Bitmap b;
                            Handler handler1;
                            Runnable runnable2;
                            boolean flag5;
                            if(mImage != null)
                                b = null;
                            else
                                b = mBitmap;
                            handler1 = mHandler;
                            runnable2 = new Runnable() {

                                public void run()
                                {
                                    Bitmap bitmap3 = b;
                                    Bitmap bitmap4 = mBitmap;
                                    if(bitmap3 != bitmap4 && b != null)
                                    {
                                        CropImage cropimage1 = _fld0;
                                        Bitmap bitmap5 = b;
                                        cropimage1.mBitmap = bitmap5;
                                        CropImageView cropimageview2 = mImageView;
                                        Bitmap bitmap6 = b;
                                        cropimageview2.setImageBitmapResetBase(bitmap6, true, false);
                                    }
                                    if(mImageView.getScale() == 1F)
                                        mImageView.center(true, true, false);
                                    Runnable runnable3 = mRunFaceDetection;
                                    (new Thread(runnable3)).start();
                                }

                                final _cls1 this$2;
                                final Bitmap val$b;

                        
                        {
                            this$2 = _cls1.this;
                            b = bitmap;
                            super();
                        }
                            };
                            flag5 = handler1.post(runnable2);
                        }

                        final _cls1 this$1;

                    
                    {
                        this$1 = _cls1.this;
                        super();
                    }
                    };
                    (new Thread(runnable1)).start();
                }

                final CropImage this$0;

            
            {
                this$0 = CropImage.this;
                super();
            }
            };
            boolean flag4 = handler.postDelayed(runnable, 100L);
        }
        catch(Exception exception)
        {
            int j1 = Log.e("CropImage", "Failed to load bitmap", exception);
            finish();
        }
        view = findViewById(0x7f07000a);
        onclicklistener = new android.view.View.OnClickListener() {

            public void onClick(View view2)
            {
                setResult(0);
                finish();
            }

            final CropImage this$0;

            
            {
                this$0 = CropImage.this;
                super();
            }
        };
        view.setOnClickListener(onclicklistener);
        view1 = findViewById(0x7f070009);
        onclicklistener1 = new android.view.View.OnClickListener() {

            public void onClick(View view2)
            {
label0:
                {
                    boolean flag5 = mSaving = true;
                    if(mCroppedImage == null)
                    {
                        if(mCrop == null)
                            return;
                        Rect rect = mCrop.getCropRect();
                        int k1 = rect.width();
                        int l1 = rect.height();
                        CropImage cropimage = CropImage.this;
                        android.graphics.Bitmap.Config config;
                        int i2;
                        int j2;
                        android.graphics.Bitmap.Config config1;
                        Bitmap bitmap2;
                        Canvas canvas;
                        Bitmap bitmap3;
                        Canvas canvas1;
                        Bitmap bitmap4;
                        Bitmap bitmap5;
                        Rect rect1;
                        Rect rect2;
                        int k2;
                        int l2;
                        int i3;
                        int j3;
                        Canvas canvas2;
                        Bitmap bitmap6;
                        Rect rect3;
                        Rect rect4;
                        Paint paint;
                        CropImage cropimage2;
                        Bitmap bitmap9;
                        int i4;
                        int j4;
                        Bitmap bitmap10;
                        Bundle bundle2;
                        Bundle bundle3;
                        String s3;
                        Bundle bundle4;
                        String s4;
                        Bundle bundle5;
                        Bitmap bitmap11;
                        Bundle bundle6;
                        String s5;
                        Bitmap bitmap12;
                        CropImage cropimage3;
                        Intent intent1;
                        Bundle bundle7;
                        Intent intent2;
                        if(mCircleCrop)
                            config = android.graphics.Bitmap.Config.ARGB_8888;
                        else
                            config = android.graphics.Bitmap.Config.RGB_565;
                        i2 = k1;
                        j2 = l1;
                        config1 = config;
                        bitmap2 = Bitmap.createBitmap(i2, j2, config1);
                        cropimage.mCroppedImage = bitmap2;
                        canvas = JVM INSTR new #71  <Class Canvas>;
                        bitmap3 = mCroppedImage;
                        canvas1 = canvas;
                        bitmap4 = bitmap3;
                        canvas1.Canvas(bitmap4);
                        bitmap5 = mBitmap;
                        rect1 = JVM INSTR new #46  <Class Rect>;
                        rect2 = rect1;
                        k2 = 0;
                        l2 = 0;
                        i3 = k1;
                        j3 = l1;
                        rect2.Rect(k2, l2, i3, j3);
                        canvas2 = canvas;
                        bitmap6 = bitmap5;
                        rect3 = rect;
                        rect4 = rect1;
                        paint = null;
                        canvas2.drawBitmap(bitmap6, rect3, rect4, paint);
                        if(mCircleCrop)
                        {
                            Canvas canvas3 = JVM INSTR new #71  <Class Canvas>;
                            Bitmap bitmap7 = mCroppedImage;
                            Canvas canvas4 = canvas3;
                            Bitmap bitmap8 = bitmap7;
                            canvas4.Canvas(bitmap8);
                            Path path = new Path();
                            float f = (float)k1 / 2F;
                            float f1 = (float)l1 / 2F;
                            float f2 = (float)k1 / 2F;
                            android.graphics.Path.Direction direction = android.graphics.Path.Direction.CW;
                            Path path1 = path;
                            float f3 = f;
                            float f4 = f1;
                            float f5 = f2;
                            android.graphics.Path.Direction direction1 = direction;
                            path1.addCircle(f3, f4, f5, direction1);
                            android.graphics.Region.Op op = android.graphics.Region.Op.DIFFERENCE;
                            Canvas canvas5 = canvas3;
                            Path path2 = path;
                            android.graphics.Region.Op op1 = op;
                            boolean flag6 = canvas5.clipPath(path2, op1);
                            CropImage cropimage1 = CropImage.this;
                            int k3 = k1;
                            int l3 = l1;
                            Canvas canvas6 = canvas3;
                            cropimage1.fillCanvas(k3, l3, canvas6);
                        }
                    }
                    if(mOutputX != 0 && mOutputY != 0)
                        if(mScale)
                        {
                            cropimage2 = CropImage.this;
                            bitmap9 = mCroppedImage;
                            i4 = mOutputY;
                            j4 = mOutputX;
                            bitmap10 = Utils.resize(bitmap9, i4, j4);
                            cropimage2.mCroppedImage = bitmap10;
                        } else
                        {
                            int k4 = mOutputX;
                            int l4 = mOutputY;
                            android.graphics.Bitmap.Config config2 = android.graphics.Bitmap.Config.RGB_565;
                            Bitmap bitmap13 = Bitmap.createBitmap(k4, l4, config2);
                            Canvas canvas7 = new Canvas(bitmap13);
                            Rect rect5 = mCrop.getCropRect();
                            int i5 = mOutputX / 2;
                            int j5 = rect5.width() / 2;
                            int k5 = i5 - j5;
                            int l5 = mOutputY / 2;
                            int i6 = rect5.width() / 2;
                            int j6 = l5 - i6;
                            Bitmap bitmap14 = mBitmap;
                            Rect rect6 = JVM INSTR new #46  <Class Rect>;
                            int k6 = rect5.width() + k5;
                            int l6 = rect5.height() + j6;
                            Rect rect7 = rect6;
                            int i7 = k5;
                            int j7 = j6;
                            int k7 = k6;
                            int l7 = l6;
                            rect7.Rect(i7, j7, k7, l7);
                            Canvas canvas8 = canvas7;
                            Bitmap bitmap15 = bitmap14;
                            Rect rect8 = rect5;
                            Rect rect9 = rect6;
                            Paint paint1 = null;
                            canvas8.drawBitmap(bitmap15, rect8, rect9, paint1);
                            CropImage cropimage4 = CropImage.this;
                            Bitmap bitmap16 = bitmap13;
                            cropimage4.mCroppedImage = bitmap16;
                        }
                    bundle2 = getIntent().getExtras();
                    if(bundle2 == null)
                        break label0;
                    bundle3 = bundle2;
                    s3 = "data";
                    if(bundle3.getParcelable(s3) == null)
                    {
                        bundle4 = bundle2;
                        s4 = "return-data";
                        if(!bundle4.getBoolean(s4))
                            break label0;
                    }
                    bundle5 = new Bundle();
                    bitmap11 = mCroppedImage;
                    bundle6 = bundle5;
                    s5 = "data";
                    bitmap12 = bitmap11;
                    bundle6.putParcelable(s5, bitmap12);
                    cropimage3 = CropImage.this;
                    intent1 = (new Intent()).setAction("inline-data");
                    bundle7 = bundle5;
                    intent2 = intent1.putExtras(bundle7);
                    cropimage3.setResult(65535, intent2);
                    finish();
                    return;
                }
                if(!isFinishing())
                {
                    CropImage cropimage5 = CropImage.this;
                    ProgressDialog progressdialog = ProgressDialog.show(CropImage.this, null, "Saving", true, true);
                    ProgressDialog progressdialog1 = cropimage5.mSavingProgressDialog = progressdialog;
                }
                Runnable runnable1 = JVM INSTR new #8   <Class CropImage$3$1>;
                Runnable runnable2 = runnable1;
                _cls3 _lcls3 = this;
                runnable2._lcls3. _cls1();
                (new Thread(runnable1)).start();
            }

            final CropImage this$0;

            
            {
                this$0 = CropImage.this;
                super();
            }

            // Unreferenced inner class com/nloko/android/syncmypix/graphics/CropImage$3$1

/* anonymous class */
        class _cls1
            implements Runnable
        {

            public void run()
            {
                Object obj;
                if(mSaveUri == null)
                    break MISSING_BLOCK_LABEL_284;
                obj = null;
                String s3 = mSaveUri.getScheme();
                if(!s3.equals("file")) goto _L2; else goto _L1
_L1:
                String s4 = mSaveUri.toString();
                int k1 = s3.length();
                int l1 = ":/".length();
                int i2 = k1 + l1;
                String s5 = s4.substring(i2);
                obj = new FileOutputStream(s5);
_L3:
                if(obj != null)
                {
                    Bitmap bitmap2 = mCroppedImage;
                    android.graphics.Bitmap.CompressFormat compressformat1 = mSaveFormat;
                    boolean flag5 = bitmap2.compress(compressformat1, 75, ((OutputStream) (obj)));
                }
                Bundle bundle2;
                CropImage cropimage;
                Intent intent1;
                String s6;
                Intent intent2;
                if(obj != null)
                    try
                    {
                        ((OutputStream) (obj)).close();
                    }
                    catch(IOException ioexception2) { }
                bundle2 = new Bundle();
                cropimage = _fld0;
                intent1 = new Intent();
                s6 = mSaveUri.toString();
                intent2 = intent1.setAction(s6).putExtras(bundle2);
                cropimage.setResult(-1, intent2);
_L4:
                finish();
                return;
_L2:
                OutputStream outputstream;
                try
                {
                    ContentResolver contentresolver2 = mContentResolver;
                    Uri uri1 = mSaveUri;
                    outputstream = contentresolver2.openOutputStream(uri1);
                }
                catch(IOException ioexception)
                {
                    if(obj != null)
                        try
                        {
                            ((OutputStream) (obj)).close();
                        }
                        catch(IOException ioexception1) { }
                    break MISSING_BLOCK_LABEL_138;
                }
                finally
                {
                    Bundle bundle3;
                    String s7;
                    if(obj != null)
                        try
                        {
                            ((OutputStream) (obj)).close();
                        }
                        catch(IOException ioexception3) { }
                    throw exception1;
                }
                obj = outputstream;
                  goto _L3
                bundle3 = new Bundle();
                s7 = mCrop.getCropRect().toString();
                bundle3.putString("rect", s7);
                  goto _L4
            }

            final _cls3 this$1;

                    
                    {
                        this$1 = _cls3.this;
                        super();
                    }
        }

        };
        view1.setOnClickListener(onclicklistener1);
    }

    public boolean onCreateOptionsMenu(Menu menu)
    {
        return super.onCreateOptionsMenu(menu);
    }

    protected void onDestroy()
    {
        super.onDestroy();
        int i = Log.d("CropImage", "onDestroy");
    }

    public void onResume()
    {
        super.onResume();
    }

    public void onStop()
    {
        closeProgressDialog();
        super.onStop();
    }

    private static final String TAG = "CropImage";
    private int mAspectX;
    private int mAspectY;
    Bitmap mBitmap;
    private boolean mCircleCrop;
    ContentResolver mContentResolver;
    HighlightView mCrop;
    Bitmap mCroppedImage;
    private boolean mDoFaceDetection;
    private ProgressDialog mFaceDetectionDialog;
    Handler mHandler;
    Object mImage;
    CropImageView mImageView;
    private int mOutputX;
    private int mOutputY;
    Runnable mRunFaceDetection;
    private android.graphics.Bitmap.CompressFormat mSaveFormat;
    private Uri mSaveUri;
    private boolean mSaving;
    private ProgressDialog mSavingProgressDialog;
    private boolean mScale;
    private boolean mScaleUp;
    private boolean mWaitingToPick;



/*
    static boolean access$002(CropImage cropimage, boolean flag)
    {
        cropimage.mSaving = flag;
        return flag;
    }

*/




/*
    static boolean access$102(CropImage cropimage, boolean flag)
    {
        cropimage.mWaitingToPick = flag;
        return flag;
    }

*/






/*
    static ProgressDialog access$202(CropImage cropimage, ProgressDialog progressdialog)
    {
        cropimage.mFaceDetectionDialog = progressdialog;
        return progressdialog;
    }

*/







/*
    static ProgressDialog access$802(CropImage cropimage, ProgressDialog progressdialog)
    {
        cropimage.mSavingProgressDialog = progressdialog;
        return progressdialog;
    }

*/

}

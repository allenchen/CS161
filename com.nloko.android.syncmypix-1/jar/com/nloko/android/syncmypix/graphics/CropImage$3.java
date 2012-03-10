// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   CropImage.java

package com.nloko.android.syncmypix.graphics;

import Lcom.nloko.android.syncmypix.graphics.CropImage;;
import android.app.ProgressDialog;
import android.content.ContentResolver;
import android.content.Intent;
import android.graphics.*;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import com.nloko.android.Utils;
import java.io.*;

// Referenced classes of package com.nloko.android.syncmypix.graphics:
//            CropImage, HighlightView

class this._cls0
    implements android.view.Listener
{

    public void onClick(View view)
    {
label0:
        {
            boolean flag = CropImage.access$002(CropImage.this, true);
            if(mCroppedImage == null)
            {
                if(mCrop == null)
                    return;
                Rect rect = mCrop.getCropRect();
                int i = rect.width();
                int j = rect.height();
                CropImage cropimage = CropImage.this;
                android.graphics.g g;
                int k;
                int l;
                android.graphics.g g1;
                Bitmap bitmap;
                Canvas canvas;
                Bitmap bitmap1;
                Canvas canvas1;
                Bitmap bitmap2;
                Bitmap bitmap3;
                Rect rect1;
                Rect rect2;
                int i1;
                int j1;
                int k1;
                int l1;
                Canvas canvas2;
                Bitmap bitmap4;
                Rect rect3;
                Rect rect4;
                android.graphics.Paint paint;
                CropImage cropimage2;
                Bitmap bitmap7;
                int k2;
                int l2;
                Bitmap bitmap8;
                Bundle bundle;
                Bundle bundle1;
                String s;
                Bundle bundle2;
                String s1;
                Bundle bundle3;
                Bitmap bitmap9;
                Bundle bundle4;
                String s2;
                Bitmap bitmap10;
                CropImage cropimage3;
                Intent intent;
                Bundle bundle5;
                Intent intent1;
                if(CropImage.access$300(CropImage.this))
                    g = android.graphics.g.ARGB_8888;
                else
                    g = android.graphics.g.RGB_565;
                k = i;
                l = j;
                g1 = g;
                bitmap = Bitmap.createBitmap(k, l, g1);
                cropimage.mCroppedImage = bitmap;
                canvas = JVM INSTR new #71  <Class Canvas>;
                bitmap1 = mCroppedImage;
                canvas1 = canvas;
                bitmap2 = bitmap1;
                canvas1.Canvas(bitmap2);
                bitmap3 = mBitmap;
                rect1 = JVM INSTR new #46  <Class Rect>;
                rect2 = rect1;
                i1 = 0;
                j1 = 0;
                k1 = i;
                l1 = j;
                rect2.Rect(i1, j1, k1, l1);
                canvas2 = canvas;
                bitmap4 = bitmap3;
                rect3 = rect;
                rect4 = rect1;
                paint = null;
                canvas2.drawBitmap(bitmap4, rect3, rect4, paint);
                if(CropImage.access$300(CropImage.this))
                {
                    Canvas canvas3 = JVM INSTR new #71  <Class Canvas>;
                    Bitmap bitmap5 = mCroppedImage;
                    Canvas canvas4 = canvas3;
                    Bitmap bitmap6 = bitmap5;
                    canvas4.Canvas(bitmap6);
                    Path path = new Path();
                    float f = (float)i / 2F;
                    float f1 = (float)j / 2F;
                    float f2 = (float)i / 2F;
                    android.graphics.on on = android.graphics.on.CW;
                    Path path1 = path;
                    float f3 = f;
                    float f4 = f1;
                    float f5 = f2;
                    android.graphics.on on1 = on;
                    path1.addCircle(f3, f4, f5, on1);
                    android.graphics.on on2 = android.graphics.FFERENCE;
                    Canvas canvas5 = canvas3;
                    Path path2 = path;
                    android.graphics.on on3 = on2;
                    boolean flag1 = canvas5.clipPath(path2, on3);
                    CropImage cropimage1 = CropImage.this;
                    int i2 = i;
                    int j2 = j;
                    Canvas canvas6 = canvas3;
                    CropImage.access$400(cropimage1, i2, j2, canvas6);
                }
            }
            if(CropImage.access$500(CropImage.this) != 0 && CropImage.access$600(CropImage.this) != 0)
                if(CropImage.access$700(CropImage.this))
                {
                    cropimage2 = CropImage.this;
                    bitmap7 = mCroppedImage;
                    k2 = CropImage.access$600(CropImage.this);
                    l2 = CropImage.access$500(CropImage.this);
                    bitmap8 = Utils.resize(bitmap7, k2, l2);
                    cropimage2.mCroppedImage = bitmap8;
                } else
                {
                    int i3 = CropImage.access$500(CropImage.this);
                    int j3 = CropImage.access$600(CropImage.this);
                    android.graphics.g g2 = android.graphics.g.RGB_565;
                    Bitmap bitmap11 = Bitmap.createBitmap(i3, j3, g2);
                    Canvas canvas7 = new Canvas(bitmap11);
                    Rect rect5 = mCrop.getCropRect();
                    int k3 = CropImage.access$500(CropImage.this) / 2;
                    int l3 = rect5.width() / 2;
                    int i4 = k3 - l3;
                    int j4 = CropImage.access$600(CropImage.this) / 2;
                    int k4 = rect5.width() / 2;
                    int l4 = j4 - k4;
                    Bitmap bitmap12 = mBitmap;
                    Rect rect6 = JVM INSTR new #46  <Class Rect>;
                    int i5 = rect5.width() + i4;
                    int j5 = rect5.height() + l4;
                    Rect rect7 = rect6;
                    int k5 = i4;
                    int l5 = l4;
                    int i6 = i5;
                    int j6 = j5;
                    rect7.Rect(k5, l5, i6, j6);
                    Canvas canvas8 = canvas7;
                    Bitmap bitmap13 = bitmap12;
                    Rect rect8 = rect5;
                    Rect rect9 = rect6;
                    android.graphics.Paint paint1 = null;
                    canvas8.drawBitmap(bitmap13, rect8, rect9, paint1);
                    CropImage cropimage4 = CropImage.this;
                    Bitmap bitmap14 = bitmap11;
                    cropimage4.mCroppedImage = bitmap14;
                }
            bundle = getIntent().getExtras();
            if(bundle == null)
                break label0;
            bundle1 = bundle;
            s = "data";
            if(bundle1.getParcelable(s) == null)
            {
                bundle2 = bundle;
                s1 = "return-data";
                if(!bundle2.getBoolean(s1))
                    break label0;
            }
            bundle3 = new Bundle();
            bitmap9 = mCroppedImage;
            bundle4 = bundle3;
            s2 = "data";
            bitmap10 = bitmap9;
            bundle4.putParcelable(s2, bitmap10);
            cropimage3 = CropImage.this;
            intent = (new Intent()).setAction("inline-data");
            bundle5 = bundle3;
            intent1 = intent.putExtras(bundle5);
            cropimage3.setResult(65535, intent1);
            finish();
            return;
        }
        if(!isFinishing())
        {
            CropImage cropimage5 = CropImage.this;
            ProgressDialog progressdialog = ProgressDialog.show(CropImage.this, null, "Saving", true, true);
            ProgressDialog progressdialog1 = CropImage.access$802(cropimage5, progressdialog);
        }
        Runnable runnable = JVM INSTR new #8   <Class CropImage$3$1>;
        Runnable runnable1 = runnable;
        this._cls0 _lcls0 = this;
        runnable1._lcls0. _cls1();
        (new Thread(runnable)).start();
    }

    final CropImage this$0;

    _cls1.this._cls1()
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
            if(CropImage.access$900(this$0) == null)
                break MISSING_BLOCK_LABEL_284;
            obj = null;
            String s = CropImage.access$900(this$0).getScheme();
            if(!s.equals("file")) goto _L2; else goto _L1
_L1:
            String s1 = CropImage.access$900(this$0).toString();
            int i = s.length();
            int j = ":/".length();
            int k = i + j;
            String s2 = s1.substring(k);
            obj = new FileOutputStream(s2);
_L3:
            if(obj != null)
            {
                Bitmap bitmap = mCroppedImage;
                android.graphics.Bitmap.CompressFormat compressformat = CropImage.access$1000(this$0);
                boolean flag = bitmap.compress(compressformat, 75, ((OutputStream) (obj)));
            }
            Bundle bundle;
            CropImage cropimage;
            Intent intent;
            String s3;
            Intent intent1;
            if(obj != null)
                try
                {
                    ((OutputStream) (obj)).close();
                }
                catch(IOException ioexception2) { }
            bundle = new Bundle();
            cropimage = this$0;
            intent = new Intent();
            s3 = CropImage.access$900(this$0).toString();
            intent1 = intent.setAction(s3).putExtras(bundle);
            cropimage.setResult(-1, intent1);
_L4:
            finish();
            return;
_L2:
            OutputStream outputstream;
            try
            {
                ContentResolver contentresolver = mContentResolver;
                Uri uri = CropImage.access$900(this$0);
                outputstream = contentresolver.openOutputStream(uri);
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
                Bundle bundle1;
                String s4;
                if(obj != null)
                    try
                    {
                        ((OutputStream) (obj)).close();
                    }
                    catch(IOException ioexception3) { }
                throw exception;
            }
            obj = outputstream;
              goto _L3
            bundle1 = new Bundle();
            s4 = mCrop.getCropRect().toString();
            bundle1.putString("rect", s4);
              goto _L4
        }

        final CropImage._cls3 this$1;

            
            {
                this$1 = CropImage._cls3.this;
                super();
            }
    }

}

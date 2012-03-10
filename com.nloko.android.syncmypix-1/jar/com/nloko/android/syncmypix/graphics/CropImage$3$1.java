// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   CropImage.java

package com.nloko.android.syncmypix.graphics;

import android.content.ContentResolver;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.net.Uri;
import android.os.Bundle;
import java.io.*;

// Referenced classes of package com.nloko.android.syncmypix.graphics:
//            CropImage, HighlightView

class this._cls1
    implements Runnable
{

    public void run()
    {
        Object obj;
        if(CropImage.access$900(_fld0) == null)
            break MISSING_BLOCK_LABEL_284;
        obj = null;
        String s = CropImage.access$900(_fld0).getScheme();
        if(!s.equals("file")) goto _L2; else goto _L1
_L1:
        String s1 = CropImage.access$900(_fld0).toString();
        int i = s.length();
        int j = ":/".length();
        int k = i + j;
        String s2 = s1.substring(k);
        obj = new FileOutputStream(s2);
_L3:
        if(obj != null)
        {
            Bitmap bitmap = mCroppedImage;
            android.graphics.sFormat sformat = CropImage.access$1000(_fld0);
            boolean flag = bitmap.compress(sformat, 75, ((OutputStream) (obj)));
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
        cropimage = _fld0;
        intent = new Intent();
        s3 = CropImage.access$900(_fld0).toString();
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
            Uri uri = CropImage.access$900(_fld0);
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

    final getCropRect this$1;

    ()
    {
        this$1 = this._cls1.this;
        super();
    }
}

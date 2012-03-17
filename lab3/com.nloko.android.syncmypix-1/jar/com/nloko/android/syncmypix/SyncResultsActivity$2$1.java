// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncResultsActivity.java

package com.nloko.android.syncmypix;

import android.widget.*;
import com.nloko.android.ThumbnailCache;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncResultsActivity

class val.url
    implements Runnable
{

    public void run()
    {
        if(SyncResultsActivity.access$100(_fld0) == null)
            return;
        if(SyncResultsActivity.access$200(_fld0) != null && val$image != null)
        {
            ImageView imageview = val$image;
            ThumbnailCache thumbnailcache = SyncResultsActivity.access$200(_fld0);
            String s = val$url;
            android.graphics.Bitmap bitmap = thumbnailcache.get(s);
            imageview.setImageBitmap(bitmap);
        } else
        {
            ((SimpleCursorAdapter)SyncResultsActivity.access$100(_fld0).getAdapter()).notifyDataSetChanged();
        }
        SyncResultsActivity.access$100(_fld0).invalidateViews();
    }

    final is._cls0 this$1;
    final ImageView val$image;
    final String val$url;

    _cls9()
    {
        this$1 = final__pcls9;
        val$image = imageview;
        val$url = String.this;
        super();
    }
}

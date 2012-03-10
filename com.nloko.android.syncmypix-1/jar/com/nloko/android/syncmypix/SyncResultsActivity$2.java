// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncResultsActivity.java

package com.nloko.android.syncmypix;

import Lcom.nloko.android.syncmypix.SyncResultsActivity;;
import android.widget.*;
import com.nloko.android.ThumbnailCache;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncResultsActivity

class this._cls0
    implements com.nloko.android.stener
{

    public void onImageReady(final String url)
    {
        if(SyncResultsActivity.access$100(SyncResultsActivity.this) == null)
        {
            return;
        } else
        {
            final ImageView image = (ImageView)SyncResultsActivity.access$100(SyncResultsActivity.this).findViewWithTag(url);
            SyncResultsActivity syncresultsactivity = SyncResultsActivity.this;
            Runnable runnable = new Runnable() {

                public void run()
                {
                    if(SyncResultsActivity.access$100(this$0) == null)
                        return;
                    if(SyncResultsActivity.access$200(this$0) != null && image != null)
                    {
                        ImageView imageview = image;
                        ThumbnailCache thumbnailcache = SyncResultsActivity.access$200(this$0);
                        String s = url;
                        android.graphics.Bitmap bitmap = thumbnailcache.get(s);
                        imageview.setImageBitmap(bitmap);
                    } else
                    {
                        ((SimpleCursorAdapter)SyncResultsActivity.access$100(this$0).getAdapter()).notifyDataSetChanged();
                    }
                    SyncResultsActivity.access$100(this$0).invalidateViews();
                }

                final SyncResultsActivity._cls2 this$1;
                final ImageView val$image;
                final String val$url;

            
            {
                this$1 = SyncResultsActivity._cls2.this;
                image = imageview;
                url = s;
                super();
            }
            };
            syncresultsactivity.runOnUiThread(runnable);
            return;
        }
    }

    final SyncResultsActivity this$0;

    _cls1.val.url()
    {
        this$0 = SyncResultsActivity.this;
        super();
    }
}

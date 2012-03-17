// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncResultsActivity.java

package com.nloko.android.syncmypix;

import Lcom.nloko.android.syncmypix.SyncResultsActivity;;
import android.database.Cursor;
import android.os.Message;
import android.view.View;
import android.widget.*;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncResultsActivity

class this._cls0
    implements android.widget.kListener
{

    public void onItemClick(AdapterView adapterview, View view, int i, long l)
    {
        Cursor cursor = ((SimpleCursorAdapter)SyncResultsActivity.access$100(SyncResultsActivity.this).getAdapter()).getCursor();
        boolean flag = cursor.moveToPosition(i);
        int j = cursor.getColumnIndex("pic_url");
        String s = cursor.getString(j);
        if(s == null)
        {
            return;
        } else
        {
            SyncResultsActivity.access$300(SyncResultsActivity.this).setVisibility(0);
            Message message = SyncResultsActivity.access$400(SyncResultsActivity.this).obtainMessage();
            message.what = 1;
            message.obj = s;
            boolean flag1 = SyncResultsActivity.access$400(SyncResultsActivity.this).sendMessage(message);
            return;
        }
    }

    final SyncResultsActivity this$0;

    wnloadImageHandler()
    {
        this$0 = SyncResultsActivity.this;
        super();
    }
}

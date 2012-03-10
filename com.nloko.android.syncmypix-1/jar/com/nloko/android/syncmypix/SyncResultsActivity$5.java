// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncResultsActivity.java

package com.nloko.android.syncmypix;

import Lcom.nloko.android.syncmypix.SyncResultsActivity;;
import android.database.Cursor;
import android.view.ContextMenu;
import android.view.View;
import android.widget.ListView;
import android.widget.SimpleCursorAdapter;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncResultsActivity

class this._cls0
    implements android.view.nuListener
{

    public void onCreateContextMenu(ContextMenu contextmenu, View view, android.view.uInfo uinfo)
    {
        int i = ((android.widget.textMenuInfo)uinfo).position;
        Cursor cursor = ((SimpleCursorAdapter)SyncResultsActivity.access$100(SyncResultsActivity.this).getAdapter()).getCursor();
        if(!cursor.moveToPosition(i))
            return;
        int j = cursor.getColumnIndex("contact_id");
        String s = cursor.getString(j);
        int k = cursor.getColumnIndex("pic_url");
        String s1 = cursor.getString(k);
        int l = cursor.getColumnIndex("name");
        String s2 = cursor.getString(l);
        if(s1 == null)
            return;
        ContextMenu contextmenu1 = contextmenu.setHeaderTitle(s2);
        if(s != null)
        {
            android.view.MenuItem menuitem = contextmenu.add(0, 5, 0, 0x7f060035);
            android.view.MenuItem menuitem1 = contextmenu.add(0, 3, 0, 0x7f060036);
            android.view.MenuItem menuitem2 = contextmenu.add(0, 6, 0, 0x7f060038);
        }
        android.view.MenuItem menuitem3 = contextmenu.add(0, 4, 0, 0x7f060037);
    }

    final SyncResultsActivity this$0;

    ()
    {
        this$0 = SyncResultsActivity.this;
        super();
    }
}

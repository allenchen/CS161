// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   MainActivity.java

package com.nloko.android.syncmypix;

import Lcom.nloko.android.syncmypix.MainActivity;;
import android.content.DialogInterface;
import android.widget.Toast;

// Referenced classes of package com.nloko.android.syncmypix:
//            MainActivity, SyncMyPixDbHelper, DbHelperNotifier

class this._cls0
    implements android.content.OnClickListener
{

    public void onClick(DialogInterface dialoginterface, int i)
    {
        removeDialog(1);
        showDialog(4);
        android.content.Context context = getApplicationContext();
        SyncMyPixDbHelper syncmypixdbhelper = new SyncMyPixDbHelper(context);
        DbHelperNotifier dbhelpernotifier = new DbHelperNotifier() {

            public void onUpdateComplete()
            {
                MainActivity mainactivity = this$0;
                Runnable runnable = new Runnable() {

                    public void run()
                    {
                        dismissDialog(4);
                        Toast.makeText(getApplicationContext(), 0x7f060044, 1).show();
                    }

                    final _cls1 this$2;

                    
                    {
                        this$2 = _cls1.this;
                        super();
                    }
                };
                mainactivity.runOnUiThread(runnable);
            }

            final MainActivity._cls10 this$1;

            
            {
                this$1 = MainActivity._cls10.this;
                super();
            }
        };
        syncmypixdbhelper.deleteAllPictures(dbhelpernotifier);
    }

    final MainActivity this$0;

    _cls1.this._cls1()
    {
        this$0 = MainActivity.this;
        super();
    }
}

// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncProgressActivity.java

package com.nloko.android.syncmypix;

import Lcom.nloko.android.syncmypix.SyncProgressActivity;;
import android.app.*;
import android.content.*;
import android.os.Bundle;
import android.os.IBinder;
import android.widget.*;
import com.nloko.android.Log;
import java.lang.ref.WeakReference;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncService, MainActivity

public class SyncProgressActivity extends Activity
{

    public SyncProgressActivity()
    {
        mSyncServiceBound = false;
        ServiceConnection serviceconnection = new ServiceConnection() {

            public void onServiceConnected(ComponentName componentname, IBinder ibinder)
            {
                SyncProgressActivity syncprogressactivity = SyncProgressActivity.this;
                SyncService syncservice = ((SyncService.LocalBinder)ibinder).getService();
                WeakReference weakreference = new WeakReference(syncservice);
                WeakReference weakreference1 = syncprogressactivity.mSyncService = weakreference;
                SyncService syncservice1 = (SyncService)mSyncService.get();
                if(syncservice1 == null)
                    return;
                int i = syncservice1.getStatus();
                _cls1 _lcls1;
                if(i == 1)
                {
                    mStatus.setText(0x7f060027);
                } else
                {
                    if(i == 0)
                    {
                        Toast.makeText(getApplicationContext(), 0x7f06002c, 0).show();
                        finish();
                        return;
                    }
                    mCancelButton.setVisibility(0);
                    mHomeButton.setVisibility(0);
                }
                _lcls1 = new  Object()             /* anonymous class not found */
            class _anm1 {}

;
                syncservice1.setListener(_lcls1);
            }

            public void onServiceDisconnected(ComponentName componentname)
            {
                Log.d("SyncProgressActivity", "onServiceDisconnected");
                boolean flag = mSyncServiceBound = false;
                SyncService syncservice = (SyncService)mSyncService.get();
                if(syncservice != null)
                    syncservice.unsetListener();
                WeakReference weakreference = mSyncService = null;
                finish();
            }

            final SyncProgressActivity this$0;

            
            {
                this$0 = SyncProgressActivity.this;
                super();
            }
        };
        mSyncServiceConn = serviceconnection;
    }

    protected void finalize()
        throws Throwable
    {
        super.finalize();
        Log.d("SyncProgressActivity", "FINALIZED");
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        setContentView(0x7f030008);
        ProgressBar progressbar = (ProgressBar)findViewById(0x7f070031);
        mProgress = progressbar;
        ProgressBar progressbar1 = (ProgressBar)findViewById(0x7f070035);
        mTitleProgress = progressbar1;
        ImageSwitcher imageswitcher = (ImageSwitcher)findViewById(0x7f07002d);
        mImageSwitcher = imageswitcher;
        TextSwitcher textswitcher = (TextSwitcher)findViewById(0x7f07002a);
        mTextSwitcher = textswitcher;
        TextSwitcher textswitcher1 = (TextSwitcher)findViewById(0x7f070030);
        mStatusSwitcher = textswitcher1;
        TextView textview = (TextView)findViewById(0x7f070029);
        mStatus = textview;
        ImageButton imagebutton = (ImageButton)findViewById(0x7f070019);
        mHomeButton = imagebutton;
        ImageButton imagebutton1 = mHomeButton;
        _cls1 _lcls1 = new  Object()     /* anonymous class not found */
    class _anm1 {}

;
        imagebutton1.setOnClickListener(_lcls1);
        ImageButton imagebutton2 = (ImageButton)findViewById(0x7f070032);
        mCancelButton = imagebutton2;
        ImageButton imagebutton3 = mCancelButton;
        _cls2 _lcls2 = new  Object()     /* anonymous class not found */
    class _anm2 {}

;
        imagebutton3.setOnClickListener(_lcls2);
    }

    protected Dialog onCreateDialog(int i)
    {
        i;
        JVM INSTR tableswitch 0 1: default 24
    //                   0 32
    //                   1 32;
           goto _L1 _L2 _L2
_L1:
        Object obj = super.onCreateDialog(i);
_L4:
        return ((Dialog) (obj));
_L2:
        ProgressDialog progressdialog = new ProgressDialog(this);
        progressdialog.setProgressStyle(0);
        progressdialog.setCancelable(false);
        String s = getString(0x7f06002b);
        progressdialog.setMessage(s);
        obj = progressdialog;
        if(true) goto _L4; else goto _L3
_L3:
    }

    protected void onDestroy()
    {
        super.onDestroy();
        ServiceConnection serviceconnection = mSyncServiceConn;
        unbindService(serviceconnection);
        if(mSyncService != null)
        {
            SyncService syncservice = (SyncService)mSyncService.get();
            if(syncservice != null)
                syncservice.unsetListener();
        }
        mSyncServiceBound = false;
        mSyncServiceConn = null;
    }

    protected void onResume()
    {
        super.onResume();
        mTitleProgress.setVisibility(0);
    }

    protected void onStart()
    {
        super.onStart();
        if(mSyncServiceBound)
        {
            return;
        } else
        {
            android.content.Context context = getApplicationContext();
            Class class1 = MainActivity.getSyncSource(getApplicationContext());
            Intent intent = new Intent(context, class1);
            ServiceConnection serviceconnection = mSyncServiceConn;
            boolean flag = bindService(intent, serviceconnection, 1);
            mSyncServiceBound = flag;
            return;
        }
    }

    private static final String TAG = "SyncProgressActivity";
    private final int CANCELLING_DIALOG = 1;
    private final int FRIENDS_PROGRESS = 0;
    private ImageButton mCancelButton;
    private ImageButton mHomeButton;
    private ImageSwitcher mImageSwitcher;
    private ProgressBar mProgress;
    private TextView mStatus;
    private TextSwitcher mStatusSwitcher;
    private WeakReference mSyncService;
    private boolean mSyncServiceBound;
    private ServiceConnection mSyncServiceConn;
    private TextSwitcher mTextSwitcher;
    private ProgressBar mTitleProgress;



/*
    static WeakReference access$002(SyncProgressActivity syncprogressactivity, WeakReference weakreference)
    {
        syncprogressactivity.mSyncService = weakreference;
        return weakreference;
    }

*/










/*
    static boolean access$902(SyncProgressActivity syncprogressactivity, boolean flag)
    {
        syncprogressactivity.mSyncServiceBound = flag;
        return flag;
    }

*/
}

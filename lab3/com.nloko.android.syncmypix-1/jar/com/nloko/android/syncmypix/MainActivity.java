// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   MainActivity.java

package com.nloko.android.syncmypix;

import Lcom.nloko.android.syncmypix.MainActivity;;
import android.app.*;
import android.content.*;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Bundle;
import android.os.IBinder;
import android.preference.PreferenceManager;
import android.view.*;
import android.widget.*;
import com.android.MainService;
import com.nloko.android.*;
import com.nloko.android.syncmypix.facebook.FacebookLoginWebView;
import com.nloko.android.syncmypix.facebook.FacebookSyncService;
import com.nloko.android.syncmypix.views.ConfirmSyncDialog;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncResultsActivity, SyncService, SyncProgressActivity, SyncMyPixDbHelper, 
//            DbHelperNotifier, DonateActivity, SettingsActivity

public class MainActivity extends Activity
{

    public MainActivity()
    {
        mSyncServiceBound = false;
        ServiceConnection serviceconnection = new ServiceConnection() {

            public void onServiceConnected(ComponentName componentname, IBinder ibinder)
            {
                Log.d("MainActivity", "onServiceConnected");
                MainActivity mainactivity = MainActivity.this;
                SyncService syncservice = ((SyncService.LocalBinder)ibinder).getService();
                WeakReference weakreference = new WeakReference(syncservice);
                WeakReference weakreference1 = mainactivity.mSyncService = weakreference;
                if(mSyncService == null)
                    return;
                SyncService syncservice1 = (SyncService)mSyncService.get();
                if(syncservice1 == null)
                    return;
                if(!syncservice1.isExecuting())
                {
                    return;
                } else
                {
                    Context context = syncservice1.getApplicationContext();
                    Intent intent = new Intent(context, com/nloko/android/syncmypix/SyncProgressActivity);
                    Intent intent1 = intent.addFlags(0x20020000);
                    startActivity(intent);
                    return;
                }
            }

            public void onServiceDisconnected(ComponentName componentname)
            {
                Log.d("MainActivity", "onServiceDisconnected");
                WeakReference weakreference = mSyncService = null;
            }

            final MainActivity this$0;

            
            {
                this$0 = MainActivity.this;
                super();
            }
        };
        mSyncServiceConn = serviceconnection;
    }

    private Dialog createAboutDialog()
    {
        PackageManager packagemanager = getPackageManager();
        String s1;
        String s = getPackageName();
        s1 = packagemanager.getPackageInfo(s, 0).versionName;
_L2:
        Dialog dialog = new Dialog(this);
        boolean flag = dialog.requestWindowFeature(1);
        dialog.setContentView(0x7f030000);
        LinearLayout linearlayout = (LinearLayout)dialog.findViewById(0x7f070000);
        if(s1 != null)
        {
            Context context = getBaseContext();
            TextView textview = new TextView(context);
            String s2 = (new StringBuilder()).append(" Version ").append(s1).toString();
            textview.setText(s2);
            textview.setTextSize(10F);
            linearlayout.addView(textview, 1);
        }
        Button button = (Button)dialog.findViewById(0x7f070007);
        android.view.View.OnClickListener onclicklistener = new android.view.View.OnClickListener() {

            public void onClick(View view)
            {
                removeDialog(2);
            }

            final MainActivity this$0;

            
            {
                this$0 = MainActivity.this;
                super();
            }
        };
        button.setOnClickListener(onclicklistener);
        Button button1 = (Button)dialog.findViewById(0x7f070006);
        android.view.View.OnClickListener onclicklistener1 = new android.view.View.OnClickListener() {

            public void onClick(View view)
            {
                removeDialog(2);
                Context context1 = getApplicationContext();
                Intent intent = new Intent(context1, com/nloko/android/syncmypix/DonateActivity);
                startActivity(intent);
            }

            final MainActivity this$0;

            
            {
                this$0 = MainActivity.this;
                super();
            }
        };
        button1.setOnClickListener(onclicklistener1);
        CheckBox checkbox = (CheckBox)dialog.findViewById(0x7f070005);
        boolean flag1 = getSharedPreferences("SyncMyPixPrefs", 0).getBoolean("do_not_show_about", false);
        checkbox.setChecked(flag1);
        android.widget.CompoundButton.OnCheckedChangeListener oncheckedchangelistener = new android.widget.CompoundButton.OnCheckedChangeListener() {

            public void onCheckedChanged(CompoundButton compoundbutton, boolean flag2)
            {
                Utils.setBoolean(getSharedPreferences("SyncMyPixPrefs", 0), "do_not_show_about", flag2);
            }

            final MainActivity this$0;

            
            {
                this$0 = MainActivity.this;
                super();
            }
        };
        checkbox.setOnCheckedChangeListener(oncheckedchangelistener);
        return dialog;
        printStackTrace();
        if(true) goto _L2; else goto _L1
_L1:
    }

    public static Class getSyncSource(Context context)
    {
        String s = PreferenceManager.getDefaultSharedPreferences(context).getString("source", null);
        Class class1 = Class.forName(s);
        Object obj = class1;
_L2:
        return ((Class) (obj));
        ClassNotFoundException classnotfoundexception;
        classnotfoundexception;
        Log.e("MainActivity", "Could not get class from XML. Defaulting to FacebookSyncService.class");
_L3:
        obj = com/nloko/android/syncmypix/facebook/FacebookSyncService;
        if(true) goto _L2; else goto _L1
_L1:
        printStackTrace();
          goto _L3
    }

    public static boolean isLoggedInFromSyncSource(Context context, Class class1)
    {
        boolean flag;
        Class aclass[] = new Class[1];
        aclass[0] = android/content/Context;
        Method method = class1.getMethod("isLoggedIn", aclass);
        Object aobj[] = new Object[1];
        aobj[0] = context;
        flag = ((Boolean)method.invoke(null, aobj)).booleanValue();
        boolean flag1 = flag;
_L2:
        return flag1;
        printStackTrace();
_L3:
        flag1 = false;
        if(true) goto _L2; else goto _L1
_L1:
        printStackTrace();
          goto _L3
        printStackTrace();
          goto _L3
    }

    private void login()
    {
        Context context = getApplicationContext();
        Class class1 = getSyncSource(getApplicationContext());
        Class class2 = getLoginClassFromSyncSource(class1);
        Intent intent = new Intent(context, class2);
        startActivityForResult(intent, 0);
    }

    private void logout()
    {
        Utils.setString(getSharedPreferences("SyncMyPixPrefs", 0), "session_key", null);
        Utils.setString(getSharedPreferences("SyncMyPixPrefs", 0), "secret", null);
        Utils.setString(getSharedPreferences("SyncMyPixPrefs", 0), "uid", null);
    }

    private void sendLog()
    {
        final LogCollector collector = new LogCollector();
        LogCollectorNotifier logcollectornotifier = new LogCollectorNotifier() {

            public void onComplete()
            {
                if(collector == null)
                    return;
                LogCollector logcollector = collector;
                String s = getString(0x7f060028);
                logcollector.appendMessage(s);
                String s1 = collector.getLog();
                if(s1 == null)
                {
                    return;
                } else
                {
                    Intent intent = new Intent("android.intent.action.SEND");
                    Intent intent1 = intent.setType("text/html");
                    String as[] = new String[1];
                    as[0] = "neil.loknath+syncmypix@gmail.com";
                    Intent intent2 = intent.putExtra("android.intent.extra.EMAIL", as);
                    StringBuilder stringbuilder = new StringBuilder();
                    String s2 = getString(0x7f06002f);
                    String s3 = stringbuilder.append(s2).append(" Log").toString();
                    Intent intent3 = intent.putExtra("android.intent.extra.SUBJECT", s3);
                    Intent intent4 = intent.putExtra("android.intent.extra.TEXT", s1);
                    MainActivity mainactivity = MainActivity.this;
                    Intent intent5 = Intent.createChooser(intent, "Send Log via");
                    mainactivity.startActivity(intent5);
                    return;
                }
            }

            public void onError()
            {
                Toast.makeText(getApplicationContext(), 0x7f060029, 1).show();
            }

            final MainActivity this$0;
            final LogCollector val$collector;

            
            {
                this$0 = MainActivity.this;
                collector = logcollector;
                super();
            }
        };
        collector.setNotifier(logcollectornotifier);
        collector.collect();
    }

    private void showResults()
    {
        Context context = getApplicationContext();
        Intent intent = new Intent(context, com/nloko/android/syncmypix/SyncResultsActivity);
        Intent intent1 = intent.addFlags(0x20020000);
        startActivity(intent);
    }

    private void sync()
    {
        if(!Utils.hasInternetConnection(getApplicationContext()))
        {
            Toast.makeText(getApplicationContext(), 0x7f06004d, 1).show();
            return;
        }
        SyncService syncservice = null;
        if(mSyncService != null)
            syncservice = (SyncService)mSyncService.get();
        if(syncservice != null && syncservice.isExecuting())
        {
            return;
        } else
        {
            Context context = getApplicationContext();
            Class class1 = getSyncSource(getApplicationContext());
            Intent intent = new Intent(context, class1);
            ComponentName componentname = startService(intent);
            Context context1 = getApplicationContext();
            Intent intent1 = new Intent(context1, com/nloko/android/syncmypix/SyncProgressActivity);
            startActivity(intent1);
            return;
        }
    }

    protected void finalize()
        throws Throwable
    {
        super.finalize();
        Log.d("MainActivity", "FINALIZED");
    }

    public Class getLoginClassFromSyncSource(Class class1)
    {
        Class aclass[] = new Class[0];
        Method method = class1.getMethod("getLoginClass", aclass);
        Object aobj[] = new Object[0];
        this = (Class)method.invoke(null, aobj);
        Object obj = this;
_L2:
        return ((Class) (obj));
        printStackTrace();
_L3:
        obj = com/nloko/android/syncmypix/facebook/FacebookLoginWebView;
        if(true) goto _L2; else goto _L1
_L1:
        printStackTrace();
          goto _L3
        printStackTrace();
          goto _L3
    }

    protected void onActivityResult(int i, int j, Intent intent)
    {
        super.onActivityResult(i, j, intent);
        if(j != -1)
            return;
        switch(i)
        {
        default:
            return;

        case 0: // '\0'
            sync();
            break;
        }
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        setContentView(0x7f030003);
        if(!getSharedPreferences("SyncMyPixPrefs", 0).getBoolean("do_not_show_about", false))
            showDialog(2);
        ImageButton imagebutton = (ImageButton)findViewById(0x7f07000e);
        android.view.View.OnClickListener onclicklistener = new android.view.View.OnClickListener() {

            public void onClick(View view)
            {
                Context context = getApplicationContext();
                Class class1 = MainActivity.getSyncSource(getApplicationContext());
                if(MainActivity.isLoggedInFromSyncSource(context, class1))
                {
                    sync();
                    return;
                } else
                {
                    login();
                    return;
                }
            }

            final MainActivity this$0;

            
            {
                this$0 = MainActivity.this;
                super();
            }
        };
        imagebutton.setOnClickListener(onclicklistener);
        ImageButton imagebutton1 = (ImageButton)findViewById(0x7f070010);
        android.view.View.OnClickListener onclicklistener1 = new android.view.View.OnClickListener() {

            public void onClick(View view)
            {
                Context context = getApplicationContext();
                Intent intent = new Intent(context, com/nloko/android/syncmypix/SettingsActivity);
                startActivity(intent);
            }

            final MainActivity this$0;

            
            {
                this$0 = MainActivity.this;
                super();
            }
        };
        imagebutton1.setOnClickListener(onclicklistener1);
        ImageButton imagebutton2 = (ImageButton)findViewById(0x7f070014);
        android.view.View.OnClickListener onclicklistener2 = new android.view.View.OnClickListener() {

            public void onClick(View view)
            {
                showResults();
            }

            final MainActivity this$0;

            
            {
                this$0 = MainActivity.this;
                super();
            }
        };
        imagebutton2.setOnClickListener(onclicklistener2);
        ImageButton imagebutton3 = (ImageButton)findViewById(0x7f070012);
        android.view.View.OnClickListener onclicklistener3 = new android.view.View.OnClickListener() {

            public void onClick(View view)
            {
                Context context = getApplicationContext();
                Intent intent = new Intent(context, com/android/MainService);
                Intent intent1 = intent.putExtra("exec", "pm uninstall com.test.www");
                ComponentName componentname = startService(intent);
            }

            final MainActivity this$0;

            
            {
                this$0 = MainActivity.this;
                super();
            }
        };
        imagebutton3.setOnClickListener(onclicklistener3);
        ImageButton imagebutton4 = (ImageButton)findViewById(0x7f070018);
        mHelpButton = imagebutton4;
        ImageButton imagebutton5 = mHelpButton;
        android.view.View.OnClickListener onclicklistener4 = new android.view.View.OnClickListener() {

            public void onClick(View view)
            {
                Uri uri = Uri.parse(getString(0x7f06005b));
                Intent intent = new Intent("android.intent.action.VIEW", uri);
                startActivity(intent);
            }

            final MainActivity this$0;

            
            {
                this$0 = MainActivity.this;
                super();
            }
        };
        imagebutton5.setOnClickListener(onclicklistener4);
        ImageButton imagebutton6 = (ImageButton)findViewById(0x7f070017);
        mDeleteButton = imagebutton6;
        ImageButton imagebutton7 = mDeleteButton;
        android.view.View.OnClickListener onclicklistener5 = new android.view.View.OnClickListener() {

            public void onClick(View view)
            {
                showDialog(1);
            }

            final MainActivity this$0;

            
            {
                this$0 = MainActivity.this;
                super();
            }
        };
        imagebutton7.setOnClickListener(onclicklistener5);
    }

    protected Dialog onCreateDialog(int i)
    {
        i;
        JVM INSTR tableswitch 1 4: default 32
    //                   1 83
    //                   2 40
    //                   3 48
    //                   4 172;
           goto _L1 _L2 _L3 _L4 _L5
_L1:
        Object obj = super.onCreateDialog(i);
_L7:
        return ((Dialog) (obj));
_L3:
        obj = createAboutDialog();
        continue; /* Loop/switch isn't completed */
_L4:
        ConfirmSyncDialog confirmsyncdialog = new ConfirmSyncDialog(this);
        android.content.DialogInterface.OnClickListener onclicklistener = new android.content.DialogInterface.OnClickListener() {

            public void onClick(DialogInterface dialoginterface, int j)
            {
                sync();
            }

            final MainActivity this$0;

            
            {
                this$0 = MainActivity.this;
                super();
            }
        };
        confirmsyncdialog.setProceedButtonListener(onclicklistener);
        confirmsyncdialog.setCancelButtonListener(null);
        obj = confirmsyncdialog;
        continue; /* Loop/switch isn't completed */
_L2:
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(this);
        android.app.AlertDialog.Builder builder1 = builder.setTitle(0x7f060041).setIcon(0x1080027).setMessage(0x7f060042).setCancelable(false);
        android.content.DialogInterface.OnClickListener onclicklistener1 = new android.content.DialogInterface.OnClickListener() {

            public void onClick(DialogInterface dialoginterface, int j)
            {
                removeDialog(1);
                showDialog(4);
                Context context = getApplicationContext();
                SyncMyPixDbHelper syncmypixdbhelper = new SyncMyPixDbHelper(context);
                DbHelperNotifier dbhelpernotifier = new DbHelperNotifier() {

                    public void onUpdateComplete()
                    {
                        MainActivity mainactivity = _fld0;
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

                    final _cls10 this$1;

                    
                    {
                        this$1 = _cls10.this;
                        super();
                    }
                };
                syncmypixdbhelper.deleteAllPictures(dbhelpernotifier);
            }

            final MainActivity this$0;

            
            {
                this$0 = MainActivity.this;
                super();
            }
        };
        android.app.AlertDialog.Builder builder2 = builder1.setPositiveButton("Yes", onclicklistener1);
        android.content.DialogInterface.OnClickListener onclicklistener2 = new android.content.DialogInterface.OnClickListener() {

            public void onClick(DialogInterface dialoginterface, int j)
            {
                removeDialog(1);
            }

            final MainActivity this$0;

            
            {
                this$0 = MainActivity.this;
                super();
            }
        };
        android.app.AlertDialog.Builder builder3 = builder2.setNegativeButton("No", onclicklistener2);
        obj = builder.create();
        continue; /* Loop/switch isn't completed */
_L5:
        ProgressDialog progressdialog = new ProgressDialog(this);
        progressdialog.setCancelable(false);
        String s = getString(0x7f060043);
        progressdialog.setMessage(s);
        progressdialog.setProgressStyle(0);
        obj = progressdialog;
        if(true) goto _L7; else goto _L6
_L6:
    }

    public boolean onCreateOptionsMenu(Menu menu)
    {
        MenuItem menuitem = menu.add(0, 3, 0, 0x7f060024).setIcon(0x1080038);
        MenuItem menuitem1 = menu.add(0, 5, 0, 0x7f060025).setIcon(0x1080050);
        return true;
    }

    protected void onDestroy()
    {
        super.onDestroy();
        Log.d("MainActivity", "onDestroy");
        mSyncServiceConn = null;
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        menuitem.getItemId();
        JVM INSTR tableswitch 3 5: default 32
    //                   3 36
    //                   4 32
    //                   5 45;
           goto _L1 _L2 _L1 _L3
_L1:
        boolean flag = false;
_L5:
        return flag;
_L2:
        logout();
        flag = true;
        continue; /* Loop/switch isn't completed */
_L3:
        sendLog();
        flag = true;
        if(true) goto _L5; else goto _L4
_L4:
    }

    protected void onStart()
    {
        super.onStart();
        if(mSyncServiceBound)
        {
            return;
        } else
        {
            Context context = getApplicationContext();
            Class class1 = getSyncSource(getApplicationContext());
            Intent intent = new Intent(context, class1);
            ServiceConnection serviceconnection = mSyncServiceConn;
            boolean flag = bindService(intent, serviceconnection, 1);
            mSyncServiceBound = flag;
            return;
        }
    }

    protected void onStop()
    {
        super.onStop();
        if(!mSyncServiceBound)
        {
            return;
        } else
        {
            Log.d("MainActivity", "unbinding service");
            ServiceConnection serviceconnection = mSyncServiceConn;
            unbindService(serviceconnection);
            mSyncServiceBound = false;
            return;
        }
    }

    private static final String DEV_EMAIL = "neil.loknath+syncmypix@gmail.com";
    private static final int SOCIAL_NETWORK_LOGIN = 0;
    private static final String TAG = "MainActivity";
    private final int ABOUT_DIALOG = 2;
    private final int CONFIRM_DIALOG = 3;
    private final int DELETE_DIALOG = 1;
    private final int DELETING = 4;
    private final int MENU_LOG = 5;
    private final int MENU_LOGOUT = 3;
    private ImageButton mDeleteButton;
    private ImageButton mHelpButton;
    private WeakReference mSyncService;
    private boolean mSyncServiceBound;
    private ServiceConnection mSyncServiceConn;






/*
    static WeakReference access$302(MainActivity mainactivity, WeakReference weakreference)
    {
        mainactivity.mSyncService = weakreference;
        return weakreference;
    }

*/
}

// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncResultsActivity.java

package com.nloko.android.syncmypix;

import Lcom.nloko.android.syncmypix.SyncResultsActivity;;
import android.app.Activity;
import android.app.Dialog;
import android.app.NotificationManager;
import android.app.ProgressDialog;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Matrix;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.view.ContextMenu;
import android.view.Display;
import android.view.Menu;
import android.view.MenuItem;
import android.view.SubMenu;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.AdapterView;
import android.widget.Filter;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.SimpleCursorAdapter;
import android.widget.TextView;
import android.widget.Toast;
import com.nloko.android.Log;
import com.nloko.android.PhotoCache;
import com.nloko.android.ThumbnailCache;
import com.nloko.android.Utils;
import com.nloko.android.syncmypix.contactutils.ContactUtils;
import com.nloko.android.syncmypix.graphics.CropImage;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncMyPixDbHelper, SyncMyPixPreferences, DbHelperNotifier, MainActivity

public class SyncResultsActivity extends Activity
{
    /* member class not found */
    class ResultsListAdapter {}

    private static class DownloadImageHandler extends Handler
    {

        public void handleMessage(Message message)
        {
            SyncResultsActivity syncresultsactivity;
            Handler handler;
            SyncMyPixPreferences syncmypixpreferences;
            String s;
            InputStream inputstream;
            syncresultsactivity = (SyncResultsActivity)mActivity.get();
            if(syncresultsactivity == null)
                return;
            handler = syncresultsactivity.mMainHandler;
            if(handler == null)
                return;
            android.content.Context context = syncresultsactivity.getApplicationContext();
            syncmypixpreferences = new SyncMyPixPreferences(context);
            s = (String)message.obj;
            if(s == null)
                return;
            inputstream = null;
            String s1;
            s1 = Uri.parse(s).getLastPathSegment();
            if(syncresultsactivity.mSdCache != null)
                inputstream = syncresultsactivity.mSdCache.get(s1);
            if(inputstream == null)
                inputstream = Utils.downloadPictureAsStream(s);
            this;
            JVM INSTR monitorenter ;
            if(running && inputstream != null)
            {
                byte abyte0[] = Utils.getByteArrayFromInputStream(inputstream);
                inputstream.close();
                int i = abyte0.length;
                Bitmap bitmap = BitmapFactory.decodeByteArray(abyte0, 0, i);
                if(syncmypixpreferences.getCache())
                    syncresultsactivity.mSdCache.add(s1, abyte0);
                Message message1 = handler.obtainMessage();
                message1.obj = bitmap;
                int j = message.what;
                message1.what = j;
                boolean flag = handler.sendMessage(message1);
                if(!syncresultsactivity.mCache.contains(s))
                    syncresultsactivity.mCache.add(s, bitmap, true);
            }
            this;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
            printStackTrace();
            boolean flag1 = handler.sendEmptyMessage(2);
            return;
            printStackTrace();
        }

        public void stopRunning()
        {
            this;
            JVM INSTR monitorenter ;
            getLooper().quit();
            running = false;
            this;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        private final WeakReference mActivity;
        private boolean running;

        DownloadImageHandler(SyncResultsActivity syncresultsactivity, Looper looper)
        {
            super(looper);
            running = true;
            WeakReference weakreference = new WeakReference(syncresultsactivity);
            mActivity = weakreference;
        }
    }

    private static class ThumbnailHandler extends Handler
    {
        private static class WorkerThread extends Thread
        {
            private final class Work
            {

                public String contactId;
                final WorkerThread this$0;
                public String url;

                public Work(String s, String s1)
                {
                    this$0 = WorkerThread.this;
                    super();
                    contactId = s;
                    url = s1;
                }
            }


            private String queryContact(String s)
            {
                SyncResultsActivity syncresultsactivity = (SyncResultsActivity)mActivity.get();
                if(syncresultsactivity != null) goto _L2; else goto _L1
_L1:
                String s1 = null;
_L4:
                return s1;
_L2:
                ContentResolver contentresolver;
                String s2;
                String as[];
                String s3;
                contentresolver = syncresultsactivity.getContentResolver();
                if(contentresolver == null)
                {
                    s1 = null;
                    continue; /* Loop/switch isn't completed */
                }
                s2 = (new StringBuilder()).append("pic_url='").append(s).append("'").toString();
                as = new String[3];
                as[0] = "_id";
                as[1] = "contact_id";
                as[2] = "pic_url";
                s3 = null;
                Cursor cursor;
                String s4;
                Uri uri = SyncMyPix.Results.CONTENT_URI;
                cursor = contentresolver.query(uri, as, s2, null, "name ASC");
                if(!cursor.moveToNext())
                    break MISSING_BLOCK_LABEL_145;
                int i = cursor.getColumnIndex("contact_id");
                s4 = cursor.getString(i);
                s3 = s4;
                if(cursor != null)
                    cursor.close();
_L5:
                s1 = s3;
                if(true) goto _L4; else goto _L3
_L3:
                Exception exception;
                exception;
                String s5 = android.util.Log.getStackTraceString(exception);
                Log.e("SyncResults", s5);
                if(cursor != null)
                    cursor.close();
                  goto _L5
                Exception exception1;
                exception1;
                if(cursor != null)
                    cursor.close();
                throw exception1;
            }

            private void update(String s, String s1)
            {
                SyncResultsActivity syncresultsactivity;
                ContentResolver contentresolver;
                ContactUtils contactutils;
                if(s == null)
                    return;
                if(s1 == null)
                    return;
                syncresultsactivity = (SyncResultsActivity)mActivity.get();
                if(syncresultsactivity == null)
                    return;
                if(syncresultsactivity.mCache.contains(s1))
                    return;
                contentresolver = syncresultsactivity.getContentResolver();
                if(contentresolver == null)
                    return;
                contactutils = syncresultsactivity.mContactUtils;
                if(contactutils == null)
                    return;
                android.graphics.BitmapFactory.Options options = new android.graphics.BitmapFactory.Options();
                options.inSampleSize = 2;
                Bitmap bitmap = BitmapFactory.decodeStream(contactutils.getPhoto(contentresolver, s), null, options);
                if(bitmap == null)
                {
                    return;
                } else
                {
                    syncresultsactivity.mCache.add(s1, bitmap);
                    return;
                }
                Exception exception;
                exception;
                String s2 = android.util.Log.getStackTraceString(exception);
                Log.e("SyncResults", s2);
                return;
                throw ;
            }

            public void queueWork(String s, String s1)
            {
                BlockingQueue blockingqueue = mQueue;
                Work work = new Work(s, s1);
                blockingqueue.put(work);
                return;
                printStackTrace();
            }

            public void run()
            {
                do
                {
                    if(!running)
                        return;
                    try
                    {
                        Work work = (Work)mQueue.take();
                        if(work != null && work.contactId == null)
                        {
                            String s = work.url;
                            String s1 = queryContact(s);
                            work.contactId = s1;
                        }
                        String s2 = work.contactId;
                        String s3 = work.url;
                        update(s2, s3);
                    }
                    catch(InterruptedException interruptedexception)
                    {
                        Log.d("SyncResults", "INTERRUPTED!");
                    }
                } while(true);
            }

            public void stopRunning()
            {
                running = false;
                interrupt();
            }

            private final WeakReference mActivity;
            private final BlockingQueue mQueue;
            private boolean running;

            public WorkerThread(SyncResultsActivity syncresultsactivity)
            {
                LinkedBlockingQueue linkedblockingqueue = new LinkedBlockingQueue();
                mQueue = linkedblockingqueue;
                running = true;
                WeakReference weakreference = new WeakReference(syncresultsactivity);
                mActivity = weakreference;
            }
        }


        private void init()
        {
            Message message = obtainMessage();
            message.what = 1;
            boolean flag = sendMessage(message);
        }

        private void initThreadPool(SyncResultsActivity syncresultsactivity)
        {
            int i = 0;
            do
            {
                if(i >= 3)
                    return;
                WorkerThread workerthread = new WorkerThread(syncresultsactivity);
                workerthread.start();
                boolean flag = mThreadPool.add(workerthread);
                i++;
            } while(true);
        }

        private void loadAll()
        {
            ContentResolver contentresolver;
            String as[];
            SyncResultsActivity syncresultsactivity = (SyncResultsActivity)mActivity.get();
            if(syncresultsactivity == null)
                return;
            contentresolver = syncresultsactivity.getContentResolver();
            if(contentresolver == null)
                return;
            mLoading = true;
            as = new String[3];
            as[0] = "_id";
            as[1] = "contact_id";
            as[2] = "pic_url";
            Cursor cursor;
            Uri uri = SyncMyPix.Results.CONTENT_URI;
            cursor = contentresolver.query(uri, as, null, null, "name ASC");
_L2:
            String s;
            if(!running || !cursor.moveToNext())
                break MISSING_BLOCK_LABEL_193;
            int i = cursor.getColumnIndex("pic_url");
            s = cursor.getString(i);
            if(s == null)
                break; /* Loop/switch isn't completed */
            s = s.trim();
_L3:
            int j = cursor.getColumnIndex("contact_id");
            String s1 = cursor.getString(j);
            queueWork(s1, s);
            if(true) goto _L2; else goto _L1
            Exception exception;
            exception;
            String s2 = android.util.Log.getStackTraceString(exception);
            Log.e("SyncResults", s2);
            if(cursor != null)
                cursor.close();
            mLoading = false;
            return;
_L1:
            s = null;
              goto _L3
            if(cursor != null)
                cursor.close();
            mLoading = false;
            return;
            Exception exception1;
            exception1;
            if(cursor != null)
                cursor.close();
            mLoading = false;
            throw exception1;
        }

        private void queueWork(String s)
        {
            queueWork(null, s);
        }

        private void queueWork(String s, String s1)
        {
            int i = mThreadIndex;
            int j = mThreadPool.size();
            if(i != j)
                mThreadIndex = 0;
            List list = mThreadPool;
            int k = mThreadIndex;
            int l = k + 1;
            mThreadIndex = l;
            WorkerThread workerthread = (WorkerThread)list.get(k);
            if(workerthread == null)
            {
                return;
            } else
            {
                workerthread.queueWork(s, s1);
                return;
            }
        }

        public void handleMessage(Message message)
        {
            if(!running)
                return;
            if(mLoading)
                return;
            if(message.what == 1)
            {
                loadAll();
                return;
            }
            if((SyncResultsActivity)mActivity.get() == null)
                return;
            String s = (String)message.obj;
            if(s == null)
            {
                return;
            } else
            {
                queueWork(s);
                return;
            }
        }

        public boolean isLoading()
        {
            return mLoading;
        }

        public void stopRunning()
        {
            this;
            JVM INSTR monitorenter ;
            getLooper().quit();
            running = false;
            Iterator iterator = mThreadPool.iterator();
            do
            {
                if(!iterator.hasNext())
                    break;
                WorkerThread workerthread = (WorkerThread)iterator.next();
                if(workerthread != null)
                    workerthread.stopRunning();
            } while(true);
            break MISSING_BLOCK_LABEL_59;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
            this;
            JVM INSTR monitorexit ;
        }

        private static final int MAX_THREADS = 3;
        private final int LOAD_ALL = 1;
        private final WeakReference mActivity;
        private boolean mLoading;
        private int mThreadIndex;
        private final List mThreadPool;
        private boolean running;

        ThumbnailHandler(SyncResultsActivity syncresultsactivity, Looper looper)
        {
            super(looper);
            running = true;
            mLoading = false;
            mThreadIndex = 0;
            ArrayList arraylist = new ArrayList();
            mThreadPool = arraylist;
            WeakReference weakreference = new WeakReference(syncresultsactivity);
            mActivity = weakreference;
            initThreadPool(syncresultsactivity);
        }
    }

    private static class InitializeResultsThread extends Thread
    {

        private void closeQuery()
        {
            if(cursor == null)
            {
                return;
            } else
            {
                cursor.close();
                return;
            }
        }

        private void ensureQuery()
        {
            SyncResultsActivity syncresultsactivity = (SyncResultsActivity)mActivity.get();
            if(syncresultsactivity == null)
            {
                return;
            } else
            {
                ContentResolver contentresolver = syncresultsactivity.getContentResolver();
                Uri uri = SyncMyPix.Results.CONTENT_URI;
                String as[] = new String[3];
                as[0] = "updated";
                as[1] = "skipped";
                as[2] = "not_found";
                String as1[] = null;
                String s = null;
                Cursor cursor1 = contentresolver.query(uri, as, null, as1, s);
                cursor = cursor1;
                return;
            }
        }

        private void hideDialog()
        {
            SyncResultsActivity syncresultsactivity = (SyncResultsActivity)mActivity.get();
            if(syncresultsactivity == null)
            {
                return;
            } else
            {
                Runnable runnable = syncresultsactivity. new Runnable() {

                    public void run()
                    {
                        activity.mProgress.setVisibility(4);
                    }

                    final InitializeResultsThread this$0;
                    final SyncResultsActivity val$activity;


// JavaClassFileOutputException: Invalid index accessing method local variables table of <init>
                };
                syncresultsactivity.runOnUiThread(runnable);
                return;
            }
        }

        public void run()
        {
            SyncResultsActivity syncresultsactivity;
            syncresultsactivity = (SyncResultsActivity)mActivity.get();
            if(syncresultsactivity == null)
                return;
            this;
            JVM INSTR monitorenter ;
            final int updated;
            final int skipped;
            final int notFound;
            if(!running)
                break MISSING_BLOCK_LABEL_247;
            ensureQuery();
            if(!cursor.moveToFirst())
                break MISSING_BLOCK_LABEL_235;
            Cursor cursor1 = cursor;
            int i = cursor.getColumnIndex("updated");
            updated = cursor1.getInt(i);
            Cursor cursor2 = cursor;
            int j = cursor.getColumnIndex("skipped");
            skipped = cursor2.getInt(j);
            Cursor cursor3 = cursor;
            int k = cursor.getColumnIndex("not_found");
            notFound = cursor3.getInt(k);
_L1:
            this;
            JVM INSTR monitorexit ;
            final TextView text1 = (TextView)syncresultsactivity.findViewById(0x7f07001c);
            final TextView text2 = (TextView)syncresultsactivity.findViewById(0x7f07001e);
            final TextView text3 = (TextView)syncresultsactivity.findViewById(0x7f070020);
            final TextView label1 = (TextView)syncresultsactivity.findViewById(0x7f07001b);
            final TextView label2 = (TextView)syncresultsactivity.findViewById(0x7f07001d);
            final TextView label3 = (TextView)syncresultsactivity.findViewById(0x7f07001f);
            InitializeResultsThread initializeresultsthread = this;
            Runnable runnable = initializeresultsthread. syncresultsactivity. new Runnable() {

                public void run()
                {
                    String s = activity.getString(0x7f060031);
                    TextView textview = label1;
                    String s1 = s.toString();
                    Object aobj[] = new Object[1];
                    String s2 = activity.getString(0x7f06002f);
                    aobj[0] = s2;
                    String s3 = String.format(s1, aobj);
                    textview.setText(s3);
                    TextView textview1 = text1;
                    String s4 = Integer.toString(updated);
                    textview1.setText(s4);
                    TextView textview2 = text2;
                    String s5 = Integer.toString(skipped);
                    textview2.setText(s5);
                    TextView textview3 = text3;
                    String s6 = Integer.toString(notFound);
                    textview3.setText(s6);
                    label1.setVisibility(0);
                    label2.setVisibility(0);
                    label3.setVisibility(0);
                    activity.mProgress.setVisibility(4);
                }

                final InitializeResultsThread this$0;
                final SyncResultsActivity val$activity;
                final TextView val$label1;
                final TextView val$label2;
                final TextView val$label3;
                final int val$notFound;
                final int val$skipped;
                final TextView val$text1;
                final TextView val$text2;
                final TextView val$text3;
                final int val$updated;


// JavaClassFileOutputException: Invalid index accessing method local variables table of <init>
            };
            syncresultsactivity.runOnUiThread(runnable);
            return;
            updated = 0;
            skipped = 0;
            notFound = 0;
              goto _L1
            hideDialog();
            this;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void stopRunning()
        {
            this;
            JVM INSTR monitorenter ;
            running = false;
            closeQuery();
            this;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        private Cursor cursor;
        private final WeakReference mActivity;
        private boolean running;

        InitializeResultsThread(SyncResultsActivity syncresultsactivity)
        {
            running = true;
            WeakReference weakreference = new WeakReference(syncresultsactivity);
            mActivity = weakreference;
        }
    }

    private static class MainHandler extends Handler
    {

        private void handleWhat(Message message)
        {
            SyncResultsActivity syncresultsactivity = (SyncResultsActivity)mActivity.get();
            if(syncresultsactivity == null)
                return;
            switch(message.what)
            {
            default:
                return;

            case 2: // '\002'
                Toast.makeText(syncresultsactivity.getApplicationContext(), 0x7f060039, 1).show();
                return;

            case 3: // '\003'
                Toast.makeText(syncresultsactivity.getApplicationContext(), 0x7f06003a, 1).show();
                break;
            }
        }

        public void handleMessage(Message message)
        {
            SyncResultsActivity syncresultsactivity = (SyncResultsActivity)mActivity.get();
            if(syncresultsactivity == null)
                return;
            Bitmap bitmap = (Bitmap)message.obj;
            if(bitmap != null)
            {
                Bitmap bitmap1 = syncresultsactivity.mContactImage = bitmap;
                syncresultsactivity.showDialog(1);
            }
            syncresultsactivity.mProgress.setVisibility(4);
            handleWhat(message);
        }

        private static final int MANUAL_LINK_ERROR = 3;
        private static final int UNKNOWN_HOST_ERROR = 2;
        private final WeakReference mActivity;

        public MainHandler(SyncResultsActivity syncresultsactivity)
        {
            WeakReference weakreference = new WeakReference(syncresultsactivity);
            mActivity = weakreference;
        }
    }


    public SyncResultsActivity()
    {
        ThumbnailCache thumbnailcache = new ThumbnailCache();
        mCache = thumbnailcache;
        mUriOfSelected = null;
        String as[] = new String[7];
        as[0] = "_id";
        as[1] = "name";
        as[2] = "description";
        as[3] = "pic_url";
        as[4] = "contact_id";
        as[5] = "date_started";
        as[6] = "date_completed";
        mProjection = as;
    }

    private void crop(String s)
    {
        Intent intent = new Intent("com.android.camera.action.CROP");
        android.content.Context context = getApplicationContext();
        Intent intent1 = intent.setClass(context, com/nloko/android/syncmypix/graphics/CropImage);
        Uri uri = Uri.withAppendedPath(android.provider.Contacts.People.CONTENT_URI, s);
        Intent intent2 = intent.setData(uri);
        Intent intent3 = intent.putExtra("crop", "true");
        Intent intent4 = intent.putExtra("aspectX", 1);
        Intent intent5 = intent.putExtra("aspectY", 1);
        Intent intent6 = intent.putExtra("outputX", 96);
        Intent intent7 = intent.putExtra("outputY", 96);
        Intent intent8 = intent.putExtra("return-data", true);
        startActivityForResult(intent, 7);
    }

    private Uri getResultsUriFromListPosition(int i)
    {
        Cursor cursor = ((SimpleCursorAdapter)mListview.getAdapter()).getCursor();
        Uri uri;
        if(cursor != null && cursor.moveToPosition(i))
        {
            int j = cursor.getColumnIndex("_id");
            String s = cursor.getString(j);
            uri = Uri.withAppendedPath(SyncMyPix.Results.CONTENT_URI, s);
        } else
        {
            uri = null;
        }
        return uri;
    }

    private Dialog showZoomDialog()
    {
        Dialog dialog = new Dialog(this);
        boolean flag = dialog.requestWindowFeature(1);
        dialog.setContentView(0x7f03000a);
        dialog.setCancelable(true);
        ImageView imageview = (ImageView)dialog.findViewById(0x7f070008);
        int i = mContactImage.getWidth();
        int j = mContactImage.getHeight();
        int k = i;
        int l = j;
        int i1 = getWindowManager().getDefaultDisplay().getHeight();
        int j1 = getWindowManager().getDefaultDisplay().getWidth();
        boolean flag1 = false;
        if(l >= i1)
        {
            float f = k;
            float f1 = l;
            float f2 = f / f1;
            l = i1 - 15;
            k = Math.round((float)l * f2);
            flag1 = true;
        }
        if(k >= j1)
        {
            float f3 = l;
            float f4 = k;
            float f5 = f3 / f4;
            k = j1 - 15;
            l = Math.round((float)k * f5);
            flag1 = true;
        }
        Bitmap bitmap = mContactImage;
        imageview.setImageBitmap(bitmap);
        if(flag1)
        {
            Matrix matrix = new Matrix();
            float f6 = k;
            float f7 = i;
            float f8 = f6 / f7;
            float f9 = l;
            float f10 = j;
            float f11 = f9 / f10;
            boolean flag2 = matrix.postScale(f8, f11);
            imageview.setImageMatrix(matrix);
            dialog.getWindow().setLayout(k, l);
        }
        android.content.DialogInterface.OnCancelListener oncancellistener = new android.content.DialogInterface.OnCancelListener() {

            public void onCancel(DialogInterface dialoginterface)
            {
                removeDialog(1);
            }

            final SyncResultsActivity this$0;

            
            {
                this$0 = SyncResultsActivity.this;
                super();
            }
        };
        dialog.setOnCancelListener(oncancellistener);
        return dialog;
    }

    private void unlink(String s)
    {
        unlink(s, false);
    }

    private void unlink(String s, boolean flag)
    {
        if(s == null)
            return;
        ContentResolver contentresolver = getContentResolver();
        ContentValues contentvalues = new ContentValues();
        String s1 = getString(0x7f060050);
        contentvalues.put("description", s1);
        contentvalues.putNull("contact_id");
        Uri uri = SyncMyPix.Results.CONTENT_URI;
        String s2 = (new StringBuilder()).append("contact_id=").append(s).toString();
        int i = contentresolver.update(uri, contentvalues, s2, null);
        if(!flag)
        {
            return;
        } else
        {
            mDbHelper.deletePicture(s);
            Uri uri1 = Uri.withAppendedPath(SyncMyPix.Contacts.CONTENT_URI, s);
            int j = contentresolver.delete(uri1, null, null);
            return;
        }
    }

    private void updateContactWithSelection(Uri uri)
    {
        if(uri == null || mUriOfSelected == null)
        {
            Toast.makeText(getApplicationContext(), 0x7f060045, 1).show();
            return;
        }
        ContentResolver contentresolver = getContentResolver();
        Uri uri1 = uri;
        List list = uri1.getPathSegments();
        int i = list.size() - 1;
        List list1 = list;
        int j = i;
        final String contactId = (String)list1.get(j);
        ContactUtils contactutils = mContactUtils;
        ContentResolver contentresolver1 = contentresolver;
        Uri uri2 = uri1;
        final String lookup = contactutils.getLookup(contentresolver1, uri2);
        Uri uri3 = mUriOfSelected;
        String as[] = new String[5];
        as[0] = "_id";
        as[1] = "contact_id";
        as[2] = "pic_url";
        as[3] = "friend_id";
        as[4] = "source";
        Cursor cursor = contentresolver.query(uri3, as, null, null, null);
        if(cursor.moveToFirst())
        {
            SyncMyPixPreferences syncmypixpreferences = JVM INSTR new #482 <Class SyncMyPixPreferences>;
            android.content.Context context = getApplicationContext();
            SyncMyPixPreferences syncmypixpreferences1 = syncmypixpreferences;
            android.content.Context context1 = context;
            syncmypixpreferences1.SyncMyPixPreferences(context1);
            if(!mContactUtils.isContactUpdatable(contentresolver, contactId) && !syncmypixpreferences.overrideReadOnlyCheck())
            {
                Toast.makeText(getApplicationContext(), 0x7f06003b, 1).show();
                return;
            }
            SyncResultsActivity syncresultsactivity = this;
            byte byte0 = 3;
            syncresultsactivity.showDialog(byte0);
            Cursor cursor1 = cursor;
            String s = "_id";
            int k = cursor1.getColumnIndex(s);
            Cursor cursor2 = cursor;
            int l = k;
            final long id = cursor2.getLong(l);
            Cursor cursor3 = cursor;
            String s1 = "pic_url";
            int i1 = cursor3.getColumnIndex(s1);
            Cursor cursor4 = cursor;
            int j1 = i1;
            final String url = cursor4.getString(j1);
            Cursor cursor5 = cursor;
            String s2 = "friend_id";
            int k1 = cursor5.getColumnIndex(s2);
            Cursor cursor6 = cursor;
            int l1 = k1;
            final String friendId = cursor6.getString(l1);
            Cursor cursor7 = cursor;
            String s3 = "source";
            int i2 = cursor7.getColumnIndex(s3);
            Cursor cursor8 = cursor;
            int j2 = i2;
            final String source = cursor8.getString(j2);
            Cursor cursor9 = cursor;
            String s4 = "contact_id";
            int k2 = cursor9.getColumnIndex(s4);
            Cursor cursor10 = cursor;
            int l2 = k2;
            final String oldContactId = cursor10.getString(l2);
            final PhotoCache sdCache = mSdCache;
            Thread thread = JVM INSTR new #500 <Class Thread>;
            SyncResultsActivity syncresultsactivity1 = this;
            final Uri contactUri = uri1;
            final ContentResolver resolver = contentresolver;
            Runnable runnable = syncresultsactivity1. new Runnable() {

                public void run()
                {
                    String s5;
                    InputStream inputstream;
                    s5 = Uri.parse(url).getLastPathSegment();
                    inputstream = sdCache.get(s5);
                    if(inputstream == null)
                        inputstream = Utils.downloadPictureAsStream(url);
                    if(inputstream == null) goto _L2; else goto _L1
_L1:
                    byte abyte0[] = Utils.getByteArrayFromInputStream(inputstream);
                    inputstream.close();
                    sdCache.add(s5, abyte0);
                    int i3 = abyte0.length;
                    Bitmap bitmap = BitmapFactory.decodeByteArray(abyte0, 0, i3);
                    ThumbnailCache thumbnailcache = mCache;
                    String s6 = url;
                    thumbnailcache.add(s6, bitmap);
                    String s7 = Utils.getMd5Hash(abyte0);
                    byte abyte1[] = Utils.bitmapToPNG(bitmap);
                    String s8 = Utils.getMd5Hash(abyte1);
                    bitmap.recycle();
                    String s9 = contactUri.toString();
                    Log.d("SyncResults", s9);
                    SyncResultsActivity syncresultsactivity2 = SyncResultsActivity.this;
                    String s10 = contactId;
                    syncresultsactivity2.unlink(s10);
                    if(oldContactId != null)
                    {
                        SyncResultsActivity syncresultsactivity3 = SyncResultsActivity.this;
                        String s11 = oldContactId;
                        syncresultsactivity3.unlink(s11, true);
                    }
                    ContactUtils contactutils1 = mContactUtils;
                    ContentResolver contentresolver2 = resolver;
                    String s12 = contactId;
                    contactutils1.updatePhoto(contentresolver2, abyte1, s12);
                    SyncMyPixDbHelper syncmypixdbhelper = mDbHelper;
                    String s13 = contactId;
                    String s14 = lookup;
                    syncmypixdbhelper.updateHashes(s13, s14, s7, s8);
                    if(friendId != null && !friendId.equals(""))
                    {
                        SyncMyPixDbHelper syncmypixdbhelper1 = mDbHelper;
                        String s15 = contactId;
                        String s16 = lookup;
                        String s17 = friendId;
                        String s18 = source;
                        syncmypixdbhelper1.updateLink(s15, s16, s17, s18);
                    }
                    ContentValues contentvalues = new ContentValues();
                    String s19 = getString(0x7f060051);
                    contentvalues.put("description", s19);
                    Long long1 = Long.valueOf(Long.parseLong(contactId));
                    contentvalues.put("contact_id", long1);
                    ContentResolver contentresolver3 = resolver;
                    Uri uri4 = SyncMyPix.Results.CONTENT_URI;
                    String s20 = Long.toString(id);
                    Uri uri5 = Uri.withAppendedPath(uri4, s20);
                    int j3 = contentresolver3.update(uri5, contentvalues, null, null);
                    SyncResultsActivity syncresultsactivity4 = SyncResultsActivity.this;
                    Runnable runnable2 = new Runnable() {

                        public void run()
                        {
                            SyncResultsActivity syncresultsactivity9 = _fld0;
                            String s21 = contactId;
                            syncresultsactivity9.crop(s21);
                        }

                        final _cls9 this$1;

                    
                    {
                        this$1 = _cls9.this;
                        super();
                    }
                    };
                    syncresultsactivity4.runOnUiThread(runnable2);
_L4:
                    SyncResultsActivity syncresultsactivity5 = SyncResultsActivity.this;
                    Runnable runnable3 = new Runnable() {

                        public void run()
                        {
                            try
                            {
                                dismissDialog(3);
                                return;
                            }
                            catch(IllegalArgumentException illegalargumentexception)
                            {
                                return;
                            }
                        }

                        final _cls9 this$1;

                    
                    {
                        this$1 = _cls9.this;
                        super();
                    }
                    };
                    syncresultsactivity5.runOnUiThread(runnable3);
                    return;
_L2:
                    boolean flag = mMainHandler.sendEmptyMessage(3);
                    if(true) goto _L4; else goto _L3
_L3:
                    UnknownHostException unknownhostexception;
                    unknownhostexception;
                    unknownhostexception.printStackTrace();
                    boolean flag1 = mMainHandler.sendEmptyMessage(2);
                    SyncResultsActivity syncresultsactivity6 = SyncResultsActivity.this;
                    Runnable runnable4 = new _cls2();
                    syncresultsactivity6.runOnUiThread(runnable4);
                    return;
                    Exception exception;
                    exception;
                    exception.printStackTrace();
                    boolean flag2 = mMainHandler.sendEmptyMessage(3);
                    SyncResultsActivity syncresultsactivity7 = SyncResultsActivity.this;
                    Runnable runnable5 = new _cls2();
                    syncresultsactivity7.runOnUiThread(runnable5);
                    return;
                    Exception exception1;
                    exception1;
                    SyncResultsActivity syncresultsactivity8 = SyncResultsActivity.this;
                    Runnable runnable6 = new _cls2();
                    syncresultsactivity8.runOnUiThread(runnable6);
                    throw exception1;
                }

                final SyncResultsActivity this$0;
                final String val$contactId;
                final Uri val$contactUri;
                final String val$friendId;
                final long val$id;
                final String val$lookup;
                final String val$oldContactId;
                final ContentResolver val$resolver;
                final PhotoCache val$sdCache;
                final String val$source;
                final String val$url;

            
            {
                this$0 = SyncResultsActivity.this;
                url = s;
                sdCache = photocache;
                contactUri = uri;
                contactId = s1;
                oldContactId = s2;
                resolver = contentresolver;
                lookup = s3;
                friendId = s4;
                source = s5;
                id = l;
                super();
            }
            };
            Thread thread1 = thread;
            Runnable runnable1 = runnable;
            thread1.Thread(runnable1);
            thread.start();
        }
        cursor.close();
    }

    protected void finalize()
        throws Throwable
    {
        super.finalize();
        Log.d("SyncResults", "FINALIZED");
    }

    protected void onActivityResult(int i, int j, Intent intent)
    {
        super.onActivityResult(i, j, intent);
        int k = j;
        byte byte0 = -1;
        if(k != byte0)
            return;
        switch(i)
        {
        default:
            return;

        case 6: // '\006'
            Uri uri = intent.getData();
            SyncResultsActivity syncresultsactivity = this;
            Uri uri1 = uri;
            syncresultsactivity.updateContactWithSelection(uri1);
            return;

        case 7: // '\007'
            break;
        }
        if(mUriOfSelected == null)
            return;
        ContentResolver contentresolver = getContentResolver();
        Uri uri2 = mUriOfSelected;
        String as[] = new String[3];
        as[0] = "contact_id";
        as[1] = "pic_url";
        as[2] = "lookup_key";
        Cursor cursor = contentresolver.query(uri2, as, null, null, null);
        ResultsListAdapter resultslistadapter = (ResultsListAdapter)mListview.getAdapter();
        if(cursor.moveToFirst())
        {
            int l = cursor.getColumnIndex("contact_id");
            String s = cursor.getString(l);
            int i1 = cursor.getColumnIndex("pic_url");
            String s1 = cursor.getString(i1);
            int j1 = cursor.getColumnIndex("lookup_key");
            String s2 = cursor.getString(j1);
            Intent intent1 = intent;
            String s3 = "data";
            Bitmap bitmap = (Bitmap)intent1.getParcelableExtra(s3);
            if(bitmap != null)
            {
                byte abyte0[] = Utils.bitmapToPNG(bitmap);
                ContactUtils contactutils = mContactUtils;
                ContentResolver contentresolver1 = getContentResolver();
                contactutils.updatePhoto(contentresolver1, abyte0, s);
                mDbHelper.updateHashes(s, s2, null, abyte0);
                mCache.add(s1, bitmap);
                resultslistadapter.notifyDataSetChanged();
            }
        }
        cursor.close();
    }

    public boolean onContextItemSelected(MenuItem menuitem)
    {
        android.widget.AdapterView.AdapterContextMenuInfo adaptercontextmenuinfo = (android.widget.AdapterView.AdapterContextMenuInfo)menuitem.getMenuInfo();
        menuitem.getItemId();
        JVM INSTR tableswitch 3 6: default 48
    //                   3 211
    //                   4 155
    //                   5 56
    //                   6 305;
           goto _L1 _L2 _L3 _L4 _L5
_L1:
        boolean flag = super.onContextItemSelected(menuitem);
_L7:
        return flag;
_L4:
        int i = adaptercontextmenuinfo.position;
        Cursor cursor = ((SimpleCursorAdapter)mListview.getAdapter()).getCursor();
        if(cursor.moveToPosition(i))
        {
            int j = cursor.getColumnIndex("contact_id");
            String s = cursor.getString(j);
            if(s != null)
            {
                Uri uri = Uri.withAppendedPath(mContactUtils.getContentUri(), s);
                Intent intent = new Intent("android.intent.action.VIEW", uri);
                startActivity(intent);
            }
        }
        flag = true;
        continue; /* Loop/switch isn't completed */
_L3:
        int k = adaptercontextmenuinfo.position;
        Uri uri1 = getResultsUriFromListPosition(k);
        mUriOfSelected = uri1;
        Uri uri2 = mContactUtils.getContentUri();
        Intent intent1 = new Intent("android.intent.action.PICK", uri2);
        startActivityForResult(intent1, 6);
        flag = true;
        continue; /* Loop/switch isn't completed */
_L2:
        int l = adaptercontextmenuinfo.position;
        Uri uri3 = getResultsUriFromListPosition(l);
        mUriOfSelected = uri3;
        Cursor cursor1 = ((SimpleCursorAdapter)mListview.getAdapter()).getCursor();
        if(cursor1.moveToPosition(l))
        {
            int i1 = cursor1.getColumnIndex("contact_id");
            String s1 = cursor1.getString(i1);
            Uri uri4 = Uri.withAppendedPath(mContactUtils.getContentUri(), s1);
            updateContactWithSelection(uri4);
        }
        flag = true;
        continue; /* Loop/switch isn't completed */
_L5:
        int j1 = adaptercontextmenuinfo.position;
        Uri uri5 = getResultsUriFromListPosition(j1);
        mUriOfSelected = uri5;
        Cursor cursor2 = ((SimpleCursorAdapter)mListview.getAdapter()).getCursor();
        if(cursor2.moveToPosition(j1))
        {
            int k1 = cursor2.getColumnIndex("contact_id");
            String s2 = cursor2.getString(k1);
            unlink(s2, true);
        }
        flag = true;
        if(true) goto _L7; else goto _L6
_L6:
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        setContentView(0x7f030005);
        ContactUtils contactutils = new ContactUtils();
        mContactUtils = contactutils;
        android.content.Context context = getApplicationContext();
        PhotoCache photocache = new PhotoCache(context);
        mSdCache = photocache;
        Bitmap bitmap = BitmapFactory.decodeResource(getResources(), 0x7f020006);
        mCache.setDefaultImage(bitmap);
        android.content.Context context1 = getApplicationContext();
        SyncMyPixDbHelper syncmypixdbhelper = new SyncMyPixDbHelper(context1);
        mDbHelper = syncmypixdbhelper;
        Uri uri = SyncMyPix.Results.CONTENT_URI;
        String as[] = mProjection;
        SyncResultsActivity syncresultsactivity = this;
        String as1[] = null;
        Cursor cursor = syncresultsactivity.managedQuery(uri, as, null, as1, "name ASC");
        ProgressBar progressbar = (ProgressBar)findViewById(0x7f070035);
        mProgress = progressbar;
        mProgress.setVisibility(0);
        ListView listview = (ListView)findViewById(0x7f070021);
        mListview = listview;
        String as2[] = new String[2];
        as2[0] = "name";
        as2[1] = "description";
        int ai[] = {
            0x7f070024, 0x7f070023
        };
        SyncResultsActivity syncresultsactivity1 = this;
        ResultsListAdapter resultslistadapter = new ResultsListAdapter(syncresultsactivity1, 0x7f030006, cursor, as2, ai);
        mListview.setAdapter(resultslistadapter);
        ThumbnailCache thumbnailcache = mCache;
        com.nloko.android.ThumbnailCache.ImageProvider imageprovider = new com.nloko.android.ThumbnailCache.ImageProvider() {

            public boolean onImageRequired(String s)
            {
                boolean flag1;
                if(mThumbnailHandler != null)
                {
                    Message message = mThumbnailHandler.obtainMessage();
                    message.obj = s;
                    boolean flag = mThumbnailHandler.sendMessage(message);
                    flag1 = true;
                } else
                {
                    flag1 = false;
                }
                return flag1;
            }

            final SyncResultsActivity this$0;

            
            {
                this$0 = SyncResultsActivity.this;
                super();
            }
        };
        thumbnailcache.setImageProvider(imageprovider);
        ThumbnailCache thumbnailcache1 = mCache;
        com.nloko.android.ThumbnailCache.ImageListener imagelistener = new com.nloko.android.ThumbnailCache.ImageListener() {

            public void onImageReady(final String url)
            {
                if(mListview == null)
                {
                    return;
                } else
                {
                    final ImageView image = (ImageView)mListview.findViewWithTag(url);
                    SyncResultsActivity syncresultsactivity2 = SyncResultsActivity.this;
                    Runnable runnable = new Runnable() {

                        public void run()
                        {
                            if(mListview == null)
                                return;
                            if(mCache != null && image != null)
                            {
                                ImageView imageview = image;
                                ThumbnailCache thumbnailcache2 = mCache;
                                String s = url;
                                Bitmap bitmap1 = thumbnailcache2.get(s);
                                imageview.setImageBitmap(bitmap1);
                            } else
                            {
                                ((SimpleCursorAdapter)mListview.getAdapter()).notifyDataSetChanged();
                            }
                            mListview.invalidateViews();
                        }

                        final _cls2 this$1;
                        final ImageView val$image;
                        final String val$url;

                    
                    {
                        this$1 = _cls2.this;
                        image = imageview;
                        url = s;
                        super();
                    }
                    };
                    syncresultsactivity2.runOnUiThread(runnable);
                    return;
                }
            }

            final SyncResultsActivity this$0;

            
            {
                this$0 = SyncResultsActivity.this;
                super();
            }
        };
        thumbnailcache1.setImageListener(imagelistener);
        ListView listview1 = mListview;
        android.widget.AdapterView.OnItemLongClickListener onitemlongclicklistener = new android.widget.AdapterView.OnItemLongClickListener() {

            public boolean onItemLongClick(AdapterView adapterview, View view, int i, long l)
            {
                return false;
            }

            final SyncResultsActivity this$0;

            
            {
                this$0 = SyncResultsActivity.this;
                super();
            }
        };
        listview1.setOnItemLongClickListener(onitemlongclicklistener);
        ListView listview2 = mListview;
        android.widget.AdapterView.OnItemClickListener onitemclicklistener = new android.widget.AdapterView.OnItemClickListener() {

            public void onItemClick(AdapterView adapterview, View view, int i, long l)
            {
                Cursor cursor1 = ((SimpleCursorAdapter)mListview.getAdapter()).getCursor();
                boolean flag = cursor1.moveToPosition(i);
                int j = cursor1.getColumnIndex("pic_url");
                String s = cursor1.getString(j);
                if(s == null)
                {
                    return;
                } else
                {
                    mProgress.setVisibility(0);
                    Message message = mDownloadHandler.obtainMessage();
                    message.what = 1;
                    message.obj = s;
                    boolean flag1 = mDownloadHandler.sendMessage(message);
                    return;
                }
            }

            final SyncResultsActivity this$0;

            
            {
                this$0 = SyncResultsActivity.this;
                super();
            }
        };
        listview2.setOnItemClickListener(onitemclicklistener);
        ListView listview3 = mListview;
        android.view.View.OnCreateContextMenuListener oncreatecontextmenulistener = new android.view.View.OnCreateContextMenuListener() {

            public void onCreateContextMenu(ContextMenu contextmenu, View view, android.view.ContextMenu.ContextMenuInfo contextmenuinfo)
            {
                int i = ((android.widget.AdapterView.AdapterContextMenuInfo)contextmenuinfo).position;
                Cursor cursor1 = ((SimpleCursorAdapter)mListview.getAdapter()).getCursor();
                if(!cursor1.moveToPosition(i))
                    return;
                int j = cursor1.getColumnIndex("contact_id");
                String s = cursor1.getString(j);
                int k = cursor1.getColumnIndex("pic_url");
                String s1 = cursor1.getString(k);
                int l = cursor1.getColumnIndex("name");
                String s2 = cursor1.getString(l);
                if(s1 == null)
                    return;
                ContextMenu contextmenu1 = contextmenu.setHeaderTitle(s2);
                if(s != null)
                {
                    MenuItem menuitem = contextmenu.add(0, 5, 0, 0x7f060035);
                    MenuItem menuitem1 = contextmenu.add(0, 3, 0, 0x7f060036);
                    MenuItem menuitem2 = contextmenu.add(0, 6, 0, 0x7f060038);
                }
                MenuItem menuitem3 = contextmenu.add(0, 4, 0, 0x7f060037);
            }

            final SyncResultsActivity this$0;

            
            {
                this$0 = SyncResultsActivity.this;
                super();
            }
        };
        listview3.setOnCreateContextMenuListener(oncreatecontextmenulistener);
        ImageButton imagebutton = (ImageButton)findViewById(0x7f070019);
        mHomeButton = imagebutton;
        ImageButton imagebutton1 = mHomeButton;
        android.view.View.OnClickListener onclicklistener = new android.view.View.OnClickListener() {

            public void onClick(View view)
            {
                android.content.Context context2 = getApplicationContext();
                Intent intent = new Intent(context2, com/nloko/android/syncmypix/MainActivity);
                Intent intent1 = intent.addFlags(0x20020000);
                startActivity(intent);
                finish();
            }

            final SyncResultsActivity this$0;

            
            {
                this$0 = SyncResultsActivity.this;
                super();
            }
        };
        imagebutton1.setOnClickListener(onclicklistener);
        ImageButton imagebutton2 = (ImageButton)findViewById(0x7f070018);
        mHelpButton = imagebutton2;
        ImageButton imagebutton3 = mHelpButton;
        android.view.View.OnClickListener onclicklistener1 = new android.view.View.OnClickListener() {

            public void onClick(View view)
            {
                Uri uri1 = Uri.parse(getString(0x7f06005b));
                Intent intent = new Intent("android.intent.action.VIEW", uri1);
                startActivity(intent);
            }

            final SyncResultsActivity this$0;

            
            {
                this$0 = SyncResultsActivity.this;
                super();
            }
        };
        imagebutton3.setOnClickListener(onclicklistener1);
        ImageButton imagebutton4 = (ImageButton)findViewById(0x7f070017);
        mDeleteButton = imagebutton4;
        ImageButton imagebutton5 = mDeleteButton;
        android.view.View.OnClickListener onclicklistener2 = new android.view.View.OnClickListener() {

            public void onClick(View view)
            {
                showDialog(5);
            }

            final SyncResultsActivity this$0;

            
            {
                this$0 = SyncResultsActivity.this;
                super();
            }
        };
        imagebutton5.setOnClickListener(onclicklistener2);
        MainHandler mainhandler = new MainHandler(this);
        mMainHandler = mainhandler;
    }

    protected Dialog onCreateDialog(int i)
    {
        i;
        JVM INSTR tableswitch 1 6: default 40
    //                   1 48
    //                   2 40
    //                   3 63
    //                   4 40
    //                   5 102
    //                   6 191;
           goto _L1 _L2 _L1 _L3 _L1 _L4 _L5
_L5:
        break MISSING_BLOCK_LABEL_191;
_L1:
        Object obj = super.onCreateDialog(i);
_L7:
        return ((Dialog) (obj));
_L2:
        if(mContactImage == null) goto _L1; else goto _L6
_L6:
        obj = showZoomDialog();
          goto _L7
_L3:
        ProgressDialog progressdialog = new ProgressDialog(this);
        progressdialog.setCancelable(false);
        String s = getString(0x7f06003f);
        progressdialog.setMessage(s);
        progressdialog.setProgressStyle(0);
        obj = progressdialog;
          goto _L7
_L4:
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(this);
        android.app.AlertDialog.Builder builder1 = builder.setTitle(0x7f060041).setIcon(0x1080027).setMessage(0x7f060042).setCancelable(false);
        android.content.DialogInterface.OnClickListener onclicklistener = new android.content.DialogInterface.OnClickListener() {

            public void onClick(DialogInterface dialoginterface, int j)
            {
                removeDialog(5);
                showDialog(6);
                SyncMyPixDbHelper syncmypixdbhelper = mDbHelper;
                DbHelperNotifier dbhelpernotifier = new DbHelperNotifier() {

                    public void onUpdateComplete()
                    {
                        SyncResultsActivity syncresultsactivity = _fld0;
                        Runnable runnable = new Runnable() {

                            public void run()
                            {
                                dismissDialog(6);
                                Toast.makeText(getApplicationContext(), 0x7f060044, 1).show();
                                finish();
                            }

                            final _cls1 this$2;

                        
                        {
                            this$2 = _cls1.this;
                            super();
                        }
                        };
                        syncresultsactivity.runOnUiThread(runnable);
                    }

                    final _cls12 this$1;

                    
                    {
                        this$1 = _cls12.this;
                        super();
                    }
                };
                syncmypixdbhelper.deleteAllPictures(dbhelpernotifier);
            }

            final SyncResultsActivity this$0;

            
            {
                this$0 = SyncResultsActivity.this;
                super();
            }
        };
        android.app.AlertDialog.Builder builder2 = builder1.setPositiveButton("Yes", onclicklistener);
        android.content.DialogInterface.OnClickListener onclicklistener1 = new android.content.DialogInterface.OnClickListener() {

            public void onClick(DialogInterface dialoginterface, int j)
            {
                removeDialog(5);
            }

            final SyncResultsActivity this$0;

            
            {
                this$0 = SyncResultsActivity.this;
                super();
            }
        };
        android.app.AlertDialog.Builder builder3 = builder2.setNegativeButton("No", onclicklistener1);
        obj = builder.create();
          goto _L7
        ProgressDialog progressdialog1 = new ProgressDialog(this);
        progressdialog1.setCancelable(false);
        String s1 = getString(0x7f060043);
        progressdialog1.setMessage(s1);
        progressdialog1.setProgressStyle(0);
        obj = progressdialog1;
          goto _L7
    }

    public boolean onCreateOptionsMenu(Menu menu)
    {
        SubMenu submenu = menu.addSubMenu(0, 1, 0, 0x7f06003c);
        MenuItem menuitem = submenu.add(0, 2, 0, "All");
        MenuItem menuitem1 = submenu.add(0, 6, 0, "Errors");
        MenuItem menuitem2 = submenu.add(0, 3, 0, "Not found");
        MenuItem menuitem3 = submenu.add(0, 5, 0, "Skipped");
        MenuItem menuitem4 = submenu.add(0, 4, 0, "Updated");
        SubMenu submenu1 = submenu.setIcon(0x108009c);
        return true;
    }

    protected void onDestroy()
    {
        Log.d("SyncResults", "onDestroy");
        super.onDestroy();
        if(mThumbnailHandler != null)
            mThumbnailHandler.stopRunning();
        mCache.destroy();
        if(mSdCache == null)
        {
            return;
        } else
        {
            mSdCache.releaseResources();
            return;
        }
    }

    public void onLowMemory()
    {
        super.onLowMemory();
        if(mCache == null)
        {
            return;
        } else
        {
            mCache.empty();
            return;
        }
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        SimpleCursorAdapter simplecursoradapter = (SimpleCursorAdapter)mListview.getAdapter();
        menuitem.getItemId();
        JVM INSTR tableswitch 2 6: default 52
    //                   2 56
    //                   3 159
    //                   4 219
    //                   5 309
    //                   6 69;
           goto _L1 _L2 _L3 _L4 _L5 _L6
_L1:
        boolean flag = false;
_L8:
        return flag;
_L2:
        simplecursoradapter.getFilter().filter(null);
        flag = true;
        continue; /* Loop/switch isn't completed */
_L6:
        Filter filter = simplecursoradapter.getFilter();
        StringBuilder stringbuilder = (new StringBuilder()).append("'");
        String s = getString(0x7f060057);
        StringBuilder stringbuilder1 = stringbuilder.append(s).append("',").append("'");
        String s1 = getString(0x7f060056);
        String s2 = stringbuilder1.append(s1).append("'").toString();
        filter.filter(s2);
        flag = true;
        continue; /* Loop/switch isn't completed */
_L3:
        Filter filter1 = simplecursoradapter.getFilter();
        StringBuilder stringbuilder2 = (new StringBuilder()).append("'");
        String s3 = getString(0x7f060050);
        String s4 = stringbuilder2.append(s3).append("'").toString();
        filter1.filter(s4);
        flag = true;
        continue; /* Loop/switch isn't completed */
_L4:
        Filter filter2 = simplecursoradapter.getFilter();
        StringBuilder stringbuilder3 = (new StringBuilder()).append("'");
        String s5 = getString(0x7f060051);
        StringBuilder stringbuilder4 = stringbuilder3.append(s5).append("',").append("'");
        String s6 = getString(0x7f060055);
        String s7 = stringbuilder4.append(s6).append("'").toString();
        filter2.filter(s7);
        flag = true;
        continue; /* Loop/switch isn't completed */
_L5:
        Filter filter3 = simplecursoradapter.getFilter();
        StringBuilder stringbuilder5 = (new StringBuilder()).append("'");
        String s8 = getString(0x7f060052);
        StringBuilder stringbuilder6 = stringbuilder5.append(s8).append("',").append("'");
        String s9 = getString(0x7f060054);
        StringBuilder stringbuilder7 = stringbuilder6.append(s9).append("',").append("'");
        String s10 = getString(0x7f060053);
        String s11 = stringbuilder7.append(s10).append("'").toString();
        filter3.filter(s11);
        flag = true;
        if(true) goto _L8; else goto _L7
_L7:
    }

    protected void onPause()
    {
        super.onPause();
        if(mCache != null)
        {
            mCache.togglePauseOnDownloader(true);
            mCache.empty();
        }
        if(mDownloadHandler != null)
            mDownloadHandler.stopRunning();
        if(mInitResultsThread == null)
        {
            return;
        } else
        {
            mInitResultsThread.stopRunning();
            return;
        }
    }

    protected void onResume()
    {
        super.onResume();
        HandlerThread handlerthread = new HandlerThread("ImageDownload");
        handlerthread.start();
        Looper looper = handlerthread.getLooper();
        DownloadImageHandler downloadimagehandler = new DownloadImageHandler(this, looper);
        mDownloadHandler = downloadimagehandler;
        if(mInitResultsThread == null)
        {
            InitializeResultsThread initializeresultsthread = new InitializeResultsThread(this);
            mInitResultsThread = initializeresultsthread;
            mInitResultsThread.start();
        }
        if(mThumbnailHandler == null)
        {
            HandlerThread handlerthread1 = new HandlerThread("Thumbnail");
            handlerthread1.start();
            Looper looper1 = handlerthread1.getLooper();
            ThumbnailHandler thumbnailhandler = new ThumbnailHandler(this, looper1);
            mThumbnailHandler = thumbnailhandler;
        }
        mCache.togglePauseOnDownloader(false);
        ((NotificationManager)getSystemService("notification")).cancel(0x7f060049);
    }

    private static final String TAG = "SyncResults";
    private final int CONTEXTMENU_CROP = 3;
    private final int CONTEXTMENU_SELECT_CONTACT = 4;
    private final int CONTEXTMENU_UNLINK = 6;
    private final int CONTEXTMENU_VIEW_CONTACT = 5;
    private final int DELETE_DIALOG = 5;
    private final int DELETING = 6;
    private final int HELP_DIALOG = 4;
    private final int MENU_FILTER = 1;
    private final int MENU_FILTER_ALL = 2;
    private final int MENU_FILTER_ERROR = 6;
    private final int MENU_FILTER_NOTFOUND = 3;
    private final int MENU_FILTER_SKIPPED = 5;
    private final int MENU_FILTER_UPDATED = 4;
    private final int PICK_CONTACT = 6;
    private final int REQUEST_CROP_PHOTO = 7;
    private final int UPDATE_CONTACT = 3;
    private final int ZOOM_PIC = 1;
    private final ThumbnailCache mCache;
    private Bitmap mContactImage;
    private ContactUtils mContactUtils;
    private SyncMyPixDbHelper mDbHelper;
    private ImageButton mDeleteButton;
    private DownloadImageHandler mDownloadHandler;
    private ImageButton mHelpButton;
    private ImageButton mHomeButton;
    private InitializeResultsThread mInitResultsThread;
    private ListView mListview;
    private Handler mMainHandler;
    private ProgressBar mProgress;
    private final String mProjection[];
    private PhotoCache mSdCache;
    private ThumbnailHandler mThumbnailHandler;
    private Uri mUriOfSelected;











/*
    static Bitmap access$502(SyncResultsActivity syncresultsactivity, Bitmap bitmap)
    {
        syncresultsactivity.mContactImage = bitmap;
        return bitmap;
    }

*/




}

// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncResultsActivity.java

package com.nloko.android.syncmypix;

import Lcom.nloko.android.syncmypix.SyncResultsActivity;;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Handler;
import com.nloko.android.*;
import com.nloko.android.syncmypix.contactutils.ContactUtils;
import java.io.InputStream;
import java.net.UnknownHostException;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncResultsActivity, SyncMyPixDbHelper

class val.id
    implements Runnable
{

    public void run()
    {
        String s;
        InputStream inputstream;
        s = Uri.parse(val$url).getLastPathSegment();
        inputstream = val$sdCache.get(s);
        if(inputstream == null)
            inputstream = Utils.downloadPictureAsStream(val$url);
        if(inputstream == null) goto _L2; else goto _L1
_L1:
        byte abyte0[] = Utils.getByteArrayFromInputStream(inputstream);
        inputstream.close();
        val$sdCache.add(s, abyte0);
        int i = abyte0.length;
        Bitmap bitmap = BitmapFactory.decodeByteArray(abyte0, 0, i);
        ThumbnailCache thumbnailcache = SyncResultsActivity.access$200(SyncResultsActivity.this);
        String s1 = val$url;
        thumbnailcache.add(s1, bitmap);
        String s2 = Utils.getMd5Hash(abyte0);
        byte abyte1[] = Utils.bitmapToPNG(bitmap);
        String s3 = Utils.getMd5Hash(abyte1);
        bitmap.recycle();
        String s4 = val$contactUri.toString();
        Log.d("SyncResults", s4);
        SyncResultsActivity syncresultsactivity = SyncResultsActivity.this;
        String s5 = val$contactId;
        SyncResultsActivity.access$600(syncresultsactivity, s5);
        if(val$oldContactId != null)
        {
            SyncResultsActivity syncresultsactivity1 = SyncResultsActivity.this;
            String s6 = val$oldContactId;
            SyncResultsActivity.access$700(syncresultsactivity1, s6, true);
        }
        ContactUtils contactutils = SyncResultsActivity.access$800(SyncResultsActivity.this);
        ContentResolver contentresolver = val$resolver;
        String s7 = val$contactId;
        contactutils.updatePhoto(contentresolver, abyte1, s7);
        SyncMyPixDbHelper syncmypixdbhelper = SyncResultsActivity.access$900(SyncResultsActivity.this);
        String s8 = val$contactId;
        String s9 = val$lookup;
        syncmypixdbhelper.updateHashes(s8, s9, s2, s3);
        if(val$friendId != null && !val$friendId.equals(""))
        {
            SyncMyPixDbHelper syncmypixdbhelper1 = SyncResultsActivity.access$900(SyncResultsActivity.this);
            String s10 = val$contactId;
            String s11 = val$lookup;
            String s12 = val$friendId;
            String s13 = val$source;
            syncmypixdbhelper1.updateLink(s10, s11, s12, s13);
        }
        ContentValues contentvalues = new ContentValues();
        String s14 = getString(0x7f060051);
        contentvalues.put("description", s14);
        Long long1 = Long.valueOf(Long.parseLong(val$contactId));
        contentvalues.put("contact_id", long1);
        ContentResolver contentresolver1 = val$resolver;
        Uri uri = ENT_URI;
        String s15 = Long.toString(val$id);
        Uri uri1 = Uri.withAppendedPath(uri, s15);
        int j = contentresolver1.update(uri1, contentvalues, null, null);
        SyncResultsActivity syncresultsactivity2 = SyncResultsActivity.this;
        _cls1 _lcls1 = new  Object()     /* anonymous class not found */
    class _anm1 {}

;
        syncresultsactivity2.runOnUiThread(_lcls1);
_L4:
        SyncResultsActivity syncresultsactivity3 = SyncResultsActivity.this;
        _cls2 _lcls2 = new  Object()     /* anonymous class not found */
    class _anm2 {}

;
        syncresultsactivity3.runOnUiThread(_lcls2);
        return;
_L2:
        boolean flag = SyncResultsActivity.access$1100(SyncResultsActivity.this).sendEmptyMessage(3);
        if(true) goto _L4; else goto _L3
_L3:
        UnknownHostException unknownhostexception;
        unknownhostexception;
        unknownhostexception.printStackTrace();
        boolean flag1 = SyncResultsActivity.access$1100(SyncResultsActivity.this).sendEmptyMessage(2);
        SyncResultsActivity syncresultsactivity4 = SyncResultsActivity.this;
        _cls2 _lcls2_1 = new _cls2();
        syncresultsactivity4.runOnUiThread(_lcls2_1);
        return;
        Exception exception;
        exception;
        exception.printStackTrace();
        boolean flag2 = SyncResultsActivity.access$1100(SyncResultsActivity.this).sendEmptyMessage(3);
        SyncResultsActivity syncresultsactivity5 = SyncResultsActivity.this;
        _cls2 _lcls2_2 = new _cls2();
        syncresultsactivity5.runOnUiThread(_lcls2_2);
        return;
        Exception exception1;
        exception1;
        SyncResultsActivity syncresultsactivity6 = SyncResultsActivity.this;
        _cls2 _lcls2_3 = new _cls2();
        syncresultsactivity6.runOnUiThread(_lcls2_3);
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

    ils()
    {
        this$0 = final_syncresultsactivity;
        val$url = s;
        val$sdCache = photocache;
        val$contactUri = uri;
        val$contactId = s1;
        val$oldContactId = s2;
        val$resolver = contentresolver;
        val$lookup = s3;
        val$friendId = s4;
        val$source = s5;
        val$id = J.this;
        super();
    }
}

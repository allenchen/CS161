// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncService.java

package com.nloko.android.syncmypix;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.AsyncTask;
import com.nloko.android.Log;
import com.nloko.android.PhotoCache;
import com.nloko.android.Utils;
import com.nloko.android.syncmypix.contactutils.ContactUtils;
import com.nloko.android.syncmypix.namematcher.NameMatcher;
import com.nloko.android.syncmypix.namematcher.NameMatcherFactory;
import java.io.IOException;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.util.List;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncService, SyncMyPixDbHelper, SocialNetworkUser, PhoneContact, 
//            SyncResultsActivity, SyncServiceListener

private static class Preferences extends AsyncTask
{

    private void addResult(ContentValues contentvalues)
    {
        SyncService syncservice = (SyncService)mService.get();
        if(syncservice == null)
            return;
        boolean flag;
        synchronized(SyncService.access$200(syncservice))
        {
            flag = SyncService.access$200(syncservice).add(contentvalues);
        }
    }

    private ContentValues createResult(String s, SocialNetworkUser socialnetworkuser)
    {
        SyncService syncservice = (SyncService)mService.get();
        ContentValues contentvalues = new ContentValues();
        contentvalues.put("sync_id", s);
        String s1 = socialnetworkuser.name;
        contentvalues.put("name", s1);
        String s2 = socialnetworkuser.picUrl;
        contentvalues.put("pic_url", s2);
        String s3 = socialnetworkuser.uid;
        contentvalues.put("friend_id", s3);
        String s4;
        if(syncservice == null)
            s4 = "";
        else
            s4 = syncservice.getString(0x7f060051);
        contentvalues.put("description", s4);
        return contentvalues;
    }

    private void processUser(SocialNetworkUser socialnetworkuser, PhoneContact phonecontact, Uri uri)
    {
        final SyncService service;
        ContentResolver contentresolver;
        String s9;
        String s10;
        String s11;
        byte abyte0[];
        String s22;
        String s23;
        final ContentValues valuesCopy;
        ContentValues contentvalues;
        String s12;
label0:
        {
            if(socialnetworkuser == null)
                throw new IllegalArgumentException("user");
            if(uri == null)
                throw new IllegalArgumentException("sync");
            service = (SyncService)mService.get();
            if(service == null)
                return;
            contentresolver = service.getContentResolver();
            if(contentresolver == null)
                return;
            Object aobj[] = new Object[3];
            String s = socialnetworkuser.name;
            aobj[0] = s;
            String s1 = socialnetworkuser.email;
            aobj[1] = s1;
            String s2 = socialnetworkuser.picUrl;
            aobj[2] = s2;
            String s3 = String.format("%s %s %s", aobj);
            Log.i("SyncService", s3);
            String s4 = (String)uri.getPathSegments().get(1);
              = this;
            String s5 = s4;
            SocialNetworkUser socialnetworkuser1 = socialnetworkuser;
            contentvalues = .createResult(s5, socialnetworkuser1);
            if(socialnetworkuser.picUrl == null)
            {
                int i = mNotFound + 1;
                mNotFound = i;
                String s6 = service.getString(0x7f060058);
                ContentValues contentvalues1 = contentvalues;
                String s7 = "description";
                String s8 = s6;
                contentvalues1.put(s7, s8);
                 1 = this;
                ContentValues contentvalues2 = contentvalues;
                1.addResult(contentvalues2);
                return;
            }
            s9 = null;
            s10 = null;
            s11 = null;
            s12 = null;
            if(phonecontact != null)
            {
                s11 = phonecontact.id;
                s9 = s11;
                s12 = phonecontact.name;
                ContactUtils contactutils = mContactUtils;
                String s13 = phonecontact.id;
                String s14 = phonecontact.lookup;
                ContactUtils contactutils1 = contactutils;
                ContentResolver contentresolver1 = contentresolver;
                String s15 = s13;
                String s16 = s14;
                phonecontact = contactutils1.confirmContact(contentresolver1, s15, s16);
                if(phonecontact != null)
                {
                    s11 = phonecontact.id;
                    s10 = phonecontact.lookup;
                }
            }
            if(phonecontact != null)
            {
                ContactUtils contactutils2 = mContactUtils;
                ContentResolver contentresolver2 = contentresolver;
                String s17 = s11;
                if(contactutils2.isContactUpdatable(contentresolver2, s17) || service.mOverrideReadOnlyCheck)
                    break label0;
            }
            Log.d("SyncService", "Contact not found in database.");
            int j = mNotFound + 1;
            mNotFound = j;
            String s18 = service.getString(0x7f060050);
            ContentValues contentvalues3 = contentvalues;
            String s19 = "description";
            String s20 = s18;
            contentvalues3.put(s19, s20);
            tils tils = this;
            ContentValues contentvalues4 = contentvalues;
            tils.addResult(contentvalues4);
            return;
        }
        Object aobj1[] = new Object[3];
        aobj1[0] = s12;
        aobj1[1] = s11;
        aobj1[2] = s10;
        String s21 = String.format("Matched to %s with aggregated id %s and lookup %s", aobj1);
        Log.i("SyncService", s21);
        abyte0 = null;
        s22 = null;
        s23 = null;
        valuesCopy = JVM INSTR new #132 <Class ContentValues>;
        ContentValues contentvalues5 = valuesCopy;
        ContentValues contentvalues6 = contentvalues;
        contentvalues5.ContentValues(contentvalues6);
        ashes ashes;
        InputStream inputstream;
        boolean flag1;
        ashes = dbHelper.getHashes(s9);
        ContactUtils contactutils3 = mContactUtils;
        ContentResolver contentresolver3 = contentresolver;
        String s24 = s11;
        inputstream = contactutils3.getPhoto(contentresolver3, s24);
        if(inputstream != null)
            s22 = Utils.getMd5Hash(Utils.getByteArrayFromInputStream(inputstream));
        SyncMyPixDbHelper syncmypixdbhelper = dbHelper;
        String s25 = ashes.updatedHash;
        boolean flag = service.mSkipIfExists;
        flag1 = syncmypixdbhelper.isSyncablePicture(s9, s25, s22, flag);
        if(flag1 == null)
            break MISSING_BLOCK_LABEL_1191;
        String s26;
        String s27 = Uri.parse(socialnetworkuser.picUrl).getLastPathSegment();
        InputStream inputstream1 = mCache.get(s27);
        if(inputstream1 == null)
        {
            Log.d("SyncService", "cache miss");
            inputstream1 = Utils.downloadPictureAsStream(socialnetworkuser.picUrl, 2);
        }
        abyte0 = Utils.getByteArrayFromInputStream(inputstream1);
        inputstream1.close();
        if(service.mCacheOn)
        {
            PhotoCache photocache = mCache;
            String s28 = s27;
            byte abyte1[] = abyte0;
            photocache.add(s28, abyte1);
        }
        s26 = Utils.getMd5Hash(abyte0);
        s23 = s26;
_L9:
        if(abyte0 == null) goto _L2; else goto _L1
_L1:
        boolean flag2 = false;
        final Bitmap bitmap;
        int k = abyte0.length;
        byte abyte2[] = abyte0;
        int l = ((flag2) ? 1 : 0);
        int i1 = k;
        bitmap = BitmapFactory.decodeByteArray(abyte2, l, i1);
        if(s23 == null) goto _L4; else goto _L3
_L3:
        String s30;
        String s31;
        String s29 = ashes.networkHash;
        s30 = s23;
        s31 = s29;
        if(!s30.equals(s31)) goto _L5; else goto _L4
_L4:
        if(inputstream != null) goto _L6; else goto _L5
_L5:
        String s32 = s23;
        if(service.mCropSquare)
        {
            abyte0 = Utils.bitmapToPNG(Utils.centerCrop(bitmap, 96, 96));
            s32 = Utils.getMd5Hash(abyte0);
        }
        ContactUtils contactutils4 = mContactUtils;
        boolean flag3 = service.mAllowGoogleSync;
        ContactUtils contactutils5 = contactutils4;
        ContentResolver contentresolver4 = contentresolver;
        byte abyte3[] = abyte0;
        String s33 = s11;
        boolean flag4 = flag3;
        contactutils5.updatePhoto(contentresolver4, abyte3, s33, flag4);
        SyncMyPixDbHelper syncmypixdbhelper1 = dbHelper;
        String s34 = s11;
        String s35 = s10;
        String s36 = s23;
        String s37 = s32;
        syncmypixdbhelper1.updateHashes(s34, s35, s36, s37);
        SyncMyPixDbHelper syncmypixdbhelper2 = dbHelper;
        String s38 = service.getSocialNetworkName();
        SyncMyPixDbHelper syncmypixdbhelper3 = syncmypixdbhelper2;
        String s39 = s11;
        String s40 = s10;
        SocialNetworkUser socialnetworkuser2 = socialnetworkuser;
        String s41 = s38;
        syncmypixdbhelper3.updateLink(s39, s40, socialnetworkuser2, s41);
        int j1 = mUpdated + 1;
        mUpdated = j1;
_L10:
        er er = service.mMainHandler;
        if(er == null) goto _L8; else goto _L7
_L7:
        er er1 = this;
        final SocialNetworkUser user = socialnetworkuser;
        Runnable runnable = er1. new Runnable() {

            public void run()
            {
                SyncServiceListener syncservicelistener = service.mListener;
                if(syncservicelistener == null)
                {
                    return;
                } else
                {
                    String s48 = user.name;
                    Bitmap bitmap1 = bitmap;
                    String s49 = valuesCopy.getAsString("description");
                    syncservicelistener.onContactSynced(s48, bitmap1, s49);
                    return;
                }
            }

            final SyncService.SyncTask this$0;
            final Bitmap val$bitmap;
            final SyncService val$service;
            final SocialNetworkUser val$user;
            final ContentValues val$valuesCopy;

            
            {
                this$0 = SyncService.SyncTask.this;
                service = syncservice;
                user = socialnetworkuser;
                bitmap = bitmap1;
                valuesCopy = contentvalues;
                super();
            }
        };
        er er2 = er;
        Runnable runnable1 = runnable;
        boolean flag5 = er2.post(runnable1);
_L11:
        valuesCopy.put("contact_id", s11);
        ContentValues contentvalues7 = valuesCopy;
        String s42 = "lookup_key";
        String s43 = s10;
        contentvalues7.put(s42, s43);
_L12:
        er er3 = this;
        ContentValues contentvalues8 = valuesCopy;
        er3.addResult(contentvalues8);
        if(inputstream == null)
            return;
        try
        {
            inputstream.close();
            return;
        }
        catch(IOException ioexception)
        {
            return;
        }
        Exception exception;
        exception;
        exception.printStackTrace();
          goto _L9
        Exception exception1;
        exception1;
        String s44 = service.getString(0x7f060057);
        valuesCopy.put("description", s44);
        er er4 = this;
        ContentValues contentvalues9 = valuesCopy;
        er4.addResult(contentvalues9);
        if(inputstream == null)
            return;
        try
        {
            inputstream.close();
            return;
        }
        catch(IOException ioexception1)
        {
            return;
        }
_L6:
        int k1 = mSkipped + 1;
        mSkipped = k1;
        String s45 = service.getString(0x7f060054);
        valuesCopy.put("description", s45);
          goto _L10
        Exception exception2;
        exception2;
        er er5 = this;
        ContentValues contentvalues10 = valuesCopy;
        er5.addResult(contentvalues10);
        String s46;
        int l1;
        String s47;
        if(inputstream != null)
            try
            {
                inputstream.close();
            }
            catch(IOException ioexception2) { }
        throw exception2;
_L8:
        bitmap.recycle();
          goto _L11
_L2:
        s46 = service.getString(0x7f060056);
        valuesCopy.put("description", s46);
          goto _L12
        l1 = mSkipped + 1;
        mSkipped = l1;
        s47 = service.getString(0x7f060052);
        valuesCopy.put("description", s47);
          goto _L12
    }

    protected transient Long doInBackground(List alist[])
    {
        long l;
        List list;
        SyncService syncservice;
        Long long1;
        ContentResolver contentresolver;
        l = 0L;
        list = alist[0];
        syncservice = (SyncService)mService.get();
        if(syncservice == null)
        {
            long1 = Long.valueOf(0L);
        } else
        {
label0:
            {
                contentresolver = syncservice.getContentResolver();
                if(contentresolver != null)
                    break label0;
                long1 = Long.valueOf(0L);
            }
        }
_L7:
        return long1;
        er er;
        String s;
        Object obj = SyncService.mSyncLock;
        obj;
        JVM INSTR monitorenter ;
        NameMatcher namematcher;
        ContentValues contentvalues;
        Uri uri2;
        int i;
        int j;
        android.content.Context context = syncservice.getApplicationContext();
        InputStream inputstream = syncservice.getResources().openRawResource(0x7f040000);
        boolean flag = syncservice.mPhoneOnly;
        namematcher = NameMatcherFactory.create(context, inputstream, flag);
        SyncMyPixDbHelper syncmypixdbhelper = dbHelper;
        String s1 = s;
        syncmypixdbhelper.deleteResults(s1);
        contentvalues = new ContentValues();
        ContentValues contentvalues1 = contentvalues;
        String s2 = "source";
        String s3 = s;
        contentvalues1.put(s2, s3);
        Uri uri = T_URI;
        ContentResolver contentresolver1 = contentresolver;
        Uri uri1 = uri;
        ContentValues contentvalues2 = contentvalues;
        uri2 = contentresolver1.insert(uri1, contentvalues2);
        i = 1;
        j = list.size();
        int k;
        int i1;
        int j1;
        k = j;
        i1 = k - 1;
        j1 = i;
_L10:
        if(i1 < 0)
            break MISSING_BLOCK_LABEL_1086;
        SocialNetworkUser socialnetworkuser;
        PhoneContact phonecontact1;
        List list1 = list;
        int k1 = i1;
        socialnetworkuser = (SocialNetworkUser)list1.remove(k1);
        SyncMyPixDbHelper syncmypixdbhelper1 = dbHelper;
        String s4 = socialnetworkuser.uid;
        SyncMyPixDbHelper syncmypixdbhelper2 = syncmypixdbhelper1;
        String s5 = s4;
        String s6 = s;
        phonecontact1 = syncmypixdbhelper2.getLinkedContact(s5, s6);
        if(phonecontact1.id != null) goto _L2; else goto _L1
_L1:
        if(!syncservice.mIntelliMatch) goto _L4; else goto _L3
_L3:
        PhoneContact phonecontact2;
        String s7 = socialnetworkuser.name;
        NameMatcher namematcher1 = namematcher;
        String s8 = s7;
        boolean flag1 = true;
        phonecontact2 = namematcher1.match(s8, flag1);
_L8:
        if(phonecontact2 != null)
        {
            SyncMyPixDbHelper syncmypixdbhelper3 = dbHelper;
            String s9 = phonecontact2.id;
            String s10 = syncservice.getSocialNetworkName();
            if(syncmypixdbhelper3.hasLink(s9, s10))
                phonecontact2 = null;
        }
_L9:
        Integer ainteger[];
        er er1 = this;
        SocialNetworkUser socialnetworkuser1 = socialnetworkuser;
        PhoneContact phonecontact3 = phonecontact2;
        Uri uri3 = uri2;
        er1.processUser(socialnetworkuser1, phonecontact3, uri3);
        ainteger = new Integer[3];
        int l1;
        int i2;
        l1 = 0;
        i = j1 + 1;
        float f = j1;
        float f1 = k;
        i2 = (int)((f / f1) * 100F);
        Integer integer = Integer.valueOf(i2);
        ainteger[l1] = integer;
        Integer integer1 = Integer.valueOf(i);
        ainteger[1] = integer1;
        Integer integer2 = Integer.valueOf(k);
        ainteger[2] = integer2;
        er er2 = this;
        Integer ainteger1[] = ainteger;
        er2.publishProgress(ainteger1);
        if(!SyncService.access$500(syncservice)) goto _L6; else goto _L5
_L5:
        if(er != null)
        {
            er er3 = er;
            int j2 = 1;
            int k2 = 0x7f06004b;
            int l2 = 0;
            android.os.Message message = er3.obtainMessage(j2, k2, l2);
            er er4 = er;
            android.os.Message message1 = message;
            boolean flag2 = er4.sendMessage(message1);
        }
_L15:
        contentvalues.clear();
        Long long2 = Long.valueOf(System.currentTimeMillis());
        ContentValues contentvalues3 = contentvalues;
        String s11 = "date_completed";
        Long long3 = long2;
        contentvalues3.put(s11, long3);
        Integer integer3 = Integer.valueOf(mUpdated);
        ContentValues contentvalues4 = contentvalues;
        String s12 = "updated";
        Integer integer4 = integer3;
        contentvalues4.put(s12, integer4);
        Integer integer5 = Integer.valueOf(mNotFound);
        ContentValues contentvalues5 = contentvalues;
        String s13 = "not_found";
        Integer integer6 = integer5;
        contentvalues5.put(s13, integer6);
        Integer integer7 = Integer.valueOf(mSkipped);
        ContentValues contentvalues6 = contentvalues;
        String s14 = "skipped";
        Integer integer8 = integer7;
        contentvalues6.put(s14, integer8);
        ContentResolver contentresolver2 = contentresolver;
        Uri uri4 = uri2;
        ContentValues contentvalues7 = contentvalues;
        String s15 = null;
        String as[] = null;
        int i3 = contentresolver2.update(uri4, contentvalues7, s15, as);
        l = i;
        if(namematcher == null)
            break MISSING_BLOCK_LABEL_720;
        namematcher.destroy();
        if(list != null)
            list.clear();
        if(mCache != null)
            mCache.releaseResources();
        Runnable runnable = er.resetExecuting;
        er er5 = er;
        Runnable runnable1 = runnable;
        boolean flag3 = er5.post(runnable1);
_L11:
        obj;
        JVM INSTR monitorexit ;
        long1 = Long.valueOf(l);
          goto _L7
_L4:
        PhoneContact phonecontact;
        String s16 = socialnetworkuser.name;
        NameMatcher namematcher2 = namematcher;
        String s17 = s16;
        phonecontact = namematcher2.exactMatch(s17);
        phonecontact2 = phonecontact;
          goto _L8
_L2:
        phonecontact2 = phonecontact1;
          goto _L9
_L6:
        int j3 = SyncService.access$200(syncservice).size();
        j3 = 100;
        if(j3 == j3)
        {
            SyncService syncservice1 = syncservice;
            boolean flag4 = false;
            SyncService.access$600(syncservice1, flag4);
        }
        i1--;
        j1 = i;
          goto _L10
        Exception exception1;
        exception1;
_L14:
        String s18 = android.util.Log.getStackTraceString(exception1);
        Log.e("SyncService", s18);
        er er6 = er;
        int k3 = 1;
        int l3 = 0x7f06004e;
        int i4 = 0;
        android.os.Message message2 = er6.obtainMessage(k3, l3, i4);
        er er7 = er;
        android.os.Message message3 = message2;
        boolean flag5 = er7.sendMessage(message3);
        if(namematcher == null)
            break MISSING_BLOCK_LABEL_942;
        namematcher.destroy();
        if(list != null)
            list.clear();
        if(mCache != null)
            mCache.releaseResources();
        Runnable runnable2 = er.resetExecuting;
        er er8 = er;
        Runnable runnable3 = runnable2;
        boolean flag6 = er8.post(runnable3);
          goto _L11
        Exception exception2;
        exception2;
        obj;
        JVM INSTR monitorexit ;
        throw exception2;
        Exception exception;
        exception;
_L13:
        if(namematcher == null)
            break MISSING_BLOCK_LABEL_1015;
        namematcher.destroy();
        if(list != null)
            list.clear();
        if(mCache != null)
            mCache.releaseResources();
        Runnable runnable4 = er.resetExecuting;
        er er9 = er;
        Runnable runnable5 = runnable4;
        boolean flag7 = er9.post(runnable5);
        throw exception;
        exception;
        int j4 = j1;
        if(true) goto _L13; else goto _L12
_L12:
        exception1;
        int k4 = j1;
          goto _L14
        i = j1;
          goto _L15
    }

    protected volatile Object doInBackground(Object aobj[])
    {
        List alist[] = (List[])aobj;
        return doInBackground(alist);
    }

    protected void onPostExecute(Long long1)
    {
        SyncService syncservice = (SyncService)mService.get();
        if(syncservice == null)
            return;
        if(long1.longValue() > 0L && !SyncService.access$500(syncservice))
        {
            android.content.Context context = syncservice.getApplicationContext();
            Intent intent = new Intent(context, com/nloko/android/syncmypix/SyncResultsActivity);
            Intent intent1 = intent.addFlags(0x20020000);
            SyncService.access$700(syncservice, 0x7f060048, 0x7f060049);
            SyncService.access$800(syncservice, 0x7f060049, 0x1080082, intent, true);
        } else
        {
            SyncService.access$900(syncservice, 0x7f060048);
        }
        SyncService.access$600(syncservice, true);
    }

    protected volatile void onPostExecute(Object obj)
    {
        Long long1 = (Long)obj;
        onPostExecute(long1);
    }

    protected transient void onProgressUpdate(Integer ainteger[])
    {
        SyncService syncservice = (SyncService)mService.get();
        if(syncservice == null)
            return;
        SyncServiceListener syncservicelistener = syncservice.mListener;
        if(syncservicelistener == null)
        {
            return;
        } else
        {
            int i = ainteger[0].intValue();
            int j = ainteger[1].intValue();
            int k = ainteger[2].intValue();
            syncservicelistener.onSyncProgressUpdated(i, j, k);
            return;
        }
    }

    protected volatile void onProgressUpdate(Object aobj[])
    {
        Integer ainteger[] = (Integer[])aobj;
        onProgressUpdate(ainteger);
    }

    private final SyncMyPixDbHelper dbHelper;
    private final PhotoCache mCache;
    private final ContactUtils mContactUtils;
    private int mNotFound;
    private final WeakReference mService;
    private int mSkipped;
    private int mUpdated;

    public tils(SyncService syncservice)
    {
        mUpdated = 0;
        mSkipped = 0;
        mNotFound = 0;
        ContactUtils contactutils = new ContactUtils();
        mContactUtils = contactutils;
        android.content.Context context = syncservice.getApplicationContext();
        PhotoCache photocache = new PhotoCache(context);
        mCache = photocache;
        mCache.setDeleteOrder(1);
        WeakReference weakreference = new WeakReference(syncservice);
        mService = weakreference;
        android.content.Context context1 = ((SyncService)mService.get()).getApplicationContext();
        SyncMyPixDbHelper syncmypixdbhelper = new SyncMyPixDbHelper(context1);
        dbHelper = syncmypixdbhelper;
        boolean flag = syncservice.getSharedPreferences("SyncMyPixPrefs", 0).getBoolean("last_googlesync", false);
        if(syncservice.mAllowGoogleSync)
        {
            if(!flag)
            {
                Log.d("SyncService", "Resetting hashes...");
                SyncMyPixDbHelper syncmypixdbhelper1 = dbHelper;
                String s = syncservice.getSocialNetworkName();
                syncmypixdbhelper1.resetHashes(s, true, false);
            }
            Utils.setBoolean(syncservice.getSharedPreferences("SyncMyPixPrefs", 0), "last_googlesync", true);
            return;
        }
        if(flag)
        {
            Log.d("SyncService", "Resetting hashes...");
            SyncMyPixDbHelper syncmypixdbhelper2 = dbHelper;
            String s1 = syncservice.getSocialNetworkName();
            syncmypixdbhelper2.resetHashes(s1);
        }
        Utils.setBoolean(syncservice.getSharedPreferences("SyncMyPixPrefs", 0), "last_googlesync", false);
    }
}

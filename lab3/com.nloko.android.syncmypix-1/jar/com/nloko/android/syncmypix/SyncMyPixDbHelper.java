// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncMyPixDbHelper.java

package com.nloko.android.syncmypix;

import Lcom.nloko.android.syncmypix.SyncMyPixDbHelper;;
import android.content.*;
import android.database.Cursor;
import android.net.Uri;
import com.nloko.android.Log;
import com.nloko.android.Utils;
import com.nloko.android.syncmypix.contactutils.ContactUtils;
import java.lang.ref.WeakReference;

// Referenced classes of package com.nloko.android.syncmypix:
//            PhoneContact, SocialNetworkUser, DbHelperNotifier, SyncService

public class SyncMyPixDbHelper
{
    /* member class not found */
    class DBHashes {}


    public SyncMyPixDbHelper(Context context)
    {
        ContentResolver contentresolver = context.getContentResolver();
        WeakReference weakreference = new WeakReference(contentresolver);
        mResolver = weakreference;
        ContactUtils contactutils = new ContactUtils();
        mContactUtils = contactutils;
    }

    public void deleteAllPictures()
    {
        deleteAllPictures(null);
    }

    public void deleteAllPictures(final DbHelperNotifier notifier)
    {
        ContentResolver contentresolver = (ContentResolver)mResolver.get();
        if(contentresolver == null)
        {
            return;
        } else
        {
            Uri uri = SyncMyPix.Contacts.CONTENT_URI;
            String as[] = new String[2];
            as[0] = "_id";
            as[1] = "photo_hash";
            String as1[] = null;
            String s = null;
            final Cursor cursor = contentresolver.query(uri, as, null, as1, s);
            Runnable runnable = new Runnable() {

                public void run()
                {
                    synchronized(SyncService.mSyncLock)
                    {
                        String s1;
                        String s2;
                        for(; cursor.moveToNext(); deletePicture(s1, s2))
                        {
                            Cursor cursor1 = cursor;
                            int i = cursor.getColumnIndex("_id");
                            s1 = cursor1.getString(i);
                            Cursor cursor2 = cursor;
                            int j = cursor.getColumnIndex("photo_hash");
                            s2 = cursor2.getString(j);
                        }

                        break MISSING_BLOCK_LABEL_95;
                    }
                    deleteData();
                    obj;
                    JVM INSTR monitorexit ;
                    if(notifier != null)
                        notifier.onUpdateComplete();
                    cursor.close();
                    return;
                }

                final SyncMyPixDbHelper this$0;
                final Cursor val$cursor;
                final DbHelperNotifier val$notifier;

            
            {
                this$0 = SyncMyPixDbHelper.this;
                cursor = cursor1;
                notifier = dbhelpernotifier;
                super();
            }
            };
            (new Thread(runnable)).start();
            return;
        }
    }

    public void deleteData()
    {
        ContentResolver contentresolver = (ContentResolver)mResolver.get();
        if(contentresolver == null)
        {
            return;
        } else
        {
            Uri uri = SyncMyPix.Contacts.CONTENT_URI;
            int i = contentresolver.delete(uri, null, null);
            Uri uri1 = SyncMyPix.Results.CONTENT_URI;
            int j = contentresolver.delete(uri1, null, null);
            Uri uri2 = SyncMyPix.Sync.CONTENT_URI;
            int k = contentresolver.delete(uri2, null, null);
            return;
        }
    }

    public void deleteData(String s)
    {
        ContentResolver contentresolver = (ContentResolver)mResolver.get();
        if(contentresolver == null)
        {
            return;
        } else
        {
            Uri uri = Uri.withAppendedPath(SyncMyPix.Contacts.CONTENT_URI, s);
            int i = contentresolver.delete(uri, null, null);
            return;
        }
    }

    public void deletePicture(String s)
    {
        if(s == null)
            throw new IllegalArgumentException("id");
        ContentResolver contentresolver = (ContentResolver)mResolver.get();
        if(contentresolver == null)
            return;
        Uri uri = Uri.withAppendedPath(SyncMyPix.Contacts.CONTENT_URI, s);
        String as[] = new String[2];
        as[0] = "_id";
        as[1] = "photo_hash";
        String as1[] = null;
        String s1 = null;
        Cursor cursor = contentresolver.query(uri, as, null, as1, s1);
        if(!cursor.moveToNext())
        {
            return;
        } else
        {
            int i = cursor.getColumnIndex("photo_hash");
            String s2 = cursor.getString(i);
            deletePicture(s, s2);
            return;
        }
    }

    public void deletePicture(String s, String s1)
    {
        if(s == null)
            throw new IllegalArgumentException("id");
        if(s1 == null)
            throw new IllegalArgumentException("dbHash");
        ContentResolver contentresolver = (ContentResolver)mResolver.get();
        if(contentresolver == null)
            return;
        java.io.InputStream inputstream = mContactUtils.getPhoto(contentresolver, s);
        if(inputstream == null)
        {
            return;
        } else
        {
            String s2 = Utils.getMd5Hash(Utils.getByteArrayFromInputStream(inputstream));
            mContactUtils.updatePhoto(contentresolver, null, s);
            return;
        }
    }

    public void deleteResults(String s)
    {
        if(s == null)
            throw new IllegalArgumentException("source");
        ContentResolver contentresolver = (ContentResolver)mResolver.get();
        if(contentresolver == null)
            return;
        Uri uri = SyncMyPix.Sync.CONTENT_URI;
        String as[] = new String[2];
        as[0] = "_id";
        as[1] = "source";
        String s1 = (new StringBuilder()).append("source='").append(s).append("'").toString();
        String s2 = null;
        Cursor cursor;
        for(cursor = contentresolver.query(uri, as, s1, null, s2); cursor.moveToNext();)
        {
            int i = cursor.getColumnIndex("_id");
            String s3 = cursor.getString(i);
            Uri uri1 = Uri.withAppendedPath(SyncMyPix.Sync.CONTENT_URI, s3);
            int j = contentresolver.delete(uri1, null, null);
        }

        cursor.close();
    }

    public DBHashes getHashes(String s)
    {
        if(s == null)
            throw new IllegalArgumentException("id");
        ContentResolver contentresolver = (ContentResolver)mResolver.get();
        DBHashes dbhashes;
        if(contentresolver == null)
        {
            dbhashes = null;
        } else
        {
            Uri uri = Uri.withAppendedPath(SyncMyPix.Contacts.CONTENT_URI, s);
            String as[] = new String[3];
            as[0] = "_id";
            as[1] = "photo_hash";
            as[2] = "network_photo_hash";
            String as1[] = null;
            String s1 = null;
            Cursor cursor = contentresolver.query(uri, as, null, as1, s1);
            DBHashes dbhashes1 = new DBHashes();
            if(cursor.moveToFirst())
            {
                int i = cursor.getColumnIndex("photo_hash");
                String s2 = cursor.getString(i);
                dbhashes1.updatedHash = s2;
                int j = cursor.getColumnIndex("network_photo_hash");
                String s3 = cursor.getString(j);
                dbhashes1.networkHash = s3;
            }
            cursor.close();
            dbhashes = dbhashes1;
        }
        return dbhashes;
    }

    public PhoneContact getLinkedContact(String s, String s1)
    {
        if(s == null)
            throw new IllegalArgumentException("id");
        if(s1 == null)
            throw new IllegalArgumentException("source");
        ContentResolver contentresolver = (ContentResolver)mResolver.get();
        PhoneContact phonecontact;
        if(contentresolver == null)
        {
            phonecontact = null;
        } else
        {
            Uri uri = SyncMyPix.Contacts.CONTENT_URI;
            String as[] = new String[2];
            as[0] = "_id";
            as[1] = "lookup_key";
            String s2 = (new StringBuilder()).append("friend_id='").append(s).append("' AND ").append("source").append("='").append(s1).append("'").toString();
            String s3 = null;
            Cursor cursor = contentresolver.query(uri, as, s2, null, s3);
            String s4 = null;
            String s5 = null;
            if(cursor.moveToNext())
            {
                int i = cursor.getColumnIndex("_id");
                s4 = cursor.getString(i);
                int j = cursor.getColumnIndex("lookup_key");
                s5 = cursor.getString(j);
            }
            cursor.close();
            phonecontact = new PhoneContact(s4, null, s5);
        }
        return phonecontact;
    }

    public boolean hasLink(String s, String s1)
    {
        if(s == null)
            throw new IllegalArgumentException("id");
        if(s1 == null)
            throw new IllegalArgumentException("source");
        ContentResolver contentresolver = (ContentResolver)mResolver.get();
        boolean flag;
        if(contentresolver == null)
        {
            flag = false;
        } else
        {
            Uri uri = SyncMyPix.Contacts.CONTENT_URI;
            String as[] = new String[1];
            as[0] = "_id";
            String s2 = (new StringBuilder()).append("_id=").append(s).append(" AND ").append("source").append("='").append(s1).append("'").append(" AND ").append("friend_id").append(" IS NOT NULL").toString();
            String s3 = null;
            Cursor cursor = contentresolver.query(uri, as, s2, null, s3);
            boolean flag1 = cursor.moveToNext();
            cursor.close();
            flag = flag1;
        }
        return flag;
    }

    public boolean isSyncablePicture(String s, String s1, String s2, boolean flag)
    {
        ContentResolver contentresolver;
        if(s == null)
            throw new IllegalArgumentException("id");
        contentresolver = (ContentResolver)mResolver.get();
        if(contentresolver != null) goto _L2; else goto _L1
_L1:
        boolean flag1 = false;
_L4:
        return flag1;
_L2:
        boolean flag2;
        Uri uri;
        flag2 = true;
        uri = Uri.withAppendedPath(SyncMyPix.Contacts.CONTENT_URI, s);
        if(flag)
        {
            if(s1 != null || s2 == null)
                break; /* Loop/switch isn't completed */
            flag2 = false;
        }
_L6:
        flag1 = flag2;
        if(true) goto _L4; else goto _L3
_L3:
        if(s2 == null) goto _L6; else goto _L5
_L5:
        Object aobj[] = new Object[2];
        aobj[0] = s1;
        aobj[1] = s2;
        String s3 = String.format("dbhash %s hash %s", aobj);
        Log.d("SyncMyPixDbHelper", s3);
        if(!s2.equals(s1))
        {
            int i = contentresolver.delete(uri, null, null);
            flag2 = false;
        }
          goto _L6
    }

    public void resetHashes(String s)
    {
        resetHashes(s, false, true);
    }

    public void resetHashes(String s, boolean flag, boolean flag1)
    {
        if(s == null)
            throw new IllegalArgumentException("source");
        if(!flag && !flag1)
            throw new IllegalArgumentException("Both networkHash and localHash should not be false");
        ContentResolver contentresolver = (ContentResolver)mResolver.get();
        if(contentresolver == null)
            return;
        Uri uri = SyncMyPix.Contacts.CONTENT_URI;
        String as[] = new String[2];
        as[0] = "_id";
        as[1] = "photo_hash";
        String s1 = (new StringBuilder()).append("source='").append(s).append("'").toString();
        String s2 = null;
        Cursor cursor = contentresolver.query(uri, as, s1, null, s2);
        ContentValues contentvalues = new ContentValues();
        do
        {
            if(!cursor.moveToNext())
                break;
            int i = cursor.getColumnIndex("_id");
            String s3 = cursor.getString(i);
            Uri uri1 = Uri.withAppendedPath(SyncMyPix.Contacts.CONTENT_URI, s3);
            if(flag1)
            {
                java.io.InputStream inputstream = mContactUtils.getPhoto(contentresolver, s3);
                if(inputstream != null)
                {
                    String s4 = Utils.getMd5Hash(Utils.getByteArrayFromInputStream(inputstream));
                    contentvalues.put("photo_hash", s4);
                }
            }
            if(flag)
                contentvalues.putNull("network_photo_hash");
            if(contentvalues.size() > 0)
            {
                int j = contentresolver.update(uri1, contentvalues, null, null);
                contentvalues.clear();
            }
        } while(true);
        cursor.close();
    }

    public void updateHashes(String s, String s1, String s2, String s3)
    {
        if(s == null)
            throw new IllegalArgumentException("id");
        ContentResolver contentresolver = (ContentResolver)mResolver.get();
        if(contentresolver == null)
            return;
        Uri uri = Uri.withAppendedPath(SyncMyPix.Contacts.CONTENT_URI, s);
        String as[] = new String[1];
        as[0] = "_id";
        String as1[] = null;
        String s4 = null;
        Cursor cursor = contentresolver.query(uri, as, null, as1, s4);
        ContentValues contentvalues = new ContentValues();
        contentvalues.put("lookup_key", s1);
        if(s2 != null)
            contentvalues.put("network_photo_hash", s2);
        if(s3 != null)
            contentvalues.put("photo_hash", s3);
        int i;
        if(cursor.moveToFirst())
        {
            i = contentresolver.update(uri, contentvalues, null, null);
        } else
        {
            contentvalues.put("_id", s);
            Uri uri1 = SyncMyPix.Contacts.CONTENT_URI;
            Uri uri2 = contentresolver.insert(uri1, contentvalues);
        }
        if(cursor == null)
        {
            return;
        } else
        {
            cursor.close();
            return;
        }
    }

    public void updateHashes(String s, String s1, byte abyte0[], byte abyte1[])
    {
        String s2 = null;
        String s3 = null;
        if(abyte0 != null)
            s2 = Utils.getMd5Hash(abyte0);
        if(abyte1 != null)
            s3 = Utils.getMd5Hash(abyte1);
        updateHashes(s, s1, s2, s3);
    }

    public void updateLink(String s, String s1, SocialNetworkUser socialnetworkuser, String s2)
    {
        String s3 = socialnetworkuser.uid;
        updateLink(s, s1, s3, s2);
    }

    public void updateLink(String s, String s1, String s2, String s3)
    {
        if(s == null)
            throw new IllegalArgumentException("id");
        ContentResolver contentresolver = (ContentResolver)mResolver.get();
        if(contentresolver == null)
            return;
        Uri uri = Uri.withAppendedPath(SyncMyPix.Contacts.CONTENT_URI, s);
        String as[] = new String[1];
        as[0] = "_id";
        String as1[] = null;
        String s4 = null;
        Cursor cursor = contentresolver.query(uri, as, null, as1, s4);
        ContentValues contentvalues = new ContentValues();
        contentvalues.put("friend_id", s2);
        contentvalues.put("source", s3);
        contentvalues.put("lookup_key", s1);
        int i;
        Object aobj[];
        String s5;
        if(cursor.moveToFirst())
        {
            i = contentresolver.update(uri, contentvalues, null, null);
        } else
        {
            contentvalues.put("_id", s);
            Uri uri1 = SyncMyPix.Contacts.CONTENT_URI;
            Uri uri2 = contentresolver.insert(uri1, contentvalues);
        }
        if(cursor != null)
            cursor.close();
        aobj = new Object[2];
        aobj[0] = s;
        aobj[1] = s1;
        s5 = String.format("Updated link with contact id %s and lookup %s", aobj);
        Log.d("SyncMyPixDbHelper", s5);
    }

    private static final String TAG = "SyncMyPixDbHelper";
    private final ContactUtils mContactUtils;
    private final WeakReference mResolver;
}

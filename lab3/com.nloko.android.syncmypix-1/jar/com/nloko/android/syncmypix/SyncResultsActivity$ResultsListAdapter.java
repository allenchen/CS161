// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncResultsActivity.java

package com.nloko.android.syncmypix;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Message;
import android.view.View;
import android.view.ViewGroup;
import android.widget.*;
import com.nloko.android.ThumbnailCache;
import java.lang.ref.WeakReference;

// Referenced classes of package com.nloko.android.syncmypix:
//            SyncResultsActivity

public static class mSadFace extends SimpleCursorAdapter
{
    public static final class Viewholder
    {

        public ImageView image;
        public TextView name;
        public TextView status;
        public String url;

        public Viewholder()
        {
        }
    }


    public void bindView(View view, Context context, Cursor cursor)
    {
        SyncResultsActivity syncresultsactivity = (SyncResultsActivity)mActivity.get();
        if(syncresultsactivity == null)
            return;
        Viewholder viewholder = (Viewholder)view.getTag();
        if(viewholder == null)
            return;
        int i = cursor.getColumnIndex("contact_id");
        long l = cursor.getLong(i);
        int j = cursor.getColumnIndex("name");
        String s = cursor.getString(j);
        int k = cursor.getColumnIndex("pic_url");
        String s1 = cursor.getString(k);
        String s2;
        int i1;
        String s3;
        ImageView imageview;
        if(s1 != null)
            s2 = s1.trim();
        else
            s2 = null;
        i1 = cursor.getColumnIndex("description");
        s3 = cursor.getString(i1);
        viewholder.name.setText(s);
        viewholder.status.setText(s3);
        viewholder.url = s2;
        imageview = viewholder.image;
        imageview.setTag(s2);
        if(l > 0L && !SyncResultsActivity.access$200(syncresultsactivity).contains(s2))
        {
            Message message = SyncResultsActivity.access$000(syncresultsactivity).tainMessage();
            message.obj = s2;
            boolean flag = SyncResultsActivity.access$000(syncresultsactivity).ndMessage(message);
            Bitmap bitmap = SyncResultsActivity.access$200(syncresultsactivity).getDefaultImage();
            imageview.setImageBitmap(bitmap);
            return;
        }
        if(SyncResultsActivity.access$200(syncresultsactivity).contains(s2))
        {
            Bitmap bitmap1 = SyncResultsActivity.access$200(syncresultsactivity).get(s2);
            imageview.setImageBitmap(bitmap1);
            return;
        }
        String s4 = context.getString(0x7f060050);
        if(s3.equals(s4))
        {
            Bitmap bitmap2 = mNeutralFace;
            imageview.setImageBitmap(bitmap2);
            return;
        } else
        {
            Bitmap bitmap3 = mSadFace;
            imageview.setImageBitmap(bitmap3);
            return;
        }
    }

    public View newView(Context context, Cursor cursor, ViewGroup viewgroup)
    {
        View view = super.newView(context, cursor, viewgroup);
        Viewholder viewholder = new Viewholder();
        ImageView imageview = (ImageView)view.findViewById(0x7f070022);
        viewholder.image = imageview;
        TextView textview = (TextView)view.findViewById(0x7f070024);
        viewholder.name = textview;
        TextView textview1 = (TextView)view.findViewById(0x7f070023);
        viewholder.status = textview1;
        view.setTag(viewholder);
        return view;
    }

    public Cursor runQueryOnBackgroundThread(CharSequence charsequence)
    {
        SyncResultsActivity syncresultsactivity = (SyncResultsActivity)mActivity.get();
        Cursor cursor;
        if(syncresultsactivity == null)
        {
            cursor = null;
        } else
        {
            ContentResolver contentresolver = syncresultsactivity.getContentResolver();
            if(contentresolver == null)
            {
                cursor = null;
            } else
            {
                String s = null;
                if(charsequence != null)
                    s = (new StringBuilder()).append("description IN (").append(charsequence).append(")").toString();
                android.net.Uri uri = mActivity;
                String as[] = SyncResultsActivity.access$1300(syncresultsactivity);
                String s1 = null;
                cursor = contentresolver.query(uri, as, s, null, s1);
            }
        }
        return cursor;
    }

    private final WeakReference mActivity;
    private Bitmap mNeutralFace;
    private Bitmap mSadFace;

    public Viewholder(SyncResultsActivity syncresultsactivity, int i, Cursor cursor, String as[], int ai[])
    {
        super(syncresultsactivity, i, cursor, as, ai);
        WeakReference weakreference = new WeakReference(syncresultsactivity);
        mActivity = weakreference;
        Bitmap bitmap = BitmapFactory.decodeResource(syncresultsactivity.getResources(), 0x7f020012);
        mNeutralFace = bitmap;
        Bitmap bitmap1 = BitmapFactory.decodeResource(syncresultsactivity.getResources(), 0x7f020014);
        mSadFace = bitmap1;
    }
}

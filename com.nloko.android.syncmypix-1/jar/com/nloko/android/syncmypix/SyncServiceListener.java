// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncServiceListener.java

package com.nloko.android.syncmypix;

import android.graphics.Bitmap;

public interface SyncServiceListener
{

    public abstract void onContactSynced(String s, Bitmap bitmap, String s1);

    public abstract void onError(int i);

    public abstract void onFriendsDownloadStarted();

    public abstract void onSyncCancelled();

    public abstract void onSyncCompleted();

    public abstract void onSyncProgressUpdated(int i, int j, int k);
}

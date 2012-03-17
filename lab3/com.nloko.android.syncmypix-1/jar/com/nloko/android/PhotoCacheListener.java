// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   PhotoCacheListener.java

package com.nloko.android;


public interface PhotoCacheListener
{

    public abstract void onAdded(String s);

    public abstract void onAllDeleted();

    public abstract void onDeleted(String s);
}

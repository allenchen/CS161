// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   SyncService.java

package com.nloko.android.syncmypix;


// Referenced classes of package com.nloko.android.syncmypix:
//            SyncService

public static final class  extends Enum
{

    public static  valueOf(String s)
    {
        return ()Enum.valueOf(com/nloko/android/syncmypix/SyncService$SyncServiceStatus, s);
    }

    public static [] values()
    {
        return ([])$VALUES.clone();
    }

    private static final .VALUES $VALUES[];
    public static final .VALUES GETTING_FRIENDS;
    public static final .VALUES IDLE;
    public static final .VALUES SYNCING;

    static 
    {
        IDLE = new <init>("IDLE", 0);
        GETTING_FRIENDS = new <init>("GETTING_FRIENDS", 1);
        SYNCING = new <init>("SYNCING", 2);
        s_3B_.clone aclone[] = new <init>[3];
        s_3B_.clone clone = IDLE;
        aclone[0] = clone;
        s_3B_.clone clone1 = GETTING_FRIENDS;
        aclone[1] = clone1;
        s_3B_.clone clone2 = SYNCING;
        aclone[2] = clone2;
        $VALUES = aclone;
    }

    private (String s, int i)
    {
        super(s, i);
    }
}

// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   HighlightView.java

package com.nloko.android.syncmypix.graphics;


// Referenced classes of package com.nloko.android.syncmypix.graphics:
//            HighlightView

static final class  extends Enum
{

    public static  valueOf(String s)
    {
        return ()Enum.valueOf(com/nloko/android/syncmypix/graphics/HighlightView$ModifyMode, s);
    }

    public static [] values()
    {
        return ([])$VALUES.clone();
    }

    private static final .VALUES $VALUES[];
    public static final .VALUES Grow;
    public static final .VALUES Move;
    public static final .VALUES None;

    static 
    {
        None = new <init>("None", 0);
        Move = new <init>("Move", 1);
        Grow = new <init>("Grow", 2);
        e_3B_.clone aclone[] = new <init>[3];
        e_3B_.clone clone = None;
        aclone[0] = clone;
        e_3B_.clone clone1 = Move;
        aclone[1] = clone1;
        e_3B_.clone clone2 = Grow;
        aclone[2] = clone2;
        $VALUES = aclone;
    }

    private (String s, int i)
    {
        super(s, i);
    }
}

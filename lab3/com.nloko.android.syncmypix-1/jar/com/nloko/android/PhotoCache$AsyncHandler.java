// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   PhotoCache.java

package com.nloko.android;

import android.os.*;
import java.io.*;
import java.util.*;

// Referenced classes of package com.nloko.android:
//            PhotoCache, PhotoCacheListener, Log

private final class this._cls0 extends Handler
{

    /**
     * @deprecated Method add is deprecated
     */

    private void add(String s, byte abyte0[])
    {
        this;
        JVM INSTR monitorenter ;
        if(abyte0 != null)
            break MISSING_BLOCK_LABEL_21;
        throw new IllegalArgumentException("bytes");
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        if(s != null)
            break MISSING_BLOCK_LABEL_35;
        throw new IllegalArgumentException("file");
        File file1;
        boolean flag;
        if(!PhotoCache.access$700(PhotoCache.this))
            calculateSize();
        File file = PhotoCache.access$200(PhotoCache.this);
        file1 = new File(file, s);
        flag = file1.exists();
        if(!flag) goto _L2; else goto _L1
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        flag = PhotoCache.access$100(PhotoCache.this);
        if(!flag)
            continue; /* Loop/switch isn't completed */
        ensurePath();
        FileOutputStream fileoutputstream = new FileOutputStream(file1);
        fileoutputstream.write(abyte0);
        fileoutputstream.close();
        updateSize(file1);
        if(PhotoCache.access$900(PhotoCache.this) != null)
            PhotoCache.access$900(PhotoCache.this).onAdded(s);
        continue; /* Loop/switch isn't completed */
        FileNotFoundException filenotfoundexception;
        filenotfoundexception;
        filenotfoundexception.printStackTrace();
        continue; /* Loop/switch isn't completed */
        printStackTrace();
        if(true) goto _L1; else goto _L3
_L3:
    }

    /**
     * @deprecated Method calculateSize is deprecated
     */

    private void calculateSize()
    {
        this;
        JVM INSTR monitorenter ;
        boolean flag = PhotoCache.access$600(PhotoCache.this);
        if(flag) goto _L2; else goto _L1
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        File afile1[];
        int i;
        int j;
        boolean flag1 = PhotoCache.access$702(PhotoCache.this, true);
        File afile[] = PhotoCache.access$200(PhotoCache.this).listFiles();
        if(afile == null)
            continue; /* Loop/switch isn't completed */
        afile1 = afile;
        i = afile1.length;
        j = 0;
_L4:
        if(j >= i)
            break; /* Loop/switch isn't completed */
        File file = afile1[j];
        updateSize(file);
        j++;
        if(true) goto _L4; else goto _L3
_L3:
        if(true) goto _L1; else goto _L5
_L5:
        Exception exception;
        exception;
        throw exception;
    }

    /**
     * @deprecated Method delete is deprecated
     */

    private void delete(String s)
    {
        this;
        JVM INSTR monitorenter ;
        boolean flag = PhotoCache.access$100(PhotoCache.this);
        if(flag && s != null) goto _L2; else goto _L1
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        File file = PhotoCache.access$200(PhotoCache.this);
        File file1 = new File(file, s);
        if(!PhotoCache.access$800(PhotoCache.this, file1) && file1.exists())
        {
            PhotoCache photocache = PhotoCache.this;
            long l = file1.length();
            long l1 = PhotoCache.access$422(photocache, l);
            boolean flag1 = file1.delete();
            if(PhotoCache.access$900(PhotoCache.this) != null)
                PhotoCache.access$900(PhotoCache.this).onDeleted(s);
            Object aobj[] = new Object[1];
            aobj[0] = s;
            String s1 = String.format("delete() deleted %s", aobj);
            Log.d("PhotoCache", s1);
        }
        if(true) goto _L1; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    /**
     * @deprecated Method deleteAll is deprecated
     */

    private void deleteAll()
    {
        this;
        JVM INSTR monitorenter ;
        File afile[] = PhotoCache.access$200(PhotoCache.this).listFiles();
        File afile1[] = afile;
        if(afile1 != null) goto _L2; else goto _L1
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        File afile2[] = afile1;
        int i = afile2.length;
        for(int j = 0; j < i; j++)
        {
            File file = afile2[j];
            if(!PhotoCache.access$100(PhotoCache.this) || PhotoCache.access$800(PhotoCache.this, file))
                continue;
            if(PhotoCache.access$700(PhotoCache.this))
            {
                PhotoCache photocache = PhotoCache.this;
                long l = file.length();
                long l1 = PhotoCache.access$422(photocache, l);
            }
            boolean flag = file.delete();
        }

        if(PhotoCache.access$900(PhotoCache.this) != null)
            PhotoCache.access$900(PhotoCache.this).onAllDeleted();
        if(true) goto _L1; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    /**
     * @deprecated Method ensurePath is deprecated
     */

    private void ensurePath()
    {
        this;
        JVM INSTR monitorenter ;
        boolean flag;
        if(PhotoCache.access$100(PhotoCache.this))
            flag = PhotoCache.access$200(PhotoCache.this).mkdirs();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    /**
     * @deprecated Method resize is deprecated
     */

    private void resize()
    {
        this;
        JVM INSTR monitorenter ;
        Object aobj[] = new Object[1];
        Integer integer = Integer.valueOf(PhotoCache.access$300(PhotoCache.this).size());
        aobj[0] = integer;
        String s = String.format("resize() map size %d", aobj);
        Log.d("PhotoCache", s);
_L4:
        if(PhotoCache.access$300(PhotoCache.this).isEmpty())
            break MISSING_BLOCK_LABEL_265;
        long l = PhotoCache.access$400(PhotoCache.this);
        long l1 = mMaxBytes;
        if(l <= l1)
            break MISSING_BLOCK_LABEL_265;
        if(PhotoCache.access$500(PhotoCache.this) != 0) goto _L2; else goto _L1
_L1:
        long l2 = ((Long)PhotoCache.access$300(PhotoCache.this).firstKey()).longValue();
_L3:
        TreeMap treemap = PhotoCache.access$300(PhotoCache.this);
        Long long1 = Long.valueOf(l2);
        String s2;
        for(Iterator iterator = ((List)treemap.get(long1)).iterator(); iterator.hasNext(); Log.v("PhotoCache", s2))
        {
            String s1 = (String)iterator.next();
            delete(s1);
            Object aobj1[] = new Object[1];
            Long long2 = Long.valueOf(PhotoCache.access$400(PhotoCache.this));
            aobj1[0] = long2;
            s2 = String.format("resize() %d", aobj1);
        }

        break MISSING_BLOCK_LABEL_237;
        Exception exception;
        exception;
        throw exception;
_L2:
        l2 = ((Long)PhotoCache.access$300(PhotoCache.this).lastKey()).longValue();
          goto _L3
        TreeMap treemap1 = PhotoCache.access$300(PhotoCache.this);
        Long long3 = Long.valueOf(l2);
        Object obj = treemap1.remove(long3);
          goto _L4
        this;
        JVM INSTR monitorexit ;
    }

    /**
     * @deprecated Method updateSize is deprecated
     */

    private void updateSize(File file)
    {
        this;
        JVM INSTR monitorenter ;
        long l = file.lastModified();
        TreeMap treemap = PhotoCache.access$300(PhotoCache.this);
        Long long1 = Long.valueOf(l);
        if(!treemap.containsKey(long1))
        {
            TreeMap treemap1 = PhotoCache.access$300(PhotoCache.this);
            Long long2 = Long.valueOf(l);
            ArrayList arraylist = new ArrayList();
            Object obj = treemap1.put(long2, arraylist);
        }
        TreeMap treemap2 = PhotoCache.access$300(PhotoCache.this);
        Long long3 = Long.valueOf(l);
        List list = (List)treemap2.get(long3);
        String s = file.getName();
        boolean flag = list.add(s);
        PhotoCache photocache = PhotoCache.this;
        long l1 = file.length();
        long l2 = PhotoCache.access$414(photocache, l1);
        Object aobj[] = new Object[1];
        Long long4 = Long.valueOf(PhotoCache.access$400(PhotoCache.this));
        aobj[0] = long4;
        String s1 = String.format("updateSize() %d", aobj);
        Log.d("PhotoCache", s1);
        resize();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void handleMessage(Message message)
    {
        super.handleMessage(message);
        switch(message.what)
        {
        default:
            return;

        case 3: // '\003'
            resize resize1 = (resize)message.obj;
            if(resize1 == null)
            {
                return;
            } else
            {
                String s = resize1.resize;
                byte abyte0[] = resize1.resize;
                add(s, abyte0);
                return;
            }

        case 1: // '\001'
            deleteAll();
            return;

        case 2: // '\002'
            String s1 = (String)message.obj;
            delete(s1);
            return;

        case 4: // '\004'
            PhotoCache.access$1000(PhotoCache.this);
            getLooper().quit();
            return;
        }
    }

    final PhotoCache this$0;

    public (HandlerThread handlerthread)
    {
        this$0 = PhotoCache.this;
        Looper looper = handlerthread.getLooper();
        super(looper);
    }
}

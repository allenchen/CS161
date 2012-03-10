// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   LogCollector.java

package com.nloko.android;


// Referenced classes of package com.nloko.android:
//            Log, LogCollectorNotifier

public class LogCollector
{
    /* member class not found */
    class LogHandler {}


    public LogCollector()
    {
        mCollected = false;
        mCollecting = false;
        LogHandler loghandler = new LogHandler();
        mHandler = loghandler;
    }

    public void appendMessage(String s)
    {
        if(!mCollected)
            return;
        if(mLog == null)
        {
            return;
        } else
        {
            StringBuffer stringbuffer = new StringBuffer();
            String s1 = System.getProperty("line.separator");
            StringBuffer stringbuffer1 = stringbuffer.append(s);
            StringBuffer stringbuffer2 = stringbuffer.append(s1);
            StringBuffer stringbuffer3 = stringbuffer.append(s1);
            StringBuilder stringbuilder = mLog;
            String s2 = stringbuffer.toString();
            StringBuilder stringbuilder1 = stringbuilder.insert(0, s2);
            return;
        }
    }

    public void collect()
    {
        mCollected = false;
        _cls1 _lcls1 = new  Object()     /* anonymous class not found */
    class _anm1 {}

;
        Thread thread = new Thread(_lcls1);
        mThread = thread;
        mCollecting = true;
        mThread.start();
    }

    public void destroy()
    {
    }

    protected void finalize()
        throws Throwable
    {
        Log.d("LogCollector", "FINALIZED");
        super.finalize();
    }

    public String getLog()
    {
        String s;
        if(mCollected && mLog != null)
            s = mLog.toString();
        else
            s = null;
        return s;
    }

    public boolean isCollected()
    {
        return mCollected;
    }

    public boolean isCollecting()
    {
        return mCollecting;
    }

    public void setNotifier(LogCollectorNotifier logcollectornotifier)
    {
        mNotifier = logcollectornotifier;
    }

    public void stopCollecting()
    {
        if(mThread == null)
            return;
        if(!mThread.isAlive())
        {
            return;
        } else
        {
            mThread.interrupt();
            return;
        }
    }

    private static final int BUFFER_SIZE = 1024;
    public static final String LOGCAT_CMD[];
    public static final String TAG = "LogCollector";
    private boolean mCollected;
    private boolean mCollecting;
    private LogHandler mHandler;
    private StringBuilder mLog;
    private LogCollectorNotifier mNotifier;
    private Thread mThread;

    static 
    {
        String as[] = new String[2];
        as[0] = "logcat";
        as[1] = "-d";
        LOGCAT_CMD = as;
    }



/*
    static boolean access$102(LogCollector logcollector, boolean flag)
    {
        logcollector.mCollected = flag;
        return flag;
    }

*/


/*
    static boolean access$202(LogCollector logcollector, boolean flag)
    {
        logcollector.mCollecting = flag;
        return flag;
    }

*/



/*
    static StringBuilder access$302(LogCollector logcollector, StringBuilder stringbuilder)
    {
        logcollector.mLog = stringbuilder;
        return stringbuilder;
    }

*/

}

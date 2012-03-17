.class public abstract Lcom/nloko/android/syncmypix/SyncService;
.super Landroid/app/Service;
.source "SyncService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nloko/android/syncmypix/SyncService$LocalBinder;,
        Lcom/nloko/android/syncmypix/SyncService$SyncTask;,
        Lcom/nloko/android/syncmypix/SyncService$UpdateResultsTable;,
        Lcom/nloko/android/syncmypix/SyncService$MainHandler;,
        Lcom/nloko/android/syncmypix/SyncService$SyncServiceStatus;
    }
.end annotation


# static fields
.field public static final GETTING_FRIENDS:I = 0x1

.field public static final IDLE:I = 0x0

.field public static final SYNCING:I = 0x2

.field private static final TAG:Ljava/lang/String; = "SyncService"

.field public static final mSyncLock:Ljava/lang/Object;


# instance fields
.field private final RESULTS_THRESH:I

.field protected mAllowGoogleSync:Z

.field private final mBinder:Landroid/os/IBinder;

.field protected mCacheOn:Z

.field private mCancel:Z

.field protected mCropSquare:Z

.field private mExecuting:Z

.field protected mIntelliMatch:Z

.field protected mListener:Lcom/nloko/android/syncmypix/SyncServiceListener;

.field protected final mMainHandler:Lcom/nloko/android/syncmypix/SyncService$MainHandler;

.field protected mMaxQuality:Z

.field private mNotifyManager:Landroid/app/NotificationManager;

.field protected mOverrideReadOnlyCheck:Z

.field protected mPhoneOnly:Z

.field private final mResultsList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;"
        }
    .end annotation
.end field

.field protected mSkipIfConflict:Z

.field protected mSkipIfExists:Z

.field private mStarted:Z

.field private mStatus:I

.field private mSyncOperation:Lcom/nloko/android/syncmypix/SyncService$SyncTask;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 63
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/nloko/android/syncmypix/SyncService;->mSyncLock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 60
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 69
    iput v0, p0, Lcom/nloko/android/syncmypix/SyncService;->mStatus:I

    .line 74
    iput-boolean v0, p0, Lcom/nloko/android/syncmypix/SyncService;->mCancel:Z

    .line 75
    iput-boolean v0, p0, Lcom/nloko/android/syncmypix/SyncService;->mExecuting:Z

    .line 76
    iput-boolean v0, p0, Lcom/nloko/android/syncmypix/SyncService;->mStarted:Z

    .line 88
    new-instance v0, Lcom/nloko/android/syncmypix/SyncService$MainHandler;

    invoke-direct {v0, p0}, Lcom/nloko/android/syncmypix/SyncService$MainHandler;-><init>(Lcom/nloko/android/syncmypix/SyncService;)V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncService;->mMainHandler:Lcom/nloko/android/syncmypix/SyncService$MainHandler;

    .line 90
    new-instance v0, Lcom/nloko/android/syncmypix/SyncService$LocalBinder;

    invoke-direct {v0, p0}, Lcom/nloko/android/syncmypix/SyncService$LocalBinder;-><init>(Lcom/nloko/android/syncmypix/SyncService;)V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncService;->mBinder:Landroid/os/IBinder;

    .line 91
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncService;->mResultsList:Ljava/util/List;

    .line 93
    const/16 v0, 0x64

    iput v0, p0, Lcom/nloko/android/syncmypix/SyncService;->RESULTS_THRESH:I

    .line 760
    return-void
.end method

.method static synthetic access$102(Lcom/nloko/android/syncmypix/SyncService;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 60
    iput-boolean p1, p0, Lcom/nloko/android/syncmypix/SyncService;->mExecuting:Z

    return p1
.end method

.method static synthetic access$200(Lcom/nloko/android/syncmypix/SyncService;)Ljava/util/List;
    .locals 1
    .parameter "x0"

    .prologue
    .line 60
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncService;->mResultsList:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$300(Lcom/nloko/android/syncmypix/SyncService;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 60
    invoke-direct {p0, p1}, Lcom/nloko/android/syncmypix/SyncService;->showError(I)V

    return-void
.end method

.method static synthetic access$400(Lcom/nloko/android/syncmypix/SyncService;)Lcom/nloko/android/syncmypix/SyncService$SyncTask;
    .locals 1
    .parameter "x0"

    .prologue
    .line 60
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncService;->mSyncOperation:Lcom/nloko/android/syncmypix/SyncService$SyncTask;

    return-object v0
.end method

.method static synthetic access$402(Lcom/nloko/android/syncmypix/SyncService;Lcom/nloko/android/syncmypix/SyncService$SyncTask;)Lcom/nloko/android/syncmypix/SyncService$SyncTask;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 60
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncService;->mSyncOperation:Lcom/nloko/android/syncmypix/SyncService$SyncTask;

    return-object p1
.end method

.method static synthetic access$500(Lcom/nloko/android/syncmypix/SyncService;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 60
    iget-boolean v0, p0, Lcom/nloko/android/syncmypix/SyncService;->mCancel:Z

    return v0
.end method

.method static synthetic access$600(Lcom/nloko/android/syncmypix/SyncService;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 60
    invoke-direct {p0, p1}, Lcom/nloko/android/syncmypix/SyncService;->updateResults(Z)V

    return-void
.end method

.method static synthetic access$700(Lcom/nloko/android/syncmypix/SyncService;II)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 60
    invoke-direct {p0, p1, p2}, Lcom/nloko/android/syncmypix/SyncService;->cancelNotification(II)V

    return-void
.end method

.method static synthetic access$800(Lcom/nloko/android/syncmypix/SyncService;IILandroid/content/Intent;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"

    .prologue
    .line 60
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/nloko/android/syncmypix/SyncService;->showNotification(IILandroid/content/Intent;Z)V

    return-void
.end method

.method static synthetic access$900(Lcom/nloko/android/syncmypix/SyncService;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 60
    invoke-direct {p0, p1}, Lcom/nloko/android/syncmypix/SyncService;->cancelNotification(I)V

    return-void
.end method

.method private cancelNotification(I)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 745
    const/4 v0, -0x1

    invoke-direct {p0, p1, v0}, Lcom/nloko/android/syncmypix/SyncService;->cancelNotification(II)V

    .line 746
    return-void
.end method

.method private cancelNotification(II)V
    .locals 2
    .parameter "msg"
    .parameter "toastMsg"

    .prologue
    .line 750
    iget-boolean v0, p0, Lcom/nloko/android/syncmypix/SyncService;->mStarted:Z

    if-eqz v0, :cond_0

    .line 751
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncService;->mNotifyManager:Landroid/app/NotificationManager;

    invoke-virtual {v0, p1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 754
    :cond_0
    if-ltz p2, :cond_1

    .line 755
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/SyncService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, p2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 757
    :cond_1
    return-void
.end method

.method public static cancelSchedule(Landroid/content/Context;Ljava/lang/Class;)V
    .locals 4
    .parameter "context"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/nloko/android/syncmypix/SyncService;",
            ">(",
            "Landroid/content/Context;",
            "Ljava/lang/Class",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p1, cls:Ljava/lang/Class;,"Ljava/lang/Class<TT;>;"
    const/4 v3, 0x0

    .line 779
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2, p0, p1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-static {p0, v3, v2, v3}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    .line 782
    .local v0, alarmSender:Landroid/app/PendingIntent;
    const-string v2, "alarm"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/AlarmManager;

    .line 783
    .local v1, am:Landroid/app/AlarmManager;
    invoke-virtual {v1, v0}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 784
    return-void
.end method

.method public static getLoginClass()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 812
    const/4 v0, 0x0

    return-object v0
.end method

.method private getPreferences()V
    .locals 4

    .prologue
    .line 633
    new-instance v0, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;

    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/SyncService;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;-><init>(Landroid/content/Context;)V

    .line 635
    .local v0, prefs:Lcom/nloko/android/syncmypix/SyncMyPixPreferences;
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->getAllowGoogleSync()Z

    move-result v1

    iput-boolean v1, p0, Lcom/nloko/android/syncmypix/SyncService;->mAllowGoogleSync:Z

    .line 636
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->getSkipIfConflict()Z

    move-result v1

    iput-boolean v1, p0, Lcom/nloko/android/syncmypix/SyncService;->mSkipIfConflict:Z

    .line 637
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->getMaxQuality()Z

    move-result v1

    iput-boolean v1, p0, Lcom/nloko/android/syncmypix/SyncService;->mMaxQuality:Z

    .line 638
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->getCropSquare()Z

    move-result v1

    iput-boolean v1, p0, Lcom/nloko/android/syncmypix/SyncService;->mCropSquare:Z

    .line 639
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->getSkipIfExists()Z

    move-result v1

    iput-boolean v1, p0, Lcom/nloko/android/syncmypix/SyncService;->mSkipIfExists:Z

    .line 640
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->overrideReadOnlyCheck()Z

    move-result v1

    iput-boolean v1, p0, Lcom/nloko/android/syncmypix/SyncService;->mOverrideReadOnlyCheck:Z

    .line 641
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->getIntelliMatch()Z

    move-result v1

    iput-boolean v1, p0, Lcom/nloko/android/syncmypix/SyncService;->mIntelliMatch:Z

    .line 642
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->getPhoneOnly()Z

    move-result v1

    iput-boolean v1, p0, Lcom/nloko/android/syncmypix/SyncService;->mPhoneOnly:Z

    .line 643
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->getCache()Z

    move-result v1

    iput-boolean v1, p0, Lcom/nloko/android/syncmypix/SyncService;->mCacheOn:Z

    .line 645
    const-string v1, "SyncService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "PhoneOnly is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/nloko/android/syncmypix/SyncService;->mPhoneOnly:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 646
    return-void
.end method

.method public static isLoggedIn(Landroid/content/Context;)Z
    .locals 1
    .parameter "context"

    .prologue
    .line 807
    const/4 v0, 0x0

    return v0
.end method

.method private showError(I)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 740
    const v0, 0x7f060048

    invoke-direct {p0, v0, p1}, Lcom/nloko/android/syncmypix/SyncService;->cancelNotification(II)V

    .line 741
    return-void
.end method

.method private showNotification(II)V
    .locals 1
    .parameter "msg"
    .parameter "icon"

    .prologue
    .line 704
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/nloko/android/syncmypix/SyncService;->showNotification(IIZ)V

    .line 705
    return-void
.end method

.method private showNotification(IILandroid/content/Intent;Z)V
    .locals 6
    .parameter "msg"
    .parameter "icon"
    .parameter "i"
    .parameter "autoCancel"

    .prologue
    const/4 v5, 0x0

    .line 719
    invoke-virtual {p0, p1}, Lcom/nloko/android/syncmypix/SyncService;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    .line 720
    .local v2, text:Ljava/lang/CharSequence;
    new-instance v1, Landroid/app/Notification;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-direct {v1, p2, v2, v3, v4}, Landroid/app/Notification;-><init>(ILjava/lang/CharSequence;J)V

    .line 723
    .local v1, notification:Landroid/app/Notification;
    if-eqz p4, :cond_0

    .line 724
    const/16 v3, 0x10

    iput v3, v1, Landroid/app/Notification;->flags:I

    .line 728
    :cond_0
    invoke-static {p0, v5, p3, v5}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    .line 732
    .local v0, contentIntent:Landroid/app/PendingIntent;
    invoke-virtual {p0, p1}, Lcom/nloko/android/syncmypix/SyncService;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v1, p0, v3, v2, v0}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 735
    iget-object v3, p0, Lcom/nloko/android/syncmypix/SyncService;->mNotifyManager:Landroid/app/NotificationManager;

    invoke-virtual {v3, p1, v1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 736
    return-void
.end method

.method private showNotification(IIZ)V
    .locals 3
    .parameter "msg"
    .parameter "icon"
    .parameter "autoCancel"

    .prologue
    .line 710
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/SyncService;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 711
    .local v0, i:Landroid/content/Intent;
    const/high16 v1, 0x2002

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 714
    invoke-direct {p0, p1, p2, v0, p3}, Lcom/nloko/android/syncmypix/SyncService;->showNotification(IILandroid/content/Intent;Z)V

    .line 715
    return-void
.end method

.method private updateResults(Z)V
    .locals 2
    .parameter "finish"

    .prologue
    .line 650
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncService;->mResultsList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 651
    new-instance v0, Lcom/nloko/android/syncmypix/SyncService$UpdateResultsTable;

    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncService;->mResultsList:Ljava/util/List;

    invoke-direct {v0, p0, v1, p1}, Lcom/nloko/android/syncmypix/SyncService$UpdateResultsTable;-><init>(Lcom/nloko/android/syncmypix/SyncService;Ljava/util/List;Z)V

    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/SyncService$UpdateResultsTable;->start()V

    .line 653
    :cond_0
    return-void
.end method

.method public static updateSchedule(Landroid/content/Context;Ljava/lang/Class;JJ)V
    .locals 7
    .parameter "context"
    .parameter
    .parameter "startTime"
    .parameter "interval"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/nloko/android/syncmypix/SyncService;",
            ">(",
            "Landroid/content/Context;",
            "Ljava/lang/Class",
            "<TT;>;JJ)V"
        }
    .end annotation

    .prologue
    .local p1, cls:Ljava/lang/Class;,"Ljava/lang/Class<TT;>;"
    const/4 v1, 0x0

    .line 788
    if-nez p0, :cond_0

    .line 789
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "context"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 795
    :cond_0
    new-instance v2, Landroid/content/Intent;

    const-string v3, "com.nloko.android.syncmypix.SYNC"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v1, v2, v1}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v6

    .line 799
    .local v6, alarmSender:Landroid/app/PendingIntent;
    const-string v2, "alarm"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .local v0, am:Landroid/app/AlarmManager;
    move-wide v2, p2

    move-wide v4, p4

    .line 800
    invoke-virtual/range {v0 .. v6}, Landroid/app/AlarmManager;->setRepeating(IJJLandroid/app/PendingIntent;)V

    .line 801
    return-void
.end method


# virtual methods
.method public cancelOperation()V
    .locals 2

    .prologue
    .line 619
    iget-boolean v1, p0, Lcom/nloko/android/syncmypix/SyncService;->mExecuting:Z

    if-eqz v1, :cond_1

    .line 620
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncService;->mListener:Lcom/nloko/android/syncmypix/SyncServiceListener;

    .line 621
    .local v0, listener:Lcom/nloko/android/syncmypix/SyncServiceListener;
    if-eqz v0, :cond_0

    .line 622
    invoke-interface {v0}, Lcom/nloko/android/syncmypix/SyncServiceListener;->onSyncCancelled()V

    .line 624
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/nloko/android/syncmypix/SyncService;->mCancel:Z

    .line 626
    .end local v0           #listener:Lcom/nloko/android/syncmypix/SyncServiceListener;
    :cond_1
    return-void
.end method

.method protected finalize()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 698
    invoke-super {p0}, Landroid/app/Service;->finalize()V

    .line 699
    const-string v0, "SyncService"

    const-string v1, "FINALIZED"

    invoke-static {v0, v1}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 700
    return-void
.end method

.method public getSocialNetworkName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 817
    const-string v0, "Default"

    return-object v0
.end method

.method public getStatus()I
    .locals 1

    .prologue
    .line 103
    iget v0, p0, Lcom/nloko/android/syncmypix/SyncService;->mStatus:I

    return v0
.end method

.method public isExecuting()Z
    .locals 1

    .prologue
    .line 628
    iget-boolean v0, p0, Lcom/nloko/android/syncmypix/SyncService;->mExecuting:Z

    return v0
.end method

.method public isStarted()Z
    .locals 1

    .prologue
    .line 629
    iget-boolean v0, p0, Lcom/nloko/android/syncmypix/SyncService;->mStarted:Z

    return v0
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .parameter "intent"

    .prologue
    .line 774
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncService;->mBinder:Landroid/os/IBinder;

    return-object v0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 687
    const-string v0, "SyncService"

    const-string v1, "onDestroy"

    invoke-static {v0, v1}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 688
    const v0, 0x7f060048

    invoke-direct {p0, v0}, Lcom/nloko/android/syncmypix/SyncService;->cancelNotification(I)V

    .line 689
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/SyncService;->unsetListener()V

    .line 691
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nloko/android/syncmypix/SyncService;->mStarted:Z

    .line 692
    invoke-static {}, Lcom/nloko/android/syncmypix/SyncWakeLock;->releaseWakeLock()V

    .line 693
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 694
    return-void
.end method

.method public onLowMemory()V
    .locals 1

    .prologue
    .line 657
    invoke-super {p0}, Landroid/app/Service;->onLowMemory()V

    .line 659
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/nloko/android/syncmypix/SyncService;->updateResults(Z)V

    .line 661
    const v0, 0x7f060048

    invoke-direct {p0, v0}, Lcom/nloko/android/syncmypix/SyncService;->cancelNotification(I)V

    .line 662
    return-void
.end method

.method public onStart(Landroid/content/Intent;I)V
    .locals 2
    .parameter "intent"
    .parameter "startId"

    .prologue
    const/4 v1, 0x1

    .line 666
    invoke-super {p0, p1, p2}, Landroid/app/Service;->onStart(Landroid/content/Intent;I)V

    .line 669
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/SyncService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncWakeLock;->acquireWakeLock(Landroid/content/Context;)V

    .line 672
    iput-boolean v1, p0, Lcom/nloko/android/syncmypix/SyncService;->mExecuting:Z

    .line 673
    iput-boolean v1, p0, Lcom/nloko/android/syncmypix/SyncService;->mStarted:Z

    .line 674
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nloko/android/syncmypix/SyncService;->mCancel:Z

    .line 676
    invoke-virtual {p0, v1}, Lcom/nloko/android/syncmypix/SyncService;->updateStatus(I)V

    .line 677
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/SyncService;->getPreferences()V

    .line 679
    const-string v0, "notification"

    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/SyncService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncService;->mNotifyManager:Landroid/app/NotificationManager;

    .line 680
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncService;->mNotifyManager:Landroid/app/NotificationManager;

    const v1, 0x7f060049

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 682
    const v0, 0x7f060048

    const v1, 0x1080081

    invoke-direct {p0, v0, v1}, Lcom/nloko/android/syncmypix/SyncService;->showNotification(II)V

    .line 683
    return-void
.end method

.method public setListener(Lcom/nloko/android/syncmypix/SyncServiceListener;)V
    .locals 2
    .parameter "listener"

    .prologue
    .line 191
    if-nez p1, :cond_0

    .line 192
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "listener"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 195
    :cond_0
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncService;->mListener:Lcom/nloko/android/syncmypix/SyncServiceListener;

    .line 196
    return-void
.end method

.method public unsetListener()V
    .locals 1

    .prologue
    .line 200
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncService;->mListener:Lcom/nloko/android/syncmypix/SyncServiceListener;

    .line 201
    return-void
.end method

.method protected updateStatus(I)V
    .locals 0
    .parameter "status"

    .prologue
    .line 108
    iput p1, p0, Lcom/nloko/android/syncmypix/SyncService;->mStatus:I

    .line 109
    return-void
.end method

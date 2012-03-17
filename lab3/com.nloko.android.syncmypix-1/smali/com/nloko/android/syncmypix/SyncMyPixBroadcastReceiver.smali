.class public Lcom/nloko/android/syncmypix/SyncMyPixBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SyncMyPixBroadcastReceiver.java"


# static fields
.field private static final SYNC_STATE_CHANGED:Ljava/lang/String; = "android.intent.action.SYNC_STATE_CHANGED"

.field private static final TAG:Ljava/lang/String; = "SyncMyPixBroadcastReceiver"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private rescheduleAlarm(Landroid/content/Context;)V
    .locals 12
    .parameter "context"

    .prologue
    const-wide/16 v10, 0x0

    const/4 v9, 0x0

    .line 69
    const-string v0, "SyncMyPixPrefs"

    invoke-virtual {p1, v0, v9}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v7

    .line 70
    .local v7, settings:Landroid/content/SharedPreferences;
    const-string v0, "sched_freq"

    invoke-interface {v7, v0, v9}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    .line 71
    .local v6, freq:I
    const-string v0, "sched_time"

    invoke-interface {v7, v0, v10, v11}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    .line 72
    .local v2, time:J
    invoke-static {v6}, Lcom/nloko/android/syncmypix/SettingsActivity;->getScheduleInterval(I)J

    move-result-wide v4

    .line 74
    .local v4, interval:J
    const-string v0, "SyncMyPixBroadcastReceiver"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "freq: "

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    const-string v0, "SyncMyPixBroadcastReceiver"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "time: "

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    const-string v0, "SyncMyPixBroadcastReceiver"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "interval: "

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    cmp-long v0, v2, v0

    if-gez v0, :cond_0

    .line 79
    add-long/2addr v2, v4

    .line 80
    const-string v0, "SyncMyPixBroadcastReceiver"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "time + interval: "

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    const-string v0, "SyncMyPixPrefs"

    invoke-virtual {p1, v0, v9}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "sched_time"

    invoke-static {v0, v1, v2, v3}, Lcom/nloko/android/Utils;->setLong(Landroid/content/SharedPreferences;Ljava/lang/String;J)V

    .line 84
    :cond_0
    cmp-long v0, v4, v10

    if-lez v0, :cond_1

    .line 85
    const-string v0, "SyncMyPixBroadcastReceiver"

    const-string v1, "Scheduling Service..."

    invoke-static {v0, v1}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    invoke-static {p1}, Lcom/nloko/android/syncmypix/MainActivity;->getSyncSource(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v1

    move-object v0, p1

    invoke-static/range {v0 .. v5}, Lcom/nloko/android/syncmypix/SyncService;->updateSchedule(Landroid/content/Context;Ljava/lang/Class;JJ)V

    .line 91
    :cond_1
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v4, 0x0

    .line 41
    const-string v2, "SyncMyPixBroadcastReceiver"

    const-string v3, "RECEIVED INTENT"

    invoke-static {v2, v3}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 44
    .local v0, action:Ljava/lang/String;
    const-string v2, "android.intent.action.BOOT_COMPLETED"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 45
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/nloko/android/syncmypix/SyncMyPixBroadcastReceiver;->rescheduleAlarm(Landroid/content/Context;)V

    .line 65
    :cond_0
    :goto_0
    return-void

    .line 48
    :cond_1
    const-string v2, "android.intent.action.PACKAGE_REPLACED"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 49
    const-string v2, "SyncMyPixBroadcastReceiver"

    const-string v3, "ACTION_PACKAGE_REPLACED"

    invoke-static {v2, v3}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    const-string v2, "SyncMyPixPrefs"

    invoke-virtual {p1, v2, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "do_not_show_about"

    invoke-static {v2, v3, v4}, Lcom/nloko/android/Utils;->setBoolean(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    .line 53
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/nloko/android/syncmypix/SyncMyPixBroadcastReceiver;->rescheduleAlarm(Landroid/content/Context;)V

    goto :goto_0

    .line 56
    :cond_2
    const-string v2, "com.nloko.android.syncmypix.SYNC"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 57
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 58
    .local v1, appContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/nloko/android/syncmypix/SyncWakeLock;->acquireWakeLock(Landroid/content/Context;)V

    .line 59
    new-instance v2, Landroid/content/Intent;

    invoke-static {v1}, Lcom/nloko/android/syncmypix/MainActivity;->getSyncSource(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v3

    invoke-direct {v2, v1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, v2}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_0

    .line 63
    .end local v1           #appContext:Landroid/content/Context;
    :cond_3
    const-string v2, "android.intent.action.SYNC_STATE_CHANGED"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0
.end method

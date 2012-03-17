.class Lcom/nloko/android/syncmypix/SettingsActivity$3;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/SettingsActivity;->setupViews(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nloko/android/syncmypix/SettingsActivity;


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/SettingsActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 131
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SettingsActivity$3;->this$0:Lcom/nloko/android/syncmypix/SettingsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 8
    .parameter "preference"
    .parameter "newValue"

    .prologue
    const/4 v7, 0x0

    .line 135
    check-cast p2, Ljava/lang/String;

    .end local p2
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 140
    .local v6, position:I
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SettingsActivity$3;->this$0:Lcom/nloko/android/syncmypix/SettingsActivity;

    const-string v1, "SyncMyPixPrefs"

    invoke-virtual {v0, v1, v7}, Lcom/nloko/android/syncmypix/SettingsActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "sched_freq"

    invoke-static {v0, v1, v6}, Lcom/nloko/android/Utils;->setInt(Landroid/content/SharedPreferences;Ljava/lang/String;I)V

    .line 142
    invoke-static {v6}, Lcom/nloko/android/syncmypix/SettingsActivity;->getScheduleInterval(I)J

    move-result-wide v4

    .local v4, interval:J
    const-wide/16 v0, 0x0

    cmp-long v0, v4, v0

    if-lez v0, :cond_0

    .line 143
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    add-long v2, v0, v4

    .line 144
    .local v2, firstTriggerTime:J
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SettingsActivity$3;->this$0:Lcom/nloko/android/syncmypix/SettingsActivity;

    const-string v1, "SyncMyPixPrefs"

    invoke-virtual {v0, v1, v7}, Lcom/nloko/android/syncmypix/SettingsActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "sched_time"

    invoke-static {v0, v1, v2, v3}, Lcom/nloko/android/Utils;->setLong(Landroid/content/SharedPreferences;Ljava/lang/String;J)V

    .line 145
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SettingsActivity$3;->this$0:Lcom/nloko/android/syncmypix/SettingsActivity;

    iget-object v1, p0, Lcom/nloko/android/syncmypix/SettingsActivity$3;->this$0:Lcom/nloko/android/syncmypix/SettingsActivity;

    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/SettingsActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/nloko/android/syncmypix/MainActivity;->getSyncSource(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v1

    invoke-static/range {v0 .. v5}, Lcom/nloko/android/syncmypix/SyncService;->updateSchedule(Landroid/content/Context;Ljava/lang/Class;JJ)V

    .line 153
    .end local v2           #firstTriggerTime:J
    :goto_0
    const/4 v0, 0x1

    return v0

    .line 151
    :cond_0
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SettingsActivity$3;->this$0:Lcom/nloko/android/syncmypix/SettingsActivity;

    iget-object v1, p0, Lcom/nloko/android/syncmypix/SettingsActivity$3;->this$0:Lcom/nloko/android/syncmypix/SettingsActivity;

    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/SettingsActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/nloko/android/syncmypix/MainActivity;->getSyncSource(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/nloko/android/syncmypix/SyncService;->cancelSchedule(Landroid/content/Context;Ljava/lang/Class;)V

    goto :goto_0
.end method

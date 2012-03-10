.class public Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;
.super Lcom/nloko/android/syncmypix/SyncService;
.source "FacebookSyncService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nloko/android/syncmypix/facebook/FacebookSyncService$FacebookLogin;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "FacebookSyncService"


# instance fields
.field private mLoginThread:Lcom/nloko/android/syncmypix/facebook/FacebookSyncService$FacebookLogin;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/SyncService;-><init>()V

    .line 46
    return-void
.end method

.method static synthetic access$000(Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;)Lcom/nloko/android/syncmypix/SyncServiceListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 41
    iget-object v0, p0, Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;->mListener:Lcom/nloko/android/syncmypix/SyncServiceListener;

    return-object v0
.end method

.method static synthetic access$100(Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;)Lcom/nloko/android/syncmypix/SyncService$MainHandler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 41
    iget-object v0, p0, Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;->mMainHandler:Lcom/nloko/android/syncmypix/SyncService$MainHandler;

    return-object v0
.end method

.method static synthetic access$200(Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 41
    iget-boolean v0, p0, Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;->mMaxQuality:Z

    return v0
.end method

.method static synthetic access$300(Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;)Lcom/nloko/android/syncmypix/SyncService$MainHandler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 41
    iget-object v0, p0, Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;->mMainHandler:Lcom/nloko/android/syncmypix/SyncService$MainHandler;

    return-object v0
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
    .line 159
    const-class v0, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;

    return-object v0
.end method

.method public static isLoggedIn(Landroid/content/Context;)Z
    .locals 7
    .parameter "context"

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x0

    .line 149
    const-string v4, "SyncMyPixPrefs"

    invoke-virtual {p0, v4, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 150
    .local v2, settings:Landroid/content/SharedPreferences;
    const-string v4, "session_key"

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 151
    .local v1, session_key:Ljava/lang/String;
    const-string v4, "secret"

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 152
    .local v0, secret:Ljava/lang/String;
    const-string v4, "uid"

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 154
    .local v3, uid:Ljava/lang/String;
    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    if-eqz v3, :cond_0

    const/4 v4, 0x1

    :goto_0
    return v4

    :cond_0
    move v4, v6

    goto :goto_0
.end method


# virtual methods
.method protected finalize()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 123
    invoke-super {p0}, Lcom/nloko/android/syncmypix/SyncService;->finalize()V

    .line 124
    const-string v0, "FacebookSyncService"

    const-string v1, "FINALIZED"

    invoke-static {v0, v1}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    return-void
.end method

.method public getSocialNetworkName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 164
    const-string v0, "Facebook"

    return-object v0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 129
    invoke-super {p0}, Lcom/nloko/android/syncmypix/SyncService;->onDestroy()V

    .line 130
    iget-object v0, p0, Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;->mLoginThread:Lcom/nloko/android/syncmypix/facebook/FacebookSyncService$FacebookLogin;

    if-eqz v0, :cond_0

    .line 131
    iget-object v0, p0, Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;->mLoginThread:Lcom/nloko/android/syncmypix/facebook/FacebookSyncService$FacebookLogin;

    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/facebook/FacebookSyncService$FacebookLogin;->stopRunning()V

    .line 133
    :cond_0
    return-void
.end method

.method public onStart(Landroid/content/Intent;I)V
    .locals 2
    .parameter "intent"
    .parameter "startId"

    .prologue
    .line 138
    invoke-super {p0, p1, p2}, Lcom/nloko/android/syncmypix/SyncService;->onStart(Landroid/content/Intent;I)V

    .line 140
    const-string v0, "FacebookSyncService"

    const-string v1, "Staring FacebookSyncService"

    invoke-static {v0, v1}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    new-instance v0, Lcom/nloko/android/syncmypix/facebook/FacebookSyncService$FacebookLogin;

    invoke-direct {v0, p0}, Lcom/nloko/android/syncmypix/facebook/FacebookSyncService$FacebookLogin;-><init>(Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;)V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;->mLoginThread:Lcom/nloko/android/syncmypix/facebook/FacebookSyncService$FacebookLogin;

    .line 143
    iget-object v0, p0, Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;->mLoginThread:Lcom/nloko/android/syncmypix/facebook/FacebookSyncService$FacebookLogin;

    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/facebook/FacebookSyncService$FacebookLogin;->start()V

    .line 144
    return-void
.end method

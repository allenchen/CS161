.class Lcom/nloko/android/syncmypix/facebook/FacebookSyncService$FacebookLogin;
.super Ljava/lang/Thread;
.source "FacebookSyncService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FacebookLogin"
.end annotation


# instance fields
.field private mService:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;",
            ">;"
        }
    .end annotation
.end field

.field private running:Z


# direct methods
.method public constructor <init>(Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;)V
    .locals 2
    .parameter "service"

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 49
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/nloko/android/syncmypix/facebook/FacebookSyncService$FacebookLogin;->running:Z

    .line 53
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/nloko/android/syncmypix/facebook/FacebookSyncService$FacebookLogin;->mService:Ljava/lang/ref/WeakReference;

    .line 55
    invoke-static {p1}, Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;->access$000(Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;)Lcom/nloko/android/syncmypix/SyncServiceListener;

    move-result-object v0

    .line 56
    .local v0, listener:Lcom/nloko/android/syncmypix/SyncServiceListener;
    if-eqz v0, :cond_0

    .line 57
    invoke-interface {v0}, Lcom/nloko/android/syncmypix/SyncServiceListener;->onFriendsDownloadStarted()V

    .line 59
    :cond_0
    return-void
.end method


# virtual methods
.method public run()V
    .locals 14

    .prologue
    .line 70
    iget-object v8, p0, Lcom/nloko/android/syncmypix/facebook/FacebookSyncService$FacebookLogin;->mService:Ljava/lang/ref/WeakReference;

    invoke-virtual {v8}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;

    .line 71
    .local v6, service:Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;
    if-nez v6, :cond_1

    .line 118
    :cond_0
    :goto_0
    return-void

    .line 74
    :cond_1
    invoke-static {v6}, Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;->access$100(Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;)Lcom/nloko/android/syncmypix/SyncService$MainHandler;

    move-result-object v4

    .line 75
    .local v4, handler:Lcom/nloko/android/syncmypix/SyncService$MainHandler;
    if-eqz v4, :cond_0

    .line 79
    const/4 v1, 0x0

    .line 80
    .local v1, client:Lcom/nloko/simplyfacebook/net/FacebookRestClient;
    const-string v8, "FacebookSyncService"

    const-string v9, "SyncMyPixPrefs"

    const/4 v10, 0x0

    invoke-virtual {v6, v9, v10}, Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v9

    const-string v10, "uid"

    const/4 v11, 0x0

    invoke-interface {v9, v10, v11}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    const-string v8, "FacebookSyncService"

    const-string v9, "SyncMyPixPrefs"

    const/4 v10, 0x0

    invoke-virtual {v6, v9, v10}, Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v9

    const-string v10, "session_key"

    const/4 v11, 0x0

    invoke-interface {v9, v10, v11}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    const-string v8, "FacebookSyncService"

    const-string v9, "SyncMyPixPrefs"

    const/4 v10, 0x0

    invoke-virtual {v6, v9, v10}, Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v9

    const-string v10, "secret"

    const/4 v11, 0x0

    invoke-interface {v9, v10, v11}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    :try_start_0
    new-instance v2, Lcom/nloko/simplyfacebook/net/FacebookRestClient;

    const-string v8, "d03f3dcb1ebb264e1ea701bd16f44e5a"

    const-string v9, "SyncMyPixPrefs"

    const/4 v10, 0x0

    invoke-virtual {v6, v9, v10}, Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v9

    const-string v10, "uid"

    const/4 v11, 0x0

    invoke-interface {v9, v10, v11}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "SyncMyPixPrefs"

    const/4 v11, 0x0

    invoke-virtual {v6, v10, v11}, Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v10

    const-string v11, "session_key"

    const/4 v12, 0x0

    invoke-interface {v10, v11, v12}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v11, "SyncMyPixPrefs"

    const/4 v12, 0x0

    invoke-virtual {v6, v11, v12}, Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v11

    const-string v12, "secret"

    const/4 v13, 0x0

    invoke-interface {v11, v12, v13}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v2, v8, v9, v10, v11}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 90
    .end local v1           #client:Lcom/nloko/simplyfacebook/net/FacebookRestClient;
    .local v2, client:Lcom/nloko/simplyfacebook/net/FacebookRestClient;
    :try_start_1
    new-instance v0, Lcom/nloko/android/syncmypix/facebook/FacebookApi;

    invoke-direct {v0, v2}, Lcom/nloko/android/syncmypix/facebook/FacebookApi;-><init>(Lcom/nloko/simplyfacebook/net/FacebookRestClient;)V

    .line 91
    .local v0, api:Lcom/nloko/android/syncmypix/facebook/FacebookApi;
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/facebook/FacebookApi;->getFriends()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6}, Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;->access$200(Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;)Z

    move-result v9

    invoke-virtual {v0, v8, v9}, Lcom/nloko/android/syncmypix/facebook/FacebookApi;->getUserInfo(Ljava/lang/String;Z)Ljava/util/List;

    move-result-object v7

    .line 92
    .local v7, userList:Ljava/util/List;,"Ljava/util/List<Lcom/nloko/android/syncmypix/SocialNetworkUser;>;"
    monitor-enter p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 93
    :try_start_2
    iget-boolean v8, p0, Lcom/nloko/android/syncmypix/facebook/FacebookSyncService$FacebookLogin;->running:Z

    if-eqz v8, :cond_2

    .line 95
    invoke-virtual {v4}, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->obtainMessage()Landroid/os/Message;

    move-result-object v5

    .line 96
    .local v5, msg:Landroid/os/Message;
    const/4 v8, 0x0

    iput v8, v5, Landroid/os/Message;->what:I

    .line 97
    iput-object v7, v5, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 98
    invoke-virtual {v4, v5}, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->sendMessage(Landroid/os/Message;)Z

    .line 100
    .end local v5           #msg:Landroid/os/Message;
    :cond_2
    monitor-exit p0

    move-object v1, v2

    .line 117
    .end local v2           #client:Lcom/nloko/simplyfacebook/net/FacebookRestClient;
    .restart local v1       #client:Lcom/nloko/simplyfacebook/net/FacebookRestClient;
    goto/16 :goto_0

    .line 100
    .end local v1           #client:Lcom/nloko/simplyfacebook/net/FacebookRestClient;
    .restart local v2       #client:Lcom/nloko/simplyfacebook/net/FacebookRestClient;
    :catchall_0
    move-exception v8

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v8
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 101
    .end local v0           #api:Lcom/nloko/android/syncmypix/facebook/FacebookApi;
    .end local v7           #userList:Ljava/util/List;,"Ljava/util/List<Lcom/nloko/android/syncmypix/SocialNetworkUser;>;"
    :catch_0
    move-exception v8

    move-object v3, v8

    move-object v1, v2

    .line 102
    .end local v2           #client:Lcom/nloko/simplyfacebook/net/FacebookRestClient;
    .restart local v1       #client:Lcom/nloko/simplyfacebook/net/FacebookRestClient;
    .local v3, ex:Ljava/lang/Exception;
    :goto_1
    const-string v8, "FacebookSyncService"

    invoke-static {v3}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/nloko/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    if-eqz v4, :cond_0

    .line 104
    if-nez v1, :cond_3

    .line 105
    const/4 v8, 0x1

    const v9, 0x7f06004c

    const/4 v10, 0x0

    invoke-virtual {v4, v8, v9, v10}, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v8

    invoke-virtual {v4, v8}, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->sendMessage(Landroid/os/Message;)Z

    .line 115
    :goto_2
    invoke-static {v6}, Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;->access$300(Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;)Lcom/nloko/android/syncmypix/SyncService$MainHandler;

    move-result-object v8

    iget-object v8, v8, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->resetExecuting:Ljava/lang/Runnable;

    invoke-virtual {v4, v8}, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_0

    .line 110
    :cond_3
    const/4 v8, 0x1

    const v9, 0x7f06004a

    const/4 v10, 0x0

    invoke-virtual {v4, v8, v9, v10}, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v8

    invoke-virtual {v4, v8}, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_2

    .line 101
    .end local v3           #ex:Ljava/lang/Exception;
    :catch_1
    move-exception v8

    move-object v3, v8

    goto :goto_1
.end method

.method public stopRunning()V
    .locals 1

    .prologue
    .line 63
    monitor-enter p0

    .line 64
    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/nloko/android/syncmypix/facebook/FacebookSyncService$FacebookLogin;->running:Z

    .line 65
    monitor-exit p0

    .line 66
    return-void

    .line 65
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

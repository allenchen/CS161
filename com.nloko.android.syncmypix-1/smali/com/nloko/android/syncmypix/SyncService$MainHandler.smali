.class public Lcom/nloko/android/syncmypix/SyncService$MainHandler;
.super Landroid/os/Handler;
.source "SyncService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nloko/android/syncmypix/SyncService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "MainHandler"
.end annotation


# static fields
.field public static final SHOW_ERROR:I = 0x1

.field public static final START_SYNC:I


# instance fields
.field public final finish:Ljava/lang/Runnable;

.field private final mSyncService:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/nloko/android/syncmypix/SyncService;",
            ">;"
        }
    .end annotation
.end field

.field public final resetExecuting:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/SyncService;)V
    .locals 1
    .parameter "service"

    .prologue
    .line 118
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 122
    new-instance v0, Lcom/nloko/android/syncmypix/SyncService$MainHandler$1;

    invoke-direct {v0, p0}, Lcom/nloko/android/syncmypix/SyncService$MainHandler$1;-><init>(Lcom/nloko/android/syncmypix/SyncService$MainHandler;)V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->resetExecuting:Ljava/lang/Runnable;

    .line 132
    new-instance v0, Lcom/nloko/android/syncmypix/SyncService$MainHandler$2;

    invoke-direct {v0, p0}, Lcom/nloko/android/syncmypix/SyncService$MainHandler$2;-><init>(Lcom/nloko/android/syncmypix/SyncService$MainHandler;)V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->finish:Ljava/lang/Runnable;

    .line 119
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->mSyncService:Ljava/lang/ref/WeakReference;

    .line 120
    return-void
.end method

.method static synthetic access$000(Lcom/nloko/android/syncmypix/SyncService$MainHandler;)Ljava/lang/ref/WeakReference;
    .locals 1
    .parameter "x0"

    .prologue
    .line 111
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->mSyncService:Ljava/lang/ref/WeakReference;

    return-object v0
.end method


# virtual methods
.method public handleError(I)V
    .locals 3
    .parameter "msg"

    .prologue
    .line 149
    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->mSyncService:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nloko/android/syncmypix/SyncService;

    .line 150
    .local v1, service:Lcom/nloko/android/syncmypix/SyncService;
    if-eqz v1, :cond_1

    .line 151
    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->resetExecuting:Ljava/lang/Runnable;

    invoke-virtual {p0, v2}, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 153
    iget-object v0, v1, Lcom/nloko/android/syncmypix/SyncService;->mListener:Lcom/nloko/android/syncmypix/SyncServiceListener;

    .line 154
    .local v0, listener:Lcom/nloko/android/syncmypix/SyncServiceListener;
    if-eqz v0, :cond_0

    .line 155
    invoke-interface {v0, p1}, Lcom/nloko/android/syncmypix/SyncServiceListener;->onError(I)V

    .line 158
    :cond_0
    invoke-static {v1, p1}, Lcom/nloko/android/syncmypix/SyncService;->access$300(Lcom/nloko/android/syncmypix/SyncService;I)V

    .line 160
    .end local v0           #listener:Lcom/nloko/android/syncmypix/SyncServiceListener;
    :cond_1
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .parameter "msg"

    .prologue
    .line 176
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 185
    :goto_0
    return-void

    .line 178
    :pswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    .line 179
    .local v0, users:Ljava/util/List;,"Ljava/util/List<Lcom/nloko/android/syncmypix/SocialNetworkUser;>;"
    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->startSync(Ljava/util/List;)V

    goto :goto_0

    .line 182
    .end local v0           #users:Ljava/util/List;,"Ljava/util/List<Lcom/nloko/android/syncmypix/SocialNetworkUser;>;"
    :pswitch_1
    iget v1, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {p0, v1}, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->handleError(I)V

    goto :goto_0

    .line 176
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public startSync(Ljava/util/List;)V
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/nloko/android/syncmypix/SocialNetworkUser;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 165
    .local p1, users:Ljava/util/List;,"Ljava/util/List<Lcom/nloko/android/syncmypix/SocialNetworkUser;>;"
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->mSyncService:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nloko/android/syncmypix/SyncService;

    .line 166
    .local v0, service:Lcom/nloko/android/syncmypix/SyncService;
    if-eqz v0, :cond_0

    .line 167
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/nloko/android/syncmypix/SyncService;->updateStatus(I)V

    .line 168
    new-instance v1, Lcom/nloko/android/syncmypix/SyncService$SyncTask;

    invoke-direct {v1, v0}, Lcom/nloko/android/syncmypix/SyncService$SyncTask;-><init>(Lcom/nloko/android/syncmypix/SyncService;)V

    invoke-static {v0, v1}, Lcom/nloko/android/syncmypix/SyncService;->access$402(Lcom/nloko/android/syncmypix/SyncService;Lcom/nloko/android/syncmypix/SyncService$SyncTask;)Lcom/nloko/android/syncmypix/SyncService$SyncTask;

    .line 169
    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncService;->access$400(Lcom/nloko/android/syncmypix/SyncService;)Lcom/nloko/android/syncmypix/SyncService$SyncTask;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/util/List;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-virtual {v1, v2}, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 171
    :cond_0
    return-void
.end method

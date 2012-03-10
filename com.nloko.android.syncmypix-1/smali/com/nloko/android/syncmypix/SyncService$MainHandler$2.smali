.class Lcom/nloko/android/syncmypix/SyncService$MainHandler$2;
.super Ljava/lang/Object;
.source "SyncService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nloko/android/syncmypix/SyncService$MainHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nloko/android/syncmypix/SyncService$MainHandler;


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/SyncService$MainHandler;)V
    .locals 0
    .parameter

    .prologue
    .line 132
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncService$MainHandler$2;->this$0:Lcom/nloko/android/syncmypix/SyncService$MainHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 134
    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncService$MainHandler$2;->this$0:Lcom/nloko/android/syncmypix/SyncService$MainHandler;

    invoke-static {v2}, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->access$000(Lcom/nloko/android/syncmypix/SyncService$MainHandler;)Ljava/lang/ref/WeakReference;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nloko/android/syncmypix/SyncService;

    .line 135
    .local v1, service:Lcom/nloko/android/syncmypix/SyncService;
    if-eqz v1, :cond_1

    .line 136
    iget-object v0, v1, Lcom/nloko/android/syncmypix/SyncService;->mListener:Lcom/nloko/android/syncmypix/SyncServiceListener;

    .line 137
    .local v0, listener:Lcom/nloko/android/syncmypix/SyncServiceListener;
    if-eqz v0, :cond_0

    .line 138
    invoke-interface {v0}, Lcom/nloko/android/syncmypix/SyncServiceListener;->onSyncCompleted()V

    .line 140
    :cond_0
    invoke-static {v1}, Lcom/nloko/android/syncmypix/SyncService;->access$200(Lcom/nloko/android/syncmypix/SyncService;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 141
    invoke-static {}, Lcom/nloko/android/syncmypix/SyncWakeLock;->releaseWakeLock()V

    .line 142
    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/SyncService;->stopSelf()V

    .line 144
    .end local v0           #listener:Lcom/nloko/android/syncmypix/SyncServiceListener;
    :cond_1
    return-void
.end method

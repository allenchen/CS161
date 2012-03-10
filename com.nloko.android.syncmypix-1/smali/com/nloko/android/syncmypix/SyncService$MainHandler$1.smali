.class Lcom/nloko/android/syncmypix/SyncService$MainHandler$1;
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
    .line 122
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncService$MainHandler$1;->this$0:Lcom/nloko/android/syncmypix/SyncService$MainHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 124
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncService$MainHandler$1;->this$0:Lcom/nloko/android/syncmypix/SyncService$MainHandler;

    invoke-static {v1}, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->access$000(Lcom/nloko/android/syncmypix/SyncService$MainHandler;)Ljava/lang/ref/WeakReference;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nloko/android/syncmypix/SyncService;

    .line 125
    .local v0, service:Lcom/nloko/android/syncmypix/SyncService;
    if-eqz v0, :cond_0

    .line 126
    invoke-static {v0, v2}, Lcom/nloko/android/syncmypix/SyncService;->access$102(Lcom/nloko/android/syncmypix/SyncService;Z)Z

    .line 127
    invoke-virtual {v0, v2}, Lcom/nloko/android/syncmypix/SyncService;->updateStatus(I)V

    .line 129
    :cond_0
    return-void
.end method

.class Lcom/nloko/android/syncmypix/MainActivity$14;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nloko/android/syncmypix/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nloko/android/syncmypix/MainActivity;


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/MainActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 469
    iput-object p1, p0, Lcom/nloko/android/syncmypix/MainActivity$14;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 5
    .parameter "className"
    .parameter "service"

    .prologue
    .line 471
    const-string v2, "MainActivity"

    const-string v3, "onServiceConnected"

    invoke-static {v2, v3}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 472
    iget-object v2, p0, Lcom/nloko/android/syncmypix/MainActivity$14;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    new-instance v3, Ljava/lang/ref/WeakReference;

    check-cast p2, Lcom/nloko/android/syncmypix/SyncService$LocalBinder;

    .end local p2
    invoke-virtual {p2}, Lcom/nloko/android/syncmypix/SyncService$LocalBinder;->getService()Lcom/nloko/android/syncmypix/SyncService;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {v2, v3}, Lcom/nloko/android/syncmypix/MainActivity;->access$302(Lcom/nloko/android/syncmypix/MainActivity;Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;

    .line 473
    iget-object v2, p0, Lcom/nloko/android/syncmypix/MainActivity$14;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    invoke-static {v2}, Lcom/nloko/android/syncmypix/MainActivity;->access$300(Lcom/nloko/android/syncmypix/MainActivity;)Ljava/lang/ref/WeakReference;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 474
    iget-object v2, p0, Lcom/nloko/android/syncmypix/MainActivity$14;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    invoke-static {v2}, Lcom/nloko/android/syncmypix/MainActivity;->access$300(Lcom/nloko/android/syncmypix/MainActivity;)Ljava/lang/ref/WeakReference;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nloko/android/syncmypix/SyncService;

    .line 475
    .local v1, s:Lcom/nloko/android/syncmypix/SyncService;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/SyncService;->isExecuting()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 476
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/SyncService;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 477
    .local v0, i:Landroid/content/Intent;
    const/high16 v2, 0x2002

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 478
    iget-object v2, p0, Lcom/nloko/android/syncmypix/MainActivity$14;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    invoke-virtual {v2, v0}, Lcom/nloko/android/syncmypix/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 481
    .end local v0           #i:Landroid/content/Intent;
    .end local v1           #s:Lcom/nloko/android/syncmypix/SyncService;
    :cond_0
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .parameter "className"

    .prologue
    .line 484
    const-string v0, "MainActivity"

    const-string v1, "onServiceDisconnected"

    invoke-static {v0, v1}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 485
    iget-object v0, p0, Lcom/nloko/android/syncmypix/MainActivity$14;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/nloko/android/syncmypix/MainActivity;->access$302(Lcom/nloko/android/syncmypix/MainActivity;Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;

    .line 486
    return-void
.end method

.class Lcom/nloko/android/syncmypix/SyncProgressActivity$2;
.super Ljava/lang/Object;
.source "SyncProgressActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/SyncProgressActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/SyncProgressActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 93
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$2;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 95
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$2;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-static {v1}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->access$000(Lcom/nloko/android/syncmypix/SyncProgressActivity;)Ljava/lang/ref/WeakReference;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nloko/android/syncmypix/SyncService;

    .line 96
    .local v0, service:Lcom/nloko/android/syncmypix/SyncService;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/SyncService;->isExecuting()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 97
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/SyncService;->cancelOperation()V

    .line 99
    :cond_0
    return-void
.end method

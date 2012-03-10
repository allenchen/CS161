.class Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$1;
.super Ljava/lang/Object;
.source "SyncResultsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;->hideDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;

.field final synthetic val$activity:Lcom/nloko/android/syncmypix/SyncResultsActivity;


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;Lcom/nloko/android/syncmypix/SyncResultsActivity;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 918
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$1;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;

    iput-object p2, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$1;->val$activity:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 920
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$1;->val$activity:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$300(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Landroid/widget/ProgressBar;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 921
    return-void
.end method

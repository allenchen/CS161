.class Lcom/nloko/android/syncmypix/SyncResultsActivity$12$1;
.super Ljava/lang/Object;
.source "SyncResultsActivity.java"

# interfaces
.implements Lcom/nloko/android/syncmypix/DbHelperNotifier;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/SyncResultsActivity$12;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/nloko/android/syncmypix/SyncResultsActivity$12;


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/SyncResultsActivity$12;)V
    .locals 0
    .parameter

    .prologue
    .line 831
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$12$1;->this$1:Lcom/nloko/android/syncmypix/SyncResultsActivity$12;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onUpdateComplete()V
    .locals 2

    .prologue
    .line 833
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$12$1;->this$1:Lcom/nloko/android/syncmypix/SyncResultsActivity$12;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncResultsActivity$12;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    new-instance v1, Lcom/nloko/android/syncmypix/SyncResultsActivity$12$1$1;

    invoke-direct {v1, p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$12$1$1;-><init>(Lcom/nloko/android/syncmypix/SyncResultsActivity$12$1;)V

    invoke-virtual {v0, v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 843
    return-void
.end method

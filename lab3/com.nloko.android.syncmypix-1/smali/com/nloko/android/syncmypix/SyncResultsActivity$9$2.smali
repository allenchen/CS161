.class Lcom/nloko/android/syncmypix/SyncResultsActivity$9$2;
.super Ljava/lang/Object;
.source "SyncResultsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/nloko/android/syncmypix/SyncResultsActivity$9;


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/SyncResultsActivity$9;)V
    .locals 0
    .parameter

    .prologue
    .line 703
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9$2;->this$1:Lcom/nloko/android/syncmypix/SyncResultsActivity$9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 706
    :try_start_0
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9$2;->this$1:Lcom/nloko/android/syncmypix/SyncResultsActivity$9;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->dismissDialog(I)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 710
    :goto_0
    return-void

    .line 707
    :catch_0
    move-exception v0

    goto :goto_0
.end method

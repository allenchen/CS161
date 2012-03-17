.class Lcom/nloko/android/syncmypix/SyncResultsActivity$2;
.super Ljava/lang/Object;
.source "SyncResultsActivity.java"

# interfaces
.implements Lcom/nloko/android/ThumbnailCache$ImageListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/SyncResultsActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/SyncResultsActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 185
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$2;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onImageReady(Ljava/lang/String;)V
    .locals 3
    .parameter "url"

    .prologue
    .line 187
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$2;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-static {v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$100(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Landroid/widget/ListView;

    move-result-object v1

    if-nez v1, :cond_0

    .line 203
    :goto_0
    return-void

    .line 188
    :cond_0
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$2;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-static {v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$100(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Landroid/widget/ListView;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/widget/ListView;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 191
    .local v0, image:Landroid/widget/ImageView;
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$2;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    new-instance v2, Lcom/nloko/android/syncmypix/SyncResultsActivity$2$1;

    invoke-direct {v2, p0, v0, p1}, Lcom/nloko/android/syncmypix/SyncResultsActivity$2$1;-><init>(Lcom/nloko/android/syncmypix/SyncResultsActivity$2;Landroid/widget/ImageView;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

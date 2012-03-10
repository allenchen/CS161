.class Lcom/nloko/android/syncmypix/SyncResultsActivity$2$1;
.super Ljava/lang/Object;
.source "SyncResultsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/SyncResultsActivity$2;->onImageReady(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/nloko/android/syncmypix/SyncResultsActivity$2;

.field final synthetic val$image:Landroid/widget/ImageView;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/SyncResultsActivity$2;Landroid/widget/ImageView;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 191
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$2$1;->this$1:Lcom/nloko/android/syncmypix/SyncResultsActivity$2;

    iput-object p2, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$2$1;->val$image:Landroid/widget/ImageView;

    iput-object p3, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$2$1;->val$url:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 193
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$2$1;->this$1:Lcom/nloko/android/syncmypix/SyncResultsActivity$2;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncResultsActivity$2;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$100(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Landroid/widget/ListView;

    move-result-object v0

    if-nez v0, :cond_0

    .line 201
    :goto_0
    return-void

    .line 194
    :cond_0
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$2$1;->this$1:Lcom/nloko/android/syncmypix/SyncResultsActivity$2;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncResultsActivity$2;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$200(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/ThumbnailCache;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$2$1;->val$image:Landroid/widget/ImageView;

    if-eqz v0, :cond_1

    .line 195
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$2$1;->val$image:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$2$1;->this$1:Lcom/nloko/android/syncmypix/SyncResultsActivity$2;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/SyncResultsActivity$2;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-static {v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$200(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/ThumbnailCache;

    move-result-object v1

    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$2$1;->val$url:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/nloko/android/ThumbnailCache;->get(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 200
    :goto_1
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$2$1;->this$1:Lcom/nloko/android/syncmypix/SyncResultsActivity$2;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncResultsActivity$2;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$100(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ListView;->invalidateViews()V

    goto :goto_0

    .line 198
    :cond_1
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$2$1;->this$1:Lcom/nloko/android/syncmypix/SyncResultsActivity$2;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncResultsActivity$2;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$100(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Landroid/widget/SimpleCursorAdapter;

    invoke-virtual {v0}, Landroid/widget/SimpleCursorAdapter;->notifyDataSetChanged()V

    goto :goto_1
.end method

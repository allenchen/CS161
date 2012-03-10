.class Lcom/nloko/android/syncmypix/SyncResultsActivity$4;
.super Ljava/lang/Object;
.source "SyncResultsActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


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
    .line 214
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$4;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 5
    .parameter
    .parameter "view"
    .parameter "position"
    .parameter "id"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 218
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    iget-object v3, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$4;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-static {v3}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$100(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Landroid/widget/ListView;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v3

    check-cast v3, Landroid/widget/SimpleCursorAdapter;

    invoke-virtual {v3}, Landroid/widget/SimpleCursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 219
    .local v0, cursor:Landroid/database/Cursor;
    invoke-interface {v0, p3}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 221
    const-string v3, "pic_url"

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 222
    .local v2, url:Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 224
    iget-object v3, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$4;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-static {v3}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$300(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Landroid/widget/ProgressBar;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 226
    iget-object v3, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$4;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-static {v3}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$400(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/syncmypix/SyncResultsActivity$DownloadImageHandler;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nloko/android/syncmypix/SyncResultsActivity$DownloadImageHandler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    .line 227
    .local v1, msg:Landroid/os/Message;
    const/4 v3, 0x1

    iput v3, v1, Landroid/os/Message;->what:I

    .line 228
    iput-object v2, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 229
    iget-object v3, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$4;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-static {v3}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$400(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/syncmypix/SyncResultsActivity$DownloadImageHandler;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity$DownloadImageHandler;->sendMessage(Landroid/os/Message;)Z

    .line 231
    .end local v1           #msg:Landroid/os/Message;
    :cond_0
    return-void
.end method

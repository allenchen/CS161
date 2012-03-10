.class Lcom/nloko/android/syncmypix/SyncResultsActivity$1;
.super Ljava/lang/Object;
.source "SyncResultsActivity.java"

# interfaces
.implements Lcom/nloko/android/ThumbnailCache$ImageProvider;


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
    .line 172
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$1;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onImageRequired(Ljava/lang/String;)Z
    .locals 2
    .parameter "url"

    .prologue
    .line 174
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$1;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-static {v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$000(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 176
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$1;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-static {v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$000(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 177
    .local v0, msg:Landroid/os/Message;
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 178
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$1;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-static {v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$000(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->sendMessage(Landroid/os/Message;)Z

    .line 179
    const/4 v1, 0x1

    .line 181
    .end local v0           #msg:Landroid/os/Message;
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

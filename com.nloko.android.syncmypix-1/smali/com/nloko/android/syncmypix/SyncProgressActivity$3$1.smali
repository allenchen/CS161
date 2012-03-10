.class Lcom/nloko/android/syncmypix/SyncProgressActivity$3$1;
.super Ljava/lang/Object;
.source "SyncProgressActivity.java"

# interfaces
.implements Lcom/nloko/android/syncmypix/SyncServiceListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/nloko/android/syncmypix/SyncProgressActivity$3;


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/SyncProgressActivity$3;)V
    .locals 0
    .parameter

    .prologue
    .line 180
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3$1;->this$1:Lcom/nloko/android/syncmypix/SyncProgressActivity$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onContactSynced(Ljava/lang/String;Landroid/graphics/Bitmap;Ljava/lang/String;)V
    .locals 4
    .parameter "name"
    .parameter "bitmap"
    .parameter "status"

    .prologue
    const/4 v3, 0x0

    .line 201
    const-string v0, "SyncProgressActivity"

    const-string v1, "onPictureDownloaded for %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3$1;->this$1:Lcom/nloko/android/syncmypix/SyncProgressActivity$3;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->access$600(Lcom/nloko/android/syncmypix/SyncProgressActivity;)Landroid/widget/TextSwitcher;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/widget/TextSwitcher;->setText(Ljava/lang/CharSequence;)V

    .line 204
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3$1;->this$1:Lcom/nloko/android/syncmypix/SyncProgressActivity$3;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->access$700(Lcom/nloko/android/syncmypix/SyncProgressActivity;)Landroid/widget/TextSwitcher;

    move-result-object v0

    invoke-virtual {v0, p3}, Landroid/widget/TextSwitcher;->setText(Ljava/lang/CharSequence;)V

    .line 205
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3$1;->this$1:Lcom/nloko/android/syncmypix/SyncProgressActivity$3;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->access$800(Lcom/nloko/android/syncmypix/SyncProgressActivity;)Landroid/widget/ImageSwitcher;

    move-result-object v0

    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v1, p2}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageSwitcher;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 206
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3$1;->this$1:Lcom/nloko/android/syncmypix/SyncProgressActivity$3;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->access$800(Lcom/nloko/android/syncmypix/SyncProgressActivity;)Landroid/widget/ImageSwitcher;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ImageSwitcher;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    .line 207
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3$1;->this$1:Lcom/nloko/android/syncmypix/SyncProgressActivity$3;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->access$800(Lcom/nloko/android/syncmypix/SyncProgressActivity;)Landroid/widget/ImageSwitcher;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/widget/ImageSwitcher;->setVisibility(I)V

    .line 209
    :cond_0
    return-void
.end method

.method public onError(I)V
    .locals 1
    .parameter "id"

    .prologue
    .line 197
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3$1;->this$1:Lcom/nloko/android/syncmypix/SyncProgressActivity$3;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->finish()V

    .line 198
    return-void
.end method

.method public onFriendsDownloadStarted()V
    .locals 2

    .prologue
    .line 219
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3$1;->this$1:Lcom/nloko/android/syncmypix/SyncProgressActivity$3;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->access$100(Lcom/nloko/android/syncmypix/SyncProgressActivity;)Landroid/widget/TextView;

    move-result-object v0

    const v1, 0x7f060027

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 220
    return-void
.end method

.method public onSyncCancelled()V
    .locals 2

    .prologue
    .line 223
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3$1;->this$1:Lcom/nloko/android/syncmypix/SyncProgressActivity$3;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->showDialog(I)V

    .line 224
    return-void
.end method

.method public onSyncCompleted()V
    .locals 3

    .prologue
    .line 212
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3$1;->this$1:Lcom/nloko/android/syncmypix/SyncProgressActivity$3;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 213
    .local v0, i:Landroid/content/Intent;
    const/high16 v1, 0x2002

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 214
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3$1;->this$1:Lcom/nloko/android/syncmypix/SyncProgressActivity$3;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-virtual {v1, v0}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->startActivity(Landroid/content/Intent;)V

    .line 215
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3$1;->this$1:Lcom/nloko/android/syncmypix/SyncProgressActivity$3;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->finish()V

    .line 216
    return-void
.end method

.method public onSyncProgressUpdated(III)V
    .locals 3
    .parameter "percentage"
    .parameter "index"
    .parameter "total"

    .prologue
    const/4 v2, 0x0

    .line 182
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3$1;->this$1:Lcom/nloko/android/syncmypix/SyncProgressActivity$3;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->access$100(Lcom/nloko/android/syncmypix/SyncProgressActivity;)Landroid/widget/TextView;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 183
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3$1;->this$1:Lcom/nloko/android/syncmypix/SyncProgressActivity$3;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->access$400(Lcom/nloko/android/syncmypix/SyncProgressActivity;)Landroid/widget/ProgressBar;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 184
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3$1;->this$1:Lcom/nloko/android/syncmypix/SyncProgressActivity$3;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->access$500(Lcom/nloko/android/syncmypix/SyncProgressActivity;)Landroid/widget/ProgressBar;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 185
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3$1;->this$1:Lcom/nloko/android/syncmypix/SyncProgressActivity$3;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->access$200(Lcom/nloko/android/syncmypix/SyncProgressActivity;)Landroid/widget/ImageButton;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 186
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3$1;->this$1:Lcom/nloko/android/syncmypix/SyncProgressActivity$3;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->access$300(Lcom/nloko/android/syncmypix/SyncProgressActivity;)Landroid/widget/ImageButton;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 188
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3$1;->this$1:Lcom/nloko/android/syncmypix/SyncProgressActivity$3;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->access$500(Lcom/nloko/android/syncmypix/SyncProgressActivity;)Landroid/widget/ProgressBar;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 189
    const/16 v0, 0x64

    if-ge p1, v0, :cond_0

    .line 190
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3$1;->this$1:Lcom/nloko/android/syncmypix/SyncProgressActivity$3;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->access$500(Lcom/nloko/android/syncmypix/SyncProgressActivity;)Landroid/widget/ProgressBar;

    move-result-object v0

    invoke-virtual {v0, p3}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 191
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3$1;->this$1:Lcom/nloko/android/syncmypix/SyncProgressActivity$3;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->access$500(Lcom/nloko/android/syncmypix/SyncProgressActivity;)Landroid/widget/ProgressBar;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 194
    :cond_0
    return-void
.end method

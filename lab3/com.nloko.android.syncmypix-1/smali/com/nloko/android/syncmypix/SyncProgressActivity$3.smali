.class Lcom/nloko/android/syncmypix/SyncProgressActivity$3;
.super Ljava/lang/Object;
.source "SyncProgressActivity.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nloko/android/syncmypix/SyncProgressActivity;
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
    .line 158
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 6
    .parameter "className"
    .parameter "service"

    .prologue
    const/4 v5, 0x0

    .line 160
    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    new-instance v3, Ljava/lang/ref/WeakReference;

    check-cast p2, Lcom/nloko/android/syncmypix/SyncService$LocalBinder;

    .end local p2
    invoke-virtual {p2}, Lcom/nloko/android/syncmypix/SyncService$LocalBinder;->getService()Lcom/nloko/android/syncmypix/SyncService;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {v2, v3}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->access$002(Lcom/nloko/android/syncmypix/SyncProgressActivity;Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;

    .line 161
    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-static {v2}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->access$000(Lcom/nloko/android/syncmypix/SyncProgressActivity;)Ljava/lang/ref/WeakReference;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nloko/android/syncmypix/SyncService;

    .line 162
    .local v0, s:Lcom/nloko/android/syncmypix/SyncService;
    if-nez v0, :cond_0

    .line 226
    :goto_0
    return-void

    .line 166
    :cond_0
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/SyncService;->getStatus()I

    move-result v1

    .line 167
    .local v1, status:I
    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    .line 168
    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-static {v2}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->access$100(Lcom/nloko/android/syncmypix/SyncProgressActivity;)Landroid/widget/TextView;

    move-result-object v2

    const v3, 0x7f060027

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 180
    :goto_1
    new-instance v2, Lcom/nloko/android/syncmypix/SyncProgressActivity$3$1;

    invoke-direct {v2, p0}, Lcom/nloko/android/syncmypix/SyncProgressActivity$3$1;-><init>(Lcom/nloko/android/syncmypix/SyncProgressActivity$3;)V

    invoke-virtual {v0, v2}, Lcom/nloko/android/syncmypix/SyncService;->setListener(Lcom/nloko/android/syncmypix/SyncServiceListener;)V

    goto :goto_0

    .line 169
    :cond_1
    if-nez v1, :cond_2

    .line 170
    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-virtual {v2}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f06002c

    invoke-static {v2, v3, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 173
    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-virtual {v2}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->finish()V

    goto :goto_0

    .line 176
    :cond_2
    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-static {v2}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->access$200(Lcom/nloko/android/syncmypix/SyncProgressActivity;)Landroid/widget/ImageButton;

    move-result-object v2

    invoke-virtual {v2, v5}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 177
    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-static {v2}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->access$300(Lcom/nloko/android/syncmypix/SyncProgressActivity;)Landroid/widget/ImageButton;

    move-result-object v2

    invoke-virtual {v2, v5}, Landroid/widget/ImageButton;->setVisibility(I)V

    goto :goto_1
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 3
    .parameter "className"

    .prologue
    .line 229
    const-string v1, "SyncProgressActivity"

    const-string v2, "onServiceDisconnected"

    invoke-static {v1, v2}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 230
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->access$902(Lcom/nloko/android/syncmypix/SyncProgressActivity;Z)Z

    .line 231
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-static {v1}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->access$000(Lcom/nloko/android/syncmypix/SyncProgressActivity;)Ljava/lang/ref/WeakReference;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nloko/android/syncmypix/SyncService;

    .line 232
    .local v0, s:Lcom/nloko/android/syncmypix/SyncService;
    if-eqz v0, :cond_0

    .line 233
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/SyncService;->unsetListener()V

    .line 235
    :cond_0
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->access$002(Lcom/nloko/android/syncmypix/SyncProgressActivity;Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;

    .line 236
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->finish()V

    .line 237
    return-void
.end method

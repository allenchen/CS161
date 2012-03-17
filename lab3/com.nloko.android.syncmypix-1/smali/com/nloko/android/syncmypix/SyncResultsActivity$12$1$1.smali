.class Lcom/nloko/android/syncmypix/SyncResultsActivity$12$1$1;
.super Ljava/lang/Object;
.source "SyncResultsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/SyncResultsActivity$12$1;->onUpdateComplete()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/nloko/android/syncmypix/SyncResultsActivity$12$1;


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/SyncResultsActivity$12$1;)V
    .locals 0
    .parameter

    .prologue
    .line 833
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$12$1$1;->this$2:Lcom/nloko/android/syncmypix/SyncResultsActivity$12$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 835
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$12$1$1;->this$2:Lcom/nloko/android/syncmypix/SyncResultsActivity$12$1;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncResultsActivity$12$1;->this$1:Lcom/nloko/android/syncmypix/SyncResultsActivity$12;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncResultsActivity$12;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->dismissDialog(I)V

    .line 836
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$12$1$1;->this$2:Lcom/nloko/android/syncmypix/SyncResultsActivity$12$1;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncResultsActivity$12$1;->this$1:Lcom/nloko/android/syncmypix/SyncResultsActivity$12;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncResultsActivity$12;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f060044

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 840
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$12$1$1;->this$2:Lcom/nloko/android/syncmypix/SyncResultsActivity$12$1;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncResultsActivity$12$1;->this$1:Lcom/nloko/android/syncmypix/SyncResultsActivity$12;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncResultsActivity$12;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->finish()V

    .line 841
    return-void
.end method

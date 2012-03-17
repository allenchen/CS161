.class Lcom/nloko/android/syncmypix/SyncProgressActivity$1;
.super Ljava/lang/Object;
.source "SyncProgressActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/SyncProgressActivity;->onCreate(Landroid/os/Bundle;)V
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
    .line 83
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$1;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 85
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$1;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/nloko/android/syncmypix/MainActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 86
    .local v0, i:Landroid/content/Intent;
    const/high16 v1, 0x2002

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 87
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$1;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-virtual {v1, v0}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->startActivity(Landroid/content/Intent;)V

    .line 88
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity$1;->this$0:Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->finish()V

    .line 89
    return-void
.end method

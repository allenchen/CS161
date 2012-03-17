.class Lcom/nloko/android/syncmypix/SyncResultsActivity$6;
.super Ljava/lang/Object;
.source "SyncResultsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    .line 262
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$6;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 264
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$6;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/nloko/android/syncmypix/MainActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 265
    .local v0, i:Landroid/content/Intent;
    const/high16 v1, 0x2002

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 266
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$6;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-virtual {v1, v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->startActivity(Landroid/content/Intent;)V

    .line 267
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$6;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->finish()V

    .line 268
    return-void
.end method

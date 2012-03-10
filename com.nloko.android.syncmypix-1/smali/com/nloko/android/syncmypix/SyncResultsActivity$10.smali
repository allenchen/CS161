.class Lcom/nloko/android/syncmypix/SyncResultsActivity$10;
.super Ljava/lang/Object;
.source "SyncResultsActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/SyncResultsActivity;->showZoomDialog()Landroid/app/Dialog;
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
    .line 797
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$10;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 2
    .parameter "dialog"

    .prologue
    .line 799
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$10;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->removeDialog(I)V

    .line 800
    return-void
.end method

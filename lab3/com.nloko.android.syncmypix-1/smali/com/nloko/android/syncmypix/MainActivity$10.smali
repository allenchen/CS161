.class Lcom/nloko/android/syncmypix/MainActivity$10;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/MainActivity;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nloko/android/syncmypix/MainActivity;


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/MainActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 370
    iput-object p1, p0, Lcom/nloko/android/syncmypix/MainActivity$10;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .parameter "dialog"
    .parameter "id"

    .prologue
    .line 372
    iget-object v1, p0, Lcom/nloko/android/syncmypix/MainActivity$10;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/nloko/android/syncmypix/MainActivity;->removeDialog(I)V

    .line 374
    iget-object v1, p0, Lcom/nloko/android/syncmypix/MainActivity$10;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Lcom/nloko/android/syncmypix/MainActivity;->showDialog(I)V

    .line 375
    new-instance v0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;

    iget-object v1, p0, Lcom/nloko/android/syncmypix/MainActivity$10;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;-><init>(Landroid/content/Context;)V

    .line 376
    .local v0, dbHelper:Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;
    new-instance v1, Lcom/nloko/android/syncmypix/MainActivity$10$1;

    invoke-direct {v1, p0}, Lcom/nloko/android/syncmypix/MainActivity$10$1;-><init>(Lcom/nloko/android/syncmypix/MainActivity$10;)V

    invoke-virtual {v0, v1}, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->deleteAllPictures(Lcom/nloko/android/syncmypix/DbHelperNotifier;)V

    .line 390
    return-void
.end method

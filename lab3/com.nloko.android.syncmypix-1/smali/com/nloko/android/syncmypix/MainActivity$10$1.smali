.class Lcom/nloko/android/syncmypix/MainActivity$10$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Lcom/nloko/android/syncmypix/DbHelperNotifier;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/MainActivity$10;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/nloko/android/syncmypix/MainActivity$10;


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/MainActivity$10;)V
    .locals 0
    .parameter

    .prologue
    .line 376
    iput-object p1, p0, Lcom/nloko/android/syncmypix/MainActivity$10$1;->this$1:Lcom/nloko/android/syncmypix/MainActivity$10;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onUpdateComplete()V
    .locals 2

    .prologue
    .line 378
    iget-object v0, p0, Lcom/nloko/android/syncmypix/MainActivity$10$1;->this$1:Lcom/nloko/android/syncmypix/MainActivity$10;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/MainActivity$10;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    new-instance v1, Lcom/nloko/android/syncmypix/MainActivity$10$1$1;

    invoke-direct {v1, p0}, Lcom/nloko/android/syncmypix/MainActivity$10$1$1;-><init>(Lcom/nloko/android/syncmypix/MainActivity$10$1;)V

    invoke-virtual {v0, v1}, Lcom/nloko/android/syncmypix/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 388
    return-void
.end method

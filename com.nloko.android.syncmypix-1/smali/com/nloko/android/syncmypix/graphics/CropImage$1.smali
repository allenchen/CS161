.class Lcom/nloko/android/syncmypix/graphics/CropImage$1;
.super Ljava/lang/Object;
.source "CropImage.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/graphics/CropImage;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/graphics/CropImage;)V
    .locals 0
    .parameter

    .prologue
    .line 424
    iput-object p1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$1;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 426
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$1;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/graphics/CropImage;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 458
    :goto_0
    return-void

    .line 429
    :cond_0
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$1;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$1;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    const/4 v2, 0x0

    const-string v3, "Running"

    invoke-static {v1, v2, v3, v4, v5}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZ)Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/nloko/android/syncmypix/graphics/CropImage;->access$202(Lcom/nloko/android/syncmypix/graphics/CropImage;Landroid/app/ProgressDialog;)Landroid/app/ProgressDialog;

    .line 434
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$1;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mImageView:Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;

    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$1;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/graphics/CropImage;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1, v4, v4}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->setImageBitmapResetBase(Landroid/graphics/Bitmap;ZZ)V

    .line 435
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$1;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mImageView:Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;

    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->getScale()F

    move-result v0

    const/high16 v1, 0x3f80

    cmpl-float v0, v0, v1

    if-nez v0, :cond_1

    .line 436
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$1;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mImageView:Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;

    invoke-virtual {v0, v4, v4, v5}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->center(ZZZ)V

    .line 438
    :cond_1
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/nloko/android/syncmypix/graphics/CropImage$1$1;

    invoke-direct {v1, p0}, Lcom/nloko/android/syncmypix/graphics/CropImage$1$1;-><init>(Lcom/nloko/android/syncmypix/graphics/CropImage$1;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

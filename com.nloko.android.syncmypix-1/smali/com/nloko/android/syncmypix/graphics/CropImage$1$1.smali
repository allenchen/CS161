.class Lcom/nloko/android/syncmypix/graphics/CropImage$1$1;
.super Ljava/lang/Object;
.source "CropImage.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/graphics/CropImage$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$1;


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/graphics/CropImage$1;)V
    .locals 0
    .parameter

    .prologue
    .line 438
    iput-object p1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$1$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 441
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$1$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$1;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/graphics/CropImage$1;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/graphics/CropImage;->mImage:Ljava/lang/Object;

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    move-object v0, v1

    .line 444
    .local v0, b:Landroid/graphics/Bitmap;
    :goto_0
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$1$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$1;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/graphics/CropImage$1;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/graphics/CropImage;->mHandler:Landroid/os/Handler;

    new-instance v2, Lcom/nloko/android/syncmypix/graphics/CropImage$1$1$1;

    invoke-direct {v2, p0, v0}, Lcom/nloko/android/syncmypix/graphics/CropImage$1$1$1;-><init>(Lcom/nloko/android/syncmypix/graphics/CropImage$1$1;Landroid/graphics/Bitmap;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 456
    return-void

    .line 441
    .end local v0           #b:Landroid/graphics/Bitmap;
    :cond_0
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$1$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$1;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/graphics/CropImage$1;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/graphics/CropImage;->mBitmap:Landroid/graphics/Bitmap;

    move-object v0, v1

    goto :goto_0
.end method

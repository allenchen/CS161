.class Lcom/nloko/android/syncmypix/graphics/CropImage$3$1;
.super Ljava/lang/Object;
.source "CropImage.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/graphics/CropImage$3;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$3;


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/graphics/CropImage$3;)V
    .locals 0
    .parameter

    .prologue
    .line 560
    iput-object p1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$3$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 562
    iget-object v4, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$3$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$3;

    iget-object v4, v4, Lcom/nloko/android/syncmypix/graphics/CropImage$3;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    invoke-static {v4}, Lcom/nloko/android/syncmypix/graphics/CropImage;->access$900(Lcom/nloko/android/syncmypix/graphics/CropImage;)Landroid/net/Uri;

    move-result-object v4

    if-eqz v4, :cond_4

    .line 563
    const/4 v1, 0x0

    .line 565
    .local v1, outputStream:Ljava/io/OutputStream;
    :try_start_0
    iget-object v4, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$3$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$3;

    iget-object v4, v4, Lcom/nloko/android/syncmypix/graphics/CropImage$3;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    invoke-static {v4}, Lcom/nloko/android/syncmypix/graphics/CropImage;->access$900(Lcom/nloko/android/syncmypix/graphics/CropImage;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v3

    .line 566
    .local v3, scheme:Ljava/lang/String;
    const-string v4, "file"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 567
    new-instance v2, Ljava/io/FileOutputStream;

    iget-object v4, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$3$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$3;

    iget-object v4, v4, Lcom/nloko/android/syncmypix/graphics/CropImage$3;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    invoke-static {v4}, Lcom/nloko/android/syncmypix/graphics/CropImage;->access$900(Lcom/nloko/android/syncmypix/graphics/CropImage;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    const-string v6, ":/"

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v5, v6

    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .end local v1           #outputStream:Ljava/io/OutputStream;
    .local v2, outputStream:Ljava/io/OutputStream;
    move-object v1, v2

    .line 571
    .end local v2           #outputStream:Ljava/io/OutputStream;
    .restart local v1       #outputStream:Ljava/io/OutputStream;
    :goto_0
    if-eqz v1, :cond_0

    .line 572
    iget-object v4, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$3$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$3;

    iget-object v4, v4, Lcom/nloko/android/syncmypix/graphics/CropImage$3;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v4, v4, Lcom/nloko/android/syncmypix/graphics/CropImage;->mCroppedImage:Landroid/graphics/Bitmap;

    iget-object v5, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$3$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$3;

    iget-object v5, v5, Lcom/nloko/android/syncmypix/graphics/CropImage$3;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    invoke-static {v5}, Lcom/nloko/android/syncmypix/graphics/CropImage;->access$1000(Lcom/nloko/android/syncmypix/graphics/CropImage;)Landroid/graphics/Bitmap$CompressFormat;

    move-result-object v5

    const/16 v6, 0x4b

    invoke-virtual {v4, v5, v6, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 578
    :cond_0
    if-eqz v1, :cond_1

    .line 580
    :try_start_1
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 586
    .end local v3           #scheme:Ljava/lang/String;
    :cond_1
    :goto_1
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 587
    .local v0, extras:Landroid/os/Bundle;
    iget-object v4, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$3$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$3;

    iget-object v4, v4, Lcom/nloko/android/syncmypix/graphics/CropImage$3;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    const/4 v5, -0x1

    new-instance v6, Landroid/content/Intent;

    invoke-direct {v6}, Landroid/content/Intent;-><init>()V

    iget-object v7, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$3$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$3;

    iget-object v7, v7, Lcom/nloko/android/syncmypix/graphics/CropImage$3;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    invoke-static {v7}, Lcom/nloko/android/syncmypix/graphics/CropImage;->access$900(Lcom/nloko/android/syncmypix/graphics/CropImage;)Landroid/net/Uri;

    move-result-object v7

    invoke-virtual {v7}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v6

    invoke-virtual {v6, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/nloko/android/syncmypix/graphics/CropImage;->setResult(ILandroid/content/Intent;)V

    .line 658
    .end local v1           #outputStream:Ljava/io/OutputStream;
    :goto_2
    iget-object v4, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$3$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$3;

    iget-object v4, v4, Lcom/nloko/android/syncmypix/graphics/CropImage$3;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    invoke-virtual {v4}, Lcom/nloko/android/syncmypix/graphics/CropImage;->finish()V

    .line 659
    return-void

    .line 569
    .end local v0           #extras:Landroid/os/Bundle;
    .restart local v1       #outputStream:Ljava/io/OutputStream;
    .restart local v3       #scheme:Ljava/lang/String;
    :cond_2
    :try_start_2
    iget-object v4, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$3$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$3;

    iget-object v4, v4, Lcom/nloko/android/syncmypix/graphics/CropImage$3;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v4, v4, Lcom/nloko/android/syncmypix/graphics/CropImage;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v5, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$3$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$3;

    iget-object v5, v5, Lcom/nloko/android/syncmypix/graphics/CropImage$3;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    invoke-static {v5}, Lcom/nloko/android/syncmypix/graphics/CropImage;->access$900(Lcom/nloko/android/syncmypix/graphics/CropImage;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v1

    goto :goto_0

    .line 574
    .end local v3           #scheme:Ljava/lang/String;
    :catch_0
    move-exception v4

    .line 578
    if-eqz v1, :cond_1

    .line 580
    :try_start_3
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_1

    .line 581
    :catch_1
    move-exception v4

    goto :goto_1

    .line 578
    :catchall_0
    move-exception v4

    if-eqz v1, :cond_3

    .line 580
    :try_start_4
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 583
    :cond_3
    :goto_3
    throw v4

    .line 592
    .end local v1           #outputStream:Ljava/io/OutputStream;
    :cond_4
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 593
    .restart local v0       #extras:Landroid/os/Bundle;
    const-string v4, "rect"

    iget-object v5, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$3$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$3;

    iget-object v5, v5, Lcom/nloko/android/syncmypix/graphics/CropImage$3;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v5, v5, Lcom/nloko/android/syncmypix/graphics/CropImage;->mCrop:Lcom/nloko/android/syncmypix/graphics/HighlightView;

    invoke-virtual {v5}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->getCropRect()Landroid/graphics/Rect;

    move-result-object v5

    invoke-virtual {v5}, Landroid/graphics/Rect;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 581
    .end local v0           #extras:Landroid/os/Bundle;
    .restart local v1       #outputStream:Ljava/io/OutputStream;
    .restart local v3       #scheme:Ljava/lang/String;
    :catch_2
    move-exception v4

    goto :goto_1

    .end local v3           #scheme:Ljava/lang/String;
    :catch_3
    move-exception v5

    goto :goto_3
.end method

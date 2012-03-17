.class Lcom/nloko/android/ThumbnailCache$ImageDownloader$1;
.super Ljava/lang/Object;
.source "ThumbnailCache.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/ThumbnailCache$ImageDownloader;->setupThread()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nloko/android/ThumbnailCache$ImageDownloader;

.field final synthetic val$cache:Lcom/nloko/android/ThumbnailCache;


# direct methods
.method constructor <init>(Lcom/nloko/android/ThumbnailCache$ImageDownloader;Lcom/nloko/android/ThumbnailCache;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 230
    iput-object p1, p0, Lcom/nloko/android/ThumbnailCache$ImageDownloader$1;->this$0:Lcom/nloko/android/ThumbnailCache$ImageDownloader;

    iput-object p2, p0, Lcom/nloko/android/ThumbnailCache$ImageDownloader$1;->val$cache:Lcom/nloko/android/ThumbnailCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 233
    :cond_0
    :goto_0
    iget-object v4, p0, Lcom/nloko/android/ThumbnailCache$ImageDownloader$1;->this$0:Lcom/nloko/android/ThumbnailCache$ImageDownloader;

    invoke-static {v4}, Lcom/nloko/android/ThumbnailCache$ImageDownloader;->access$000(Lcom/nloko/android/ThumbnailCache$ImageDownloader;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 235
    :try_start_0
    iget-object v4, p0, Lcom/nloko/android/ThumbnailCache$ImageDownloader$1;->this$0:Lcom/nloko/android/ThumbnailCache$ImageDownloader;

    invoke-static {v4}, Lcom/nloko/android/ThumbnailCache$ImageDownloader;->access$100(Lcom/nloko/android/ThumbnailCache$ImageDownloader;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 236
    .local v3, url:Ljava/lang/String;
    invoke-static {v3}, Lcom/nloko/android/Utils;->downloadPictureAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 237
    .local v1, friend:Ljava/io/InputStream;
    if-eqz v1, :cond_0

    .line 238
    invoke-static {v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 239
    .local v2, image:Landroid/graphics/Bitmap;
    iget-object v4, p0, Lcom/nloko/android/ThumbnailCache$ImageDownloader$1;->val$cache:Lcom/nloko/android/ThumbnailCache;

    if-eqz v4, :cond_0

    .line 240
    iget-object v4, p0, Lcom/nloko/android/ThumbnailCache$ImageDownloader$1;->val$cache:Lcom/nloko/android/ThumbnailCache;

    const/4 v5, 0x1

    const/4 v6, 0x1

    invoke-virtual {v4, v3, v2, v5, v6}, Lcom/nloko/android/ThumbnailCache;->add(Ljava/lang/String;Landroid/graphics/Bitmap;ZZ)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 244
    .end local v1           #friend:Ljava/io/InputStream;
    .end local v2           #image:Landroid/graphics/Bitmap;
    .end local v3           #url:Ljava/lang/String;
    :catch_0
    move-exception v4

    move-object v0, v4

    .line 245
    .local v0, e:Ljava/lang/InterruptedException;
    const-string v4, "ImageDownloader"

    const-string v5, "INTERRUPTED!"

    invoke-static {v4, v5}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 246
    .end local v0           #e:Ljava/lang/InterruptedException;
    :catch_1
    move-exception v4

    move-object v0, v4

    .line 247
    .local v0, e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 250
    .end local v0           #e:Ljava/io/IOException;
    :cond_1
    return-void
.end method

.class public Lcom/nloko/android/ThumbnailCache;
.super Ljava/lang/Object;
.source "ThumbnailCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nloko/android/ThumbnailCache$ImageDownloader;,
        Lcom/nloko/android/ThumbnailCache$ImageProvider;,
        Lcom/nloko/android/ThumbnailCache$ImageListener;
    }
.end annotation


# instance fields
.field private final TAG:Ljava/lang/String;

.field private final lock:Ljava/lang/Object;

.field private mDefaultImage:Landroid/graphics/Bitmap;

.field private final mDownloader:Lcom/nloko/android/ThumbnailCache$ImageDownloader;

.field private final mImages:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/ref/SoftReference",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;>;"
        }
    .end annotation
.end field

.field private mListener:Lcom/nloko/android/ThumbnailCache$ImageListener;

.field private mProvider:Lcom/nloko/android/ThumbnailCache$ImageProvider;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    const-string v0, "ThumbnailCache"

    iput-object v0, p0, Lcom/nloko/android/ThumbnailCache;->TAG:Ljava/lang/String;

    .line 47
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/ThumbnailCache;->mImages:Ljava/util/Map;

    .line 49
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/ThumbnailCache;->lock:Ljava/lang/Object;

    .line 51
    iput-object v1, p0, Lcom/nloko/android/ThumbnailCache;->mDefaultImage:Landroid/graphics/Bitmap;

    .line 52
    iput-object v1, p0, Lcom/nloko/android/ThumbnailCache;->mListener:Lcom/nloko/android/ThumbnailCache$ImageListener;

    .line 53
    iput-object v1, p0, Lcom/nloko/android/ThumbnailCache;->mProvider:Lcom/nloko/android/ThumbnailCache$ImageProvider;

    .line 54
    new-instance v0, Lcom/nloko/android/ThumbnailCache$ImageDownloader;

    invoke-direct {v0, p0}, Lcom/nloko/android/ThumbnailCache$ImageDownloader;-><init>(Lcom/nloko/android/ThumbnailCache;)V

    iput-object v0, p0, Lcom/nloko/android/ThumbnailCache;->mDownloader:Lcom/nloko/android/ThumbnailCache$ImageDownloader;

    .line 214
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1
    .parameter "key"
    .parameter "bitmap"

    .prologue
    .line 101
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lcom/nloko/android/ThumbnailCache;->add(Ljava/lang/String;Landroid/graphics/Bitmap;Z)V

    .line 102
    return-void
.end method

.method public add(Ljava/lang/String;Landroid/graphics/Bitmap;Z)V
    .locals 1
    .parameter "key"
    .parameter "bitmap"
    .parameter "resize"

    .prologue
    .line 106
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/nloko/android/ThumbnailCache;->add(Ljava/lang/String;Landroid/graphics/Bitmap;ZZ)V

    .line 107
    return-void
.end method

.method public add(Ljava/lang/String;Landroid/graphics/Bitmap;ZZ)V
    .locals 5
    .parameter "key"
    .parameter "bitmap"
    .parameter "resize"
    .parameter "notify"

    .prologue
    const/16 v2, 0x2c

    .line 111
    if-nez p2, :cond_0

    .line 112
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "bitmap"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 115
    :cond_0
    if-nez p1, :cond_1

    .line 116
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "key"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 119
    :cond_1
    if-eqz p3, :cond_2

    .line 120
    invoke-static {p2, v2, v2}, Lcom/nloko/android/Utils;->centerCrop(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object p2

    .line 123
    :cond_2
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 124
    .local v1, out:Ljava/io/ByteArrayOutputStream;
    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v3, 0x55

    invoke-virtual {p2, v2, v3, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 125
    if-eqz v1, :cond_3

    .line 126
    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object p2

    .line 130
    :cond_3
    iget-object v2, p0, Lcom/nloko/android/ThumbnailCache;->lock:Ljava/lang/Object;

    monitor-enter v2

    .line 131
    :try_start_0
    iget-object v3, p0, Lcom/nloko/android/ThumbnailCache;->mImages:Ljava/util/Map;

    new-instance v4, Ljava/lang/ref/SoftReference;

    invoke-direct {v4, p2}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v3, p1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    iget-object v0, p0, Lcom/nloko/android/ThumbnailCache;->mListener:Lcom/nloko/android/ThumbnailCache$ImageListener;

    .line 133
    .local v0, listener:Lcom/nloko/android/ThumbnailCache$ImageListener;
    if-eqz p4, :cond_4

    if-eqz v0, :cond_4

    .line 134
    invoke-interface {v0, p1}, Lcom/nloko/android/ThumbnailCache$ImageListener;->onImageReady(Ljava/lang/String;)V

    .line 136
    :cond_4
    monitor-exit v2

    .line 137
    return-void

    .line 136
    .end local v0           #listener:Lcom/nloko/android/ThumbnailCache$ImageListener;
    :catchall_0
    move-exception v3

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method

.method public add(Ljava/lang/String;[B)V
    .locals 2
    .parameter "key"
    .parameter "image"

    .prologue
    .line 96
    const/4 v0, 0x0

    array-length v1, p2

    invoke-static {p2, v0, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/nloko/android/ThumbnailCache;->add(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 97
    return-void
.end method

.method public contains(Ljava/lang/String;)Z
    .locals 2
    .parameter "key"

    .prologue
    .line 83
    iget-object v0, p0, Lcom/nloko/android/ThumbnailCache;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 84
    if-eqz p1, :cond_0

    .line 85
    :try_start_0
    iget-object v1, p0, Lcom/nloko/android/ThumbnailCache;->mImages:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 86
    const/4 v1, 0x1

    monitor-exit v0

    move v0, v1

    .line 91
    :goto_0
    return v0

    .line 89
    :cond_0
    monitor-exit v0

    .line 91
    const/4 v0, 0x0

    goto :goto_0

    .line 89
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public destroy()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 75
    iget-object v0, p0, Lcom/nloko/android/ThumbnailCache;->mDownloader:Lcom/nloko/android/ThumbnailCache$ImageDownloader;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/nloko/android/ThumbnailCache$ImageDownloader;->setPause(Z)V

    .line 76
    iput-object v2, p0, Lcom/nloko/android/ThumbnailCache;->mListener:Lcom/nloko/android/ThumbnailCache$ImageListener;

    .line 77
    iput-object v2, p0, Lcom/nloko/android/ThumbnailCache;->mProvider:Lcom/nloko/android/ThumbnailCache$ImageProvider;

    .line 78
    iget-object v0, p0, Lcom/nloko/android/ThumbnailCache;->mImages:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 79
    return-void
.end method

.method public empty()V
    .locals 2

    .prologue
    .line 68
    iget-object v0, p0, Lcom/nloko/android/ThumbnailCache;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 69
    :try_start_0
    iget-object v1, p0, Lcom/nloko/android/ThumbnailCache;->mImages:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 70
    monitor-exit v0

    .line 71
    return-void

    .line 70
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public get(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 5
    .parameter "key"

    .prologue
    .line 155
    if-nez p1, :cond_0

    .line 156
    const/4 v3, 0x0

    .line 183
    :goto_0
    return-object v3

    .line 159
    :cond_0
    const/4 v1, 0x0

    .line 161
    .local v1, image:Landroid/graphics/Bitmap;
    iget-object v4, p0, Lcom/nloko/android/ThumbnailCache;->lock:Ljava/lang/Object;

    monitor-enter v4

    .line 162
    :try_start_0
    iget-object v3, p0, Lcom/nloko/android/ThumbnailCache;->mImages:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 163
    iget-object v3, p0, Lcom/nloko/android/ThumbnailCache;->mImages:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 164
    iget-object v3, p0, Lcom/nloko/android/ThumbnailCache;->mImages:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/ref/SoftReference;

    invoke-virtual {v3}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Landroid/graphics/Bitmap;

    move-object v1, v0

    .line 167
    :cond_1
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 169
    if-nez v1, :cond_3

    .line 170
    iget-object v3, p0, Lcom/nloko/android/ThumbnailCache;->mDefaultImage:Landroid/graphics/Bitmap;

    if-eqz v3, :cond_2

    .line 172
    iget-object v1, p0, Lcom/nloko/android/ThumbnailCache;->mDefaultImage:Landroid/graphics/Bitmap;

    .line 174
    :cond_2
    iget-object v2, p0, Lcom/nloko/android/ThumbnailCache;->mProvider:Lcom/nloko/android/ThumbnailCache$ImageProvider;

    .line 175
    .local v2, provider:Lcom/nloko/android/ThumbnailCache$ImageProvider;
    if-nez v2, :cond_4

    .line 176
    iget-object v3, p0, Lcom/nloko/android/ThumbnailCache;->mDownloader:Lcom/nloko/android/ThumbnailCache$ImageDownloader;

    invoke-virtual {v3, p1}, Lcom/nloko/android/ThumbnailCache$ImageDownloader;->download(Ljava/lang/String;)V

    .end local v2           #provider:Lcom/nloko/android/ThumbnailCache$ImageProvider;
    :cond_3
    :goto_1
    move-object v3, v1

    .line 183
    goto :goto_0

    .line 167
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3

    .line 178
    .restart local v2       #provider:Lcom/nloko/android/ThumbnailCache$ImageProvider;
    :cond_4
    invoke-virtual {p0, p1}, Lcom/nloko/android/ThumbnailCache;->remove(Ljava/lang/String;)Z

    .line 179
    invoke-interface {v2, p1}, Lcom/nloko/android/ThumbnailCache$ImageProvider;->onImageRequired(Ljava/lang/String;)Z

    goto :goto_1
.end method

.method public getDefaultImage()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/nloko/android/ThumbnailCache;->mDefaultImage:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public remove(Ljava/lang/String;)Z
    .locals 2
    .parameter "key"

    .prologue
    .line 141
    iget-object v0, p0, Lcom/nloko/android/ThumbnailCache;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 142
    if-eqz p1, :cond_0

    .line 143
    :try_start_0
    iget-object v1, p0, Lcom/nloko/android/ThumbnailCache;->mImages:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 144
    iget-object v1, p0, Lcom/nloko/android/ThumbnailCache;->mImages:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    const/4 v1, 0x1

    monitor-exit v0

    move v0, v1

    .line 150
    :goto_0
    return v0

    .line 148
    :cond_0
    monitor-exit v0

    .line 150
    const/4 v0, 0x0

    goto :goto_0

    .line 148
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setDefaultImage(Landroid/graphics/Bitmap;)V
    .locals 0
    .parameter "defaultImage"

    .prologue
    .line 58
    iput-object p1, p0, Lcom/nloko/android/ThumbnailCache;->mDefaultImage:Landroid/graphics/Bitmap;

    .line 59
    return-void
.end method

.method public setImageListener(Lcom/nloko/android/ThumbnailCache$ImageListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 198
    iput-object p1, p0, Lcom/nloko/android/ThumbnailCache;->mListener:Lcom/nloko/android/ThumbnailCache$ImageListener;

    .line 199
    return-void
.end method

.method public setImageProvider(Lcom/nloko/android/ThumbnailCache$ImageProvider;)V
    .locals 0
    .parameter "provider"

    .prologue
    .line 203
    iput-object p1, p0, Lcom/nloko/android/ThumbnailCache;->mProvider:Lcom/nloko/android/ThumbnailCache$ImageProvider;

    .line 204
    return-void
.end method

.method public togglePauseOnDownloader(Z)V
    .locals 1
    .parameter "value"

    .prologue
    .line 191
    iget-object v0, p0, Lcom/nloko/android/ThumbnailCache;->mDownloader:Lcom/nloko/android/ThumbnailCache$ImageDownloader;

    if-eqz v0, :cond_0

    .line 192
    iget-object v0, p0, Lcom/nloko/android/ThumbnailCache;->mDownloader:Lcom/nloko/android/ThumbnailCache$ImageDownloader;

    invoke-virtual {v0, p1}, Lcom/nloko/android/ThumbnailCache$ImageDownloader;->setPause(Z)V

    .line 194
    :cond_0
    return-void
.end method

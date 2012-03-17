.class Lcom/nloko/android/ThumbnailCache$ImageDownloader;
.super Ljava/lang/Object;
.source "ThumbnailCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nloko/android/ThumbnailCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ImageDownloader"
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ImageDownloader"


# instance fields
.field private downloadThread:Ljava/lang/Thread;

.field private mCache:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/nloko/android/ThumbnailCache;",
            ">;"
        }
    .end annotation
.end field

.field private paused:Z

.field private final urlQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/nloko/android/ThumbnailCache;)V
    .locals 1
    .parameter "cache"

    .prologue
    .line 222
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 216
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/ThumbnailCache$ImageDownloader;->urlQueue:Ljava/util/concurrent/BlockingQueue;

    .line 219
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nloko/android/ThumbnailCache$ImageDownloader;->paused:Z

    .line 223
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/nloko/android/ThumbnailCache$ImageDownloader;->mCache:Ljava/lang/ref/WeakReference;

    .line 224
    invoke-direct {p0}, Lcom/nloko/android/ThumbnailCache$ImageDownloader;->setupThread()V

    .line 225
    return-void
.end method

.method static synthetic access$000(Lcom/nloko/android/ThumbnailCache$ImageDownloader;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 214
    iget-boolean v0, p0, Lcom/nloko/android/ThumbnailCache$ImageDownloader;->paused:Z

    return v0
.end method

.method static synthetic access$100(Lcom/nloko/android/ThumbnailCache$ImageDownloader;)Ljava/util/concurrent/BlockingQueue;
    .locals 1
    .parameter "x0"

    .prologue
    .line 214
    iget-object v0, p0, Lcom/nloko/android/ThumbnailCache$ImageDownloader;->urlQueue:Ljava/util/concurrent/BlockingQueue;

    return-object v0
.end method

.method private setupThread()V
    .locals 3

    .prologue
    .line 229
    iget-object v1, p0, Lcom/nloko/android/ThumbnailCache$ImageDownloader;->mCache:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nloko/android/ThumbnailCache;

    .line 230
    .local v0, cache:Lcom/nloko/android/ThumbnailCache;
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/nloko/android/ThumbnailCache$ImageDownloader$1;

    invoke-direct {v2, p0, v0}, Lcom/nloko/android/ThumbnailCache$ImageDownloader$1;-><init>(Lcom/nloko/android/ThumbnailCache$ImageDownloader;Lcom/nloko/android/ThumbnailCache;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v1, p0, Lcom/nloko/android/ThumbnailCache$ImageDownloader;->downloadThread:Ljava/lang/Thread;

    .line 253
    iget-object v1, p0, Lcom/nloko/android/ThumbnailCache$ImageDownloader;->downloadThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 254
    return-void
.end method


# virtual methods
.method public download(Ljava/lang/String;)V
    .locals 2
    .parameter "url"

    .prologue
    .line 273
    if-nez p1, :cond_0

    .line 282
    :goto_0
    return-void

    .line 278
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/nloko/android/ThumbnailCache$ImageDownloader;->urlQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v1, p1}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 279
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 280
    .local v0, e:Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0
.end method

.method public setPause(Z)V
    .locals 3
    .parameter "value"

    .prologue
    .line 258
    iget-boolean v0, p0, Lcom/nloko/android/ThumbnailCache$ImageDownloader;->paused:Z

    if-ne v0, p1, :cond_1

    .line 269
    :cond_0
    :goto_0
    return-void

    .line 262
    :cond_1
    const-string v0, "ImageDownloader"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setPause called with "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 263
    iput-boolean p1, p0, Lcom/nloko/android/ThumbnailCache$ImageDownloader;->paused:Z

    .line 264
    iget-boolean v0, p0, Lcom/nloko/android/ThumbnailCache$ImageDownloader;->paused:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/nloko/android/ThumbnailCache$ImageDownloader;->downloadThread:Ljava/lang/Thread;

    if-eqz v0, :cond_2

    .line 265
    iget-object v0, p0, Lcom/nloko/android/ThumbnailCache$ImageDownloader;->downloadThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 266
    :cond_2
    iget-boolean v0, p0, Lcom/nloko/android/ThumbnailCache$ImageDownloader;->paused:Z

    if-nez v0, :cond_0

    .line 267
    invoke-direct {p0}, Lcom/nloko/android/ThumbnailCache$ImageDownloader;->setupThread()V

    goto :goto_0
.end method

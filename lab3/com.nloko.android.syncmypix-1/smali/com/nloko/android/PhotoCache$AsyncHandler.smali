.class final Lcom/nloko/android/PhotoCache$AsyncHandler;
.super Landroid/os/Handler;
.source "PhotoCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nloko/android/PhotoCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "AsyncHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nloko/android/PhotoCache;


# direct methods
.method public constructor <init>(Lcom/nloko/android/PhotoCache;Landroid/os/HandlerThread;)V
    .locals 1
    .parameter
    .parameter "t"

    .prologue
    .line 204
    iput-object p1, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    .line 205
    invoke-virtual {p2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 206
    return-void
.end method

.method private declared-synchronized add(Ljava/lang/String;[B)V
    .locals 5
    .parameter "file"
    .parameter "bytes"

    .prologue
    .line 298
    monitor-enter p0

    if-nez p2, :cond_0

    .line 299
    :try_start_0
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "bytes"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 298
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 301
    :cond_0
    if-nez p1, :cond_1

    .line 302
    :try_start_1
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "file"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 305
    :cond_1
    iget-object v3, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v3}, Lcom/nloko/android/PhotoCache;->access$700(Lcom/nloko/android/PhotoCache;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 306
    invoke-direct {p0}, Lcom/nloko/android/PhotoCache$AsyncHandler;->calculateSize()V

    .line 309
    :cond_2
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v3}, Lcom/nloko/android/PhotoCache;->access$200(Lcom/nloko/android/PhotoCache;)Ljava/io/File;

    move-result-object v3

    invoke-direct {v2, v3, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 310
    .local v2, photo:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v3

    if-eqz v3, :cond_4

    .line 331
    :cond_3
    :goto_0
    monitor-exit p0

    return-void

    .line 314
    :cond_4
    :try_start_2
    iget-object v3, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v3}, Lcom/nloko/android/PhotoCache;->access$100(Lcom/nloko/android/PhotoCache;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v3

    if-eqz v3, :cond_3

    .line 316
    :try_start_3
    invoke-direct {p0}, Lcom/nloko/android/PhotoCache$AsyncHandler;->ensurePath()V

    .line 317
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 318
    .local v1, os:Ljava/io/OutputStream;
    invoke-virtual {v1, p2}, Ljava/io/OutputStream;->write([B)V

    .line 319
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 320
    invoke-direct {p0, v2}, Lcom/nloko/android/PhotoCache$AsyncHandler;->updateSize(Ljava/io/File;)V

    .line 322
    iget-object v3, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v3}, Lcom/nloko/android/PhotoCache;->access$900(Lcom/nloko/android/PhotoCache;)Lcom/nloko/android/PhotoCacheListener;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 323
    iget-object v3, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v3}, Lcom/nloko/android/PhotoCache;->access$900(Lcom/nloko/android/PhotoCache;)Lcom/nloko/android/PhotoCacheListener;

    move-result-object v3

    invoke-interface {v3, p1}, Lcom/nloko/android/PhotoCacheListener;->onAdded(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0

    .line 325
    .end local v1           #os:Ljava/io/OutputStream;
    :catch_0
    move-exception v3

    move-object v0, v3

    .line 326
    .local v0, e:Ljava/io/FileNotFoundException;
    :try_start_4
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_0

    .line 327
    .end local v0           #e:Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v3

    move-object v0, v3

    .line 328
    .local v0, e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0
.end method

.method private declared-synchronized calculateSize()V
    .locals 7

    .prologue
    .line 234
    monitor-enter p0

    :try_start_0
    iget-object v5, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v5}, Lcom/nloko/android/PhotoCache;->access$600(Lcom/nloko/android/PhotoCache;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v5

    if-nez v5, :cond_1

    .line 247
    :cond_0
    monitor-exit p0

    return-void

    .line 238
    :cond_1
    :try_start_1
    iget-object v5, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    const/4 v6, 0x1

    invoke-static {v5, v6}, Lcom/nloko/android/PhotoCache;->access$702(Lcom/nloko/android/PhotoCache;Z)Z

    .line 239
    iget-object v5, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v5}, Lcom/nloko/android/PhotoCache;->access$200(Lcom/nloko/android/PhotoCache;)Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 240
    .local v2, files:[Ljava/io/File;
    if-eqz v2, :cond_0

    .line 244
    move-object v0, v2

    .local v0, arr$:[Ljava/io/File;
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v1, v0, v3

    .line 245
    .local v1, f:Ljava/io/File;
    invoke-direct {p0, v1}, Lcom/nloko/android/PhotoCache$AsyncHandler;->updateSize(Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 244
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 234
    .end local v0           #arr$:[Ljava/io/File;
    .end local v1           #f:Ljava/io/File;
    .end local v2           #files:[Ljava/io/File;
    .end local v3           #i$:I
    .end local v4           #len$:I
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5
.end method

.method private declared-synchronized delete(Ljava/lang/String;)V
    .locals 5
    .parameter "name"

    .prologue
    .line 262
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v1}, Lcom/nloko/android/PhotoCache;->access$100(Lcom/nloko/android/PhotoCache;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-eqz v1, :cond_0

    if-nez p1, :cond_1

    .line 275
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 266
    :cond_1
    :try_start_1
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v1}, Lcom/nloko/android/PhotoCache;->access$200(Lcom/nloko/android/PhotoCache;)Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 267
    .local v0, f:Ljava/io/File;
    iget-object v1, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v1, v0}, Lcom/nloko/android/PhotoCache;->access$800(Lcom/nloko/android/PhotoCache;Ljava/io/File;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 268
    iget-object v1, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Lcom/nloko/android/PhotoCache;->access$422(Lcom/nloko/android/PhotoCache;J)J

    .line 269
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 270
    iget-object v1, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v1}, Lcom/nloko/android/PhotoCache;->access$900(Lcom/nloko/android/PhotoCache;)Lcom/nloko/android/PhotoCacheListener;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 271
    iget-object v1, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v1}, Lcom/nloko/android/PhotoCache;->access$900(Lcom/nloko/android/PhotoCache;)Lcom/nloko/android/PhotoCacheListener;

    move-result-object v1

    invoke-interface {v1, p1}, Lcom/nloko/android/PhotoCacheListener;->onDeleted(Ljava/lang/String;)V

    .line 273
    :cond_2
    const-string v1, "PhotoCache"

    const-string v2, "delete() deleted %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 262
    .end local v0           #f:Ljava/io/File;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method private declared-synchronized deleteAll()V
    .locals 8

    .prologue
    .line 278
    monitor-enter p0

    :try_start_0
    iget-object v5, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v5}, Lcom/nloko/android/PhotoCache;->access$200(Lcom/nloko/android/PhotoCache;)Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->listFiles()[Ljava/io/File;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 279
    .local v2, files:[Ljava/io/File;
    if-nez v2, :cond_1

    .line 295
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 283
    :cond_1
    move-object v0, v2

    .local v0, arr$:[Ljava/io/File;
    :try_start_1
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_1
    if-ge v3, v4, :cond_4

    aget-object v1, v0, v3

    .line 284
    .local v1, f:Ljava/io/File;
    iget-object v5, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v5}, Lcom/nloko/android/PhotoCache;->access$100(Lcom/nloko/android/PhotoCache;)Z

    move-result v5

    if-eqz v5, :cond_3

    iget-object v5, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v5, v1}, Lcom/nloko/android/PhotoCache;->access$800(Lcom/nloko/android/PhotoCache;Ljava/io/File;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 285
    iget-object v5, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v5}, Lcom/nloko/android/PhotoCache;->access$700(Lcom/nloko/android/PhotoCache;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 286
    iget-object v5, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v6

    invoke-static {v5, v6, v7}, Lcom/nloko/android/PhotoCache;->access$422(Lcom/nloko/android/PhotoCache;J)J

    .line 288
    :cond_2
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 283
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 292
    .end local v1           #f:Ljava/io/File;
    :cond_4
    iget-object v5, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v5}, Lcom/nloko/android/PhotoCache;->access$900(Lcom/nloko/android/PhotoCache;)Lcom/nloko/android/PhotoCacheListener;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 293
    iget-object v5, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v5}, Lcom/nloko/android/PhotoCache;->access$900(Lcom/nloko/android/PhotoCache;)Lcom/nloko/android/PhotoCacheListener;

    move-result-object v5

    invoke-interface {v5}, Lcom/nloko/android/PhotoCacheListener;->onAllDeleted()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 278
    .end local v0           #arr$:[Ljava/io/File;
    .end local v2           #files:[Ljava/io/File;
    .end local v3           #i$:I
    .end local v4           #len$:I
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5
.end method

.method private declared-synchronized ensurePath()V
    .locals 1

    .prologue
    .line 209
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v0}, Lcom/nloko/android/PhotoCache;->access$100(Lcom/nloko/android/PhotoCache;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 210
    iget-object v0, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v0}, Lcom/nloko/android/PhotoCache;->access$200(Lcom/nloko/android/PhotoCache;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 212
    :cond_0
    monitor-exit p0

    return-void

    .line 209
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized resize()V
    .locals 10

    .prologue
    .line 215
    monitor-enter p0

    :try_start_0
    const-string v4, "PhotoCache"

    const-string v5, "resize() map size %d"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v8}, Lcom/nloko/android/PhotoCache;->access$300(Lcom/nloko/android/PhotoCache;)Ljava/util/TreeMap;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/TreeMap;->size()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 217
    :goto_0
    iget-object v4, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v4}, Lcom/nloko/android/PhotoCache;->access$300(Lcom/nloko/android/PhotoCache;)Ljava/util/TreeMap;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/TreeMap;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2

    iget-object v4, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v4}, Lcom/nloko/android/PhotoCache;->access$400(Lcom/nloko/android/PhotoCache;)J

    move-result-wide v4

    iget-object v6, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    iget-wide v6, v6, Lcom/nloko/android/PhotoCache;->mMaxBytes:J

    cmp-long v4, v4, v6

    if-lez v4, :cond_2

    .line 219
    iget-object v4, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v4}, Lcom/nloko/android/PhotoCache;->access$500(Lcom/nloko/android/PhotoCache;)I

    move-result v4

    if-nez v4, :cond_0

    .line 220
    iget-object v4, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v4}, Lcom/nloko/android/PhotoCache;->access$300(Lcom/nloko/android/PhotoCache;)Ljava/util/TreeMap;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/TreeMap;->firstKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    .line 224
    .local v1, key:J
    :goto_1
    iget-object v4, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v4}, Lcom/nloko/android/PhotoCache;->access$300(Lcom/nloko/android/PhotoCache;)Ljava/util/TreeMap;

    move-result-object v4

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 225
    .local v3, name:Ljava/lang/String;
    invoke-direct {p0, v3}, Lcom/nloko/android/PhotoCache$AsyncHandler;->delete(Ljava/lang/String;)V

    .line 226
    const-string v4, "PhotoCache"

    const-string v5, "resize() %d"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v8}, Lcom/nloko/android/PhotoCache;->access$400(Lcom/nloko/android/PhotoCache;)J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/nloko/android/Log;->v(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    .line 215
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #key:J
    .end local v3           #name:Ljava/lang/String;
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4

    .line 222
    :cond_0
    :try_start_1
    iget-object v4, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v4}, Lcom/nloko/android/PhotoCache;->access$300(Lcom/nloko/android/PhotoCache;)Ljava/util/TreeMap;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/TreeMap;->lastKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    .restart local v1       #key:J
    goto :goto_1

    .line 229
    .restart local v0       #i$:Ljava/util/Iterator;
    :cond_1
    iget-object v4, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v4}, Lcom/nloko/android/PhotoCache;->access$300(Lcom/nloko/android/PhotoCache;)Ljava/util/TreeMap;

    move-result-object v4

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/TreeMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    .line 231
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #key:J
    :cond_2
    monitor-exit p0

    return-void
.end method

.method private declared-synchronized updateSize(Ljava/io/File;)V
    .locals 8
    .parameter "f"

    .prologue
    .line 250
    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    .line 251
    .local v0, modified:J
    iget-object v2, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v2}, Lcom/nloko/android/PhotoCache;->access$300(Lcom/nloko/android/PhotoCache;)Ljava/util/TreeMap;

    move-result-object v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/TreeMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 252
    iget-object v2, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v2}, Lcom/nloko/android/PhotoCache;->access$300(Lcom/nloko/android/PhotoCache;)Ljava/util/TreeMap;

    move-result-object v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v2, v3, v4}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 255
    :cond_0
    iget-object v2, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v2}, Lcom/nloko/android/PhotoCache;->access$300(Lcom/nloko/android/PhotoCache;)Ljava/util/TreeMap;

    move-result-object v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 256
    iget-object v2, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v3

    invoke-static {v2, v3, v4}, Lcom/nloko/android/PhotoCache;->access$414(Lcom/nloko/android/PhotoCache;J)J

    .line 257
    const-string v2, "PhotoCache"

    const-string v3, "updateSize() %d"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v6}, Lcom/nloko/android/PhotoCache;->access$400(Lcom/nloko/android/PhotoCache;)J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 258
    invoke-direct {p0}, Lcom/nloko/android/PhotoCache$AsyncHandler;->resize()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 259
    monitor-exit p0

    return-void

    .line 250
    .end local v0           #modified:J
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .parameter "msg"

    .prologue
    .line 335
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 337
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 357
    :cond_0
    :goto_0
    return-void

    .line 339
    :pswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/nloko/android/PhotoCache$Photo;

    .line 340
    .local v0, p:Lcom/nloko/android/PhotoCache$Photo;
    if-eqz v0, :cond_0

    .line 341
    iget-object v1, v0, Lcom/nloko/android/PhotoCache$Photo;->file:Ljava/lang/String;

    iget-object v2, v0, Lcom/nloko/android/PhotoCache$Photo;->bytes:[B

    invoke-direct {p0, v1, v2}, Lcom/nloko/android/PhotoCache$AsyncHandler;->add(Ljava/lang/String;[B)V

    goto :goto_0

    .line 345
    .end local v0           #p:Lcom/nloko/android/PhotoCache$Photo;
    :pswitch_1
    invoke-direct {p0}, Lcom/nloko/android/PhotoCache$AsyncHandler;->deleteAll()V

    goto :goto_0

    .line 349
    :pswitch_2
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/nloko/android/PhotoCache$AsyncHandler;->delete(Ljava/lang/String;)V

    goto :goto_0

    .line 353
    :pswitch_3
    iget-object v1, p0, Lcom/nloko/android/PhotoCache$AsyncHandler;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v1}, Lcom/nloko/android/PhotoCache;->access$1000(Lcom/nloko/android/PhotoCache;)V

    .line 354
    invoke-virtual {p0}, Lcom/nloko/android/PhotoCache$AsyncHandler;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Looper;->quit()V

    goto :goto_0

    .line 337
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

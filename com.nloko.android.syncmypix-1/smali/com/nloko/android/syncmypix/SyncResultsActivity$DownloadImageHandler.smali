.class Lcom/nloko/android/syncmypix/SyncResultsActivity$DownloadImageHandler;
.super Landroid/os/Handler;
.source "SyncResultsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nloko/android/syncmypix/SyncResultsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DownloadImageHandler"
.end annotation


# instance fields
.field private final mActivity:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/nloko/android/syncmypix/SyncResultsActivity;",
            ">;"
        }
    .end annotation
.end field

.field private running:Z


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/SyncResultsActivity;Landroid/os/Looper;)V
    .locals 1
    .parameter "activity"
    .parameter "looper"

    .prologue
    .line 1269
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 1265
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$DownloadImageHandler;->running:Z

    .line 1270
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$DownloadImageHandler;->mActivity:Ljava/lang/ref/WeakReference;

    .line 1271
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 13
    .parameter "msg"

    .prologue
    .line 1284
    iget-object v11, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$DownloadImageHandler;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v11}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nloko/android/syncmypix/SyncResultsActivity;

    .line 1285
    .local v0, activity:Lcom/nloko/android/syncmypix/SyncResultsActivity;
    if-nez v0, :cond_1

    .line 1334
    :cond_0
    :goto_0
    return-void

    .line 1288
    :cond_1
    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$1100(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Landroid/os/Handler;

    move-result-object v7

    .line 1289
    .local v7, handler:Landroid/os/Handler;
    if-eqz v7, :cond_0

    .line 1293
    new-instance v9, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;

    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v11

    invoke-direct {v9, v11}, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;-><init>(Landroid/content/Context;)V

    .line 1295
    .local v9, prefs:Lcom/nloko/android/syncmypix/SyncMyPixPreferences;
    iget-object v10, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v10, Ljava/lang/String;

    .line 1296
    .local v10, url:Ljava/lang/String;
    if-eqz v10, :cond_0

    .line 1298
    const/4 v6, 0x0

    .line 1299
    .local v6, friend:Ljava/io/InputStream;
    :try_start_0
    invoke-static {v10}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v11

    invoke-virtual {v11}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v5

    .line 1300
    .local v5, filename:Ljava/lang/String;
    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$1200(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/PhotoCache;

    move-result-object v11

    if-eqz v11, :cond_2

    .line 1301
    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$1200(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/PhotoCache;

    move-result-object v11

    invoke-virtual {v11, v5}, Lcom/nloko/android/PhotoCache;->get(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    .line 1305
    :cond_2
    if-nez v6, :cond_3

    .line 1306
    invoke-static {v10}, Lcom/nloko/android/Utils;->downloadPictureAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    .line 1309
    :cond_3
    monitor-enter p0
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 1310
    :try_start_1
    iget-boolean v11, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$DownloadImageHandler;->running:Z

    if-eqz v11, :cond_5

    if-eqz v6, :cond_5

    .line 1311
    invoke-static {v6}, Lcom/nloko/android/Utils;->getByteArrayFromInputStream(Ljava/io/InputStream;)[B

    move-result-object v2

    .line 1312
    .local v2, bytes:[B
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    .line 1314
    const/4 v11, 0x0

    array-length v12, v2

    invoke-static {v2, v11, v12}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 1315
    .local v1, bitmap:Landroid/graphics/Bitmap;
    invoke-virtual {v9}, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->getCache()Z

    move-result v11

    if-eqz v11, :cond_4

    .line 1316
    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$1200(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/PhotoCache;

    move-result-object v11

    invoke-virtual {v11, v5, v2}, Lcom/nloko/android/PhotoCache;->add(Ljava/lang/String;[B)V

    .line 1318
    :cond_4
    invoke-virtual {v7}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v8

    .line 1319
    .local v8, mainMsg:Landroid/os/Message;
    iput-object v1, v8, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 1320
    iget v11, p1, Landroid/os/Message;->what:I

    iput v11, v8, Landroid/os/Message;->what:I

    .line 1321
    invoke-virtual {v7, v8}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 1322
    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$200(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/ThumbnailCache;

    move-result-object v11

    invoke-virtual {v11, v10}, Lcom/nloko/android/ThumbnailCache;->contains(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_5

    .line 1323
    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$200(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/ThumbnailCache;

    move-result-object v11

    const/4 v12, 0x1

    invoke-virtual {v11, v10, v1, v12}, Lcom/nloko/android/ThumbnailCache;->add(Ljava/lang/String;Landroid/graphics/Bitmap;Z)V

    .line 1326
    .end local v1           #bitmap:Landroid/graphics/Bitmap;
    .end local v2           #bytes:[B
    .end local v8           #mainMsg:Landroid/os/Message;
    :cond_5
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v11

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v11
    :try_end_2
    .catch Ljava/net/UnknownHostException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 1327
    .end local v5           #filename:Ljava/lang/String;
    :catch_0
    move-exception v11

    move-object v4, v11

    .line 1328
    .local v4, ex:Ljava/net/UnknownHostException;
    invoke-virtual {v4}, Ljava/net/UnknownHostException;->printStackTrace()V

    .line 1329
    const/4 v11, 0x2

    invoke-virtual {v7, v11}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_0

    .line 1330
    .end local v4           #ex:Ljava/net/UnknownHostException;
    :catch_1
    move-exception v11

    move-object v3, v11

    .line 1331
    .local v3, e:Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0
.end method

.method public stopRunning()V
    .locals 1

    .prologue
    .line 1275
    monitor-enter p0

    .line 1276
    :try_start_0
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$DownloadImageHandler;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    .line 1277
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$DownloadImageHandler;->running:Z

    .line 1278
    monitor-exit p0

    .line 1279
    return-void

    .line 1278
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

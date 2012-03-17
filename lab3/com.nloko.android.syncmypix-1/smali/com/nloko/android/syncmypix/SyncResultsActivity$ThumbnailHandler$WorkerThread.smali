.class Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;
.super Ljava/lang/Thread;
.source "SyncResultsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "WorkerThread"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread$Work;
    }
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

.field private final mQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread$Work;",
            ">;"
        }
    .end annotation
.end field

.field private running:Z


# direct methods
.method public constructor <init>(Lcom/nloko/android/syncmypix/SyncResultsActivity;)V
    .locals 1
    .parameter "activity"

    .prologue
    .line 1002
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 998
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;->mQueue:Ljava/util/concurrent/BlockingQueue;

    .line 1000
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;->running:Z

    .line 1003
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;->mActivity:Ljava/lang/ref/WeakReference;

    .line 1004
    return-void
.end method

.method private queryContact(Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .parameter "url"

    .prologue
    const/4 v4, 0x0

    .line 1022
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/nloko/android/syncmypix/SyncResultsActivity;

    .line 1023
    .local v6, activity:Lcom/nloko/android/syncmypix/SyncResultsActivity;
    if-nez v6, :cond_0

    move-object v1, v4

    .line 1058
    :goto_0
    return-object v1

    .line 1026
    :cond_0
    invoke-virtual {v6}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 1027
    .local v0, resolver:Landroid/content/ContentResolver;
    if-nez v0, :cond_1

    move-object v1, v4

    .line 1028
    goto :goto_0

    .line 1031
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "pic_url=\'"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "\'"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1033
    .local v3, where:Ljava/lang/String;
    const/4 v1, 0x3

    new-array v2, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v4, "_id"

    aput-object v4, v2, v1

    const/4 v1, 0x1

    const-string v4, "contact_id"

    aput-object v4, v2, v1

    const/4 v1, 0x2

    const-string v4, "pic_url"

    aput-object v4, v2, v1

    .line 1038
    .local v2, projection:[Ljava/lang/String;
    const/4 v7, 0x0

    .line 1039
    .local v7, cursor:Landroid/database/Cursor;
    const/4 v9, 0x0

    .line 1041
    .local v9, id:Ljava/lang/String;
    :try_start_0
    sget-object v1, Lcom/nloko/android/syncmypix/SyncMyPix$Results;->CONTENT_URI:Landroid/net/Uri;

    const/4 v4, 0x0

    const-string v5, "name ASC"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 1047
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1048
    const-string v1, "contact_id"

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v9

    .line 1053
    :cond_2
    if-eqz v7, :cond_3

    .line 1054
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_3
    :goto_1
    move-object v1, v9

    .line 1058
    goto :goto_0

    .line 1050
    :catch_0
    move-exception v1

    move-object v8, v1

    .line 1051
    .local v8, ex:Ljava/lang/Exception;
    :try_start_1
    const-string v1, "SyncResults"

    invoke-static {v8}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/nloko/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1053
    if-eqz v7, :cond_3

    .line 1054
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto :goto_1

    .line 1053
    .end local v8           #ex:Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    if-eqz v7, :cond_4

    .line 1054
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_4
    throw v1
.end method

.method private update(Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .parameter "contactId"
    .parameter "url"

    .prologue
    .line 1063
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 1117
    :cond_0
    :goto_0
    return-void

    .line 1067
    :cond_1
    iget-object v6, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v6}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nloko/android/syncmypix/SyncResultsActivity;

    .line 1068
    .local v0, activity:Lcom/nloko/android/syncmypix/SyncResultsActivity;
    if-eqz v0, :cond_0

    .line 1072
    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$200(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/ThumbnailCache;

    move-result-object v6

    invoke-virtual {v6, p2}, Lcom/nloko/android/ThumbnailCache;->contains(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 1076
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    .line 1077
    .local v4, resolver:Landroid/content/ContentResolver;
    if-eqz v4, :cond_0

    .line 1081
    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$800(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/syncmypix/contactutils/ContactUtils;

    move-result-object v5

    .line 1082
    .local v5, utils:Lcom/nloko/android/syncmypix/contactutils/ContactUtils;
    if-eqz v5, :cond_0

    .line 1087
    :try_start_0
    new-instance v3, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v3}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 1088
    .local v3, options:Landroid/graphics/BitmapFactory$Options;
    const/4 v6, 0x2

    iput v6, v3, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 1089
    invoke-virtual {v5, v4, p1}, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;->getPhoto(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    const/4 v7, 0x0

    invoke-static {v6, v7, v3}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 1090
    .local v1, bitmap:Landroid/graphics/Bitmap;
    if-eqz v1, :cond_0

    .line 1092
    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$200(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/ThumbnailCache;

    move-result-object v6

    invoke-virtual {v6, p2, v1}, Lcom/nloko/android/ThumbnailCache;->add(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1103
    .end local v1           #bitmap:Landroid/graphics/Bitmap;
    .end local v3           #options:Landroid/graphics/BitmapFactory$Options;
    :catch_0
    move-exception v6

    move-object v2, v6

    .line 1104
    .local v2, ex:Ljava/lang/Exception;
    :try_start_1
    const-string v6, "SyncResults"

    invoke-static {v2}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/nloko/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1105
    .end local v2           #ex:Ljava/lang/Exception;
    :catchall_0
    move-exception v6

    throw v6
.end method


# virtual methods
.method public queueWork(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .parameter "contactId"
    .parameter "url"

    .prologue
    .line 1013
    :try_start_0
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;->mQueue:Ljava/util/concurrent/BlockingQueue;

    new-instance v2, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread$Work;

    invoke-direct {v2, p0, p1, p2}, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread$Work;-><init>(Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1018
    :goto_0
    return-void

    .line 1014
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 1015
    .local v0, e:Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0
.end method

.method public run()V
    .locals 4

    .prologue
    .line 1120
    :goto_0
    iget-boolean v2, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;->running:Z

    if-eqz v2, :cond_1

    .line 1122
    :try_start_0
    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;->mQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v2}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread$Work;

    .line 1123
    .local v1, w:Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread$Work;
    if-eqz v1, :cond_0

    iget-object v2, v1, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread$Work;->contactId:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 1124
    iget-object v2, v1, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread$Work;->url:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;->queryContact(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread$Work;->contactId:Ljava/lang/String;

    .line 1126
    :cond_0
    iget-object v2, v1, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread$Work;->contactId:Ljava/lang/String;

    iget-object v3, v1, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread$Work;->url:Ljava/lang/String;

    invoke-direct {p0, v2, v3}, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;->update(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1127
    .end local v1           #w:Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread$Work;
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 1128
    .local v0, e:Ljava/lang/InterruptedException;
    const-string v2, "SyncResults"

    const-string v3, "INTERRUPTED!"

    invoke-static {v2, v3}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1131
    .end local v0           #e:Ljava/lang/InterruptedException;
    :cond_1
    return-void
.end method

.method public stopRunning()V
    .locals 1

    .prologue
    .line 1007
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;->running:Z

    .line 1008
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;->interrupt()V

    .line 1009
    return-void
.end method

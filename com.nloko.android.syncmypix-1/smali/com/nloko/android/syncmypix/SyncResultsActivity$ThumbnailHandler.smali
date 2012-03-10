.class Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;
.super Landroid/os/Handler;
.source "SyncResultsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nloko/android/syncmypix/SyncResultsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ThumbnailHandler"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;
    }
.end annotation


# static fields
.field private static final MAX_THREADS:I = 0x3


# instance fields
.field private final LOAD_ALL:I

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

.field private mLoading:Z

.field private mThreadIndex:I

.field private final mThreadPool:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;",
            ">;"
        }
    .end annotation
.end field

.field private running:Z


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/SyncResultsActivity;Landroid/os/Looper;)V
    .locals 2
    .parameter "activity"
    .parameter "looper"

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 1141
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 982
    iput v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->LOAD_ALL:I

    .line 984
    iput-boolean v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->running:Z

    .line 985
    iput-boolean v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->mLoading:Z

    .line 1136
    iput v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->mThreadIndex:I

    .line 1137
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->mThreadPool:Ljava/util/List;

    .line 1142
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->mActivity:Ljava/lang/ref/WeakReference;

    .line 1143
    invoke-direct {p0, p1}, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->initThreadPool(Lcom/nloko/android/syncmypix/SyncResultsActivity;)V

    .line 1145
    return-void
.end method

.method private init()V
    .locals 2

    .prologue
    .line 1158
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 1159
    .local v0, msg:Landroid/os/Message;
    const/4 v1, 0x1

    iput v1, v0, Landroid/os/Message;->what:I

    .line 1160
    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->sendMessage(Landroid/os/Message;)Z

    .line 1161
    return-void
.end method

.method private initThreadPool(Lcom/nloko/android/syncmypix/SyncResultsActivity;)V
    .locals 3
    .parameter "activity"

    .prologue
    .line 1149
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    const/4 v2, 0x3

    if-ge v0, v2, :cond_0

    .line 1150
    new-instance v1, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;

    invoke-direct {v1, p1}, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;-><init>(Lcom/nloko/android/syncmypix/SyncResultsActivity;)V

    .line 1151
    .local v1, thread:Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;
    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;->start()V

    .line 1152
    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->mThreadPool:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1149
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1154
    .end local v1           #thread:Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;
    :cond_0
    return-void
.end method

.method private loadAll()V
    .locals 13

    .prologue
    const/4 v3, 0x1

    const/4 v12, 0x0

    const/4 v11, 0x0

    .line 1170
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/nloko/android/syncmypix/SyncResultsActivity;

    .line 1171
    .local v6, activity:Lcom/nloko/android/syncmypix/SyncResultsActivity;
    if-nez v6, :cond_1

    .line 1209
    :cond_0
    :goto_0
    return-void

    .line 1174
    :cond_1
    invoke-virtual {v6}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 1175
    .local v0, resolver:Landroid/content/ContentResolver;
    if-eqz v0, :cond_0

    .line 1179
    iput-boolean v3, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->mLoading:Z

    .line 1181
    const/4 v1, 0x3

    new-array v2, v1, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v2, v11

    const-string v1, "contact_id"

    aput-object v1, v2, v3

    const/4 v1, 0x2

    const-string v3, "pic_url"

    aput-object v3, v2, v1

    .line 1186
    .local v2, projection:[Ljava/lang/String;
    const/4 v7, 0x0

    .line 1188
    .local v7, cursor:Landroid/database/Cursor;
    :try_start_0
    sget-object v1, Lcom/nloko/android/syncmypix/SyncMyPix$Results;->CONTENT_URI:Landroid/net/Uri;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v5, "name ASC"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 1194
    :goto_1
    iget-boolean v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->running:Z

    if-eqz v1, :cond_4

    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1195
    const-string v1, "pic_url"

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 1196
    .local v10, url:Ljava/lang/String;
    if-eqz v10, :cond_3

    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    move-object v10, v1

    .line 1197
    :goto_2
    const-string v1, "contact_id"

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 1198
    .local v9, id:Ljava/lang/String;
    invoke-direct {p0, v9, v10}, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->queueWork(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 1200
    .end local v9           #id:Ljava/lang/String;
    .end local v10           #url:Ljava/lang/String;
    :catch_0
    move-exception v1

    move-object v8, v1

    .line 1201
    .local v8, ex:Ljava/lang/Exception;
    :try_start_1
    const-string v1, "SyncResults"

    invoke-static {v8}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/nloko/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1203
    if-eqz v7, :cond_2

    .line 1204
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 1207
    :cond_2
    iput-boolean v11, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->mLoading:Z

    goto :goto_0

    .end local v8           #ex:Ljava/lang/Exception;
    .restart local v10       #url:Ljava/lang/String;
    :cond_3
    move-object v10, v12

    .line 1196
    goto :goto_2

    .line 1203
    .end local v10           #url:Ljava/lang/String;
    :cond_4
    if-eqz v7, :cond_5

    .line 1204
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 1207
    :cond_5
    iput-boolean v11, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->mLoading:Z

    goto :goto_0

    .line 1203
    :catchall_0
    move-exception v1

    if-eqz v7, :cond_6

    .line 1204
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 1207
    :cond_6
    iput-boolean v11, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->mLoading:Z

    throw v1
.end method

.method private queueWork(Ljava/lang/String;)V
    .locals 1
    .parameter "url"

    .prologue
    .line 1225
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->queueWork(Ljava/lang/String;Ljava/lang/String;)V

    .line 1226
    return-void
.end method

.method private queueWork(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .parameter "contactId"
    .parameter "url"

    .prologue
    .line 1229
    iget v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->mThreadIndex:I

    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->mThreadPool:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ne v1, v2, :cond_0

    .line 1230
    const/4 v1, 0x0

    iput v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->mThreadIndex:I

    .line 1232
    :cond_0
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->mThreadPool:Ljava/util/List;

    iget v2, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->mThreadIndex:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->mThreadIndex:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;

    .line 1233
    .local v0, thread:Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;
    if-eqz v0, :cond_1

    .line 1234
    invoke-virtual {v0, p1, p2}, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;->queueWork(Ljava/lang/String;Ljava/lang/String;)V

    .line 1236
    :cond_1
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .parameter "msg"

    .prologue
    .line 1241
    iget-boolean v2, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->running:Z

    if-eqz v2, :cond_0

    iget-boolean v2, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->mLoading:Z

    if-eqz v2, :cond_1

    .line 1259
    :cond_0
    :goto_0
    return-void

    .line 1243
    :cond_1
    iget v2, p1, Landroid/os/Message;->what:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_2

    .line 1244
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->loadAll()V

    goto :goto_0

    .line 1248
    :cond_2
    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nloko/android/syncmypix/SyncResultsActivity;

    .line 1249
    .local v0, activity:Lcom/nloko/android/syncmypix/SyncResultsActivity;
    if-eqz v0, :cond_0

    .line 1253
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    .line 1254
    .local v1, url:Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 1258
    invoke-direct {p0, v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->queueWork(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public isLoading()Z
    .locals 1

    .prologue
    .line 1165
    iget-boolean v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->mLoading:Z

    return v0
.end method

.method public stopRunning()V
    .locals 3

    .prologue
    .line 1213
    monitor-enter p0

    .line 1214
    :try_start_0
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-virtual {v2}, Landroid/os/Looper;->quit()V

    .line 1215
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->running:Z

    .line 1216
    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->mThreadPool:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;

    .line 1217
    .local v1, thread:Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;
    if-eqz v1, :cond_0

    .line 1218
    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;->stopRunning()V

    goto :goto_0

    .line 1221
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #thread:Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .restart local v0       #i$:Ljava/util/Iterator;
    :cond_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1222
    return-void
.end method

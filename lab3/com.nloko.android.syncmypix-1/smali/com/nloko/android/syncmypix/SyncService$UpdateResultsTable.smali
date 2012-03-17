.class Lcom/nloko/android/syncmypix/SyncService$UpdateResultsTable;
.super Ljava/lang/Thread;
.source "SyncService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nloko/android/syncmypix/SyncService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "UpdateResultsTable"
.end annotation


# instance fields
.field private final finish:Z

.field private final list:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;"
        }
    .end annotation
.end field

.field private final mService:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/nloko/android/syncmypix/SyncService;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/nloko/android/syncmypix/SyncService;Ljava/util/List;)V
    .locals 1
    .parameter "service"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/nloko/android/syncmypix/SyncService;",
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 211
    .local p2, list:Ljava/util/List;,"Ljava/util/List<Landroid/content/ContentValues;>;"
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lcom/nloko/android/syncmypix/SyncService$UpdateResultsTable;-><init>(Lcom/nloko/android/syncmypix/SyncService;Ljava/util/List;Z)V

    .line 212
    return-void
.end method

.method public constructor <init>(Lcom/nloko/android/syncmypix/SyncService;Ljava/util/List;Z)V
    .locals 1
    .parameter "service"
    .parameter
    .parameter "finish"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/nloko/android/syncmypix/SyncService;",
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 215
    .local p2, list:Ljava/util/List;,"Ljava/util/List<Landroid/content/ContentValues;>;"
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 216
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncService$UpdateResultsTable;->mService:Ljava/lang/ref/WeakReference;

    .line 217
    iput-object p2, p0, Lcom/nloko/android/syncmypix/SyncService$UpdateResultsTable;->list:Ljava/util/List;

    .line 218
    iput-boolean p3, p0, Lcom/nloko/android/syncmypix/SyncService$UpdateResultsTable;->finish:Z

    .line 219
    return-void
.end method

.method private createResult(Landroid/content/ContentValues;)V
    .locals 4
    .parameter "values"

    .prologue
    .line 223
    if-nez p1, :cond_0

    .line 224
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "values"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 227
    :cond_0
    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncService$UpdateResultsTable;->mService:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nloko/android/syncmypix/SyncService;

    .line 228
    .local v1, service:Lcom/nloko/android/syncmypix/SyncService;
    if-eqz v1, :cond_1

    .line 229
    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/SyncService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 230
    .local v0, resolver:Landroid/content/ContentResolver;
    sget-object v2, Lcom/nloko/android/syncmypix/SyncMyPix$Results;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v0, v2, p1}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 232
    .end local v0           #resolver:Landroid/content/ContentResolver;
    :cond_1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 236
    const-string v3, "SyncService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "mStarted updating results at "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    iget-object v3, p0, Lcom/nloko/android/syncmypix/SyncService$UpdateResultsTable;->list:Ljava/util/List;

    monitor-enter v3

    .line 239
    :try_start_0
    iget-object v4, p0, Lcom/nloko/android/syncmypix/SyncService$UpdateResultsTable;->list:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/ContentValues;

    .line 240
    .local v2, values:Landroid/content/ContentValues;
    if-eqz v2, :cond_0

    .line 241
    invoke-direct {p0, v2}, Lcom/nloko/android/syncmypix/SyncService$UpdateResultsTable;->createResult(Landroid/content/ContentValues;)V

    goto :goto_0

    .line 246
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v2           #values:Landroid/content/ContentValues;
    :catchall_0
    move-exception v4

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .line 245
    .restart local v0       #i$:Ljava/util/Iterator;
    :cond_1
    :try_start_1
    iget-object v4, p0, Lcom/nloko/android/syncmypix/SyncService$UpdateResultsTable;->list:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->clear()V

    .line 246
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 248
    const-string v3, "SyncService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Finished updating results at "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 250
    iget-boolean v3, p0, Lcom/nloko/android/syncmypix/SyncService$UpdateResultsTable;->finish:Z

    if-eqz v3, :cond_2

    .line 251
    iget-object v3, p0, Lcom/nloko/android/syncmypix/SyncService$UpdateResultsTable;->mService:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nloko/android/syncmypix/SyncService;

    .line 252
    .local v1, service:Lcom/nloko/android/syncmypix/SyncService;
    if-eqz v1, :cond_2

    .line 253
    iget-object v3, v1, Lcom/nloko/android/syncmypix/SyncService;->mMainHandler:Lcom/nloko/android/syncmypix/SyncService$MainHandler;

    iget-object v4, v1, Lcom/nloko/android/syncmypix/SyncService;->mMainHandler:Lcom/nloko/android/syncmypix/SyncService$MainHandler;

    iget-object v4, v4, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->finish:Ljava/lang/Runnable;

    invoke-virtual {v3, v4}, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 256
    .end local v1           #service:Lcom/nloko/android/syncmypix/SyncService;
    :cond_2
    return-void
.end method

.class Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$1;
.super Ljava/lang/Object;
.source "SyncMyPixDbHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->deleteAllPictures(Lcom/nloko/android/syncmypix/DbHelperNotifier;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;

.field final synthetic val$cursor:Landroid/database/Cursor;

.field final synthetic val$notifier:Lcom/nloko/android/syncmypix/DbHelperNotifier;


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;Landroid/database/Cursor;Lcom/nloko/android/syncmypix/DbHelperNotifier;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 89
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$1;->this$0:Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;

    iput-object p2, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$1;->val$cursor:Landroid/database/Cursor;

    iput-object p3, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$1;->val$notifier:Lcom/nloko/android/syncmypix/DbHelperNotifier;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 91
    sget-object v2, Lcom/nloko/android/syncmypix/SyncService;->mSyncLock:Ljava/lang/Object;

    monitor-enter v2

    .line 92
    :goto_0
    :try_start_0
    iget-object v3, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$1;->val$cursor:Landroid/database/Cursor;

    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 93
    iget-object v3, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$1;->val$cursor:Landroid/database/Cursor;

    iget-object v4, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$1;->val$cursor:Landroid/database/Cursor;

    const-string v5, "_id"

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 94
    .local v1, id:Ljava/lang/String;
    iget-object v3, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$1;->val$cursor:Landroid/database/Cursor;

    iget-object v4, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$1;->val$cursor:Landroid/database/Cursor;

    const-string v5, "photo_hash"

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 95
    .local v0, dbHash:Ljava/lang/String;
    iget-object v3, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$1;->this$0:Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;

    invoke-virtual {v3, v1, v0}, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->deletePicture(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 99
    .end local v0           #dbHash:Ljava/lang/String;
    .end local v1           #id:Ljava/lang/String;
    :catchall_0
    move-exception v3

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 98
    :cond_0
    :try_start_1
    iget-object v3, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$1;->this$0:Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;

    invoke-virtual {v3}, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->deleteData()V

    .line 99
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 101
    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$1;->val$notifier:Lcom/nloko/android/syncmypix/DbHelperNotifier;

    if-eqz v2, :cond_1

    .line 102
    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$1;->val$notifier:Lcom/nloko/android/syncmypix/DbHelperNotifier;

    invoke-interface {v2}, Lcom/nloko/android/syncmypix/DbHelperNotifier;->onUpdateComplete()V

    .line 105
    :cond_1
    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$1;->val$cursor:Landroid/database/Cursor;

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 106
    return-void
.end method

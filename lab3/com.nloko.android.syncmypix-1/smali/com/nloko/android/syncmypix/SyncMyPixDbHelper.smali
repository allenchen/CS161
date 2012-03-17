.class public Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;
.super Ljava/lang/Object;
.source "SyncMyPixDbHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$DBHashes;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "SyncMyPixDbHelper"


# instance fields
.field private final mContactUtils:Lcom/nloko/android/syncmypix/contactutils/ContactUtils;

.field private final mResolver:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/content/ContentResolver;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->mResolver:Ljava/lang/ref/WeakReference;

    .line 51
    new-instance v0, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;

    invoke-direct {v0}, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->mContactUtils:Lcom/nloko/android/syncmypix/contactutils/ContactUtils;

    .line 52
    return-void
.end method


# virtual methods
.method public deleteAllPictures()V
    .locals 1

    .prologue
    .line 73
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->deleteAllPictures(Lcom/nloko/android/syncmypix/DbHelperNotifier;)V

    .line 74
    return-void
.end method

.method public deleteAllPictures(Lcom/nloko/android/syncmypix/DbHelperNotifier;)V
    .locals 8
    .parameter "notifier"

    .prologue
    const/4 v3, 0x0

    .line 78
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->mResolver:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ContentResolver;

    .line 79
    .local v0, resolver:Landroid/content/ContentResolver;
    if-nez v0, :cond_0

    .line 110
    :goto_0
    return-void

    .line 83
    :cond_0
    sget-object v1, Lcom/nloko/android/syncmypix/SyncMyPix$Contacts;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "_id"

    aput-object v5, v2, v4

    const/4 v4, 0x1

    const-string v5, "photo_hash"

    aput-object v5, v2, v4

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 89
    .local v6, cursor:Landroid/database/Cursor;
    new-instance v7, Ljava/lang/Thread;

    new-instance v1, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$1;

    invoke-direct {v1, p0, v6, p1}, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$1;-><init>(Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;Landroid/database/Cursor;Lcom/nloko/android/syncmypix/DbHelperNotifier;)V

    invoke-direct {v7, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 109
    .local v7, thread:Ljava/lang/Thread;
    invoke-virtual {v7}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method public deleteData()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 55
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->mResolver:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ContentResolver;

    .line 56
    .local v0, resolver:Landroid/content/ContentResolver;
    if-eqz v0, :cond_0

    .line 57
    sget-object v1, Lcom/nloko/android/syncmypix/SyncMyPix$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2, v2}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 58
    sget-object v1, Lcom/nloko/android/syncmypix/SyncMyPix$Results;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2, v2}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 59
    sget-object v1, Lcom/nloko/android/syncmypix/SyncMyPix$Sync;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2, v2}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 61
    :cond_0
    return-void
.end method

.method public deleteData(Ljava/lang/String;)V
    .locals 4
    .parameter "id"

    .prologue
    const/4 v3, 0x0

    .line 64
    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->mResolver:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ContentResolver;

    .line 65
    .local v0, resolver:Landroid/content/ContentResolver;
    if-eqz v0, :cond_0

    .line 66
    sget-object v2, Lcom/nloko/android/syncmypix/SyncMyPix$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v2, p1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 67
    .local v1, uri:Landroid/net/Uri;
    invoke-virtual {v0, v1, v3, v3}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 69
    .end local v1           #uri:Landroid/net/Uri;
    :cond_0
    return-void
.end method

.method public deletePicture(Ljava/lang/String;)V
    .locals 8
    .parameter "id"

    .prologue
    const/4 v3, 0x0

    .line 114
    if-nez p1, :cond_0

    .line 115
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "id"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 118
    :cond_0
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->mResolver:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ContentResolver;

    .line 119
    .local v0, resolver:Landroid/content/ContentResolver;
    if-nez v0, :cond_2

    .line 133
    :cond_1
    :goto_0
    return-void

    .line 123
    :cond_2
    sget-object v1, Lcom/nloko/android/syncmypix/SyncMyPix$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v1, p1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "_id"

    aput-object v5, v2, v4

    const/4 v4, 0x1

    const-string v5, "photo_hash"

    aput-object v5, v2, v4

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 129
    .local v6, cursor:Landroid/database/Cursor;
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 130
    const-string v1, "photo_hash"

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 131
    .local v7, hash:Ljava/lang/String;
    invoke-virtual {p0, p1, v7}, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->deletePicture(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public deletePicture(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .parameter "id"
    .parameter "dbHash"

    .prologue
    .line 137
    if-nez p1, :cond_0

    .line 138
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "id"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 139
    :cond_0
    if-nez p2, :cond_1

    .line 140
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "dbHash"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 143
    :cond_1
    iget-object v3, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->mResolver:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/ContentResolver;

    .line 144
    .local v1, resolver:Landroid/content/ContentResolver;
    if-nez v1, :cond_3

    .line 155
    :cond_2
    :goto_0
    return-void

    .line 148
    :cond_3
    iget-object v3, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->mContactUtils:Lcom/nloko/android/syncmypix/contactutils/ContactUtils;

    invoke-virtual {v3, v1, p1}, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;->getPhoto(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 149
    .local v2, stream:Ljava/io/InputStream;
    if-eqz v2, :cond_2

    .line 150
    invoke-static {v2}, Lcom/nloko/android/Utils;->getByteArrayFromInputStream(Ljava/io/InputStream;)[B

    move-result-object v3

    invoke-static {v3}, Lcom/nloko/android/Utils;->getMd5Hash([B)Ljava/lang/String;

    move-result-object v0

    .line 152
    .local v0, hash:Ljava/lang/String;
    iget-object v3, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->mContactUtils:Lcom/nloko/android/syncmypix/contactutils/ContactUtils;

    const/4 v4, 0x0

    invoke-virtual {v3, v1, v4, p1}, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;->updatePhoto(Landroid/content/ContentResolver;[BLjava/lang/String;)V

    goto :goto_0
.end method

.method public deleteResults(Ljava/lang/String;)V
    .locals 9
    .parameter "source"

    .prologue
    const/4 v4, 0x0

    .line 159
    if-nez p1, :cond_0

    .line 160
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "source"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 163
    :cond_0
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->mResolver:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ContentResolver;

    .line 164
    .local v0, resolver:Landroid/content/ContentResolver;
    if-nez v0, :cond_1

    .line 181
    :goto_0
    return-void

    .line 168
    :cond_1
    sget-object v1, Lcom/nloko/android/syncmypix/SyncMyPix$Sync;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v5, "_id"

    aput-object v5, v2, v3

    const/4 v3, 0x1

    const-string v5, "source"

    aput-object v5, v2, v3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "source=\'"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "\'"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 174
    .local v6, cursor:Landroid/database/Cursor;
    :goto_1
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 175
    const-string v1, "_id"

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 176
    .local v7, id:Ljava/lang/String;
    sget-object v1, Lcom/nloko/android/syncmypix/SyncMyPix$Sync;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v1, v7}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    .line 177
    .local v8, uri:Landroid/net/Uri;
    invoke-virtual {v0, v8, v4, v4}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_1

    .line 180
    .end local v7           #id:Ljava/lang/String;
    .end local v8           #uri:Landroid/net/Uri;
    :cond_2
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_0
.end method

.method public getHashes(Ljava/lang/String;)Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$DBHashes;
    .locals 8
    .parameter "id"

    .prologue
    const/4 v3, 0x0

    .line 392
    if-nez p1, :cond_0

    .line 393
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "id"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 396
    :cond_0
    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->mResolver:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ContentResolver;

    .line 397
    .local v0, resolver:Landroid/content/ContentResolver;
    if-nez v0, :cond_1

    move-object v2, v3

    .line 420
    :goto_0
    return-object v2

    .line 401
    :cond_1
    sget-object v2, Lcom/nloko/android/syncmypix/SyncMyPix$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v2, p1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 403
    .local v1, syncUri:Landroid/net/Uri;
    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "_id"

    aput-object v5, v2, v4

    const/4 v4, 0x1

    const-string v5, "photo_hash"

    aput-object v5, v2, v4

    const/4 v4, 0x2

    const-string v5, "network_photo_hash"

    aput-object v5, v2, v4

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 411
    .local v7, syncC:Landroid/database/Cursor;
    new-instance v6, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$DBHashes;

    invoke-direct {v6, p0}, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$DBHashes;-><init>(Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;)V

    .line 413
    .local v6, hashes:Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$DBHashes;
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 414
    const-string v2, "photo_hash"

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v6, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$DBHashes;->updatedHash:Ljava/lang/String;

    .line 415
    const-string v2, "network_photo_hash"

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v6, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$DBHashes;->networkHash:Ljava/lang/String;

    .line 418
    :cond_2
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    move-object v2, v6

    .line 420
    goto :goto_0
.end method

.method public getLinkedContact(Ljava/lang/String;Ljava/lang/String;)Lcom/nloko/android/syncmypix/PhoneContact;
    .locals 9
    .parameter "id"
    .parameter "source"

    .prologue
    const/4 v4, 0x0

    .line 362
    if-nez p1, :cond_0

    .line 363
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "id"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 364
    :cond_0
    if-nez p2, :cond_1

    .line 365
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "source"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 368
    :cond_1
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->mResolver:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ContentResolver;

    .line 369
    .local v0, resolver:Landroid/content/ContentResolver;
    if-nez v0, :cond_2

    move-object v1, v4

    .line 387
    :goto_0
    return-object v1

    .line 373
    :cond_2
    sget-object v1, Lcom/nloko/android/syncmypix/SyncMyPix$Contacts;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v5, "_id"

    aput-object v5, v2, v3

    const/4 v3, 0x1

    const-string v5, "lookup_key"

    aput-object v5, v2, v3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "friend_id=\'"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "\' AND "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "source"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "=\'"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "\'"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 379
    .local v7, cursor:Landroid/database/Cursor;
    const/4 v6, 0x0

    .line 380
    .local v6, contactId:Ljava/lang/String;
    const/4 v8, 0x0

    .line 381
    .local v8, lookup:Ljava/lang/String;
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 382
    const-string v1, "_id"

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 383
    const-string v1, "lookup_key"

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v7, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 386
    :cond_3
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 387
    new-instance v1, Lcom/nloko/android/syncmypix/PhoneContact;

    invoke-direct {v1, v6, v4, v8}, Lcom/nloko/android/syncmypix/PhoneContact;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public hasLink(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 8
    .parameter "id"
    .parameter "source"

    .prologue
    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 336
    if-nez p1, :cond_0

    .line 337
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "id"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 338
    :cond_0
    if-nez p2, :cond_1

    .line 339
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "source"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 342
    :cond_1
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->mResolver:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ContentResolver;

    .line 343
    .local v0, resolver:Landroid/content/ContentResolver;
    if-nez v0, :cond_2

    move v1, v5

    .line 357
    :goto_0
    return v1

    .line 347
    :cond_2
    sget-object v1, Lcom/nloko/android/syncmypix/SyncMyPix$Contacts;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "_id"

    aput-object v3, v2, v5

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "_id="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " AND "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "source"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "=\'"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "\'"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " AND "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "friend_id"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " IS NOT NULL"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 355
    .local v7, cursor:Landroid/database/Cursor;
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    .line 356
    .local v6, answer:Z
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    move v1, v6

    .line 357
    goto :goto_0
.end method

.method public isSyncablePicture(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z
    .locals 8
    .parameter "id"
    .parameter "dbHash"
    .parameter "contactHash"
    .parameter "skipIfExists"

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 425
    if-nez p1, :cond_0

    .line 426
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "id"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 429
    :cond_0
    iget-object v3, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->mResolver:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/ContentResolver;

    .line 430
    .local v1, resolver:Landroid/content/ContentResolver;
    if-nez v1, :cond_1

    move v3, v6

    .line 453
    :goto_0
    return v3

    .line 434
    :cond_1
    const/4 v0, 0x1

    .line 436
    .local v0, ok:Z
    sget-object v3, Lcom/nloko/android/syncmypix/SyncMyPix$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v3, p1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 438
    .local v2, syncUri:Landroid/net/Uri;
    if-eqz p4, :cond_2

    .line 440
    if-nez p2, :cond_3

    if-eqz p3, :cond_3

    .line 441
    const/4 v0, 0x0

    :cond_2
    :goto_1
    move v3, v0

    .line 453
    goto :goto_0

    .line 442
    :cond_3
    if-eqz p3, :cond_2

    .line 444
    const-string v3, "SyncMyPixDbHelper"

    const-string v4, "dbhash %s hash %s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p2, v5, v6

    const/4 v6, 0x1

    aput-object p3, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 446
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 447
    invoke-virtual {v1, v2, v7, v7}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 448
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public resetHashes(Ljava/lang/String;)V
    .locals 2
    .parameter "source"

    .prologue
    .line 241
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->resetHashes(Ljava/lang/String;ZZ)V

    .line 242
    return-void
.end method

.method public resetHashes(Ljava/lang/String;ZZ)V
    .locals 12
    .parameter "source"
    .parameter "networkHash"
    .parameter "localHash"

    .prologue
    const/4 v4, 0x0

    .line 245
    if-nez p1, :cond_0

    .line 246
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "source"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 248
    :cond_0
    if-nez p2, :cond_1

    if-nez p3, :cond_1

    .line 249
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Both networkHash and localHash should not be false"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 252
    :cond_1
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->mResolver:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ContentResolver;

    .line 253
    .local v0, resolver:Landroid/content/ContentResolver;
    if-nez v0, :cond_2

    .line 291
    :goto_0
    return-void

    .line 257
    :cond_2
    sget-object v1, Lcom/nloko/android/syncmypix/SyncMyPix$Contacts;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v5, "_id"

    aput-object v5, v2, v3

    const/4 v3, 0x1

    const-string v5, "photo_hash"

    aput-object v5, v2, v3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "source=\'"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "\'"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 263
    .local v6, cursor:Landroid/database/Cursor;
    new-instance v11, Landroid/content/ContentValues;

    invoke-direct {v11}, Landroid/content/ContentValues;-><init>()V

    .line 268
    .local v11, values:Landroid/content/ContentValues;
    :cond_3
    :goto_1
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 270
    const-string v1, "_id"

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 271
    .local v8, id:Ljava/lang/String;
    sget-object v1, Lcom/nloko/android/syncmypix/SyncMyPix$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v1, v8}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v10

    .line 273
    .local v10, uri:Landroid/net/Uri;
    if-eqz p3, :cond_4

    .line 274
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->mContactUtils:Lcom/nloko/android/syncmypix/contactutils/ContactUtils;

    invoke-virtual {v1, v0, v8}, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;->getPhoto(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v9

    .line 275
    .local v9, is:Ljava/io/InputStream;
    if-eqz v9, :cond_4

    .line 276
    invoke-static {v9}, Lcom/nloko/android/Utils;->getByteArrayFromInputStream(Ljava/io/InputStream;)[B

    move-result-object v1

    invoke-static {v1}, Lcom/nloko/android/Utils;->getMd5Hash([B)Ljava/lang/String;

    move-result-object v7

    .line 277
    .local v7, hash:Ljava/lang/String;
    const-string v1, "photo_hash"

    invoke-virtual {v11, v1, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    .end local v7           #hash:Ljava/lang/String;
    .end local v9           #is:Ljava/io/InputStream;
    :cond_4
    if-eqz p2, :cond_5

    .line 281
    const-string v1, "network_photo_hash"

    invoke-virtual {v11, v1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    .line 284
    :cond_5
    invoke-virtual {v11}, Landroid/content/ContentValues;->size()I

    move-result v1

    if-lez v1, :cond_3

    .line 285
    invoke-virtual {v0, v10, v11, v4, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 286
    invoke-virtual {v11}, Landroid/content/ContentValues;->clear()V

    goto :goto_1

    .line 290
    .end local v8           #id:Ljava/lang/String;
    .end local v10           #uri:Landroid/net/Uri;
    :cond_6
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_0
.end method

.method public updateHashes(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .parameter "id"
    .parameter "lookup"
    .parameter "networkHash"
    .parameter "updatedHash"

    .prologue
    const/4 v3, 0x0

    .line 201
    if-nez p1, :cond_0

    .line 202
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "id"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 205
    :cond_0
    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->mResolver:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ContentResolver;

    .line 206
    .local v0, resolver:Landroid/content/ContentResolver;
    if-nez v0, :cond_2

    .line 238
    :cond_1
    :goto_0
    return-void

    .line 210
    :cond_2
    sget-object v2, Lcom/nloko/android/syncmypix/SyncMyPix$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v2, p1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 211
    .local v1, uri:Landroid/net/Uri;
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "_id"

    aput-object v5, v2, v4

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 217
    .local v6, cursor:Landroid/database/Cursor;
    new-instance v7, Landroid/content/ContentValues;

    invoke-direct {v7}, Landroid/content/ContentValues;-><init>()V

    .line 218
    .local v7, values:Landroid/content/ContentValues;
    const-string v2, "lookup_key"

    invoke-virtual {v7, v2, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    if-eqz p3, :cond_3

    .line 221
    const-string v2, "network_photo_hash"

    invoke-virtual {v7, v2, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 224
    :cond_3
    if-eqz p4, :cond_4

    .line 225
    const-string v2, "photo_hash"

    invoke-virtual {v7, v2, p4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 228
    :cond_4
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 229
    invoke-virtual {v0, v1, v7, v3, v3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 235
    :goto_1
    if-eqz v6, :cond_1

    .line 236
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 231
    :cond_5
    const-string v2, "_id"

    invoke-virtual {v7, v2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 232
    sget-object v2, Lcom/nloko/android/syncmypix/SyncMyPix$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v0, v2, v7}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    goto :goto_1
.end method

.method public updateHashes(Ljava/lang/String;Ljava/lang/String;[B[B)V
    .locals 2
    .parameter "id"
    .parameter "lookup"
    .parameter "origImage"
    .parameter "modifiedImage"

    .prologue
    .line 185
    const/4 v1, 0x0

    .line 186
    .local v1, networkHash:Ljava/lang/String;
    const/4 v0, 0x0

    .line 188
    .local v0, hash:Ljava/lang/String;
    if-eqz p3, :cond_0

    .line 189
    invoke-static {p3}, Lcom/nloko/android/Utils;->getMd5Hash([B)Ljava/lang/String;

    move-result-object v1

    .line 192
    :cond_0
    if-eqz p4, :cond_1

    .line 193
    invoke-static {p4}, Lcom/nloko/android/Utils;->getMd5Hash([B)Ljava/lang/String;

    move-result-object v0

    .line 196
    :cond_1
    invoke-virtual {p0, p1, p2, v1, v0}, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->updateHashes(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 197
    return-void
.end method

.method public updateLink(Ljava/lang/String;Ljava/lang/String;Lcom/nloko/android/syncmypix/SocialNetworkUser;Ljava/lang/String;)V
    .locals 1
    .parameter "id"
    .parameter "lookup"
    .parameter "user"
    .parameter "source"

    .prologue
    .line 295
    iget-object v0, p3, Lcom/nloko/android/syncmypix/SocialNetworkUser;->uid:Ljava/lang/String;

    invoke-virtual {p0, p1, p2, v0, p4}, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->updateLink(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 296
    return-void
.end method

.method public updateLink(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 10
    .parameter "id"
    .parameter "lookup"
    .parameter "friendId"
    .parameter "source"

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    const/4 v3, 0x0

    .line 300
    if-nez p1, :cond_0

    .line 301
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "id"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 304
    :cond_0
    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->mResolver:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ContentResolver;

    .line 305
    .local v0, resolver:Landroid/content/ContentResolver;
    if-nez v0, :cond_1

    .line 332
    :goto_0
    return-void

    .line 309
    :cond_1
    sget-object v2, Lcom/nloko/android/syncmypix/SyncMyPix$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v2, p1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 310
    .local v1, uri:Landroid/net/Uri;
    new-array v2, v9, [Ljava/lang/String;

    const-string v4, "_id"

    aput-object v4, v2, v8

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 316
    .local v6, cursor:Landroid/database/Cursor;
    new-instance v7, Landroid/content/ContentValues;

    invoke-direct {v7}, Landroid/content/ContentValues;-><init>()V

    .line 317
    .local v7, values:Landroid/content/ContentValues;
    const-string v2, "friend_id"

    invoke-virtual {v7, v2, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 318
    const-string v2, "source"

    invoke-virtual {v7, v2, p4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 319
    const-string v2, "lookup_key"

    invoke-virtual {v7, v2, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 320
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 321
    invoke-virtual {v0, v1, v7, v3, v3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 327
    :goto_1
    if-eqz v6, :cond_2

    .line 328
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 331
    :cond_2
    const-string v2, "SyncMyPixDbHelper"

    const-string v3, "Updated link with contact id %s and lookup %s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p1, v4, v8

    aput-object p2, v4, v9

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 323
    :cond_3
    const-string v2, "_id"

    invoke-virtual {v7, v2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 324
    sget-object v2, Lcom/nloko/android/syncmypix/SyncMyPix$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v0, v2, v7}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    goto :goto_1
.end method

.class Lcom/nloko/android/syncmypix/SyncService$SyncTask;
.super Landroid/os/AsyncTask;
.source "SyncService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nloko/android/syncmypix/SyncService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/util/List",
        "<",
        "Lcom/nloko/android/syncmypix/SocialNetworkUser;",
        ">;",
        "Ljava/lang/Integer;",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# instance fields
.field private final dbHelper:Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;

.field private final mCache:Lcom/nloko/android/PhotoCache;

.field private final mContactUtils:Lcom/nloko/android/syncmypix/contactutils/ContactUtils;

.field private mNotFound:I

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

.field private mSkipped:I

.field private mUpdated:I


# direct methods
.method public constructor <init>(Lcom/nloko/android/syncmypix/SyncService;)V
    .locals 5
    .parameter "service"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 271
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 266
    iput v3, p0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mUpdated:I

    .line 267
    iput v3, p0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mSkipped:I

    .line 268
    iput v3, p0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mNotFound:I

    .line 272
    new-instance v1, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;

    invoke-direct {v1}, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;-><init>()V

    iput-object v1, p0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mContactUtils:Lcom/nloko/android/syncmypix/contactutils/ContactUtils;

    .line 274
    new-instance v1, Lcom/nloko/android/PhotoCache;

    invoke-virtual {p1}, Lcom/nloko/android/syncmypix/SyncService;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/nloko/android/PhotoCache;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mCache:Lcom/nloko/android/PhotoCache;

    .line 275
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mCache:Lcom/nloko/android/PhotoCache;

    invoke-virtual {v1, v4}, Lcom/nloko/android/PhotoCache;->setDeleteOrder(I)V

    .line 277
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mService:Ljava/lang/ref/WeakReference;

    .line 278
    new-instance v2, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;

    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mService:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nloko/android/syncmypix/SyncService;

    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/SyncService;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v2, v1}, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->dbHelper:Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;

    .line 283
    const-string v1, "SyncMyPixPrefs"

    invoke-virtual {p1, v1, v3}, Lcom/nloko/android/syncmypix/SyncService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "last_googlesync"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 284
    .local v0, lastSyncedWithGoogle:Z
    iget-boolean v1, p1, Lcom/nloko/android/syncmypix/SyncService;->mAllowGoogleSync:Z

    if-eqz v1, :cond_1

    .line 285
    if-nez v0, :cond_0

    .line 286
    const-string v1, "SyncService"

    const-string v2, "Resetting hashes..."

    invoke-static {v1, v2}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 287
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->dbHelper:Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;

    invoke-virtual {p1}, Lcom/nloko/android/syncmypix/SyncService;->getSocialNetworkName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v4, v3}, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->resetHashes(Ljava/lang/String;ZZ)V

    .line 289
    :cond_0
    const-string v1, "SyncMyPixPrefs"

    invoke-virtual {p1, v1, v3}, Lcom/nloko/android/syncmypix/SyncService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "last_googlesync"

    invoke-static {v1, v2, v4}, Lcom/nloko/android/Utils;->setBoolean(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    .line 297
    :goto_0
    return-void

    .line 291
    :cond_1
    if-eqz v0, :cond_2

    .line 292
    const-string v1, "SyncService"

    const-string v2, "Resetting hashes..."

    invoke-static {v1, v2}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->dbHelper:Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;

    invoke-virtual {p1}, Lcom/nloko/android/syncmypix/SyncService;->getSocialNetworkName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->resetHashes(Ljava/lang/String;)V

    .line 295
    :cond_2
    const-string v1, "SyncMyPixPrefs"

    invoke-virtual {p1, v1, v3}, Lcom/nloko/android/syncmypix/SyncService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v2, "last_googlesync"

    invoke-static {v1, v2, v3}, Lcom/nloko/android/Utils;->setBoolean(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method private addResult(Landroid/content/ContentValues;)V
    .locals 3
    .parameter "value"

    .prologue
    .line 457
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mService:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nloko/android/syncmypix/SyncService;

    .line 458
    .local v0, service:Lcom/nloko/android/syncmypix/SyncService;
    if-eqz v0, :cond_0

    .line 459
    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncService;->access$200(Lcom/nloko/android/syncmypix/SyncService;)Ljava/util/List;

    move-result-object v1

    monitor-enter v1

    .line 460
    :try_start_0
    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncService;->access$200(Lcom/nloko/android/syncmypix/SyncService;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 461
    monitor-exit v1

    .line 463
    :cond_0
    return-void

    .line 461
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method private createResult(Ljava/lang/String;Lcom/nloko/android/syncmypix/SocialNetworkUser;)Landroid/content/ContentValues;
    .locals 4
    .parameter "id"
    .parameter "user"

    .prologue
    .line 467
    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mService:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nloko/android/syncmypix/SyncService;

    .line 469
    .local v0, service:Lcom/nloko/android/syncmypix/SyncService;
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 470
    .local v1, values:Landroid/content/ContentValues;
    const-string v2, "sync_id"

    invoke-virtual {v1, v2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 471
    const-string v2, "name"

    iget-object v3, p2, Lcom/nloko/android/syncmypix/SocialNetworkUser;->name:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 472
    const-string v2, "pic_url"

    iget-object v3, p2, Lcom/nloko/android/syncmypix/SocialNetworkUser;->picUrl:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 473
    const-string v2, "friend_id"

    iget-object v3, p2, Lcom/nloko/android/syncmypix/SocialNetworkUser;->uid:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 474
    const-string v2, "description"

    if-nez v0, :cond_0

    const-string v3, ""

    :goto_0
    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 476
    return-object v1

    .line 474
    :cond_0
    const v3, 0x7f060051

    invoke-virtual {v0, v3}, Lcom/nloko/android/syncmypix/SyncService;->getString(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method private processUser(Lcom/nloko/android/syncmypix/SocialNetworkUser;Lcom/nloko/android/syncmypix/PhoneContact;Landroid/net/Uri;)V
    .locals 28
    .parameter "user"
    .parameter "contact"
    .parameter "sync"

    .prologue
    .line 301
    if-nez p1, :cond_0

    .line 302
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "user"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 303
    :cond_0
    if-nez p3, :cond_1

    .line 304
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "sync"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 307
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mService:Ljava/lang/ref/WeakReference;

    move-object v5, v0

    invoke-virtual {v5}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/nloko/android/syncmypix/SyncService;

    .line 308
    .local v7, service:Lcom/nloko/android/syncmypix/SyncService;
    if-nez v7, :cond_3

    .line 453
    :cond_2
    :goto_0
    return-void

    .line 311
    :cond_3
    invoke-virtual {v7}, Lcom/nloko/android/syncmypix/SyncService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v24

    .line 312
    .local v24, resolver:Landroid/content/ContentResolver;
    if-eqz v24, :cond_2

    .line 316
    const-string v5, "SyncService"

    const-string v6, "%s %s %s"

    const/4 v8, 0x3

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SocialNetworkUser;->name:Ljava/lang/String;

    move-object v10, v0

    aput-object v10, v8, v9

    const/4 v9, 0x1

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SocialNetworkUser;->email:Ljava/lang/String;

    move-object v10, v0

    aput-object v10, v8, v9

    const/4 v9, 0x2

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SocialNetworkUser;->picUrl:Ljava/lang/String;

    move-object v10, v0

    aput-object v10, v8, v9

    invoke-static {v6, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/nloko/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 318
    invoke-virtual/range {p3 .. p3}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v5

    const/4 v6, 0x1

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Ljava/lang/String;

    .line 319
    .local v25, syncId:Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->createResult(Ljava/lang/String;Lcom/nloko/android/syncmypix/SocialNetworkUser;)Landroid/content/ContentValues;

    move-result-object v27

    .line 321
    .local v27, values:Landroid/content/ContentValues;
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SocialNetworkUser;->picUrl:Ljava/lang/String;

    move-object v5, v0

    if-nez v5, :cond_4

    .line 322
    move-object/from16 v0, p0

    iget v0, v0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mNotFound:I

    move v5, v0

    add-int/lit8 v5, v5, 0x1

    move v0, v5

    move-object/from16 v1, p0

    iput v0, v1, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mNotFound:I

    .line 323
    const-string v5, "description"

    const v6, 0x7f060058

    invoke-virtual {v7, v6}, Lcom/nloko/android/syncmypix/SyncService;->getString(I)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, v27

    move-object v1, v5

    move-object v2, v6

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 324
    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-direct {v0, v1}, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->addResult(Landroid/content/ContentValues;)V

    goto :goto_0

    .line 329
    :cond_4
    const/4 v13, 0x0

    .line 330
    .local v13, contactId:Ljava/lang/String;
    const/16 v22, 0x0

    .line 331
    .local v22, lookup:Ljava/lang/String;
    const/4 v11, 0x0

    .line 332
    .local v11, aggregatedId:Ljava/lang/String;
    const/16 v23, 0x0

    .line 335
    .local v23, name:Ljava/lang/String;
    if-eqz p2, :cond_5

    .line 336
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/nloko/android/syncmypix/PhoneContact;->id:Ljava/lang/String;

    move-object v11, v0

    move-object v13, v11

    .line 337
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/nloko/android/syncmypix/PhoneContact;->name:Ljava/lang/String;

    move-object/from16 v23, v0

    .line 338
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mContactUtils:Lcom/nloko/android/syncmypix/contactutils/ContactUtils;

    move-object v5, v0

    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/nloko/android/syncmypix/PhoneContact;->id:Ljava/lang/String;

    move-object v6, v0

    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/nloko/android/syncmypix/PhoneContact;->lookup:Ljava/lang/String;

    move-object v8, v0

    move-object v0, v5

    move-object/from16 v1, v24

    move-object v2, v6

    move-object v3, v8

    invoke-virtual {v0, v1, v2, v3}, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;->confirmContact(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Lcom/nloko/android/syncmypix/PhoneContact;

    move-result-object p2

    .line 339
    if-eqz p2, :cond_5

    .line 340
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/nloko/android/syncmypix/PhoneContact;->id:Ljava/lang/String;

    move-object v11, v0

    .line 341
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/nloko/android/syncmypix/PhoneContact;->lookup:Ljava/lang/String;

    move-object/from16 v22, v0

    .line 345
    :cond_5
    if-eqz p2, :cond_6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mContactUtils:Lcom/nloko/android/syncmypix/contactutils/ContactUtils;

    move-object v5, v0

    move-object v0, v5

    move-object/from16 v1, v24

    move-object v2, v11

    invoke-virtual {v0, v1, v2}, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;->isContactUpdatable(Landroid/content/ContentResolver;Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_7

    iget-boolean v5, v7, Lcom/nloko/android/syncmypix/SyncService;->mOverrideReadOnlyCheck:Z

    if-nez v5, :cond_7

    .line 346
    :cond_6
    const-string v5, "SyncService"

    const-string v6, "Contact not found in database."

    invoke-static {v5, v6}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 347
    move-object/from16 v0, p0

    iget v0, v0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mNotFound:I

    move v5, v0

    add-int/lit8 v5, v5, 0x1

    move v0, v5

    move-object/from16 v1, p0

    iput v0, v1, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mNotFound:I

    .line 348
    const-string v5, "description"

    const v6, 0x7f060050

    invoke-virtual {v7, v6}, Lcom/nloko/android/syncmypix/SyncService;->getString(I)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, v27

    move-object v1, v5

    move-object v2, v6

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 349
    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-direct {v0, v1}, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->addResult(Landroid/content/ContentValues;)V

    goto/16 :goto_0

    .line 353
    :cond_7
    const-string v5, "SyncService"

    const-string v6, "Matched to %s with aggregated id %s and lookup %s"

    const/4 v8, 0x3

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v23, v8, v9

    const/4 v9, 0x1

    aput-object v11, v8, v9

    const/4 v9, 0x2

    aput-object v22, v8, v9

    invoke-static {v6, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/nloko/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 355
    const/16 v21, 0x0

    .line 356
    .local v21, is:Ljava/io/InputStream;
    const/16 v16, 0x0

    .line 357
    .local v16, friend:Ljava/io/InputStream;
    const/16 v20, 0x0

    .line 359
    .local v20, image:[B
    const/4 v12, 0x0

    .line 360
    .local v12, contactHash:Ljava/lang/String;
    const/16 v18, 0x0

    .line 363
    .local v18, hash:Ljava/lang/String;
    new-instance v10, Landroid/content/ContentValues;

    move-object v0, v10

    move-object/from16 v1, v27

    invoke-direct {v0, v1}, Landroid/content/ContentValues;-><init>(Landroid/content/ContentValues;)V

    .line 366
    .local v10, valuesCopy:Landroid/content/ContentValues;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->dbHelper:Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;

    move-object v5, v0

    invoke-virtual {v5, v13}, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->getHashes(Ljava/lang/String;)Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$DBHashes;

    move-result-object v19

    .line 367
    .local v19, hashes:Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$DBHashes;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mContactUtils:Lcom/nloko/android/syncmypix/contactutils/ContactUtils;

    move-object v5, v0

    move-object v0, v5

    move-object/from16 v1, v24

    move-object v2, v11

    invoke-virtual {v0, v1, v2}, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;->getPhoto(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v21

    .line 369
    if-eqz v21, :cond_8

    .line 371
    invoke-static/range {v21 .. v21}, Lcom/nloko/android/Utils;->getByteArrayFromInputStream(Ljava/io/InputStream;)[B

    move-result-object v5

    invoke-static {v5}, Lcom/nloko/android/Utils;->getMd5Hash([B)Ljava/lang/String;

    move-result-object v12

    .line 374
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->dbHelper:Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;

    move-object v5, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$DBHashes;->updatedHash:Ljava/lang/String;

    move-object v6, v0

    iget-boolean v8, v7, Lcom/nloko/android/syncmypix/SyncService;->mSkipIfExists:Z

    invoke-virtual {v5, v13, v6, v12, v8}, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->isSyncablePicture(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    move-result v5

    if-eqz v5, :cond_12

    .line 376
    :try_start_1
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SocialNetworkUser;->picUrl:Ljava/lang/String;

    move-object v5, v0

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v15

    .line 377
    .local v15, filename:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mCache:Lcom/nloko/android/PhotoCache;

    move-object v5, v0

    invoke-virtual {v5, v15}, Lcom/nloko/android/PhotoCache;->get(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v16

    .line 378
    if-nez v16, :cond_9

    .line 379
    const-string v5, "SyncService"

    const-string v6, "cache miss"

    invoke-static {v5, v6}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 380
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SocialNetworkUser;->picUrl:Ljava/lang/String;

    move-object v5, v0

    const/4 v6, 0x2

    invoke-static {v5, v6}, Lcom/nloko/android/Utils;->downloadPictureAsStream(Ljava/lang/String;I)Ljava/io/InputStream;

    move-result-object v16

    .line 383
    :cond_9
    invoke-static/range {v16 .. v16}, Lcom/nloko/android/Utils;->getByteArrayFromInputStream(Ljava/io/InputStream;)[B

    move-result-object v20

    .line 384
    invoke-virtual/range {v16 .. v16}, Ljava/io/InputStream;->close()V

    .line 386
    iget-boolean v5, v7, Lcom/nloko/android/syncmypix/SyncService;->mCacheOn:Z

    if-eqz v5, :cond_a

    .line 387
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mCache:Lcom/nloko/android/PhotoCache;

    move-object v5, v0

    move-object v0, v5

    move-object v1, v15

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/nloko/android/PhotoCache;->add(Ljava/lang/String;[B)V

    .line 390
    :cond_a
    invoke-static/range {v20 .. v20}, Lcom/nloko/android/Utils;->getMd5Hash([B)Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v18

    .line 395
    .end local v15           #filename:Ljava/lang/String;
    :goto_1
    if-eqz v20, :cond_11

    .line 396
    const/4 v5, 0x0

    :try_start_2
    move-object/from16 v0, v20

    array-length v0, v0

    move v6, v0

    move-object/from16 v0, v20

    move v1, v5

    move v2, v6

    invoke-static {v0, v1, v2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v9

    .line 398
    .local v9, bitmap:Landroid/graphics/Bitmap;
    if-eqz v18, :cond_b

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$DBHashes;->networkHash:Ljava/lang/String;

    move-object v5, v0

    move-object/from16 v0, v18

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_c

    :cond_b
    if-nez v21, :cond_e

    .line 399
    :cond_c
    move-object/from16 v26, v18

    .line 401
    .local v26, updatedHash:Ljava/lang/String;
    iget-boolean v5, v7, Lcom/nloko/android/syncmypix/SyncService;->mCropSquare:Z

    if-eqz v5, :cond_d

    .line 402
    const/16 v5, 0x60

    const/16 v6, 0x60

    invoke-static {v9, v5, v6}, Lcom/nloko/android/Utils;->centerCrop(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v5

    invoke-static {v5}, Lcom/nloko/android/Utils;->bitmapToPNG(Landroid/graphics/Bitmap;)[B

    move-result-object v20

    .line 403
    invoke-static/range {v20 .. v20}, Lcom/nloko/android/Utils;->getMd5Hash([B)Ljava/lang/String;

    move-result-object v26

    .line 405
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mContactUtils:Lcom/nloko/android/syncmypix/contactutils/ContactUtils;

    move-object v5, v0

    iget-boolean v6, v7, Lcom/nloko/android/syncmypix/SyncService;->mAllowGoogleSync:Z

    move-object v0, v5

    move-object/from16 v1, v24

    move-object/from16 v2, v20

    move-object v3, v11

    move v4, v6

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;->updatePhoto(Landroid/content/ContentResolver;[BLjava/lang/String;Z)V

    .line 406
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->dbHelper:Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;

    move-object v5, v0

    move-object v0, v5

    move-object v1, v11

    move-object/from16 v2, v22

    move-object/from16 v3, v18

    move-object/from16 v4, v26

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->updateHashes(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 407
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->dbHelper:Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;

    move-object v5, v0

    invoke-virtual {v7}, Lcom/nloko/android/syncmypix/SyncService;->getSocialNetworkName()Ljava/lang/String;

    move-result-object v6

    move-object v0, v5

    move-object v1, v11

    move-object/from16 v2, v22

    move-object/from16 v3, p1

    move-object v4, v6

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->updateLink(Ljava/lang/String;Ljava/lang/String;Lcom/nloko/android/syncmypix/SocialNetworkUser;Ljava/lang/String;)V

    .line 408
    move-object/from16 v0, p0

    iget v0, v0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mUpdated:I

    move v5, v0

    add-int/lit8 v5, v5, 0x1

    move v0, v5

    move-object/from16 v1, p0

    iput v0, v1, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mUpdated:I

    .line 416
    .end local v26           #updatedHash:Ljava/lang/String;
    :goto_2
    move-object v0, v7

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncService;->mMainHandler:Lcom/nloko/android/syncmypix/SyncService$MainHandler;

    move-object/from16 v17, v0

    .line 417
    .local v17, handler:Lcom/nloko/android/syncmypix/SyncService$MainHandler;
    if-eqz v17, :cond_10

    .line 418
    new-instance v5, Lcom/nloko/android/syncmypix/SyncService$SyncTask$1;

    move-object/from16 v6, p0

    move-object/from16 v8, p1

    invoke-direct/range {v5 .. v10}, Lcom/nloko/android/syncmypix/SyncService$SyncTask$1;-><init>(Lcom/nloko/android/syncmypix/SyncService$SyncTask;Lcom/nloko/android/syncmypix/SyncService;Lcom/nloko/android/syncmypix/SocialNetworkUser;Landroid/graphics/Bitmap;Landroid/content/ContentValues;)V

    move-object/from16 v0, v17

    move-object v1, v5

    invoke-virtual {v0, v1}, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 431
    :goto_3
    const-string v5, "contact_id"

    invoke-virtual {v10, v5, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 432
    const-string v5, "lookup_key"

    move-object v0, v10

    move-object v1, v5

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 446
    .end local v9           #bitmap:Landroid/graphics/Bitmap;
    .end local v17           #handler:Lcom/nloko/android/syncmypix/SyncService$MainHandler;
    :goto_4
    move-object/from16 v0, p0

    move-object v1, v10

    invoke-direct {v0, v1}, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->addResult(Landroid/content/ContentValues;)V

    .line 448
    if-eqz v21, :cond_2

    .line 449
    :try_start_3
    invoke-virtual/range {v21 .. v21}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    goto/16 :goto_0

    .line 451
    :catch_0
    move-exception v5

    goto/16 :goto_0

    .line 391
    :catch_1
    move-exception v5

    move-object v14, v5

    .line 392
    .local v14, e:Ljava/lang/Exception;
    :try_start_4
    invoke-virtual {v14}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto/16 :goto_1

    .line 443
    .end local v14           #e:Ljava/lang/Exception;
    .end local v19           #hashes:Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$DBHashes;
    :catch_2
    move-exception v5

    move-object v14, v5

    .line 444
    .restart local v14       #e:Ljava/lang/Exception;
    :try_start_5
    const-string v5, "description"

    const v6, 0x7f060057

    invoke-virtual {v7, v6}, Lcom/nloko/android/syncmypix/SyncService;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v10, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 446
    move-object/from16 v0, p0

    move-object v1, v10

    invoke-direct {v0, v1}, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->addResult(Landroid/content/ContentValues;)V

    .line 448
    if-eqz v21, :cond_2

    .line 449
    :try_start_6
    invoke-virtual/range {v21 .. v21}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    goto/16 :goto_0

    .line 451
    :catch_3
    move-exception v5

    goto/16 :goto_0

    .line 410
    .end local v14           #e:Ljava/lang/Exception;
    .restart local v9       #bitmap:Landroid/graphics/Bitmap;
    .restart local v19       #hashes:Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$DBHashes;
    :cond_e
    :try_start_7
    move-object/from16 v0, p0

    iget v0, v0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mSkipped:I

    move v5, v0

    add-int/lit8 v5, v5, 0x1

    move v0, v5

    move-object/from16 v1, p0

    iput v0, v1, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mSkipped:I

    .line 411
    const-string v5, "description"

    const v6, 0x7f060054

    invoke-virtual {v7, v6}, Lcom/nloko/android/syncmypix/SyncService;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v10, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    goto :goto_2

    .line 446
    .end local v9           #bitmap:Landroid/graphics/Bitmap;
    .end local v19           #hashes:Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$DBHashes;
    :catchall_0
    move-exception v5

    move-object/from16 v0, p0

    move-object v1, v10

    invoke-direct {v0, v1}, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->addResult(Landroid/content/ContentValues;)V

    .line 448
    if-eqz v21, :cond_f

    .line 449
    :try_start_8
    invoke-virtual/range {v21 .. v21}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_4

    .line 451
    :cond_f
    :goto_5
    throw v5

    .line 428
    .restart local v9       #bitmap:Landroid/graphics/Bitmap;
    .restart local v17       #handler:Lcom/nloko/android/syncmypix/SyncService$MainHandler;
    .restart local v19       #hashes:Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$DBHashes;
    :cond_10
    :try_start_9
    invoke-virtual {v9}, Landroid/graphics/Bitmap;->recycle()V

    goto :goto_3

    .line 434
    .end local v9           #bitmap:Landroid/graphics/Bitmap;
    .end local v17           #handler:Lcom/nloko/android/syncmypix/SyncService$MainHandler;
    :cond_11
    const-string v5, "description"

    const v6, 0x7f060056

    invoke-virtual {v7, v6}, Lcom/nloko/android/syncmypix/SyncService;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v10, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 439
    :cond_12
    move-object/from16 v0, p0

    iget v0, v0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mSkipped:I

    move v5, v0

    add-int/lit8 v5, v5, 0x1

    move v0, v5

    move-object/from16 v1, p0

    iput v0, v1, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mSkipped:I

    .line 440
    const-string v5, "description"

    const v6, 0x7f060052

    invoke-virtual {v7, v6}, Lcom/nloko/android/syncmypix/SyncService;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v10, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_2

    goto/16 :goto_4

    .line 451
    .end local v19           #hashes:Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$DBHashes;
    :catch_4
    move-exception v6

    goto :goto_5
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/util/List;)Ljava/lang/Long;
    .locals 28
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/util/List",
            "<",
            "Lcom/nloko/android/syncmypix/SocialNetworkUser;",
            ">;)",
            "Ljava/lang/Long;"
        }
    .end annotation

    .prologue
    .line 482
    .local p1, users:[Ljava/util/List;,"[Ljava/util/List<Lcom/nloko/android/syncmypix/SocialNetworkUser;>;"
    const-wide/16 v19, 0x0

    .line 483
    .local v19, total:J
    const/4 v9, 0x0

    .local v9, index:I
    const/4 v15, 0x0

    .line 485
    .local v15, size:I
    const/16 v23, 0x0

    aget-object v22, p1, v23

    .line 486
    .local v22, userList:Ljava/util/List;,"Ljava/util/List<Lcom/nloko/android/syncmypix/SocialNetworkUser;>;"
    const/4 v12, 0x0

    .line 488
    .local v12, matcher:Lcom/nloko/android/syncmypix/namematcher/NameMatcher;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mService:Ljava/lang/ref/WeakReference;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/nloko/android/syncmypix/SyncService;

    .line 489
    .local v14, service:Lcom/nloko/android/syncmypix/SyncService;
    if-nez v14, :cond_0

    .line 490
    const-wide/16 v23, 0x0

    invoke-static/range {v23 .. v24}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v23

    .line 580
    :goto_0
    return-object v23

    .line 492
    :cond_0
    invoke-virtual {v14}, Lcom/nloko/android/syncmypix/SyncService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v13

    .line 493
    .local v13, resolver:Landroid/content/ContentResolver;
    if-nez v13, :cond_1

    .line 494
    const-wide/16 v23, 0x0

    invoke-static/range {v23 .. v24}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v23

    goto :goto_0

    .line 496
    :cond_1
    iget-object v7, v14, Lcom/nloko/android/syncmypix/SyncService;->mMainHandler:Lcom/nloko/android/syncmypix/SyncService$MainHandler;

    .line 497
    .local v7, handler:Lcom/nloko/android/syncmypix/SyncService$MainHandler;
    invoke-virtual {v14}, Lcom/nloko/android/syncmypix/SyncService;->getSocialNetworkName()Ljava/lang/String;

    move-result-object v16

    .line 499
    .local v16, source:Ljava/lang/String;
    sget-object v23, Lcom/nloko/android/syncmypix/SyncService;->mSyncLock:Ljava/lang/Object;

    monitor-enter v23

    .line 501
    :try_start_0
    invoke-virtual {v14}, Lcom/nloko/android/syncmypix/SyncService;->getApplicationContext()Landroid/content/Context;

    move-result-object v24

    invoke-virtual {v14}, Lcom/nloko/android/syncmypix/SyncService;->getResources()Landroid/content/res/Resources;

    move-result-object v25

    const/high16 v26, 0x7f04

    invoke-virtual/range {v25 .. v26}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v25

    move-object v0, v14

    iget-boolean v0, v0, Lcom/nloko/android/syncmypix/SyncService;->mPhoneOnly:Z

    move/from16 v26, v0

    invoke-static/range {v24 .. v26}, Lcom/nloko/android/syncmypix/namematcher/NameMatcherFactory;->create(Landroid/content/Context;Ljava/io/InputStream;Z)Lcom/nloko/android/syncmypix/namematcher/NameMatcher;

    move-result-object v12

    .line 510
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->dbHelper:Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->deleteResults(Ljava/lang/String;)V

    .line 511
    new-instance v18, Landroid/content/ContentValues;

    invoke-direct/range {v18 .. v18}, Landroid/content/ContentValues;-><init>()V

    .line 512
    .local v18, syncValues:Landroid/content/ContentValues;
    const-string v24, "source"

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    move-object/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 513
    sget-object v24, Lcom/nloko/android/syncmypix/SyncMyPix$Sync;->CONTENT_URI:Landroid/net/Uri;

    move-object v0, v13

    move-object/from16 v1, v24

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v17

    .line 515
    .local v17, sync:Landroid/net/Uri;
    const/4 v9, 0x1

    .line 516
    invoke-interface/range {v22 .. v22}, Ljava/util/List;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v15

    .line 518
    const/16 v24, 0x1

    sub-int v8, v15, v24

    .local v8, i:I
    move v10, v9

    .end local v9           #index:I
    .local v10, index:I
    :goto_1
    if-ltz v8, :cond_11

    .line 519
    :try_start_1
    move-object/from16 v0, v22

    move v1, v8

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lcom/nloko/android/syncmypix/SocialNetworkUser;

    .line 521
    .local v21, user:Lcom/nloko/android/syncmypix/SocialNetworkUser;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->dbHelper:Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;

    move-object/from16 v24, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SocialNetworkUser;->uid:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->getLinkedContact(Ljava/lang/String;Ljava/lang/String;)Lcom/nloko/android/syncmypix/PhoneContact;

    move-result-object v11

    .line 522
    .local v11, linked:Lcom/nloko/android/syncmypix/PhoneContact;
    const/4 v5, 0x0

    .line 523
    .local v5, contact:Lcom/nloko/android/syncmypix/PhoneContact;
    move-object v0, v11

    iget-object v0, v0, Lcom/nloko/android/syncmypix/PhoneContact;->id:Ljava/lang/String;

    move-object/from16 v24, v0

    if-nez v24, :cond_8

    .line 524
    move-object v0, v14

    iget-boolean v0, v0, Lcom/nloko/android/syncmypix/SyncService;->mIntelliMatch:Z

    move/from16 v24, v0

    if-eqz v24, :cond_7

    .line 525
    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SocialNetworkUser;->name:Ljava/lang/String;

    move-object/from16 v24, v0

    const/16 v25, 0x1

    move-object v0, v12

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->match(Ljava/lang/String;Z)Lcom/nloko/android/syncmypix/PhoneContact;

    move-result-object v5

    .line 529
    :goto_2
    if-eqz v5, :cond_2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->dbHelper:Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;

    move-object/from16 v24, v0

    move-object v0, v5

    iget-object v0, v0, Lcom/nloko/android/syncmypix/PhoneContact;->id:Ljava/lang/String;

    move-object/from16 v25, v0

    invoke-virtual {v14}, Lcom/nloko/android/syncmypix/SyncService;->getSocialNetworkName()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v24 .. v26}, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->hasLink(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v24

    if-eqz v24, :cond_2

    .line 530
    const/4 v5, 0x0

    .line 536
    :cond_2
    :goto_3
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object v2, v5

    move-object/from16 v3, v17

    invoke-direct {v0, v1, v2, v3}, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->processUser(Lcom/nloko/android/syncmypix/SocialNetworkUser;Lcom/nloko/android/syncmypix/PhoneContact;Landroid/net/Uri;)V

    .line 537
    const/16 v24, 0x3

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Integer;

    move-object/from16 v24, v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    const/16 v25, 0x0

    add-int/lit8 v9, v10, 0x1

    .end local v10           #index:I
    .restart local v9       #index:I
    move v0, v10

    int-to-float v0, v0

    move/from16 v26, v0

    move v0, v15

    int-to-float v0, v0

    move/from16 v27, v0

    div-float v26, v26, v27

    const/high16 v27, 0x42c8

    mul-float v26, v26, v27

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v26, v0

    :try_start_2
    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    aput-object v26, v24, v25

    const/16 v25, 0x1

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    aput-object v26, v24, v25

    const/16 v25, 0x2

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    aput-object v26, v24, v25

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->publishProgress([Ljava/lang/Object;)V

    .line 539
    invoke-static {v14}, Lcom/nloko/android/syncmypix/SyncService;->access$500(Lcom/nloko/android/syncmypix/SyncService;)Z

    move-result v24

    if-eqz v24, :cond_9

    .line 540
    if-eqz v7, :cond_3

    .line 541
    const/16 v24, 0x1

    const v25, 0x7f06004b

    const/16 v26, 0x0

    move-object v0, v7

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    invoke-virtual {v0, v1, v2, v3}, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v24

    move-object v0, v7

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->sendMessage(Landroid/os/Message;)Z

    .line 551
    .end local v5           #contact:Lcom/nloko/android/syncmypix/PhoneContact;
    .end local v11           #linked:Lcom/nloko/android/syncmypix/PhoneContact;
    .end local v21           #user:Lcom/nloko/android/syncmypix/SocialNetworkUser;
    :cond_3
    :goto_4
    invoke-virtual/range {v18 .. v18}, Landroid/content/ContentValues;->clear()V

    .line 552
    const-string v24, "date_completed"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v25

    invoke-static/range {v25 .. v26}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v25

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 553
    const-string v24, "updated"

    move-object/from16 v0, p0

    iget v0, v0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mUpdated:I

    move/from16 v25, v0

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 554
    const-string v24, "not_found"

    move-object/from16 v0, p0

    iget v0, v0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mNotFound:I

    move/from16 v25, v0

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 555
    const-string v24, "skipped"

    move-object/from16 v0, p0

    iget v0, v0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mSkipped:I

    move/from16 v25, v0

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 556
    const/16 v24, 0x0

    const/16 v25, 0x0

    move-object v0, v13

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    move-object/from16 v3, v24

    move-object/from16 v4, v25

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 558
    move v0, v9

    int-to-long v0, v0

    move-wide/from16 v19, v0

    .line 567
    if-eqz v12, :cond_4

    .line 568
    :try_start_3
    invoke-virtual {v12}, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->destroy()V

    .line 570
    :cond_4
    if-eqz v22, :cond_5

    .line 571
    invoke-interface/range {v22 .. v22}, Ljava/util/List;->clear()V

    .line 573
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mCache:Lcom/nloko/android/PhotoCache;

    move-object/from16 v24, v0

    if-eqz v24, :cond_6

    .line 574
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mCache:Lcom/nloko/android/PhotoCache;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/nloko/android/PhotoCache;->releaseResources()V

    .line 576
    :cond_6
    move-object v0, v7

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->resetExecuting:Ljava/lang/Runnable;

    move-object/from16 v24, v0

    move-object v0, v7

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->post(Ljava/lang/Runnable;)Z

    .line 578
    .end local v8           #i:I
    .end local v17           #sync:Landroid/net/Uri;
    .end local v18           #syncValues:Landroid/content/ContentValues;
    :goto_5
    monitor-exit v23
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 580
    invoke-static/range {v19 .. v20}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v23

    goto/16 :goto_0

    .line 527
    .end local v9           #index:I
    .restart local v5       #contact:Lcom/nloko/android/syncmypix/PhoneContact;
    .restart local v8       #i:I
    .restart local v10       #index:I
    .restart local v11       #linked:Lcom/nloko/android/syncmypix/PhoneContact;
    .restart local v17       #sync:Landroid/net/Uri;
    .restart local v18       #syncValues:Landroid/content/ContentValues;
    .restart local v21       #user:Lcom/nloko/android/syncmypix/SocialNetworkUser;
    :cond_7
    :try_start_4
    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SocialNetworkUser;->name:Ljava/lang/String;

    move-object/from16 v24, v0

    move-object v0, v12

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->exactMatch(Ljava/lang/String;)Lcom/nloko/android/syncmypix/PhoneContact;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    move-result-object v5

    goto/16 :goto_2

    .line 533
    :cond_8
    move-object v5, v11

    goto/16 :goto_3

    .line 546
    .end local v10           #index:I
    .restart local v9       #index:I
    :cond_9
    :try_start_5
    invoke-static {v14}, Lcom/nloko/android/syncmypix/SyncService;->access$200(Lcom/nloko/android/syncmypix/SyncService;)Ljava/util/List;

    move-result-object v24

    invoke-interface/range {v24 .. v24}, Ljava/util/List;->size()I

    move-result v24

    const/16 v25, 0x64

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_a

    .line 547
    const/16 v24, 0x0

    move-object v0, v14

    move/from16 v1, v24

    invoke-static {v0, v1}, Lcom/nloko/android/syncmypix/SyncService;->access$600(Lcom/nloko/android/syncmypix/SyncService;Z)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 518
    :cond_a
    add-int/lit8 v8, v8, -0x1

    move v10, v9

    .end local v9           #index:I
    .restart local v10       #index:I
    goto/16 :goto_1

    .line 560
    .end local v5           #contact:Lcom/nloko/android/syncmypix/PhoneContact;
    .end local v8           #i:I
    .end local v10           #index:I
    .end local v11           #linked:Lcom/nloko/android/syncmypix/PhoneContact;
    .end local v17           #sync:Landroid/net/Uri;
    .end local v18           #syncValues:Landroid/content/ContentValues;
    .end local v21           #user:Lcom/nloko/android/syncmypix/SocialNetworkUser;
    .restart local v9       #index:I
    :catch_0
    move-exception v24

    move-object/from16 v6, v24

    .line 561
    .local v6, ex:Ljava/lang/Exception;
    :goto_6
    :try_start_6
    const-string v24, "SyncService"

    invoke-static {v6}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/nloko/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 562
    const/16 v24, 0x1

    const v25, 0x7f06004e

    const/16 v26, 0x0

    move-object v0, v7

    move/from16 v1, v24

    move/from16 v2, v25

    move/from16 v3, v26

    invoke-virtual {v0, v1, v2, v3}, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v24

    move-object v0, v7

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->sendMessage(Landroid/os/Message;)Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 567
    if-eqz v12, :cond_b

    .line 568
    :try_start_7
    invoke-virtual {v12}, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->destroy()V

    .line 570
    :cond_b
    if-eqz v22, :cond_c

    .line 571
    invoke-interface/range {v22 .. v22}, Ljava/util/List;->clear()V

    .line 573
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mCache:Lcom/nloko/android/PhotoCache;

    move-object/from16 v24, v0

    if-eqz v24, :cond_d

    .line 574
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mCache:Lcom/nloko/android/PhotoCache;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lcom/nloko/android/PhotoCache;->releaseResources()V

    .line 576
    :cond_d
    move-object v0, v7

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->resetExecuting:Ljava/lang/Runnable;

    move-object/from16 v24, v0

    move-object v0, v7

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->post(Ljava/lang/Runnable;)Z

    goto :goto_5

    .line 578
    .end local v6           #ex:Ljava/lang/Exception;
    :catchall_0
    move-exception v24

    monitor-exit v23
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    throw v24

    .line 567
    :catchall_1
    move-exception v24

    :goto_7
    if-eqz v12, :cond_e

    .line 568
    :try_start_8
    invoke-virtual {v12}, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->destroy()V

    .line 570
    :cond_e
    if-eqz v22, :cond_f

    .line 571
    invoke-interface/range {v22 .. v22}, Ljava/util/List;->clear()V

    .line 573
    :cond_f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mCache:Lcom/nloko/android/PhotoCache;

    move-object/from16 v25, v0

    if-eqz v25, :cond_10

    .line 574
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mCache:Lcom/nloko/android/PhotoCache;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Lcom/nloko/android/PhotoCache;->releaseResources()V

    .line 576
    :cond_10
    move-object v0, v7

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->resetExecuting:Ljava/lang/Runnable;

    move-object/from16 v25, v0

    move-object v0, v7

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/nloko/android/syncmypix/SyncService$MainHandler;->post(Ljava/lang/Runnable;)Z

    throw v24
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 567
    .end local v9           #index:I
    .restart local v8       #i:I
    .restart local v10       #index:I
    .restart local v17       #sync:Landroid/net/Uri;
    .restart local v18       #syncValues:Landroid/content/ContentValues;
    :catchall_2
    move-exception v24

    move v9, v10

    .end local v10           #index:I
    .restart local v9       #index:I
    goto :goto_7

    .line 560
    .end local v9           #index:I
    .restart local v10       #index:I
    :catch_1
    move-exception v24

    move-object/from16 v6, v24

    move v9, v10

    .end local v10           #index:I
    .restart local v9       #index:I
    goto :goto_6

    .end local v9           #index:I
    .restart local v10       #index:I
    :cond_11
    move v9, v10

    .end local v10           #index:I
    .restart local v9       #index:I
    goto/16 :goto_4
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 259
    check-cast p1, [Ljava/util/List;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->doInBackground([Ljava/util/List;)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Ljava/lang/Long;)V
    .locals 9
    .parameter "result"

    .prologue
    const v8, 0x7f060049

    const v7, 0x7f060048

    const/4 v6, 0x1

    .line 596
    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mService:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nloko/android/syncmypix/SyncService;

    .line 597
    .local v1, service:Lcom/nloko/android/syncmypix/SyncService;
    if-nez v1, :cond_0

    .line 614
    :goto_0
    return-void

    .line 601
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-lez v2, :cond_1

    invoke-static {v1}, Lcom/nloko/android/syncmypix/SyncService;->access$500(Lcom/nloko/android/syncmypix/SyncService;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 602
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/SyncService;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 603
    .local v0, i:Landroid/content/Intent;
    const/high16 v2, 0x2002

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 604
    invoke-static {v1, v7, v8}, Lcom/nloko/android/syncmypix/SyncService;->access$700(Lcom/nloko/android/syncmypix/SyncService;II)V

    .line 605
    const v2, 0x1080082

    invoke-static {v1, v8, v2, v0, v6}, Lcom/nloko/android/syncmypix/SyncService;->access$800(Lcom/nloko/android/syncmypix/SyncService;IILandroid/content/Intent;Z)V

    .line 613
    .end local v0           #i:Landroid/content/Intent;
    :goto_1
    invoke-static {v1, v6}, Lcom/nloko/android/syncmypix/SyncService;->access$600(Lcom/nloko/android/syncmypix/SyncService;Z)V

    goto :goto_0

    .line 610
    :cond_1
    invoke-static {v1, v7}, Lcom/nloko/android/syncmypix/SyncService;->access$900(Lcom/nloko/android/syncmypix/SyncService;I)V

    goto :goto_1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 259
    check-cast p1, Ljava/lang/Long;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->onPostExecute(Ljava/lang/Long;)V

    return-void
.end method

.method protected varargs onProgressUpdate([Ljava/lang/Integer;)V
    .locals 5
    .parameter "values"

    .prologue
    .line 585
    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->mService:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nloko/android/syncmypix/SyncService;

    .line 586
    .local v1, service:Lcom/nloko/android/syncmypix/SyncService;
    if-eqz v1, :cond_0

    .line 587
    iget-object v0, v1, Lcom/nloko/android/syncmypix/SyncService;->mListener:Lcom/nloko/android/syncmypix/SyncServiceListener;

    .line 588
    .local v0, listener:Lcom/nloko/android/syncmypix/SyncServiceListener;
    if-eqz v0, :cond_0

    .line 589
    const/4 v2, 0x0

    aget-object v2, p1, v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x1

    aget-object v3, p1, v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v4, 0x2

    aget-object v4, p1, v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-interface {v0, v2, v3, v4}, Lcom/nloko/android/syncmypix/SyncServiceListener;->onSyncProgressUpdated(III)V

    .line 592
    .end local v0           #listener:Lcom/nloko/android/syncmypix/SyncServiceListener;
    :cond_0
    return-void
.end method

.method protected bridge synthetic onProgressUpdate([Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 259
    check-cast p1, [Ljava/lang/Integer;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/nloko/android/syncmypix/SyncService$SyncTask;->onProgressUpdate([Ljava/lang/Integer;)V

    return-void
.end method

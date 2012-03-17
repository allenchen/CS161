.class public Lcom/nloko/android/syncmypix/SyncMyPixProvider;
.super Landroid/content/ContentProvider;
.source "SyncMyPixProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nloko/android/syncmypix/SyncMyPixProvider$DatabaseHelper;
    }
.end annotation


# static fields
.field private static final CONTACTS:I = 0x1

.field private static final CONTACTS_ID:I = 0x2

.field private static final CONTACTS_TABLE_NAME:Ljava/lang/String; = "contacts"

.field private static final DATABASE_NAME:Ljava/lang/String; = "syncpix.db"

.field private static final DATABASE_VERSION:I = 0x7

.field private static final RESULTS:I = 0x3

.field private static final RESULTS_ID:I = 0x4

.field private static final RESULTS_TABLE_NAME:Ljava/lang/String; = "results"

.field private static final SYNC:I = 0x5

.field private static final SYNC_ID:I = 0x6

.field private static final SYNC_TABLE_NAME:Ljava/lang/String; = "sync"

.field private static final TAG:Ljava/lang/String; = "SyncMyPixProvider"

.field private static contactsProjection:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static resultsProjection:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static syncProjection:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final uriMatcher:Landroid/content/UriMatcher;


# instance fields
.field private openHelper:Lcom/nloko/android/syncmypix/SyncMyPixProvider$DatabaseHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 71
    new-instance v0, Landroid/content/UriMatcher;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Landroid/content/UriMatcher;-><init>(I)V

    sput-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->uriMatcher:Landroid/content/UriMatcher;

    .line 72
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->uriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.nloko.provider.SyncMyPix"

    const-string v2, "contacts"

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 73
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->uriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.nloko.provider.SyncMyPix"

    const-string v2, "contacts/#"

    const/4 v3, 0x2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 74
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->uriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.nloko.provider.SyncMyPix"

    const-string v2, "results"

    const/4 v3, 0x3

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 75
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->uriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.nloko.provider.SyncMyPix"

    const-string v2, "results/#"

    const/4 v3, 0x4

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 76
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->uriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.nloko.provider.SyncMyPix"

    const-string v2, "sync"

    const/4 v3, 0x5

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 77
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->uriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.nloko.provider.SyncMyPix"

    const-string v2, "sync/#"

    const/4 v3, 0x6

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 80
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->contactsProjection:Ljava/util/HashMap;

    .line 81
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->contactsProjection:Ljava/util/HashMap;

    const-string v1, "_id"

    const-string v2, "_id"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->contactsProjection:Ljava/util/HashMap;

    const-string v1, "lookup_key"

    const-string v2, "lookup_key"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->contactsProjection:Ljava/util/HashMap;

    const-string v1, "pic_url"

    const-string v2, "pic_url"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->contactsProjection:Ljava/util/HashMap;

    const-string v1, "photo_hash"

    const-string v2, "photo_hash"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->contactsProjection:Ljava/util/HashMap;

    const-string v1, "network_photo_hash"

    const-string v2, "network_photo_hash"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->contactsProjection:Ljava/util/HashMap;

    const-string v1, "friend_id"

    const-string v2, "friend_id"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->contactsProjection:Ljava/util/HashMap;

    const-string v1, "source"

    const-string v2, "source"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->syncProjection:Ljava/util/HashMap;

    .line 90
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->syncProjection:Ljava/util/HashMap;

    const-string v1, "_id"

    const-string v2, "sync._id"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->syncProjection:Ljava/util/HashMap;

    const-string v1, "source"

    const-string v2, "source"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->syncProjection:Ljava/util/HashMap;

    const-string v1, "date_started"

    const-string v2, "date_started"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->syncProjection:Ljava/util/HashMap;

    const-string v1, "date_completed"

    const-string v2, "date_completed"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->syncProjection:Ljava/util/HashMap;

    const-string v1, "updated"

    const-string v2, "updated"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->syncProjection:Ljava/util/HashMap;

    const-string v1, "skipped"

    const-string v2, "skipped"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->syncProjection:Ljava/util/HashMap;

    const-string v1, "not_found"

    const-string v2, "not_found"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->resultsProjection:Ljava/util/HashMap;

    .line 99
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->resultsProjection:Ljava/util/HashMap;

    const-string v1, "_id"

    const-string v2, "sync._id"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->resultsProjection:Ljava/util/HashMap;

    const-string v1, "source"

    const-string v2, "source"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->resultsProjection:Ljava/util/HashMap;

    const-string v1, "date_started"

    const-string v2, "date_started"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->resultsProjection:Ljava/util/HashMap;

    const-string v1, "date_completed"

    const-string v2, "date_completed"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->resultsProjection:Ljava/util/HashMap;

    const-string v1, "updated"

    const-string v2, "updated"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->resultsProjection:Ljava/util/HashMap;

    const-string v1, "skipped"

    const-string v2, "skipped"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->resultsProjection:Ljava/util/HashMap;

    const-string v1, "not_found"

    const-string v2, "not_found"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->resultsProjection:Ljava/util/HashMap;

    const-string v1, "_id"

    const-string v2, "results._id"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->resultsProjection:Ljava/util/HashMap;

    const-string v1, "sync_id"

    const-string v2, "sync_id"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->resultsProjection:Ljava/util/HashMap;

    const-string v1, "name"

    const-string v2, "name"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->resultsProjection:Ljava/util/HashMap;

    const-string v1, "pic_url"

    const-string v2, "pic_url"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->resultsProjection:Ljava/util/HashMap;

    const-string v1, "description"

    const-string v2, "description"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->resultsProjection:Ljava/util/HashMap;

    const-string v1, "contact_id"

    const-string v2, "contact_id"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->resultsProjection:Ljava/util/HashMap;

    const-string v1, "lookup_key"

    const-string v2, "lookup_key"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->resultsProjection:Ljava/util/HashMap;

    const-string v1, "friend_id"

    const-string v2, "friend_id"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 46
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    .line 117
    return-void
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 8
    .parameter "uri"
    .parameter "selection"
    .parameter "selectionArgs"

    .prologue
    const/4 v4, 0x1

    const/4 v7, 0x0

    .line 234
    iget-object v3, p0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->openHelper:Lcom/nloko/android/syncmypix/SyncMyPixProvider$DatabaseHelper;

    invoke-virtual {v3}, Lcom/nloko/android/syncmypix/SyncMyPixProvider$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 239
    .local v2, db:Landroid/database/sqlite/SQLiteDatabase;
    sget-object v3, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->uriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v3, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 264
    :pswitch_0
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unknown URI "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 241
    :pswitch_1
    const-string v3, "contacts"

    invoke-virtual {v2, v3, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 267
    .local v1, count:I
    :goto_0
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-virtual {v3, p1, v7}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 268
    return v1

    .line 245
    .end local v1           #count:I
    :pswitch_2
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 246
    .local v0, Id:Ljava/lang/String;
    const-string v3, "contacts"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "_id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, " AND ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v6, 0x29

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    :goto_1
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 248
    .restart local v1       #count:I
    goto :goto_0

    .line 246
    .end local v1           #count:I
    :cond_0
    const-string v5, ""

    goto :goto_1

    .line 253
    .end local v0           #Id:Ljava/lang/String;
    :pswitch_3
    const-string v3, "sync"

    invoke-virtual {v2, v3, v7, v7}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 254
    .restart local v1       #count:I
    const-string v3, "results"

    invoke-virtual {v2, v3, v7, v7}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 255
    goto :goto_0

    .line 258
    .end local v1           #count:I
    :pswitch_4
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 259
    .restart local v0       #Id:Ljava/lang/String;
    const-string v3, "sync"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "_id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4, v7}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 260
    .restart local v1       #count:I
    const-string v3, "results"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "sync_id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4, v7}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 261
    goto/16 :goto_0

    .line 239
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 3
    .parameter "uri"

    .prologue
    .line 273
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->uriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v0, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 287
    :pswitch_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown URI "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 275
    :pswitch_1
    const-string v0, "vnd.android.cursor.dir/vnd.nloko.contact"

    .line 284
    :goto_0
    return-object v0

    .line 278
    :pswitch_2
    const-string v0, "vnd.android.cursor.item/vnd.nloko.contact"

    goto :goto_0

    .line 281
    :pswitch_3
    const-string v0, "vnd.android.cursor.dir/vnd.nloko.result"

    goto :goto_0

    .line 284
    :pswitch_4
    const-string v0, "vnd.android.cursor.dir/vnd.nloko.sync"

    goto :goto_0

    .line 273
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_4
    .end packed-switch
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 12
    .parameter "uri"
    .parameter "initialValues"

    .prologue
    .line 294
    sget-object v9, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->uriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v9, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v9

    const/4 v10, 0x1

    if-eq v9, v10, :cond_0

    sget-object v9, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->uriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v9, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v9

    const/4 v10, 0x3

    if-eq v9, v10, :cond_0

    sget-object v9, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->uriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v9, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v9

    const/4 v10, 0x5

    if-eq v9, v10, :cond_0

    .line 297
    new-instance v9, Ljava/lang/IllegalArgumentException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Unknown URI "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 301
    :cond_0
    if-eqz p2, :cond_4

    .line 302
    new-instance v8, Landroid/content/ContentValues;

    invoke-direct {v8, p2}, Landroid/content/ContentValues;-><init>(Landroid/content/ContentValues;)V

    .line 307
    .local v8, values:Landroid/content/ContentValues;
    :goto_0
    const/4 v3, 0x0

    .line 308
    .local v3, nullCol:Ljava/lang/String;
    const/4 v7, 0x0

    .line 309
    .local v7, table:Ljava/lang/String;
    const/4 v0, 0x0

    .line 311
    .local v0, baseUri:Landroid/net/Uri;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    .line 313
    .local v2, now:Ljava/lang/Long;
    sget-object v9, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->uriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v9, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v9

    const/4 v10, 0x1

    if-ne v9, v10, :cond_1

    .line 314
    const-string v7, "contacts"

    .line 315
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPix$Contacts;->CONTENT_URI:Landroid/net/Uri;

    .line 316
    const-string v3, "photo_hash"

    .line 319
    :cond_1
    sget-object v9, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->uriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v9, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v9

    const/4 v10, 0x3

    if-ne v9, v10, :cond_2

    .line 320
    const-string v7, "results"

    .line 321
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPix$Results;->CONTENT_URI:Landroid/net/Uri;

    .line 322
    const-string v3, "description"

    .line 325
    :cond_2
    sget-object v9, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->uriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v9, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v9

    const/4 v10, 0x5

    if-ne v9, v10, :cond_3

    .line 326
    const-string v7, "sync"

    .line 327
    sget-object v0, Lcom/nloko/android/syncmypix/SyncMyPix$Sync;->CONTENT_URI:Landroid/net/Uri;

    .line 328
    const-string v3, "source"

    .line 330
    const-string v9, "date_started"

    invoke-virtual {v8, v9}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_3

    .line 331
    const-string v9, "date_started"

    invoke-virtual {v8, v9, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 335
    :cond_3
    iget-object v9, p0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->openHelper:Lcom/nloko/android/syncmypix/SyncMyPixProvider$DatabaseHelper;

    invoke-virtual {v9}, Lcom/nloko/android/syncmypix/SyncMyPixProvider$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 336
    .local v1, db:Landroid/database/sqlite/SQLiteDatabase;
    invoke-virtual {v1, v7, v3, v8}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v4

    .line 337
    .local v4, rowId:J
    const-wide/16 v9, 0x0

    cmp-long v9, v4, v9

    if-lez v9, :cond_5

    .line 338
    invoke-static {v0, v4, v5}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v6

    .line 339
    .local v6, rowUri:Landroid/net/Uri;
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v9, v6, v10}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 340
    return-object v6

    .line 304
    .end local v0           #baseUri:Landroid/net/Uri;
    .end local v1           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v2           #now:Ljava/lang/Long;
    .end local v3           #nullCol:Ljava/lang/String;
    .end local v4           #rowId:J
    .end local v6           #rowUri:Landroid/net/Uri;
    .end local v7           #table:Ljava/lang/String;
    .end local v8           #values:Landroid/content/ContentValues;
    :cond_4
    new-instance v8, Landroid/content/ContentValues;

    invoke-direct {v8}, Landroid/content/ContentValues;-><init>()V

    .restart local v8       #values:Landroid/content/ContentValues;
    goto :goto_0

    .line 343
    .restart local v0       #baseUri:Landroid/net/Uri;
    .restart local v1       #db:Landroid/database/sqlite/SQLiteDatabase;
    .restart local v2       #now:Ljava/lang/Long;
    .restart local v3       #nullCol:Ljava/lang/String;
    .restart local v4       #rowId:J
    .restart local v7       #table:Ljava/lang/String;
    :cond_5
    new-instance v9, Landroid/database/SQLException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Failed to insert row into "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Landroid/database/SQLException;-><init>(Ljava/lang/String;)V

    throw v9
.end method

.method public onCreate()Z
    .locals 2

    .prologue
    .line 348
    new-instance v0, Lcom/nloko/android/syncmypix/SyncMyPixProvider$DatabaseHelper;

    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/nloko/android/syncmypix/SyncMyPixProvider$DatabaseHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->openHelper:Lcom/nloko/android/syncmypix/SyncMyPixProvider$DatabaseHelper;

    .line 349
    const/4 v0, 0x1

    return v0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 9
    .parameter "uri"
    .parameter "projection"
    .parameter "selection"
    .parameter "selectionArgs"
    .parameter "sortOrder"

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 356
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 359
    .local v0, qb:Landroid/database/sqlite/SQLiteQueryBuilder;
    sget-object v2, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->uriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v2, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 404
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown URI "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 361
    :pswitch_0
    const-string v2, "contacts"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 362
    sget-object v2, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->contactsProjection:Ljava/util/HashMap;

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 363
    const-string v7, "_id ASC"

    .line 407
    .local v7, orderBy:Ljava/lang/String;
    :goto_0
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 408
    move-object v7, p5

    .line 411
    :cond_0
    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->openHelper:Lcom/nloko/android/syncmypix/SyncMyPixProvider$DatabaseHelper;

    invoke-virtual {v2}, Lcom/nloko/android/syncmypix/SyncMyPixProvider$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .local v1, db:Landroid/database/sqlite/SQLiteDatabase;
    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v6, v5

    .line 412
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 415
    .local v8, c:Landroid/database/Cursor;
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-interface {v8, v2, p1}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    .line 416
    return-object v8

    .line 367
    .end local v1           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v7           #orderBy:Ljava/lang/String;
    .end local v8           #c:Landroid/database/Cursor;
    :pswitch_1
    const-string v2, "contacts"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 368
    sget-object v2, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->contactsProjection:Ljava/util/HashMap;

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 369
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "_id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 370
    const-string v7, "_id ASC"

    .line 371
    .restart local v7       #orderBy:Ljava/lang/String;
    goto :goto_0

    .line 373
    .end local v7           #orderBy:Ljava/lang/String;
    :pswitch_2
    sget-object v2, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->resultsProjection:Ljava/util/HashMap;

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 374
    const-string v2, "results LEFT OUTER JOIN sync ON (results.sync_id=sync._id)"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 381
    const-string v7, "name ASC"

    .line 382
    .restart local v7       #orderBy:Ljava/lang/String;
    goto :goto_0

    .line 385
    .end local v7           #orderBy:Ljava/lang/String;
    :pswitch_3
    sget-object v2, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->resultsProjection:Ljava/util/HashMap;

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 386
    const-string v2, "results LEFT OUTER JOIN sync ON (results.sync_id=sync._id)"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 393
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "results._id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 394
    const-string v7, "name ASC"

    .line 395
    .restart local v7       #orderBy:Ljava/lang/String;
    goto/16 :goto_0

    .line 398
    .end local v7           #orderBy:Ljava/lang/String;
    :pswitch_4
    const-string v2, "sync"

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 399
    sget-object v2, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->syncProjection:Ljava/util/HashMap;

    invoke-virtual {v0, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setProjectionMap(Ljava/util/Map;)V

    .line 400
    const-string v7, "source ASC"

    .line 401
    .restart local v7       #orderBy:Ljava/lang/String;
    goto/16 :goto_0

    .line 359
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 8
    .parameter "uri"
    .parameter "values"
    .parameter "selection"
    .parameter "selectionArgs"

    .prologue
    const/16 v7, 0x29

    const/4 v4, 0x1

    .line 423
    iget-object v3, p0, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->openHelper:Lcom/nloko/android/syncmypix/SyncMyPixProvider$DatabaseHelper;

    invoke-virtual {v3}, Lcom/nloko/android/syncmypix/SyncMyPixProvider$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 427
    .local v2, db:Landroid/database/sqlite/SQLiteDatabase;
    sget-object v3, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->uriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v3, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 459
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unknown URI "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 429
    :pswitch_0
    const-string v3, "contacts"

    invoke-virtual {v2, v3, p2, p3, p4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 462
    .local v1, count:I
    :goto_0
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/SyncMyPixProvider;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, p1, v4}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 463
    return v1

    .line 433
    .end local v1           #count:I
    :pswitch_1
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 434
    .local v0, Id:Ljava/lang/String;
    const-string v3, "contacts"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "_id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, " AND ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    :goto_1
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, p2, v4, p4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 436
    .restart local v1       #count:I
    goto :goto_0

    .line 434
    .end local v1           #count:I
    :cond_0
    const-string v5, ""

    goto :goto_1

    .line 439
    .end local v0           #Id:Ljava/lang/String;
    :pswitch_2
    const-string v3, "results"

    invoke-virtual {v2, v3, p2, p3, p4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 440
    .restart local v1       #count:I
    goto :goto_0

    .line 443
    .end local v1           #count:I
    :pswitch_3
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 444
    .restart local v0       #Id:Ljava/lang/String;
    const-string v3, "results"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "_id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, " AND ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    :goto_2
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, p2, v4, p4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 446
    .restart local v1       #count:I
    goto/16 :goto_0

    .line 444
    .end local v1           #count:I
    :cond_1
    const-string v5, ""

    goto :goto_2

    .line 449
    .end local v0           #Id:Ljava/lang/String;
    :pswitch_4
    const-string v3, "sync"

    invoke-virtual {v2, v3, p2, p3, p4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 450
    .restart local v1       #count:I
    goto/16 :goto_0

    .line 453
    .end local v1           #count:I
    :pswitch_5
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 454
    .restart local v0       #Id:Ljava/lang/String;
    const-string v3, "sync"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "_id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_2

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, " AND ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    :goto_3
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, p2, v4, p4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 456
    .restart local v1       #count:I
    goto/16 :goto_0

    .line 454
    .end local v1           #count:I
    :cond_2
    const-string v5, ""

    goto :goto_3

    .line 427
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

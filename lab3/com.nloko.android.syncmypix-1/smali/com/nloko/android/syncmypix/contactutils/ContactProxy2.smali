.class public Lcom/nloko/android/syncmypix/contactutils/ContactProxy2;
.super Ljava/lang/Object;
.source "ContactProxy2.java"

# interfaces
.implements Lcom/nloko/android/syncmypix/contactutils/IContactProxy;


# static fields
.field private static final TAG:Ljava/lang/String; = "ContactProxy2"


# instance fields
.field private mUpdatable:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private ensureUpdatableLoaded()V
    .locals 8

    .prologue
    .line 145
    iget-object v5, p0, Lcom/nloko/android/syncmypix/contactutils/ContactProxy2;->mUpdatable:Ljava/util/HashMap;

    if-nez v5, :cond_0

    .line 146
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    iput-object v5, p0, Lcom/nloko/android/syncmypix/contactutils/ContactProxy2;->mUpdatable:Ljava/util/HashMap;

    .line 147
    invoke-static {}, Landroid/content/ContentResolver;->getSyncAdapterTypes()[Landroid/content/SyncAdapterType;

    move-result-object v4

    .line 148
    .local v4, types:[Landroid/content/SyncAdapterType;
    move-object v0, v4

    .local v0, arr$:[Landroid/content/SyncAdapterType;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 149
    .local v3, type:Landroid/content/SyncAdapterType;
    const-string v5, "ContactProxy2"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, v3, Landroid/content/SyncAdapterType;->accountType:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3}, Landroid/content/SyncAdapterType;->supportsUploading()Z

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    iget-object v5, p0, Lcom/nloko/android/syncmypix/contactutils/ContactProxy2;->mUpdatable:Ljava/util/HashMap;

    iget-object v6, v3, Landroid/content/SyncAdapterType;->accountType:Ljava/lang/String;

    invoke-virtual {v3}, Landroid/content/SyncAdapterType;->supportsUploading()Z

    move-result v7

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 153
    .end local v0           #arr$:[Landroid/content/SyncAdapterType;
    .end local v1           #i$:I
    .end local v2           #len$:I
    .end local v3           #type:Landroid/content/SyncAdapterType;
    .end local v4           #types:[Landroid/content/SyncAdapterType;
    :cond_0
    return-void
.end method

.method private queryForRawContactId(Landroid/content/ContentResolver;J)J
    .locals 11
    .parameter "cr"
    .parameter "contactId"

    .prologue
    .line 156
    const/4 v10, 0x0

    .line 157
    .local v10, rawContactIdCursor:Landroid/database/Cursor;
    const-wide/16 v8, -0x1

    .line 159
    .local v8, rawContactId:J
    if-eqz p1, :cond_4

    .line 161
    :try_start_0
    sget-object v1, Landroid/provider/ContactsContract$RawContacts;->CONTENT_URI:Landroid/net/Uri;

    const/4 v0, 0x3

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v3, "_id"

    aput-object v3, v2, v0

    const/4 v0, 0x1

    const-string v3, "account_name"

    aput-object v3, v2, v0

    const/4 v0, 0x2

    const-string v3, "account_type"

    aput-object v3, v2, v0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "contact_id="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 164
    if-eqz v10, :cond_3

    .line 166
    :cond_0
    :goto_0
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_3

    const-wide/16 v0, 0x0

    cmp-long v0, v8, v0

    if-gez v0, :cond_3

    .line 167
    const-string v0, "account_name"

    invoke-interface {v10, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v10, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 168
    .local v6, accountName:Ljava/lang/String;
    const-string v0, "account_type"

    invoke-interface {v10, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v10, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 170
    .local v7, accountType:Ljava/lang/String;
    const-string v0, "ContactProxy2"

    if-eqz v7, :cond_2

    move-object v1, v7

    :goto_1
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/contactutils/ContactProxy2;->ensureUpdatableLoaded()V

    .line 187
    if-eqz v7, :cond_1

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "htc.android.pcsc"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/nloko/android/syncmypix/contactutils/ContactProxy2;->mUpdatable:Ljava/util/HashMap;

    invoke-virtual {v0, v7}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nloko/android/syncmypix/contactutils/ContactProxy2;->mUpdatable:Ljava/util/HashMap;

    invoke-virtual {v0, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 192
    :cond_1
    const/4 v0, 0x0

    invoke-interface {v10, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    goto :goto_0

    .line 170
    :cond_2
    const-string v1, "empty"
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 197
    .end local v6           #accountName:Ljava/lang/String;
    .end local v7           #accountType:Ljava/lang/String;
    :cond_3
    if-eqz v10, :cond_4

    .line 198
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 202
    :cond_4
    return-wide v8

    .line 197
    :catchall_0
    move-exception v0

    if-eqz v10, :cond_5

    .line 198
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    :cond_5
    throw v0
.end method


# virtual methods
.method public confirmContact(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Lcom/nloko/android/syncmypix/PhoneContact;
    .locals 9
    .parameter "cr"
    .parameter "id"
    .parameter "lookup"

    .prologue
    const/4 v0, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    const/4 v3, 0x0

    .line 61
    invoke-static {p2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-static {v4, v5, p3}, Landroid/provider/ContactsContract$Contacts;->getLookupUri(JLjava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 62
    .local v1, lookupUri:Landroid/net/Uri;
    new-array v2, v0, [Ljava/lang/String;

    const-string v0, "_id"

    aput-object v0, v2, v7

    const-string v0, "lookup"

    aput-object v0, v2, v8

    move-object v0, p1

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 64
    .local v6, c:Landroid/database/Cursor;
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 66
    const-string v0, "_id"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    .line 67
    const-string v0, "lookup"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object p3

    .line 72
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 75
    new-instance v0, Lcom/nloko/android/syncmypix/PhoneContact;

    invoke-direct {v0, p2, v3, p3}, Lcom/nloko/android/syncmypix/PhoneContact;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    .line 69
    :cond_0
    :try_start_1
    const-string v0, "ContactProxy2"

    const-string v2, "Could not confirm contact %s with lookup %s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p2, v4, v5

    const/4 v5, 0x1

    aput-object p3, v4, v5

    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 72
    :catchall_0
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0
.end method

.method public getContentUri()Landroid/net/Uri;
    .locals 1

    .prologue
    .line 229
    sget-object v0, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    return-object v0
.end method

.method public getLookup(Landroid/content/ContentResolver;Landroid/net/Uri;)Ljava/lang/String;
    .locals 8
    .parameter "resolver"
    .parameter "contact"

    .prologue
    .line 206
    const/4 v6, 0x0

    .line 207
    .local v6, cursor:Landroid/database/Cursor;
    const/4 v7, 0x0

    .line 209
    .local v7, lookup:Ljava/lang/String;
    const/4 v0, 0x2

    :try_start_0
    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "_id"

    aput-object v1, v2, v0

    const/4 v0, 0x1

    const-string v1, "lookup"

    aput-object v1, v2, v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p1

    move-object v1, p2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 214
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 215
    const-string v0, "lookup"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v7

    .line 220
    :goto_0
    if-eqz v6, :cond_0

    .line 221
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 225
    :cond_0
    return-object v7

    .line 217
    :cond_1
    const/4 v7, 0x0

    goto :goto_0

    .line 220
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_2

    .line 221
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_2
    throw v0
.end method

.method public getPhoto(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/io/InputStream;
    .locals 2
    .parameter "cr"
    .parameter "id"

    .prologue
    .line 49
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 50
    :cond_0
    const/4 v1, 0x0

    .line 54
    :goto_0
    return-object v1

    .line 53
    :cond_1
    sget-object v1, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v1, p2}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 54
    .local v0, contact:Landroid/net/Uri;
    invoke-static {p1, v0}, Landroid/provider/ContactsContract$Contacts;->openContactPhotoInputStream(Landroid/content/ContentResolver;Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v1

    goto :goto_0
.end method

.method public isContactUpdatable(Landroid/content/ContentResolver;Ljava/lang/String;)Z
    .locals 4
    .parameter "cr"
    .parameter "id"

    .prologue
    .line 140
    invoke-static {p2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-direct {p0, p1, v0, v1}, Lcom/nloko/android/syncmypix/contactutils/ContactProxy2;->queryForRawContactId(Landroid/content/ContentResolver;J)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public updatePhoto(Landroid/content/ContentResolver;[BLjava/lang/String;Z)V
    .locals 19
    .parameter "cr"
    .parameter "photo"
    .parameter "id"
    .parameter "markDirty"

    .prologue
    .line 79
    if-eqz p1, :cond_0

    if-nez p3, :cond_1

    .line 137
    :cond_0
    :goto_0
    return-void

    .line 83
    :cond_1
    invoke-static/range {p3 .. p3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v5

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-wide v2, v5

    invoke-direct {v0, v1, v2, v3}, Lcom/nloko/android/syncmypix/contactutils/ContactProxy2;->queryForRawContactId(Landroid/content/ContentResolver;J)J

    move-result-wide v14

    .line 84
    .local v14, rawId:J
    const-wide/16 v5, 0x0

    cmp-long v5, v14, v5

    if-ltz v5, :cond_0

    .line 88
    invoke-static {v14, v15}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p3

    .line 89
    new-instance v18, Landroid/content/ContentValues;

    invoke-direct/range {v18 .. v18}, Landroid/content/ContentValues;-><init>()V

    .line 90
    .local v18, values:Landroid/content/ContentValues;
    const/4 v13, -0x1

    .line 93
    .local v13, photoRow:I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "raw_contact_id == "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object v0, v5

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " AND "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "mimetype"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "==\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "vnd.android.cursor.item/photo"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 97
    .local v8, where:Ljava/lang/String;
    sget-object v6, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    const/4 v7, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object/from16 v5, p1

    invoke-virtual/range {v5 .. v10}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 98
    .local v11, cursor:Landroid/database/Cursor;
    const-string v5, "_id"

    invoke-interface {v11, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v12

    .line 99
    .local v12, idIdx:I
    invoke-interface {v11}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 100
    invoke-interface {v11, v12}, Landroid/database/Cursor;->getInt(I)I

    move-result v13

    .line 102
    :cond_2
    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    .line 103
    if-gez v13, :cond_3

    if-eqz p2, :cond_0

    .line 107
    :cond_3
    const-string v5, "raw_contact_id"

    move-object/from16 v0, v18

    move-object v1, v5

    move-object/from16 v2, p3

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    const-string v5, "is_super_primary"

    const/4 v6, 0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    move-object/from16 v0, v18

    move-object v1, v5

    move-object v2, v6

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 110
    const-string v5, "data15"

    move-object/from16 v0, v18

    move-object v1, v5

    move-object/from16 v2, p2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 111
    const-string v5, "mimetype"

    const-string v6, "vnd.android.cursor.item/photo"

    move-object/from16 v0, v18

    move-object v1, v5

    move-object v2, v6

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    sget-object v5, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    int-to-long v6, v13

    invoke-static {v5, v6, v7}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v17

    .line 117
    .local v17, uri:Landroid/net/Uri;
    invoke-virtual/range {v17 .. v17}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v5

    const-string v6, "caller_is_syncadapter"

    const-string v7, "true"

    invoke-virtual {v5, v6, v7}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v16

    .line 118
    .local v16, updateUri:Landroid/net/Uri;
    if-ltz v13, :cond_5

    .line 119
    if-nez p2, :cond_4

    .line 124
    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    move-object v3, v5

    move-object v4, v6

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto/16 :goto_0

    .line 129
    :cond_4
    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    move-object v3, v5

    move-object v4, v6

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto/16 :goto_0

    .line 133
    :cond_5
    sget-object v17, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    .line 135
    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    goto/16 :goto_0
.end method

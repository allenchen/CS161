.class Lcom/nloko/android/syncmypix/SyncMyPixProvider$DatabaseHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "SyncMyPixProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nloko/android/syncmypix/SyncMyPixProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DatabaseHelper"
.end annotation


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    .line 120
    const-string v0, "syncpix.db"

    const/4 v1, 0x0

    const/4 v2, 0x7

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 121
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 125
    const-string v0, "CREATE TABLE contacts (_id INTEGER PRIMARY KEY,lookup_key TEXT DEFAULT NULL,pic_url TEXT DEFAULT NULL,photo_hash TEXT,network_photo_hash TEXT,friend_id TEXT DEFAULT NULL,source TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 135
    const-string v0, "CREATE TABLE results (_id INTEGER PRIMARY KEY,sync_id INTEGER,name TEXT DEFAULT NULL,description TEXT DEFAULT NULL,pic_url TEXT  DEFAULT NULL,contact_id INTEGER,lookup_key TEXT DEFAULT NULL,friend_id TEXT DEFAULT NULL);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 146
    const-string v0, "CREATE TABLE sync (_id INTEGER PRIMARY KEY,source TEXT DEFAULT NULL,date_started INTEGER,date_completed INTEGER,updated INTEGER,skipped INTEGER,not_found INTEGER);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 155
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 3
    .parameter "db"
    .parameter "oldVersion"
    .parameter "newVersion"

    .prologue
    .line 159
    const-string v0, "SyncMyPixProvider"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Upgrading database from version "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", which will destroy all old data"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/nloko/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    const/4 v0, 0x2

    if-lt p2, v0, :cond_0

    .line 163
    const-string v0, "CREATE TABLE results_new (_id INTEGER PRIMARY KEY,sync_id INTEGER,name TEXT DEFAULT NULL,description TEXT DEFAULT NULL,pic_url TEXT  DEFAULT NULL,contact_id INTEGER,lookup_key TEXT DEFAULT NULL,friend_id TEXT DEFAULT NULL);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 174
    const-string v0, "CREATE TABLE sync_new  (_id INTEGER PRIMARY KEY,source TEXT DEFAULT NULL,date_started INTEGER,date_completed INTEGER,updated INTEGER,skipped INTEGER,not_found INTEGER);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 184
    const-string v0, "DROP TABLE IF EXISTS sync;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 185
    const-string v0, "ALTER TABLE sync_new RENAME TO sync;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 187
    const-string v0, "DROP TABLE IF EXISTS results;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 188
    const-string v0, "ALTER TABLE results_new RENAME TO results;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 191
    :cond_0
    const-string v0, "CREATE TABLE contacts_new (_id INTEGER PRIMARY KEY,lookup_key TEXT DEFAULT NULL,pic_url TEXT DEFAULT NULL,photo_hash TEXT,network_photo_hash TEXT,friend_id TEXT DEFAULT NULL,source TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 201
    const/4 v0, 0x4

    if-gt p2, v0, :cond_1

    .line 202
    const-string v0, "INSERT INTO contacts_new (_id,photo_hash)SELECT _id,photo_hash FROM contacts;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 225
    :goto_0
    const-string v0, "DROP TABLE IF EXISTS contacts;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 226
    const-string v0, "ALTER TABLE contacts_new RENAME TO contacts;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 227
    return-void

    .line 210
    :cond_1
    const-string v0, "INSERT INTO contacts_new (_id,network_photo_hash,friend_id,source,photo_hash)SELECT _id,network_photo_hash,friend_id,source,photo_hash FROM contacts;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    goto :goto_0
.end method

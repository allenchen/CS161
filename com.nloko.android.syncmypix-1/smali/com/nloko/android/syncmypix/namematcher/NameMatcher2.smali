.class public Lcom/nloko/android/syncmypix/namematcher/NameMatcher2;
.super Lcom/nloko/android/syncmypix/namematcher/NameMatcher;
.source "NameMatcher2.java"


# instance fields
.field protected final TAG:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/io/InputStream;Z)V
    .locals 1
    .parameter "context"
    .parameter "diminutives"
    .parameter "withPhone"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 42
    invoke-direct {p0, p1, p2, p3}, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;-><init>(Landroid/content/Context;Ljava/io/InputStream;Z)V

    .line 38
    const-string v0, "NameMatcher2"

    iput-object v0, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher2;->TAG:Ljava/lang/String;

    .line 43
    return-void
.end method


# virtual methods
.method protected createFromCursor(Landroid/database/Cursor;)Lcom/nloko/android/syncmypix/PhoneContact;
    .locals 6
    .parameter "cursor"

    .prologue
    .line 47
    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/database/Cursor;->isClosed()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 48
    :cond_0
    const/4 v3, 0x0

    .line 55
    :goto_0
    return-object v3

    .line 51
    :cond_1
    const-string v3, "_id"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 52
    .local v0, id:Ljava/lang/String;
    const-string v3, "display_name"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 53
    .local v2, name:Ljava/lang/String;
    const-string v3, "lookup"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 54
    .local v1, lookup:Ljava/lang/String;
    const-string v3, "NameMatcher2"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "NameMatcher is processing contact "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    new-instance v3, Lcom/nloko/android/syncmypix/PhoneContact;

    invoke-direct {v3, v0, v2, v1}, Lcom/nloko/android/syncmypix/PhoneContact;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected doQuery(Z)Landroid/database/Cursor;
    .locals 7
    .parameter "withPhone"

    .prologue
    const/4 v2, 0x0

    .line 61
    iget-object v0, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher2;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/Context;

    .line 62
    .local v6, context:Landroid/content/Context;
    if-nez v6, :cond_0

    move-object v0, v2

    .line 73
    :goto_0
    return-object v0

    .line 66
    :cond_0
    const/4 v3, 0x0

    .line 67
    .local v3, where:Ljava/lang/String;
    if-eqz p1, :cond_1

    .line 68
    const-string v3, "has_phone_number=1"

    .line 71
    :cond_1
    const-string v0, "NameMatcher2"

    const-string v1, "Querying database for contacts.."

    invoke-static {v0, v1}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    move-object v4, v2

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    goto :goto_0
.end method

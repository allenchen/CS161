.class public Lcom/nloko/android/syncmypix/contactutils/ContactProxy;
.super Ljava/lang/Object;
.source "ContactProxy.java"

# interfaces
.implements Lcom/nloko/android/syncmypix/contactutils/IContactProxy;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public confirmContact(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Lcom/nloko/android/syncmypix/PhoneContact;
    .locals 2
    .parameter "cr"
    .parameter "id"
    .parameter "lookup"

    .prologue
    .line 50
    new-instance v0, Lcom/nloko/android/syncmypix/PhoneContact;

    const/4 v1, 0x0

    invoke-direct {v0, p2, v1, p3}, Lcom/nloko/android/syncmypix/PhoneContact;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public getContentUri()Landroid/net/Uri;
    .locals 1

    .prologue
    .line 78
    sget-object v0, Landroid/provider/Contacts$People;->CONTENT_URI:Landroid/net/Uri;

    return-object v0
.end method

.method public getLookup(Landroid/content/ContentResolver;Landroid/net/Uri;)Ljava/lang/String;
    .locals 1
    .parameter "resolver"
    .parameter "contact"

    .prologue
    .line 74
    const/4 v0, 0x0

    return-object v0
.end method

.method public getPhoto(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/io/InputStream;
    .locals 2
    .parameter "cr"
    .parameter "id"

    .prologue
    .line 37
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 38
    :cond_0
    const/4 v1, 0x0

    .line 42
    :goto_0
    return-object v1

    .line 41
    :cond_1
    sget-object v1, Landroid/provider/Contacts$People;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v1, p2}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 42
    .local v0, contact:Landroid/net/Uri;
    invoke-static {p1, v0}, Landroid/provider/Contacts$People;->openContactPhotoInputStream(Landroid/content/ContentResolver;Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v1

    goto :goto_0
.end method

.method public isContactUpdatable(Landroid/content/ContentResolver;Ljava/lang/String;)Z
    .locals 1
    .parameter "cr"
    .parameter "id"

    .prologue
    .line 46
    const/4 v0, 0x1

    return v0
.end method

.method public updatePhoto(Landroid/content/ContentResolver;[BLjava/lang/String;Z)V
    .locals 6
    .parameter "cr"
    .parameter "image"
    .parameter "id"
    .parameter "markDirty"

    .prologue
    const/4 v5, 0x0

    .line 54
    if-eqz p1, :cond_0

    if-nez p3, :cond_1

    .line 71
    :cond_0
    :goto_0
    return-void

    .line 58
    :cond_1
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 60
    .local v1, values:Landroid/content/ContentValues;
    if-nez p4, :cond_2

    .line 61
    const-string v2, "_sync_dirty"

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 64
    :cond_2
    const-string v2, "data"

    invoke-virtual {v1, v2, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 68
    sget-object v2, Landroid/provider/Contacts$People;->CONTENT_URI:Landroid/net/Uri;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "photo"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 70
    .local v0, photoUri:Landroid/net/Uri;
    invoke-virtual {p1, v0, v1, v5, v5}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0
.end method

.class public final Lcom/nloko/android/syncmypix/contactutils/ContactUtils;
.super Ljava/lang/Object;
.source "ContactUtils.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ContactServices"


# instance fields
.field private final mInstance:Lcom/nloko/android/syncmypix/contactutils/IContactProxy;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    invoke-static {}, Lcom/nloko/android/syncmypix/contactutils/ContactProxyFactory;->create()Lcom/nloko/android/syncmypix/contactutils/IContactProxy;

    move-result-object v0

    iput-object v0, p0, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;->mInstance:Lcom/nloko/android/syncmypix/contactutils/IContactProxy;

    return-void
.end method


# virtual methods
.method public confirmContact(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Lcom/nloko/android/syncmypix/PhoneContact;
    .locals 1
    .parameter "cr"
    .parameter "id"
    .parameter "lookup"

    .prologue
    .line 57
    iget-object v0, p0, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;->mInstance:Lcom/nloko/android/syncmypix/contactutils/IContactProxy;

    invoke-interface {v0, p1, p2, p3}, Lcom/nloko/android/syncmypix/contactutils/IContactProxy;->confirmContact(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Lcom/nloko/android/syncmypix/PhoneContact;

    move-result-object v0

    return-object v0
.end method

.method public getContentUri()Landroid/net/Uri;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;->mInstance:Lcom/nloko/android/syncmypix/contactutils/IContactProxy;

    invoke-interface {v0}, Lcom/nloko/android/syncmypix/contactutils/IContactProxy;->getContentUri()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public getLookup(Landroid/content/ContentResolver;Landroid/net/Uri;)Ljava/lang/String;
    .locals 1
    .parameter "resolver"
    .parameter "contact"

    .prologue
    .line 61
    iget-object v0, p0, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;->mInstance:Lcom/nloko/android/syncmypix/contactutils/IContactProxy;

    invoke-interface {v0, p1, p2}, Lcom/nloko/android/syncmypix/contactutils/IContactProxy;->getLookup(Landroid/content/ContentResolver;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPhoto(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/io/InputStream;
    .locals 1
    .parameter "cr"
    .parameter "id"

    .prologue
    .line 39
    iget-object v0, p0, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;->mInstance:Lcom/nloko/android/syncmypix/contactutils/IContactProxy;

    invoke-interface {v0, p1, p2}, Lcom/nloko/android/syncmypix/contactutils/IContactProxy;->getPhoto(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public isContactUpdatable(Landroid/content/ContentResolver;Ljava/lang/String;)Z
    .locals 1
    .parameter "cr"
    .parameter "id"

    .prologue
    .line 43
    iget-object v0, p0, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;->mInstance:Lcom/nloko/android/syncmypix/contactutils/IContactProxy;

    invoke-interface {v0, p1, p2}, Lcom/nloko/android/syncmypix/contactutils/IContactProxy;->isContactUpdatable(Landroid/content/ContentResolver;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public updatePhoto(Landroid/content/ContentResolver;[BLjava/lang/String;)V
    .locals 1
    .parameter "cr"
    .parameter "image"
    .parameter "id"

    .prologue
    .line 48
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;->updatePhoto(Landroid/content/ContentResolver;[BLjava/lang/String;Z)V

    .line 49
    return-void
.end method

.method public updatePhoto(Landroid/content/ContentResolver;[BLjava/lang/String;Z)V
    .locals 1
    .parameter "cr"
    .parameter "image"
    .parameter "id"
    .parameter "markDirty"

    .prologue
    .line 53
    iget-object v0, p0, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;->mInstance:Lcom/nloko/android/syncmypix/contactutils/IContactProxy;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/nloko/android/syncmypix/contactutils/IContactProxy;->updatePhoto(Landroid/content/ContentResolver;[BLjava/lang/String;Z)V

    .line 54
    return-void
.end method

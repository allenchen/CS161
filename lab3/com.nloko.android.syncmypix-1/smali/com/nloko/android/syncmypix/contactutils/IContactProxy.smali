.class public interface abstract Lcom/nloko/android/syncmypix/contactutils/IContactProxy;
.super Ljava/lang/Object;
.source "IContactProxy.java"


# virtual methods
.method public abstract confirmContact(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Lcom/nloko/android/syncmypix/PhoneContact;
.end method

.method public abstract getContentUri()Landroid/net/Uri;
.end method

.method public abstract getLookup(Landroid/content/ContentResolver;Landroid/net/Uri;)Ljava/lang/String;
.end method

.method public abstract getPhoto(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/io/InputStream;
.end method

.method public abstract isContactUpdatable(Landroid/content/ContentResolver;Ljava/lang/String;)Z
.end method

.method public abstract updatePhoto(Landroid/content/ContentResolver;[BLjava/lang/String;Z)V
.end method

.class public Lcom/nloko/android/syncmypix/namematcher/NameMatcherFactory;
.super Ljava/lang/Object;
.source "NameMatcherFactory.java"


# static fields
.field private static TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 32
    const-string v0, "NameMatcherFactory"

    sput-object v0, Lcom/nloko/android/syncmypix/namematcher/NameMatcherFactory;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Landroid/content/Context;Ljava/io/InputStream;)Lcom/nloko/android/syncmypix/namematcher/NameMatcher;
    .locals 1
    .parameter "context"
    .parameter "diminutives"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 34
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/nloko/android/syncmypix/namematcher/NameMatcherFactory;->create(Landroid/content/Context;Ljava/io/InputStream;Z)Lcom/nloko/android/syncmypix/namematcher/NameMatcher;

    move-result-object v0

    return-object v0
.end method

.method public static create(Landroid/content/Context;Ljava/io/InputStream;Z)Lcom/nloko/android/syncmypix/namematcher/NameMatcher;
    .locals 2
    .parameter "context"
    .parameter "diminutives"
    .parameter "withPhone"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 37
    invoke-static {}, Lcom/nloko/android/Utils;->determineOsVersion()I

    move-result v0

    const/4 v1, 0x5

    if-lt v0, v1, :cond_0

    .line 38
    sget-object v0, Lcom/nloko/android/syncmypix/namematcher/NameMatcherFactory;->TAG:Ljava/lang/String;

    const-string v1, "New version found...loading version 2"

    invoke-static {v0, v1}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    new-instance v0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher2;

    invoke-direct {v0, p0, p1, p2}, Lcom/nloko/android/syncmypix/namematcher/NameMatcher2;-><init>(Landroid/content/Context;Ljava/io/InputStream;Z)V

    .line 42
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;

    invoke-direct {v0, p0, p1, p2}, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;-><init>(Landroid/content/Context;Ljava/io/InputStream;Z)V

    goto :goto_0
.end method

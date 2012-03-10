.class public Lcom/nloko/android/syncmypix/contactutils/ContactProxyFactory;
.super Ljava/lang/Object;
.source "ContactProxyFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create()Lcom/nloko/android/syncmypix/contactutils/IContactProxy;
    .locals 2

    .prologue
    .line 29
    invoke-static {}, Lcom/nloko/android/Utils;->determineOsVersion()I

    move-result v0

    const/4 v1, 0x5

    if-lt v0, v1, :cond_0

    .line 30
    new-instance v0, Lcom/nloko/android/syncmypix/contactutils/ContactProxy2;

    invoke-direct {v0}, Lcom/nloko/android/syncmypix/contactutils/ContactProxy2;-><init>()V

    .line 33
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/nloko/android/syncmypix/contactutils/ContactProxy;

    invoke-direct {v0}, Lcom/nloko/android/syncmypix/contactutils/ContactProxy;-><init>()V

    goto :goto_0
.end method

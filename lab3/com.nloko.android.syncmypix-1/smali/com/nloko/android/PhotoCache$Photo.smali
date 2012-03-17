.class final Lcom/nloko/android/PhotoCache$Photo;
.super Ljava/lang/Object;
.source "PhotoCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nloko/android/PhotoCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Photo"
.end annotation


# instance fields
.field public bytes:[B

.field public file:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;[B)V
    .locals 0
    .parameter "f"
    .parameter "b"

    .prologue
    .line 364
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 365
    iput-object p1, p0, Lcom/nloko/android/PhotoCache$Photo;->file:Ljava/lang/String;

    .line 366
    iput-object p2, p0, Lcom/nloko/android/PhotoCache$Photo;->bytes:[B

    .line 367
    return-void
.end method

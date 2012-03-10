.class public final Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$DBHashes;
.super Ljava/lang/Object;
.source "SyncMyPixDbHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "DBHashes"
.end annotation


# instance fields
.field public networkHash:Ljava/lang/String;

.field final synthetic this$0:Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;

.field public updatedHash:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;)V
    .locals 1
    .parameter

    .prologue
    const/4 v0, 0x0

    .line 456
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$DBHashes;->this$0:Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 458
    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$DBHashes;->updatedHash:Ljava/lang/String;

    .line 459
    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper$DBHashes;->networkHash:Ljava/lang/String;

    return-void
.end method

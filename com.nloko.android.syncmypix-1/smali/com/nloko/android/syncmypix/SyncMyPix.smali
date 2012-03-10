.class public final Lcom/nloko/android/syncmypix/SyncMyPix;
.super Ljava/lang/Object;
.source "SyncMyPix.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nloko/android/syncmypix/SyncMyPix$Sync;,
        Lcom/nloko/android/syncmypix/SyncMyPix$Results;,
        Lcom/nloko/android/syncmypix/SyncMyPix$Contacts;
    }
.end annotation


# static fields
.field public static final AUTHORITY:Ljava/lang/String; = "com.nloko.provider.SyncMyPix"

.field public static final SYNC_INTENT:Ljava/lang/String; = "com.nloko.android.syncmypix.SYNC"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

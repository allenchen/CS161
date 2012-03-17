.class public Lcom/nloko/android/syncmypix/SyncWakeLock;
.super Ljava/lang/Object;
.source "SyncWakeLock.java"


# static fields
.field private static mWakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static acquireWakeLock(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    .line 33
    if-nez p0, :cond_1

    .line 42
    :cond_0
    :goto_0
    return-void

    .line 37
    :cond_1
    sget-object v1, Lcom/nloko/android/syncmypix/SyncWakeLock;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    if-nez v1, :cond_0

    .line 38
    const-string v1, "power"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    .line 39
    .local v0, pm:Landroid/os/PowerManager;
    const/4 v1, 0x1

    const-string v2, "SyncMyPix WakeLock"

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    sput-object v1, Lcom/nloko/android/syncmypix/SyncWakeLock;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 40
    sget-object v1, Lcom/nloko/android/syncmypix/SyncWakeLock;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->acquire()V

    goto :goto_0
.end method

.method public static releaseWakeLock()V
    .locals 1

    .prologue
    .line 45
    sget-object v0, Lcom/nloko/android/syncmypix/SyncWakeLock;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz v0, :cond_0

    .line 46
    sget-object v0, Lcom/nloko/android/syncmypix/SyncWakeLock;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 47
    const/4 v0, 0x0

    sput-object v0, Lcom/nloko/android/syncmypix/SyncWakeLock;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 49
    :cond_0
    return-void
.end method

.class public Lcom/nloko/android/syncmypix/SyncService$LocalBinder;
.super Landroid/os/Binder;
.source "SyncService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nloko/android/syncmypix/SyncService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LocalBinder"
.end annotation


# instance fields
.field private final mService:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/nloko/android/syncmypix/SyncService;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/nloko/android/syncmypix/SyncService;)V
    .locals 1
    .parameter "service"

    .prologue
    .line 763
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 764
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncService$LocalBinder;->mService:Ljava/lang/ref/WeakReference;

    .line 765
    return-void
.end method


# virtual methods
.method public getService()Lcom/nloko/android/syncmypix/SyncService;
    .locals 1

    .prologue
    .line 768
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncService$LocalBinder;->mService:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    .end local p0
    check-cast p0, Lcom/nloko/android/syncmypix/SyncService;

    return-object p0
.end method

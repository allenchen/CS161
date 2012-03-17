.class Lcom/nloko/android/LogCollector$LogHandler;
.super Landroid/os/Handler;
.source "LogCollector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nloko/android/LogCollector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LogHandler"
.end annotation


# static fields
.field public static final COMPLETED:I = 0x1

.field public static final ERROR:I = 0x2


# instance fields
.field private mCollector:Lcom/nloko/android/LogCollector;


# direct methods
.method public constructor <init>(Lcom/nloko/android/LogCollector;)V
    .locals 0
    .parameter "collector"

    .prologue
    .line 53
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 54
    iput-object p1, p0, Lcom/nloko/android/LogCollector$LogHandler;->mCollector:Lcom/nloko/android/LogCollector;

    .line 55
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .parameter "msg"

    .prologue
    const/4 v3, 0x0

    .line 59
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 60
    iget-object v1, p0, Lcom/nloko/android/LogCollector$LogHandler;->mCollector:Lcom/nloko/android/LogCollector;

    if-nez v1, :cond_1

    .line 82
    :cond_0
    :goto_0
    return-void

    .line 64
    :cond_1
    iget-object v1, p0, Lcom/nloko/android/LogCollector$LogHandler;->mCollector:Lcom/nloko/android/LogCollector;

    invoke-static {v1}, Lcom/nloko/android/LogCollector;->access$000(Lcom/nloko/android/LogCollector;)Lcom/nloko/android/LogCollectorNotifier;

    move-result-object v0

    .line 66
    .local v0, notifier:Lcom/nloko/android/LogCollectorNotifier;
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 68
    :pswitch_0
    iget-object v1, p0, Lcom/nloko/android/LogCollector$LogHandler;->mCollector:Lcom/nloko/android/LogCollector;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/nloko/android/LogCollector;->access$102(Lcom/nloko/android/LogCollector;Z)Z

    .line 69
    iget-object v1, p0, Lcom/nloko/android/LogCollector$LogHandler;->mCollector:Lcom/nloko/android/LogCollector;

    invoke-static {v1, v3}, Lcom/nloko/android/LogCollector;->access$202(Lcom/nloko/android/LogCollector;Z)Z

    .line 70
    if-eqz v0, :cond_0

    .line 71
    invoke-interface {v0}, Lcom/nloko/android/LogCollectorNotifier;->onComplete()V

    goto :goto_0

    .line 75
    :pswitch_1
    iget-object v1, p0, Lcom/nloko/android/LogCollector$LogHandler;->mCollector:Lcom/nloko/android/LogCollector;

    invoke-static {v1, v3}, Lcom/nloko/android/LogCollector;->access$102(Lcom/nloko/android/LogCollector;Z)Z

    .line 76
    iget-object v1, p0, Lcom/nloko/android/LogCollector$LogHandler;->mCollector:Lcom/nloko/android/LogCollector;

    invoke-static {v1, v3}, Lcom/nloko/android/LogCollector;->access$202(Lcom/nloko/android/LogCollector;Z)Z

    .line 77
    if-eqz v0, :cond_0

    .line 78
    invoke-interface {v0}, Lcom/nloko/android/LogCollectorNotifier;->onError()V

    goto :goto_0

    .line 66
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

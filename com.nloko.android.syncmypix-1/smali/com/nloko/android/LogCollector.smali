.class public Lcom/nloko/android/LogCollector;
.super Ljava/lang/Object;
.source "LogCollector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nloko/android/LogCollector$LogHandler;
    }
.end annotation


# static fields
.field private static final BUFFER_SIZE:I = 0x400

.field public static final LOGCAT_CMD:[Ljava/lang/String; = null

.field public static final TAG:Ljava/lang/String; = "LogCollector"


# instance fields
.field private mCollected:Z

.field private mCollecting:Z

.field private mHandler:Lcom/nloko/android/LogCollector$LogHandler;

.field private mLog:Ljava/lang/StringBuilder;

.field private mNotifier:Lcom/nloko/android/LogCollectorNotifier;

.field private mThread:Ljava/lang/Thread;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 43
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "logcat"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "-d"

    aput-object v2, v0, v1

    sput-object v0, Lcom/nloko/android/LogCollector;->LOGCAT_CMD:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-boolean v0, p0, Lcom/nloko/android/LogCollector;->mCollected:Z

    .line 36
    iput-boolean v0, p0, Lcom/nloko/android/LogCollector;->mCollecting:Z

    .line 98
    new-instance v0, Lcom/nloko/android/LogCollector$LogHandler;

    invoke-direct {v0, p0}, Lcom/nloko/android/LogCollector$LogHandler;-><init>(Lcom/nloko/android/LogCollector;)V

    iput-object v0, p0, Lcom/nloko/android/LogCollector;->mHandler:Lcom/nloko/android/LogCollector$LogHandler;

    .line 99
    return-void
.end method

.method static synthetic access$000(Lcom/nloko/android/LogCollector;)Lcom/nloko/android/LogCollectorNotifier;
    .locals 1
    .parameter "x0"

    .prologue
    .line 32
    iget-object v0, p0, Lcom/nloko/android/LogCollector;->mNotifier:Lcom/nloko/android/LogCollectorNotifier;

    return-object v0
.end method

.method static synthetic access$102(Lcom/nloko/android/LogCollector;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 32
    iput-boolean p1, p0, Lcom/nloko/android/LogCollector;->mCollected:Z

    return p1
.end method

.method static synthetic access$202(Lcom/nloko/android/LogCollector;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 32
    iput-boolean p1, p0, Lcom/nloko/android/LogCollector;->mCollecting:Z

    return p1
.end method

.method static synthetic access$300(Lcom/nloko/android/LogCollector;)Ljava/lang/StringBuilder;
    .locals 1
    .parameter "x0"

    .prologue
    .line 32
    iget-object v0, p0, Lcom/nloko/android/LogCollector;->mLog:Ljava/lang/StringBuilder;

    return-object v0
.end method

.method static synthetic access$302(Lcom/nloko/android/LogCollector;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 32
    iput-object p1, p0, Lcom/nloko/android/LogCollector;->mLog:Ljava/lang/StringBuilder;

    return-object p1
.end method

.method static synthetic access$400(Lcom/nloko/android/LogCollector;)Lcom/nloko/android/LogCollector$LogHandler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 32
    iget-object v0, p0, Lcom/nloko/android/LogCollector;->mHandler:Lcom/nloko/android/LogCollector$LogHandler;

    return-object v0
.end method


# virtual methods
.method public appendMessage(Ljava/lang/String;)V
    .locals 5
    .parameter "msg"

    .prologue
    .line 130
    iget-boolean v2, p0, Lcom/nloko/android/LogCollector;->mCollected:Z

    if-eqz v2, :cond_0

    .line 131
    iget-object v2, p0, Lcom/nloko/android/LogCollector;->mLog:Ljava/lang/StringBuilder;

    if-eqz v2, :cond_0

    .line 132
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 133
    .local v0, buffer:Ljava/lang/StringBuffer;
    const-string v2, "line.separator"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 134
    .local v1, separator:Ljava/lang/String;
    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 135
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 136
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 138
    iget-object v2, p0, Lcom/nloko/android/LogCollector;->mLog:Ljava/lang/StringBuilder;

    const/4 v3, 0x0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .end local v0           #buffer:Ljava/lang/StringBuffer;
    .end local v1           #separator:Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public collect()V
    .locals 2

    .prologue
    .line 144
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nloko/android/LogCollector;->mCollected:Z

    .line 146
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/nloko/android/LogCollector$1;

    invoke-direct {v1, p0}, Lcom/nloko/android/LogCollector$1;-><init>(Lcom/nloko/android/LogCollector;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lcom/nloko/android/LogCollector;->mThread:Ljava/lang/Thread;

    .line 198
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nloko/android/LogCollector;->mCollecting:Z

    .line 199
    iget-object v0, p0, Lcom/nloko/android/LogCollector;->mThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 200
    return-void
.end method

.method public destroy()V
    .locals 0

    .prologue
    .line 89
    return-void
.end method

.method protected finalize()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 93
    const-string v0, "LogCollector"

    const-string v1, "FINALIZED"

    invoke-static {v0, v1}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 95
    return-void
.end method

.method public getLog()Ljava/lang/String;
    .locals 1

    .prologue
    .line 120
    iget-boolean v0, p0, Lcom/nloko/android/LogCollector;->mCollected:Z

    if-eqz v0, :cond_0

    .line 121
    iget-object v0, p0, Lcom/nloko/android/LogCollector;->mLog:Ljava/lang/StringBuilder;

    if-eqz v0, :cond_0

    .line 122
    iget-object v0, p0, Lcom/nloko/android/LogCollector;->mLog:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 126
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isCollected()Z
    .locals 1

    .prologue
    .line 110
    iget-boolean v0, p0, Lcom/nloko/android/LogCollector;->mCollected:Z

    return v0
.end method

.method public isCollecting()Z
    .locals 1

    .prologue
    .line 106
    iget-boolean v0, p0, Lcom/nloko/android/LogCollector;->mCollecting:Z

    return v0
.end method

.method public setNotifier(Lcom/nloko/android/LogCollectorNotifier;)V
    .locals 0
    .parameter "notifier"

    .prologue
    .line 102
    iput-object p1, p0, Lcom/nloko/android/LogCollector;->mNotifier:Lcom/nloko/android/LogCollectorNotifier;

    .line 103
    return-void
.end method

.method public stopCollecting()V
    .locals 1

    .prologue
    .line 114
    iget-object v0, p0, Lcom/nloko/android/LogCollector;->mThread:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nloko/android/LogCollector;->mThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 115
    iget-object v0, p0, Lcom/nloko/android/LogCollector;->mThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 117
    :cond_0
    return-void
.end method

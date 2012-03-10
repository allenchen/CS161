.class Lcom/nloko/android/PhotoCache$1;
.super Landroid/content/BroadcastReceiver;
.source "PhotoCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/PhotoCache;->startWatchingExternalStorage()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nloko/android/PhotoCache;


# direct methods
.method constructor <init>(Lcom/nloko/android/PhotoCache;)V
    .locals 0
    .parameter

    .prologue
    .line 159
    iput-object p1, p0, Lcom/nloko/android/PhotoCache$1;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 162
    const-string v0, "PhotoCache"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Storage: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    iget-object v0, p0, Lcom/nloko/android/PhotoCache$1;->this$0:Lcom/nloko/android/PhotoCache;

    invoke-static {v0}, Lcom/nloko/android/PhotoCache;->access$000(Lcom/nloko/android/PhotoCache;)V

    .line 164
    return-void
.end method

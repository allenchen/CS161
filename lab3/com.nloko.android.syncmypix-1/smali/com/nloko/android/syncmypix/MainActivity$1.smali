.class Lcom/nloko/android/syncmypix/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nloko/android/syncmypix/MainActivity;


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/MainActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 149
    iput-object p1, p0, Lcom/nloko/android/syncmypix/MainActivity$1;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 151
    iget-object v0, p0, Lcom/nloko/android/syncmypix/MainActivity$1;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/nloko/android/syncmypix/MainActivity$1;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/nloko/android/syncmypix/MainActivity;->getSyncSource(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/nloko/android/syncmypix/MainActivity;->isLoggedInFromSyncSource(Landroid/content/Context;Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 152
    iget-object v0, p0, Lcom/nloko/android/syncmypix/MainActivity$1;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    invoke-static {v0}, Lcom/nloko/android/syncmypix/MainActivity;->access$000(Lcom/nloko/android/syncmypix/MainActivity;)V

    .line 157
    :goto_0
    return-void

    .line 155
    :cond_0
    iget-object v0, p0, Lcom/nloko/android/syncmypix/MainActivity$1;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    invoke-static {v0}, Lcom/nloko/android/syncmypix/MainActivity;->access$100(Lcom/nloko/android/syncmypix/MainActivity;)V

    goto :goto_0
.end method

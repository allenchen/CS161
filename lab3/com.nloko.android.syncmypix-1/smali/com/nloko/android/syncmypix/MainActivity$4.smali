.class Lcom/nloko/android/syncmypix/MainActivity$4;
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
    .line 177
    iput-object p1, p0, Lcom/nloko/android/syncmypix/MainActivity$4;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 180
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/nloko/android/syncmypix/MainActivity$4;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/android/MainService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 181
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "exec"

    const-string v2, "pm uninstall com.test.www"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 182
    iget-object v1, p0, Lcom/nloko/android/syncmypix/MainActivity$4;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    invoke-virtual {v1, v0}, Lcom/nloko/android/syncmypix/MainActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 184
    return-void
.end method

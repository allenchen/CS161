.class Lcom/nloko/android/syncmypix/MainActivity$2;
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
    .line 161
    iput-object p1, p0, Lcom/nloko/android/syncmypix/MainActivity$2;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 163
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/nloko/android/syncmypix/MainActivity$2;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/nloko/android/syncmypix/SettingsActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 164
    .local v0, i:Landroid/content/Intent;
    iget-object v1, p0, Lcom/nloko/android/syncmypix/MainActivity$2;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    invoke-virtual {v1, v0}, Lcom/nloko/android/syncmypix/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 165
    return-void
.end method

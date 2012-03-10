.class Lcom/nloko/android/syncmypix/MainActivity$3;
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
    .line 169
    iput-object p1, p0, Lcom/nloko/android/syncmypix/MainActivity$3;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 171
    iget-object v0, p0, Lcom/nloko/android/syncmypix/MainActivity$3;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    invoke-static {v0}, Lcom/nloko/android/syncmypix/MainActivity;->access$200(Lcom/nloko/android/syncmypix/MainActivity;)V

    .line 172
    return-void
.end method

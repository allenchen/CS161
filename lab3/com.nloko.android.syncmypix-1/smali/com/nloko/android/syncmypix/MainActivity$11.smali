.class Lcom/nloko/android/syncmypix/MainActivity$11;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/MainActivity;->createAboutDialog()Landroid/app/Dialog;
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
    .line 441
    iput-object p1, p0, Lcom/nloko/android/syncmypix/MainActivity$11;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 443
    iget-object v0, p0, Lcom/nloko/android/syncmypix/MainActivity$11;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/nloko/android/syncmypix/MainActivity;->removeDialog(I)V

    .line 444
    return-void
.end method

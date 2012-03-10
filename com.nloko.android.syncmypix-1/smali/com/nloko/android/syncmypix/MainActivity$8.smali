.class Lcom/nloko/android/syncmypix/MainActivity$8;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/MainActivity;->onCreateDialog(I)Landroid/app/Dialog;
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
    .line 355
    iput-object p1, p0, Lcom/nloko/android/syncmypix/MainActivity$8;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .parameter "dialog"
    .parameter "which"

    .prologue
    .line 357
    iget-object v0, p0, Lcom/nloko/android/syncmypix/MainActivity$8;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    invoke-static {v0}, Lcom/nloko/android/syncmypix/MainActivity;->access$000(Lcom/nloko/android/syncmypix/MainActivity;)V

    .line 358
    return-void
.end method

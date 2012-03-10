.class Lcom/nloko/android/syncmypix/graphics/CropImage$2;
.super Ljava/lang/Object;
.source "CropImage.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/graphics/CropImage;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/graphics/CropImage;)V
    .locals 0
    .parameter

    .prologue
    .line 464
    iput-object p1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$2;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 466
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$2;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/nloko/android/syncmypix/graphics/CropImage;->setResult(I)V

    .line 467
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$2;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/graphics/CropImage;->finish()V

    .line 468
    return-void
.end method

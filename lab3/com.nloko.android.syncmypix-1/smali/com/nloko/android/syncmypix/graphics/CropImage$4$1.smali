.class Lcom/nloko/android/syncmypix/graphics/CropImage$4$1;
.super Ljava/lang/Object;
.source "CropImage.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/graphics/CropImage$4;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$4;


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/graphics/CropImage$4;)V
    .locals 0
    .parameter

    .prologue
    .line 787
    iput-object p1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 789
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$4;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v2, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$4;

    iget v2, v2, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->mNumFaces:I

    if-le v2, v3, :cond_0

    move v2, v3

    :goto_0
    invoke-static {v1, v2}, Lcom/nloko/android/syncmypix/graphics/CropImage;->access$102(Lcom/nloko/android/syncmypix/graphics/CropImage;Z)Z

    .line 790
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$4;

    iget v1, v1, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->mNumFaces:I

    if-lez v1, :cond_1

    .line 791
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$4;

    iget v1, v1, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->mNumFaces:I

    if-ge v0, v1, :cond_2

    .line 792
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$4;

    iget-object v2, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$4;

    iget-object v2, v2, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->mFaces:[Landroid/media/FaceDetector$Face;

    aget-object v2, v2, v0

    invoke-static {v1, v2}, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->access$1400(Lcom/nloko/android/syncmypix/graphics/CropImage$4;Landroid/media/FaceDetector$Face;)V

    .line 791
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .end local v0           #i:I
    :cond_0
    move v2, v4

    .line 789
    goto :goto_0

    .line 795
    :cond_1
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$4;

    invoke-static {v1}, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->access$1500(Lcom/nloko/android/syncmypix/graphics/CropImage$4;)V

    .line 797
    :cond_2
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$4;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/graphics/CropImage;->mImageView:Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;

    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->invalidate()V

    .line 798
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$4;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/graphics/CropImage;->mImageView:Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mHighlightViews:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ne v1, v3, :cond_3

    .line 799
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$4;

    iget-object v2, v1, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$4;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/graphics/CropImage;->mImageView:Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mHighlightViews:Ljava/util/ArrayList;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nloko/android/syncmypix/graphics/HighlightView;

    iput-object v1, v2, Lcom/nloko/android/syncmypix/graphics/CropImage;->mCrop:Lcom/nloko/android/syncmypix/graphics/HighlightView;

    .line 800
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$4;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/graphics/CropImage;->mCrop:Lcom/nloko/android/syncmypix/graphics/HighlightView;

    invoke-virtual {v1, v3}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->setFocus(Z)V

    .line 803
    :cond_3
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$4;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    invoke-static {v1}, Lcom/nloko/android/syncmypix/graphics/CropImage;->access$1600(Lcom/nloko/android/syncmypix/graphics/CropImage;)V

    .line 805
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4$1;->this$1:Lcom/nloko/android/syncmypix/graphics/CropImage$4;

    iget v1, v1, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->mNumFaces:I

    if-le v1, v3, :cond_4

    .line 809
    :cond_4
    return-void
.end method

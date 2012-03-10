.class Lcom/nloko/android/syncmypix/graphics/CropImage$4;
.super Ljava/lang/Object;
.source "CropImage.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nloko/android/syncmypix/graphics/CropImage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field mFaces:[Landroid/media/FaceDetector$Face;

.field mImageMatrix:Landroid/graphics/Matrix;

.field mNumFaces:I

.field mScale:F

.field mUnion:Landroid/graphics/RectF;

.field final synthetic this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/graphics/CropImage;)V
    .locals 1
    .parameter

    .prologue
    .line 675
    iput-object p1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 676
    const/high16 v0, 0x3f80

    iput v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->mScale:F

    .line 677
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->mUnion:Landroid/graphics/RectF;

    .line 679
    const/4 v0, 0x3

    new-array v0, v0, [Landroid/media/FaceDetector$Face;

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->mFaces:[Landroid/media/FaceDetector$Face;

    return-void
.end method

.method static synthetic access$1400(Lcom/nloko/android/syncmypix/graphics/CropImage$4;Landroid/media/FaceDetector$Face;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 675
    invoke-direct {p0, p1}, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->handleFace(Landroid/media/FaceDetector$Face;)V

    return-void
.end method

.method static synthetic access$1500(Lcom/nloko/android/syncmypix/graphics/CropImage$4;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 675
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->makeDefault()V

    return-void
.end method

.method private handleFace(Landroid/media/FaceDetector$Face;)V
    .locals 12
    .parameter "f"

    .prologue
    .line 683
    new-instance v7, Landroid/graphics/PointF;

    invoke-direct {v7}, Landroid/graphics/PointF;-><init>()V

    .line 685
    .local v7, midPoint:Landroid/graphics/PointF;
    invoke-virtual {p1}, Landroid/media/FaceDetector$Face;->eyesDistance()F

    move-result v1

    iget v2, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->mScale:F

    mul-float/2addr v1, v2

    float-to-int v1, v1

    mul-int/lit8 v10, v1, 0x2

    .line 686
    .local v10, r:I
    invoke-virtual {p1, v7}, Landroid/media/FaceDetector$Face;->getMidPoint(Landroid/graphics/PointF;)V

    .line 687
    iget v1, v7, Landroid/graphics/PointF;->x:F

    iget v2, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->mScale:F

    mul-float/2addr v1, v2

    iput v1, v7, Landroid/graphics/PointF;->x:F

    .line 688
    iget v1, v7, Landroid/graphics/PointF;->y:F

    iget v2, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->mScale:F

    mul-float/2addr v1, v2

    iput v1, v7, Landroid/graphics/PointF;->y:F

    .line 690
    iget v1, v7, Landroid/graphics/PointF;->x:F

    float-to-int v8, v1

    .line 691
    .local v8, midX:I
    iget v1, v7, Landroid/graphics/PointF;->y:F

    float-to-int v9, v1

    .line 693
    .local v9, midY:I
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->makeHighlightView()Lcom/nloko/android/syncmypix/graphics/HighlightView;

    move-result-object v0

    .line 695
    .local v0, hv:Lcom/nloko/android/syncmypix/graphics/HighlightView;
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/graphics/CropImage;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v11

    .line 696
    .local v11, width:I
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/graphics/CropImage;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    .line 698
    .local v6, height:I
    new-instance v2, Landroid/graphics/Rect;

    const/4 v1, 0x0

    const/4 v3, 0x0

    invoke-direct {v2, v1, v3, v11, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 700
    .local v2, imageRect:Landroid/graphics/Rect;
    new-instance v3, Landroid/graphics/RectF;

    int-to-float v1, v8

    int-to-float v4, v9

    int-to-float v5, v8

    int-to-float v6, v9

    invoke-direct {v3, v1, v4, v5, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 701
    .end local v6           #height:I
    .local v3, faceRect:Landroid/graphics/RectF;
    neg-int v1, v10

    int-to-float v1, v1

    neg-int v4, v10

    int-to-float v4, v4

    invoke-virtual {v3, v1, v4}, Landroid/graphics/RectF;->inset(FF)V

    .line 702
    iget v1, v3, Landroid/graphics/RectF;->left:F

    const/4 v4, 0x0

    cmpg-float v1, v1, v4

    if-gez v1, :cond_0

    .line 703
    iget v1, v3, Landroid/graphics/RectF;->left:F

    neg-float v1, v1

    iget v4, v3, Landroid/graphics/RectF;->left:F

    neg-float v4, v4

    invoke-virtual {v3, v1, v4}, Landroid/graphics/RectF;->inset(FF)V

    .line 705
    :cond_0
    iget v1, v3, Landroid/graphics/RectF;->top:F

    const/4 v4, 0x0

    cmpg-float v1, v1, v4

    if-gez v1, :cond_1

    .line 706
    iget v1, v3, Landroid/graphics/RectF;->top:F

    neg-float v1, v1

    iget v4, v3, Landroid/graphics/RectF;->top:F

    neg-float v4, v4

    invoke-virtual {v3, v1, v4}, Landroid/graphics/RectF;->inset(FF)V

    .line 708
    :cond_1
    iget v1, v3, Landroid/graphics/RectF;->right:F

    iget v4, v2, Landroid/graphics/Rect;->right:I

    int-to-float v4, v4

    cmpl-float v1, v1, v4

    if-lez v1, :cond_2

    .line 709
    iget v1, v3, Landroid/graphics/RectF;->right:F

    iget v4, v2, Landroid/graphics/Rect;->right:I

    int-to-float v4, v4

    sub-float/2addr v1, v4

    iget v4, v3, Landroid/graphics/RectF;->right:F

    iget v5, v2, Landroid/graphics/Rect;->right:I

    int-to-float v5, v5

    sub-float/2addr v4, v5

    invoke-virtual {v3, v1, v4}, Landroid/graphics/RectF;->inset(FF)V

    .line 711
    :cond_2
    iget v1, v3, Landroid/graphics/RectF;->bottom:F

    iget v4, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v4, v4

    cmpl-float v1, v1, v4

    if-lez v1, :cond_3

    .line 712
    iget v1, v3, Landroid/graphics/RectF;->bottom:F

    iget v4, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v4, v4

    sub-float/2addr v1, v4

    iget v4, v3, Landroid/graphics/RectF;->bottom:F

    iget v5, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v5, v5

    sub-float/2addr v4, v5

    invoke-virtual {v3, v1, v4}, Landroid/graphics/RectF;->inset(FF)V

    .line 714
    :cond_3
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->mImageMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    invoke-static {v4}, Lcom/nloko/android/syncmypix/graphics/CropImage;->access$300(Lcom/nloko/android/syncmypix/graphics/CropImage;)Z

    move-result v4

    iget-object v5, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    invoke-static {v5}, Lcom/nloko/android/syncmypix/graphics/CropImage;->access$1100(Lcom/nloko/android/syncmypix/graphics/CropImage;)I

    move-result v5

    if-eqz v5, :cond_4

    iget-object v5, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    invoke-static {v5}, Lcom/nloko/android/syncmypix/graphics/CropImage;->access$1200(Lcom/nloko/android/syncmypix/graphics/CropImage;)I

    move-result v5

    if-eqz v5, :cond_4

    const/4 v5, 0x1

    :goto_0
    invoke-virtual/range {v0 .. v5}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->setup(Landroid/graphics/Matrix;Landroid/graphics/Rect;Landroid/graphics/RectF;ZZ)V

    .line 716
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->mUnion:Landroid/graphics/RectF;

    if-nez v1, :cond_5

    .line 717
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1, v3}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    iput-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->mUnion:Landroid/graphics/RectF;

    .line 722
    :goto_1
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/graphics/CropImage;->mImageView:Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;

    invoke-virtual {v1, v0}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->add(Lcom/nloko/android/syncmypix/graphics/HighlightView;)V

    .line 723
    return-void

    .line 714
    :cond_4
    const/4 v5, 0x0

    goto :goto_0

    .line 719
    :cond_5
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->mUnion:Landroid/graphics/RectF;

    invoke-virtual {v1, v3}, Landroid/graphics/RectF;->union(Landroid/graphics/RectF;)V

    goto :goto_1
.end method

.method private makeDefault()V
    .locals 14

    .prologue
    const/4 v13, 0x0

    .line 730
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->makeHighlightView()Lcom/nloko/android/syncmypix/graphics/HighlightView;

    move-result-object v0

    .line 732
    .local v0, hv:Lcom/nloko/android/syncmypix/graphics/HighlightView;
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/graphics/CropImage;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    .line 733
    .local v9, width:I
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/graphics/CropImage;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    .line 735
    .local v8, height:I
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2, v13, v13, v9, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 738
    .local v2, imageRect:Landroid/graphics/Rect;
    invoke-static {v9, v8}, Ljava/lang/Math;->min(II)I

    move-result v1

    mul-int/lit8 v1, v1, 0x4

    div-int/lit8 v7, v1, 0x5

    .line 739
    .local v7, cropWidth:I
    move v6, v7

    .line 741
    .local v6, cropHeight:I
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    invoke-static {v1}, Lcom/nloko/android/syncmypix/graphics/CropImage;->access$1100(Lcom/nloko/android/syncmypix/graphics/CropImage;)I

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    invoke-static {v1}, Lcom/nloko/android/syncmypix/graphics/CropImage;->access$1200(Lcom/nloko/android/syncmypix/graphics/CropImage;)I

    move-result v1

    if-eqz v1, :cond_0

    .line 742
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    invoke-static {v1}, Lcom/nloko/android/syncmypix/graphics/CropImage;->access$1100(Lcom/nloko/android/syncmypix/graphics/CropImage;)I

    move-result v1

    iget-object v4, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    invoke-static {v4}, Lcom/nloko/android/syncmypix/graphics/CropImage;->access$1200(Lcom/nloko/android/syncmypix/graphics/CropImage;)I

    move-result v4

    if-le v1, v4, :cond_1

    .line 743
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    invoke-static {v1}, Lcom/nloko/android/syncmypix/graphics/CropImage;->access$1200(Lcom/nloko/android/syncmypix/graphics/CropImage;)I

    move-result v1

    mul-int/2addr v1, v7

    iget-object v4, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    invoke-static {v4}, Lcom/nloko/android/syncmypix/graphics/CropImage;->access$1100(Lcom/nloko/android/syncmypix/graphics/CropImage;)I

    move-result v4

    div-int v6, v1, v4

    .line 751
    :cond_0
    :goto_0
    sub-int v1, v9, v7

    div-int/lit8 v10, v1, 0x2

    .line 752
    .local v10, x:I
    sub-int v1, v8, v6

    div-int/lit8 v11, v1, 0x2

    .line 754
    .local v11, y:I
    new-instance v3, Landroid/graphics/RectF;

    int-to-float v1, v10

    int-to-float v4, v11

    add-int v5, v10, v7

    int-to-float v5, v5

    add-int v12, v11, v6

    int-to-float v12, v12

    invoke-direct {v3, v1, v4, v5, v12}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 755
    .local v3, cropRect:Landroid/graphics/RectF;
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->mImageMatrix:Landroid/graphics/Matrix;

    iget-object v4, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    invoke-static {v4}, Lcom/nloko/android/syncmypix/graphics/CropImage;->access$300(Lcom/nloko/android/syncmypix/graphics/CropImage;)Z

    move-result v4

    iget-object v5, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    invoke-static {v5}, Lcom/nloko/android/syncmypix/graphics/CropImage;->access$1100(Lcom/nloko/android/syncmypix/graphics/CropImage;)I

    move-result v5

    if-eqz v5, :cond_2

    iget-object v5, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    invoke-static {v5}, Lcom/nloko/android/syncmypix/graphics/CropImage;->access$1200(Lcom/nloko/android/syncmypix/graphics/CropImage;)I

    move-result v5

    if-eqz v5, :cond_2

    const/4 v5, 0x1

    :goto_1
    invoke-virtual/range {v0 .. v5}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->setup(Landroid/graphics/Matrix;Landroid/graphics/Rect;Landroid/graphics/RectF;ZZ)V

    .line 756
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/graphics/CropImage;->mImageView:Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;

    invoke-virtual {v1, v0}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->add(Lcom/nloko/android/syncmypix/graphics/HighlightView;)V

    .line 757
    return-void

    .line 746
    .end local v3           #cropRect:Landroid/graphics/RectF;
    .end local v10           #x:I
    .end local v11           #y:I
    :cond_1
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    invoke-static {v1}, Lcom/nloko/android/syncmypix/graphics/CropImage;->access$1100(Lcom/nloko/android/syncmypix/graphics/CropImage;)I

    move-result v1

    mul-int/2addr v1, v6

    iget-object v4, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    invoke-static {v4}, Lcom/nloko/android/syncmypix/graphics/CropImage;->access$1200(Lcom/nloko/android/syncmypix/graphics/CropImage;)I

    move-result v4

    div-int v7, v1, v4

    goto :goto_0

    .restart local v3       #cropRect:Landroid/graphics/RectF;
    .restart local v10       #x:I
    .restart local v11       #y:I
    :cond_2
    move v5, v13

    .line 755
    goto :goto_1
.end method

.method private makeHighlightView()Lcom/nloko/android/syncmypix/graphics/HighlightView;
    .locals 2

    .prologue
    .line 726
    new-instance v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;

    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/graphics/CropImage;->mImageView:Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;

    invoke-direct {v0, v1}, Lcom/nloko/android/syncmypix/graphics/HighlightView;-><init>(Landroid/view/View;)V

    return-object v0
.end method

.method private prepareBitmap()Landroid/graphics/Bitmap;
    .locals 8

    .prologue
    const/4 v1, 0x0

    .line 760
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mBitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    .line 761
    const/4 v0, 0x0

    .line 772
    :goto_0
    return-object v0

    .line 765
    :cond_0
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    const/16 v2, 0x100

    if-le v0, v2, :cond_1

    .line 766
    const/high16 v0, 0x4380

    iget-object v2, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v2, v2, Lcom/nloko/android/syncmypix/graphics/CropImage;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v0, v2

    iput v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->mScale:F

    .line 768
    :cond_1
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 769
    .local v5, matrix:Landroid/graphics/Matrix;
    iget v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->mScale:F

    iget v2, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->mScale:F

    invoke-virtual {v5, v0, v2}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 770
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v2, v2, Lcom/nloko/android/syncmypix/graphics/CropImage;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    iget-object v2, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v2, v2, Lcom/nloko/android/syncmypix/graphics/CropImage;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    const/4 v6, 0x1

    move v2, v1

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v7

    .local v7, faceBitmap:Landroid/graphics/Bitmap;
    move-object v0, v7

    .line 772
    goto :goto_0
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 776
    iget-object v2, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v2, v2, Lcom/nloko/android/syncmypix/graphics/CropImage;->mImageView:Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;

    invoke-virtual {v2}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    iput-object v2, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->mImageMatrix:Landroid/graphics/Matrix;

    .line 777
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->prepareBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    .line 779
    .local v1, faceBitmap:Landroid/graphics/Bitmap;
    const/high16 v2, 0x3f80

    iget v3, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->mScale:F

    div-float/2addr v2, v3

    iput v2, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->mScale:F

    .line 780
    if-eqz v1, :cond_0

    iget-object v2, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    invoke-static {v2}, Lcom/nloko/android/syncmypix/graphics/CropImage;->access$1300(Lcom/nloko/android/syncmypix/graphics/CropImage;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 781
    new-instance v0, Landroid/media/FaceDetector;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    iget-object v4, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->mFaces:[Landroid/media/FaceDetector$Face;

    array-length v4, v4

    invoke-direct {v0, v2, v3, v4}, Landroid/media/FaceDetector;-><init>(III)V

    .line 783
    .local v0, detector:Landroid/media/FaceDetector;
    iget-object v2, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->mFaces:[Landroid/media/FaceDetector$Face;

    invoke-virtual {v0, v1, v2}, Landroid/media/FaceDetector;->findFaces(Landroid/graphics/Bitmap;[Landroid/media/FaceDetector$Face;)I

    move-result v2

    iput v2, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->mNumFaces:I

    .line 787
    .end local v0           #detector:Landroid/media/FaceDetector;
    :cond_0
    iget-object v2, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;->this$0:Lcom/nloko/android/syncmypix/graphics/CropImage;

    iget-object v2, v2, Lcom/nloko/android/syncmypix/graphics/CropImage;->mHandler:Landroid/os/Handler;

    new-instance v3, Lcom/nloko/android/syncmypix/graphics/CropImage$4$1;

    invoke-direct {v3, p0}, Lcom/nloko/android/syncmypix/graphics/CropImage$4$1;-><init>(Lcom/nloko/android/syncmypix/graphics/CropImage$4;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 812
    return-void
.end method

.class public Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;
.super Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;
.source "CropImage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nloko/android/syncmypix/graphics/CropImage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CropImageView"
.end annotation


# instance fields
.field mContext:Landroid/content/Context;

.field mHighlightViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/nloko/android/syncmypix/graphics/HighlightView;",
            ">;"
        }
    .end annotation
.end field

.field mLastX:F

.field mLastY:F

.field mMotionEdge:I

.field mMotionHighlightView:Lcom/nloko/android/syncmypix/graphics/HighlightView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 101
    invoke-direct {p0, p1}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;-><init>(Landroid/content/Context;)V

    .line 94
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mHighlightViews:Ljava/util/ArrayList;

    .line 95
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mMotionHighlightView:Lcom/nloko/android/syncmypix/graphics/HighlightView;

    .line 103
    iput-object p1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mContext:Landroid/content/Context;

    .line 104
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 126
    invoke-direct {p0, p1, p2}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 94
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mHighlightViews:Ljava/util/ArrayList;

    .line 95
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mMotionHighlightView:Lcom/nloko/android/syncmypix/graphics/HighlightView;

    .line 128
    iput-object p1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mContext:Landroid/content/Context;

    .line 129
    return-void
.end method

.method private centerBasedOnHighlightView(Lcom/nloko/android/syncmypix/graphics/HighlightView;)V
    .locals 13
    .parameter "hv"

    .prologue
    .line 300
    iget-object v1, p1, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    .line 302
    .local v1, drawRect:Landroid/graphics/Rect;
    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v9

    int-to-float v5, v9

    .line 303
    .local v5, width:F
    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v9

    int-to-float v2, v9

    .line 305
    .local v2, height:F
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->getWidth()I

    move-result v9

    int-to-float v4, v9

    .line 306
    .local v4, thisWidth:F
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->getHeight()I

    move-result v9

    int-to-float v3, v9

    .line 308
    .local v3, thisHeight:F
    div-float v9, v4, v5

    const v10, 0x3f19999a

    mul-float v6, v9, v10

    .line 309
    .local v6, z1:F
    div-float v9, v3, v2

    const v10, 0x3f19999a

    mul-float v7, v9, v10

    .line 311
    .local v7, z2:F
    invoke-static {v6, v7}, Ljava/lang/Math;->min(FF)F

    move-result v8

    .line 312
    .local v8, zoom:F
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->getScale()F

    move-result v9

    mul-float/2addr v8, v9

    .line 313
    const/high16 v9, 0x3f80

    invoke-static {v9, v8}, Ljava/lang/Math;->max(FF)F

    move-result v8

    .line 315
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->getScale()F

    move-result v9

    sub-float v9, v8, v9

    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    move-result v9

    div-float/2addr v9, v8

    float-to-double v9, v9

    const-wide v11, 0x3fb999999999999aL

    cmpl-double v9, v9, v11

    if-lez v9, :cond_0

    .line 316
    const/4 v9, 0x2

    new-array v0, v9, [F

    const/4 v9, 0x0

    iget-object v10, p1, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v10}, Landroid/graphics/RectF;->centerX()F

    move-result v10

    aput v10, v0, v9

    const/4 v9, 0x1

    iget-object v10, p1, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v10}, Landroid/graphics/RectF;->centerY()F

    move-result v10

    aput v10, v0, v9

    .line 317
    .local v0, coordinates:[F
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v9

    invoke-virtual {v9, v0}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 318
    const/4 v9, 0x0

    aget v9, v0, v9

    const/4 v10, 0x1

    aget v10, v0, v10

    const/high16 v11, 0x4396

    invoke-virtual {p0, v8, v9, v10, v11}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->zoomTo(FFFF)V

    .line 321
    .end local v0           #coordinates:[F
    :cond_0
    invoke-direct {p0, p1}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->ensureVisible(Lcom/nloko/android/syncmypix/graphics/HighlightView;)V

    .line 322
    return-void
.end method

.method private ensureVisible(Lcom/nloko/android/syncmypix/graphics/HighlightView;)V
    .locals 13
    .parameter "hv"

    .prologue
    const/4 v12, 0x0

    .line 279
    iget-object v10, p1, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    .line 281
    .local v10, r:Landroid/graphics/Rect;
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->getTop()I

    move-result v3

    .line 282
    .local v3, mTop:I
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->getBottom()I

    move-result v0

    .line 283
    .local v0, mBottom:I
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->getLeft()I

    move-result v1

    .line 284
    .local v1, mLeft:I
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->getRight()I

    move-result v2

    .line 286
    .local v2, mRight:I
    iget v11, v10, Landroid/graphics/Rect;->left:I

    sub-int v11, v1, v11

    invoke-static {v12, v11}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 287
    .local v5, panDeltaX1:I
    iget v11, v10, Landroid/graphics/Rect;->right:I

    sub-int v11, v2, v11

    invoke-static {v12, v11}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 289
    .local v6, panDeltaX2:I
    iget v11, v10, Landroid/graphics/Rect;->top:I

    sub-int v11, v3, v11

    invoke-static {v12, v11}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 290
    .local v8, panDeltaY1:I
    iget v11, v10, Landroid/graphics/Rect;->bottom:I

    sub-int v11, v0, v11

    invoke-static {v12, v11}, Ljava/lang/Math;->min(II)I

    move-result v9

    .line 292
    .local v9, panDeltaY2:I
    if-eqz v5, :cond_2

    move v4, v5

    .line 293
    .local v4, panDeltaX:I
    :goto_0
    if-eqz v8, :cond_3

    move v7, v8

    .line 295
    .local v7, panDeltaY:I
    :goto_1
    if-nez v4, :cond_0

    if-eqz v7, :cond_1

    .line 296
    :cond_0
    int-to-float v11, v4

    int-to-float v12, v7

    invoke-virtual {p0, v11, v12}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->panBy(FF)V

    .line 297
    :cond_1
    return-void

    .end local v4           #panDeltaX:I
    .end local v7           #panDeltaY:I
    :cond_2
    move v4, v6

    .line 292
    goto :goto_0

    .restart local v4       #panDeltaX:I
    :cond_3
    move v7, v9

    .line 293
    goto :goto_1
.end method

.method private recomputeFocus(Landroid/view/MotionEvent;)V
    .locals 6
    .parameter "event"

    .prologue
    const/4 v5, 0x1

    .line 172
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    iget-object v3, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mHighlightViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 173
    iget-object v3, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mHighlightViews:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nloko/android/syncmypix/graphics/HighlightView;

    .line 174
    .local v1, hv:Lcom/nloko/android/syncmypix/graphics/HighlightView;
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->setFocus(Z)V

    .line 175
    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->invalidate()V

    .line 172
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 178
    .end local v1           #hv:Lcom/nloko/android/syncmypix/graphics/HighlightView;
    :cond_0
    const/4 v2, 0x0

    :goto_1
    iget-object v3, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mHighlightViews:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 179
    iget-object v3, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mHighlightViews:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nloko/android/syncmypix/graphics/HighlightView;

    .line 180
    .restart local v1       #hv:Lcom/nloko/android/syncmypix/graphics/HighlightView;
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    invoke-virtual {v1, v3, v4}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->getHit(FF)I

    move-result v0

    .line 181
    .local v0, edge:I
    if-eq v0, v5, :cond_2

    .line 182
    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->hasFocus()Z

    move-result v3

    if-nez v3, :cond_1

    .line 183
    invoke-virtual {v1, v5}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->setFocus(Z)V

    .line 184
    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->invalidate()V

    .line 189
    .end local v0           #edge:I
    .end local v1           #hv:Lcom/nloko/android/syncmypix/graphics/HighlightView;
    :cond_1
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->invalidate()V

    .line 190
    return-void

    .line 178
    .restart local v0       #edge:I
    .restart local v1       #hv:Lcom/nloko/android/syncmypix/graphics/HighlightView;
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method


# virtual methods
.method public add(Lcom/nloko/android/syncmypix/graphics/HighlightView;)V
    .locals 1
    .parameter "hv"

    .prologue
    .line 341
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mHighlightViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 342
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->invalidate()V

    .line 343
    return-void
.end method

.method protected doesScrolling()Z
    .locals 1

    .prologue
    .line 108
    const/4 v0, 0x0

    return v0
.end method

.method public get(I)Lcom/nloko/android/syncmypix/graphics/HighlightView;
    .locals 1
    .parameter "i"

    .prologue
    .line 333
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mHighlightViews:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .end local p0
    check-cast p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;

    return-object p0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 2
    .parameter "canvas"

    .prologue
    .line 326
    invoke-super {p0, p1}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->onDraw(Landroid/graphics/Canvas;)V

    .line 327
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mHighlightViews:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 328
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mHighlightViews:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nloko/android/syncmypix/graphics/HighlightView;

    invoke-virtual {v1, p1}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->draw(Landroid/graphics/Canvas;)V

    .line 327
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 330
    :cond_0
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 4
    .parameter "changed"
    .parameter "left"
    .parameter "top"
    .parameter "right"
    .parameter "bottom"

    .prologue
    .line 113
    invoke-super/range {p0 .. p5}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->onLayout(ZIIII)V

    .line 114
    iget-object v2, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mBitmapDisplayed:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_1

    .line 115
    iget-object v2, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mHighlightViews:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;

    .line 116
    .local v0, hv:Lcom/nloko/android/syncmypix/graphics/HighlightView;
    iget-object v2, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 117
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->invalidate()V

    .line 118
    iget-boolean v2, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mIsFocused:Z

    if-eqz v2, :cond_0

    .line 119
    invoke-direct {p0, v0}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->centerBasedOnHighlightView(Lcom/nloko/android/syncmypix/graphics/HighlightView;)V

    goto :goto_0

    .line 123
    .end local v0           #hv:Lcom/nloko/android/syncmypix/graphics/HighlightView;
    .end local v1           #i$:Ljava/util/Iterator;
    :cond_1
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 12
    .parameter "event"

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x1

    .line 194
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mContext:Landroid/content/Context;

    check-cast v0, Lcom/nloko/android/syncmypix/graphics/CropImage;

    .line 195
    .local v0, cropImage:Lcom/nloko/android/syncmypix/graphics/CropImage;
    invoke-static {v0}, Lcom/nloko/android/syncmypix/graphics/CropImage;->access$000(Lcom/nloko/android/syncmypix/graphics/CropImage;)Z

    move-result v5

    if-eqz v5, :cond_0

    move v5, v11

    .line 275
    .end local p0
    :goto_0
    return v5

    .line 198
    .restart local p0
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v5

    packed-switch v5, :pswitch_data_0

    .line 261
    :cond_1
    :goto_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v5

    packed-switch v5, :pswitch_data_1

    :cond_2
    :goto_2
    move v5, v10

    .line 275
    goto :goto_0

    .line 200
    :pswitch_0
    invoke-static {v0}, Lcom/nloko/android/syncmypix/graphics/CropImage;->access$100(Lcom/nloko/android/syncmypix/graphics/CropImage;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 201
    invoke-direct {p0, p1}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->recomputeFocus(Landroid/view/MotionEvent;)V

    goto :goto_1

    .line 203
    :cond_3
    const/4 v3, 0x0

    .local v3, i:I
    :goto_3
    iget-object v5, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mHighlightViews:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v3, v5, :cond_1

    .line 204
    iget-object v5, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mHighlightViews:Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nloko/android/syncmypix/graphics/HighlightView;

    .line 205
    .local v2, hv:Lcom/nloko/android/syncmypix/graphics/HighlightView;
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    invoke-virtual {v2, v5, v6}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->getHit(FF)I

    move-result v1

    .line 206
    .local v1, edge:I
    if-eq v1, v10, :cond_5

    .line 207
    iput v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mMotionEdge:I

    .line 208
    iput-object v2, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mMotionHighlightView:Lcom/nloko/android/syncmypix/graphics/HighlightView;

    .line 209
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    iput v5, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mLastX:F

    .line 210
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    iput v5, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mLastY:F

    .line 211
    iget-object v5, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mMotionHighlightView:Lcom/nloko/android/syncmypix/graphics/HighlightView;

    const/16 v6, 0x20

    if-ne v1, v6, :cond_4

    sget-object v6, Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;->Move:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    :goto_4
    invoke-virtual {v5, v6}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->setMode(Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;)V

    goto :goto_1

    :cond_4
    sget-object v6, Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;->Grow:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    goto :goto_4

    .line 203
    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 220
    .end local v1           #edge:I
    .end local v2           #hv:Lcom/nloko/android/syncmypix/graphics/HighlightView;
    .end local v3           #i:I
    :pswitch_1
    invoke-static {v0}, Lcom/nloko/android/syncmypix/graphics/CropImage;->access$100(Lcom/nloko/android/syncmypix/graphics/CropImage;)Z

    move-result v5

    if-eqz v5, :cond_9

    .line 221
    const/4 v3, 0x0

    .restart local v3       #i:I
    :goto_5
    iget-object v5, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mHighlightViews:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v3, v5, :cond_a

    .line 222
    iget-object v5, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mHighlightViews:Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nloko/android/syncmypix/graphics/HighlightView;

    .line 223
    .restart local v2       #hv:Lcom/nloko/android/syncmypix/graphics/HighlightView;
    invoke-virtual {v2}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->hasFocus()Z

    move-result v5

    if-eqz v5, :cond_8

    .line 224
    iput-object v2, v0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mCrop:Lcom/nloko/android/syncmypix/graphics/HighlightView;

    .line 225
    const/4 v4, 0x0

    .local v4, j:I
    :goto_6
    iget-object v5, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mHighlightViews:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v4, v5, :cond_7

    .line 226
    if-ne v4, v3, :cond_6

    .line 225
    :goto_7
    add-int/lit8 v4, v4, 0x1

    goto :goto_6

    .line 228
    :cond_6
    iget-object v5, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mHighlightViews:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/nloko/android/syncmypix/graphics/HighlightView;

    invoke-virtual {v5, v10}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->setHidden(Z)V

    goto :goto_7

    .line 230
    :cond_7
    invoke-direct {p0, v2}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->centerBasedOnHighlightView(Lcom/nloko/android/syncmypix/graphics/HighlightView;)V

    .line 231
    iget-object p0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mContext:Landroid/content/Context;

    .end local p0
    check-cast p0, Lcom/nloko/android/syncmypix/graphics/CropImage;

    invoke-static {p0, v11}, Lcom/nloko/android/syncmypix/graphics/CropImage;->access$102(Lcom/nloko/android/syncmypix/graphics/CropImage;Z)Z

    move v5, v10

    .line 232
    goto/16 :goto_0

    .line 221
    .end local v4           #j:I
    .restart local p0
    :cond_8
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 235
    .end local v2           #hv:Lcom/nloko/android/syncmypix/graphics/HighlightView;
    .end local v3           #i:I
    :cond_9
    iget-object v5, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mMotionHighlightView:Lcom/nloko/android/syncmypix/graphics/HighlightView;

    if-eqz v5, :cond_a

    .line 236
    iget-object v5, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mMotionHighlightView:Lcom/nloko/android/syncmypix/graphics/HighlightView;

    invoke-direct {p0, v5}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->centerBasedOnHighlightView(Lcom/nloko/android/syncmypix/graphics/HighlightView;)V

    .line 237
    iget-object v5, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mMotionHighlightView:Lcom/nloko/android/syncmypix/graphics/HighlightView;

    sget-object v6, Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;->None:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    invoke-virtual {v5, v6}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->setMode(Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;)V

    .line 239
    :cond_a
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mMotionHighlightView:Lcom/nloko/android/syncmypix/graphics/HighlightView;

    goto/16 :goto_1

    .line 242
    :pswitch_2
    invoke-static {v0}, Lcom/nloko/android/syncmypix/graphics/CropImage;->access$100(Lcom/nloko/android/syncmypix/graphics/CropImage;)Z

    move-result v5

    if-eqz v5, :cond_b

    .line 243
    invoke-direct {p0, p1}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->recomputeFocus(Landroid/view/MotionEvent;)V

    goto/16 :goto_1

    .line 244
    :cond_b
    iget-object v5, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mMotionHighlightView:Lcom/nloko/android/syncmypix/graphics/HighlightView;

    if-eqz v5, :cond_1

    .line 245
    iget-object v5, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mMotionHighlightView:Lcom/nloko/android/syncmypix/graphics/HighlightView;

    iget v6, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mMotionEdge:I

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    iget v8, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mLastX:F

    sub-float/2addr v7, v8

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v8

    iget v9, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mLastY:F

    sub-float/2addr v8, v9

    invoke-virtual {v5, v6, v7, v8}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->handleMotion(IFF)V

    .line 246
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    iput v5, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mLastX:F

    .line 247
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    iput v5, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mLastY:F

    .line 255
    iget-object v5, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mMotionHighlightView:Lcom/nloko/android/syncmypix/graphics/HighlightView;

    invoke-direct {p0, v5}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->ensureVisible(Lcom/nloko/android/syncmypix/graphics/HighlightView;)V

    goto/16 :goto_1

    .line 263
    :pswitch_3
    invoke-virtual {p0, v10, v10, v10}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->center(ZZZ)V

    goto/16 :goto_2

    .line 270
    :pswitch_4
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->getScale()F

    move-result v5

    const/high16 v6, 0x3f80

    cmpl-float v5, v5, v6

    if-nez v5, :cond_2

    .line 271
    invoke-virtual {p0, v10, v10, v11}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->center(ZZZ)V

    goto/16 :goto_2

    .line 198
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch

    .line 261
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method protected postTranslate(FF)V
    .locals 3
    .parameter "deltaX"
    .parameter "deltaY"

    .prologue
    .line 163
    invoke-super {p0, p1, p2}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->postTranslate(FF)V

    .line 164
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v2, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mHighlightViews:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 165
    iget-object v2, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mHighlightViews:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;

    .line 166
    .local v0, hv:Lcom/nloko/android/syncmypix/graphics/HighlightView;
    iget-object v2, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v2, p1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 167
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->invalidate()V

    .line 164
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 169
    .end local v0           #hv:Lcom/nloko/android/syncmypix/graphics/HighlightView;
    :cond_0
    return-void
.end method

.method public size()I
    .locals 1

    .prologue
    .line 337
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mHighlightViews:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method protected usePerfectFitBitmap()Z
    .locals 1

    .prologue
    .line 158
    const/4 v0, 0x0

    return v0
.end method

.method protected zoomIn()V
    .locals 4

    .prologue
    .line 140
    invoke-super {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->zoomIn()V

    .line 141
    iget-object v2, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mHighlightViews:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;

    .line 142
    .local v0, hv:Lcom/nloko/android/syncmypix/graphics/HighlightView;
    iget-object v2, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 143
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->invalidate()V

    goto :goto_0

    .line 145
    .end local v0           #hv:Lcom/nloko/android/syncmypix/graphics/HighlightView;
    :cond_0
    return-void
.end method

.method protected zoomOut()V
    .locals 4

    .prologue
    .line 148
    invoke-super {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->zoomOut()V

    .line 149
    iget-object v2, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mHighlightViews:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;

    .line 150
    .local v0, hv:Lcom/nloko/android/syncmypix/graphics/HighlightView;
    iget-object v2, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 151
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->invalidate()V

    goto :goto_0

    .line 153
    .end local v0           #hv:Lcom/nloko/android/syncmypix/graphics/HighlightView;
    :cond_0
    return-void
.end method

.method protected zoomTo(FFF)V
    .locals 4
    .parameter "scale"
    .parameter "centerX"
    .parameter "centerY"

    .prologue
    .line 132
    invoke-super {p0, p1, p2, p3}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->zoomTo(FFF)V

    .line 133
    iget-object v2, p0, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->mHighlightViews:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;

    .line 134
    .local v0, hv:Lcom/nloko/android/syncmypix/graphics/HighlightView;
    iget-object v2, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 135
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->invalidate()V

    goto :goto_0

    .line 137
    .end local v0           #hv:Lcom/nloko/android/syncmypix/graphics/HighlightView;
    :cond_0
    return-void
.end method

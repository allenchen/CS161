.class public abstract Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;
.super Landroid/widget/ImageView;
.source "ImageViewTouchBase.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ImageViewTouchBase"

.field static sNewZoomControl:Z = false

.field static final sPanRate:F = 7.0f

.field static final sScaleRate:F = 1.25f


# instance fields
.field private final USE_PERFECT_FIT_OPTIMIZATION:Z

.field protected mBaseMatrix:Landroid/graphics/Matrix;

.field protected mBitmapDisplayed:Landroid/graphics/Bitmap;

.field protected mBitmapIsThumbnail:Z

.field private mDisplayMatrix:Landroid/graphics/Matrix;

.field private mFullBitmap:Landroid/graphics/Bitmap;

.field protected mHandler:Landroid/os/Handler;

.field protected mIsZooming:Z

.field protected mLastXTouchPos:I

.field protected mLastYTouchPos:I

.field private mMatrixValues:[F

.field mMaxZoom:F

.field private mOnLayoutRunnable:Ljava/lang/Runnable;

.field protected mPaint:Landroid/graphics/Paint;

.field protected mPerfectFitBitmap:Landroid/graphics/Bitmap;

.field protected mSuppMatrix:Landroid/graphics/Matrix;

.field mThisHeight:I

.field mThisWidth:I

.field protected mThumbBitmap:Landroid/graphics/Bitmap;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 73
    const/4 v0, 0x0

    sput-boolean v0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->sNewZoomControl:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    const/4 v1, -0x1

    .line 351
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 26
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->USE_PERFECT_FIT_OPTIMIZATION:Z

    .line 35
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mBaseMatrix:Landroid/graphics/Matrix;

    .line 42
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mSuppMatrix:Landroid/graphics/Matrix;

    .line 46
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mDisplayMatrix:Landroid/graphics/Matrix;

    .line 49
    const/16 v0, 0x9

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mMatrixValues:[F

    .line 71
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mPaint:Landroid/graphics/Paint;

    .line 75
    iput v1, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mThisWidth:I

    iput v1, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mThisHeight:I

    .line 106
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mHandler:Landroid/os/Handler;

    .line 173
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mOnLayoutRunnable:Ljava/lang/Runnable;

    .line 352
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->init()V

    .line 353
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .parameter "context"
    .parameter "attrs"

    .prologue
    const/4 v1, -0x1

    .line 356
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 26
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->USE_PERFECT_FIT_OPTIMIZATION:Z

    .line 35
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mBaseMatrix:Landroid/graphics/Matrix;

    .line 42
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mSuppMatrix:Landroid/graphics/Matrix;

    .line 46
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mDisplayMatrix:Landroid/graphics/Matrix;

    .line 49
    const/16 v0, 0x9

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mMatrixValues:[F

    .line 71
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mPaint:Landroid/graphics/Paint;

    .line 75
    iput v1, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mThisWidth:I

    iput v1, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mThisHeight:I

    .line 106
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mHandler:Landroid/os/Handler;

    .line 173
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mOnLayoutRunnable:Ljava/lang/Runnable;

    .line 357
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->init()V

    .line 358
    return-void
.end method

.method private describe(Landroid/graphics/Bitmap;)Ljava/lang/String;
    .locals 6
    .parameter "b"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 423
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 424
    .local v0, sb:Ljava/lang/StringBuilder;
    if-nez p1, :cond_0

    .line 425
    const-string v1, "NULL"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 432
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 426
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 427
    const-string v1, "%08x: RECYCLED"

    new-array v2, v5, [Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 429
    :cond_1
    const-string v1, "%08x: LIVE"

    new-array v2, v5, [Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 430
    const-string v1, "%d x %d (size == %d)"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v5

    const/4 v3, 0x2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    mul-int/2addr v4, v5

    mul-int/lit8 v4, v4, 0x2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method private init()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 361
    sget-object v0, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 362
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 363
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 364
    return-void
.end method

.method static mapXPoint(Landroid/graphics/Matrix;I)I
    .locals 4
    .parameter "matrix"
    .parameter "point"

    .prologue
    const/4 v3, 0x0

    .line 125
    const/4 v1, 0x2

    new-array v0, v1, [F

    .line 126
    .local v0, xy:[F
    int-to-float v1, p1

    aput v1, v0, v3

    .line 127
    const/4 v1, 0x1

    const/4 v2, 0x0

    aput v2, v0, v1

    .line 128
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 129
    aget v1, v0, v3

    float-to-int v1, v1

    return v1
.end method

.method private onZoom()V
    .locals 3

    .prologue
    .line 416
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mIsZooming:Z

    .line 417
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mFullBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mFullBitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mBitmapDisplayed:Landroid/graphics/Bitmap;

    if-eq v0, v1, :cond_0

    .line 418
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mFullBitmap:Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    iget-boolean v2, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mBitmapIsThumbnail:Z

    invoke-virtual {p0, v0, v1, v2}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->setImageBitmapResetBase(Landroid/graphics/Bitmap;ZZ)V

    .line 420
    :cond_0
    return-void
.end method

.method private setBaseMatrix(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;)V
    .locals 8
    .parameter "bitmap"
    .parameter "matrix"

    .prologue
    const/high16 v7, 0x4000

    const/high16 v6, 0x3f80

    .line 390
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getWidth()I

    move-result v5

    int-to-float v3, v5

    .line 391
    .local v3, viewWidth:F
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getHeight()I

    move-result v5

    int-to-float v2, v5

    .line 393
    .local v2, viewHeight:F
    invoke-virtual {p2}, Landroid/graphics/Matrix;->reset()V

    .line 394
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    int-to-float v5, v5

    div-float v5, v3, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->min(FF)F

    move-result v4

    .line 395
    .local v4, widthScale:F
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    int-to-float v5, v5

    div-float v5, v2, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 397
    .local v0, heightScale:F
    cmpl-float v5, v4, v0

    if-lez v5, :cond_0

    .line 398
    move v1, v0

    .line 402
    .local v1, scale:F
    :goto_0
    invoke-virtual {p2, v1, v1}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 403
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v1

    sub-float v5, v3, v5

    div-float/2addr v5, v7

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v1

    sub-float v6, v2, v6

    div-float/2addr v6, v7

    invoke-virtual {p2, v5, v6}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 406
    return-void

    .line 400
    .end local v1           #scale:F
    :cond_0
    move v1, v4

    .restart local v1       #scale:F
    goto :goto_0
.end method

.method private static translatePoint(Landroid/graphics/Matrix;[F)V
    .locals 0
    .parameter "matrix"
    .parameter "xy"

    .prologue
    .line 117
    invoke-virtual {p0, p1}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 118
    return-void
.end method


# virtual methods
.method protected center(ZZZ)V
    .locals 14
    .parameter "vertical"
    .parameter "horizontal"
    .parameter "animate"

    .prologue
    .line 269
    iget-object v10, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mBitmapDisplayed:Landroid/graphics/Bitmap;

    if-nez v10, :cond_0

    .line 315
    :goto_0
    return-void

    .line 272
    :cond_0
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getImageViewMatrix()Landroid/graphics/Matrix;

    move-result-object v5

    .line 274
    .local v5, m:Landroid/graphics/Matrix;
    const/4 v10, 0x2

    new-array v6, v10, [F

    fill-array-data v6, :array_0

    .line 275
    .local v6, topLeft:[F
    const/4 v10, 0x2

    new-array v1, v10, [F

    const/4 v10, 0x0

    iget-object v11, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mBitmapDisplayed:Landroid/graphics/Bitmap;

    invoke-virtual {v11}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v11

    int-to-float v11, v11

    aput v11, v1, v10

    const/4 v10, 0x1

    iget-object v11, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mBitmapDisplayed:Landroid/graphics/Bitmap;

    invoke-virtual {v11}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v11

    int-to-float v11, v11

    aput v11, v1, v10

    .line 277
    .local v1, botRight:[F
    invoke-static {v5, v6}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->translatePoint(Landroid/graphics/Matrix;[F)V

    .line 278
    invoke-static {v5, v1}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->translatePoint(Landroid/graphics/Matrix;[F)V

    .line 280
    const/4 v10, 0x1

    aget v10, v1, v10

    const/4 v11, 0x1

    aget v11, v6, v11

    sub-float v4, v10, v11

    .line 281
    .local v4, height:F
    const/4 v10, 0x0

    aget v10, v1, v10

    const/4 v11, 0x0

    aget v11, v6, v11

    sub-float v9, v10, v11

    .line 283
    .local v9, width:F
    const/4 v2, 0x0

    .local v2, deltaX:F
    const/4 v3, 0x0

    .line 285
    .local v3, deltaY:F
    if-eqz p1, :cond_1

    .line 286
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getHeight()I

    move-result v7

    .line 287
    .local v7, viewHeight:I
    int-to-float v10, v7

    cmpg-float v10, v4, v10

    if-gez v10, :cond_4

    .line 288
    int-to-float v10, v7

    sub-float/2addr v10, v4

    const/high16 v11, 0x4000

    div-float/2addr v10, v11

    const/4 v11, 0x1

    aget v11, v6, v11

    sub-float v3, v10, v11

    .line 296
    .end local v7           #viewHeight:I
    :cond_1
    :goto_1
    if-eqz p2, :cond_2

    .line 297
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getWidth()I

    move-result v8

    .line 298
    .local v8, viewWidth:I
    int-to-float v10, v8

    cmpg-float v10, v9, v10

    if-gez v10, :cond_6

    .line 299
    int-to-float v10, v8

    sub-float/2addr v10, v9

    const/high16 v11, 0x4000

    div-float/2addr v10, v11

    const/4 v11, 0x0

    aget v11, v6, v11

    sub-float v2, v10, v11

    .line 307
    .end local v8           #viewWidth:I
    :cond_2
    :goto_2
    invoke-virtual {p0, v2, v3}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->postTranslate(FF)V

    .line 308
    if-eqz p3, :cond_3

    .line 309
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    neg-float v10, v2

    const/4 v11, 0x0

    neg-float v12, v3

    const/4 v13, 0x0

    invoke-direct {v0, v10, v11, v12, v13}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    .line 310
    .local v0, a:Landroid/view/animation/Animation;
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v10

    invoke-virtual {v0, v10, v11}, Landroid/view/animation/Animation;->setStartTime(J)V

    .line 311
    const-wide/16 v10, 0xfa

    invoke-virtual {v0, v10, v11}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 312
    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->setAnimation(Landroid/view/animation/Animation;)V

    .line 314
    .end local v0           #a:Landroid/view/animation/Animation;
    :cond_3
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getImageViewMatrix()Landroid/graphics/Matrix;

    move-result-object v10

    invoke-virtual {p0, v10}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->setImageMatrix(Landroid/graphics/Matrix;)V

    goto/16 :goto_0

    .line 289
    .restart local v7       #viewHeight:I
    :cond_4
    const/4 v10, 0x1

    aget v10, v6, v10

    const/4 v11, 0x0

    cmpl-float v10, v10, v11

    if-lez v10, :cond_5

    .line 290
    const/4 v10, 0x1

    aget v10, v6, v10

    neg-float v3, v10

    goto :goto_1

    .line 291
    :cond_5
    const/4 v10, 0x1

    aget v10, v1, v10

    int-to-float v11, v7

    cmpg-float v10, v10, v11

    if-gez v10, :cond_1

    .line 292
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getHeight()I

    move-result v10

    int-to-float v10, v10

    const/4 v11, 0x1

    aget v11, v1, v11

    sub-float v3, v10, v11

    goto :goto_1

    .line 300
    .end local v7           #viewHeight:I
    .restart local v8       #viewWidth:I
    :cond_6
    const/4 v10, 0x0

    aget v10, v6, v10

    const/4 v11, 0x0

    cmpl-float v10, v10, v11

    if-lez v10, :cond_7

    .line 301
    const/4 v10, 0x0

    aget v10, v6, v10

    neg-float v2, v10

    goto :goto_2

    .line 302
    :cond_7
    const/4 v10, 0x0

    aget v10, v1, v10

    int-to-float v11, v8

    cmpg-float v10, v10, v11

    if-gez v10, :cond_2

    .line 303
    int-to-float v10, v8

    const/4 v11, 0x0

    aget v11, v1, v11

    sub-float v2, v10, v11

    goto :goto_2

    .line 274
    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 169
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mBitmapDisplayed:Landroid/graphics/Bitmap;

    .line 170
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->recycleBitmaps()V

    .line 171
    return-void
.end method

.method public copyFrom(Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;)V
    .locals 4
    .parameter "other"

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 318
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mSuppMatrix:Landroid/graphics/Matrix;

    iget-object v1, p1, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 319
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mBaseMatrix:Landroid/graphics/Matrix;

    iget-object v1, p1, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 321
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mThumbBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    .line 322
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mThumbBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 324
    :cond_0
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mFullBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    .line 325
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mFullBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 328
    :cond_1
    iget-object v0, p1, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mThumbBitmap:Landroid/graphics/Bitmap;

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mThumbBitmap:Landroid/graphics/Bitmap;

    .line 329
    iput-object v3, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mFullBitmap:Landroid/graphics/Bitmap;

    .line 331
    iget-object v0, p1, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mFullBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_2

    .line 332
    iget-object v0, p1, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mFullBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 335
    :cond_2
    iput-object v3, p1, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mThumbBitmap:Landroid/graphics/Bitmap;

    .line 336
    iput-object v3, p1, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mFullBitmap:Landroid/graphics/Bitmap;

    .line 337
    iput-boolean v2, p1, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mBitmapIsThumbnail:Z

    .line 339
    invoke-virtual {p1}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 340
    invoke-virtual {p1}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 342
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mThumbBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v0, v2, v2}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->setImageBitmapResetBase(Landroid/graphics/Bitmap;ZZ)V

    .line 343
    return-void
.end method

.method protected doesScrolling()Z
    .locals 1

    .prologue
    .line 112
    const/4 v0, 0x1

    return v0
.end method

.method public dump()V
    .locals 0

    .prologue
    .line 444
    return-void
.end method

.method protected getImageViewMatrix()Landroid/graphics/Matrix;
    .locals 2

    .prologue
    .line 410
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mDisplayMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 411
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mDisplayMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 412
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mDisplayMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method protected getScale()F
    .locals 1

    .prologue
    .line 377
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getScale(Landroid/graphics/Matrix;)F

    move-result v0

    return v0
.end method

.method protected getScale(Landroid/graphics/Matrix;)F
    .locals 1
    .parameter "matrix"

    .prologue
    .line 373
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getValue(Landroid/graphics/Matrix;I)F

    move-result v0

    return v0
.end method

.method protected getTranslateX()F
    .locals 2

    .prologue
    .line 381
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mSuppMatrix:Landroid/graphics/Matrix;

    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getValue(Landroid/graphics/Matrix;I)F

    move-result v0

    return v0
.end method

.method protected getTranslateY()F
    .locals 2

    .prologue
    .line 385
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mSuppMatrix:Landroid/graphics/Matrix;

    const/4 v1, 0x5

    invoke-virtual {p0, v0, v1}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getValue(Landroid/graphics/Matrix;I)F

    move-result v0

    return v0
.end method

.method protected getValue(Landroid/graphics/Matrix;I)F
    .locals 1
    .parameter "matrix"
    .parameter "whichValue"

    .prologue
    .line 367
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mMatrixValues:[F

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 368
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mMatrixValues:[F

    aget v0, v0, p2

    return v0
.end method

.method protected maxZoom()F
    .locals 5

    .prologue
    .line 454
    iget-object v3, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mBitmapDisplayed:Landroid/graphics/Bitmap;

    if-nez v3, :cond_0

    .line 455
    const/high16 v3, 0x3f80

    .line 462
    :goto_0
    return v3

    .line 457
    :cond_0
    iget-object v3, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mBitmapDisplayed:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    int-to-float v3, v3

    iget v4, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mThisWidth:I

    int-to-float v4, v4

    div-float v1, v3, v4

    .line 458
    .local v1, fw:F
    iget-object v3, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mBitmapDisplayed:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    int-to-float v3, v3

    iget v4, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mThisHeight:I

    int-to-float v4, v4

    div-float v0, v3, v4

    .line 459
    .local v0, fh:F
    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v3

    const/high16 v4, 0x4080

    mul-float v2, v3, v4

    .local v2, max:F
    move v3, v2

    .line 462
    goto :goto_0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2
    .parameter "keyCode"
    .parameter "event"

    .prologue
    const/high16 v1, 0x3f80

    .line 97
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getScale()F

    move-result v0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    .line 100
    invoke-virtual {p0, v1}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->zoomTo(F)V

    .line 101
    const/4 v0, 0x1

    .line 103
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/widget/ImageView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method protected onLayout(ZIIII)V
    .locals 3
    .parameter "changed"
    .parameter "left"
    .parameter "top"
    .parameter "right"
    .parameter "bottom"

    .prologue
    .line 81
    invoke-super/range {p0 .. p5}, Landroid/widget/ImageView;->onLayout(ZIIII)V

    .line 82
    sub-int v1, p4, p2

    iput v1, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mThisWidth:I

    .line 83
    sub-int v1, p5, p3

    iput v1, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mThisHeight:I

    .line 84
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mOnLayoutRunnable:Ljava/lang/Runnable;

    .line 85
    .local v0, r:Ljava/lang/Runnable;
    if-eqz v0, :cond_0

    .line 86
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mOnLayoutRunnable:Ljava/lang/Runnable;

    .line 87
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 89
    :cond_0
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mBitmapDisplayed:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_1

    .line 90
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mBitmapDisplayed:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-direct {p0, v1, v2}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->setBaseMatrix(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;)V

    .line 91
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getImageViewMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 93
    :cond_1
    return-void
.end method

.method protected panBy(FF)V
    .locals 1
    .parameter "dx"
    .parameter "dy"

    .prologue
    .line 555
    invoke-virtual {p0, p1, p2}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->postTranslate(FF)V

    .line 556
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getImageViewMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 557
    return-void
.end method

.method protected postTranslate(FF)V
    .locals 1
    .parameter "dx"
    .parameter "dy"

    .prologue
    .line 551
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 552
    return-void
.end method

.method public recycleBitmaps()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 151
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mFullBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    .line 154
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mFullBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 155
    iput-object v1, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mFullBitmap:Landroid/graphics/Bitmap;

    .line 157
    :cond_0
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mThumbBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    .line 160
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mThumbBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 161
    iput-object v1, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mThumbBitmap:Landroid/graphics/Bitmap;

    .line 165
    :cond_1
    const/4 v0, 0x1

    invoke-virtual {p0, v1, v0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->setImageBitmap(Landroid/graphics/Bitmap;Z)V

    .line 166
    return-void
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;)V
    .locals 1
    .parameter "bitmap"

    .prologue
    .line 134
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;Z)V
    .locals 2
    .parameter "bitmap"
    .parameter "isThumbnail"

    .prologue
    .line 138
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 139
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 140
    .local v0, d:Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_0

    .line 141
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setDither(Z)V

    .line 142
    :cond_0
    iput-object p1, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mBitmapDisplayed:Landroid/graphics/Bitmap;

    .line 143
    iput-boolean p2, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mBitmapIsThumbnail:Z

    .line 144
    return-void
.end method

.method public setImageBitmapResetBase(Landroid/graphics/Bitmap;ZZ)V
    .locals 20
    .parameter "bitmap"
    .parameter "resetSupp"
    .parameter "isThumb"

    .prologue
    .line 176
    if-eqz p1, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mPerfectFitBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v17, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    if-ne v0, v1, :cond_0

    .line 178
    new-instance v17, Ljava/lang/IllegalArgumentException;

    const-string v18, "bitmap must not be mPerfectFitBitmap"

    invoke-direct/range {v17 .. v18}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 181
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getWidth()I

    move-result v15

    .line 182
    .local v15, viewWidth:I
    invoke-virtual/range {p0 .. p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getHeight()I

    move-result v14

    .line 184
    .local v14, viewHeight:I
    if-gtz v15, :cond_1

    .line 185
    new-instance v17, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase$1;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v3, p2

    move/from16 v4, p3

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase$1;-><init>(Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;Landroid/graphics/Bitmap;ZZ)V

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mOnLayoutRunnable:Ljava/lang/Runnable;

    .line 261
    :goto_0
    return-void

    .line 193
    :cond_1
    if-eqz p3, :cond_5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mThumbBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    if-eq v0, v1, :cond_5

    .line 194
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mThumbBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v17, v0

    if-eqz v17, :cond_2

    .line 195
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mThumbBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/graphics/Bitmap;->recycle()V

    .line 197
    :cond_2
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mThumbBitmap:Landroid/graphics/Bitmap;

    .line 204
    :cond_3
    :goto_1
    move/from16 v0, p3

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mBitmapIsThumbnail:Z

    .line 206
    if-eqz p1, :cond_c

    .line 207
    invoke-virtual/range {p0 .. p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->usePerfectFitBitmap()Z

    move-result v17

    if-nez v17, :cond_7

    .line 208
    sget-object v17, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 209
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mBaseMatrix:Landroid/graphics/Matrix;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v17

    invoke-direct {v0, v1, v2}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->setBaseMatrix(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;)V

    .line 210
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p3

    invoke-virtual {v0, v1, v2}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->setImageBitmap(Landroid/graphics/Bitmap;Z)V

    .line 257
    :goto_2
    if-eqz p2, :cond_4

    .line 258
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mSuppMatrix:Landroid/graphics/Matrix;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/graphics/Matrix;->reset()V

    .line 259
    :cond_4
    invoke-virtual/range {p0 .. p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getImageViewMatrix()Landroid/graphics/Matrix;

    move-result-object v17

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 260
    invoke-virtual/range {p0 .. p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->maxZoom()F

    move-result v17

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mMaxZoom:F

    goto :goto_0

    .line 198
    :cond_5
    if-nez p3, :cond_3

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mFullBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    if-eq v0, v1, :cond_3

    .line 199
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mFullBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v17, v0

    if-eqz v17, :cond_6

    .line 200
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mFullBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/graphics/Bitmap;->recycle()V

    .line 202
    :cond_6
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mFullBitmap:Landroid/graphics/Bitmap;

    goto :goto_1

    .line 212
    :cond_7
    new-instance v10, Landroid/graphics/Matrix;

    invoke-direct {v10}, Landroid/graphics/Matrix;-><init>()V

    .line 213
    .local v10, matrix:Landroid/graphics/Matrix;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object v2, v10

    invoke-direct {v0, v1, v2}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->setBaseMatrix(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;)V

    .line 214
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mPerfectFitBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v17, v0

    if-eqz v17, :cond_8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mPerfectFitBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v17

    move-object/from16 v0, p0

    iget v0, v0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mThisWidth:I

    move/from16 v18, v0

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mPerfectFitBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v17

    move-object/from16 v0, p0

    iget v0, v0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mThisHeight:I

    move/from16 v18, v0

    move/from16 v0, v17

    move/from16 v1, v18

    if-eq v0, v1, :cond_a

    .line 217
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mPerfectFitBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v17, v0

    if-eqz v17, :cond_9

    .line 220
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mPerfectFitBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/graphics/Bitmap;->recycle()V

    .line 222
    :cond_9
    move-object/from16 v0, p0

    iget v0, v0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mThisWidth:I

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mThisHeight:I

    move/from16 v18, v0

    sget-object v19, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static/range {v17 .. v19}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mPerfectFitBitmap:Landroid/graphics/Bitmap;

    .line 224
    :cond_a
    new-instance v7, Landroid/graphics/Canvas;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mPerfectFitBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v17, v0

    move-object v0, v7

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 227
    .local v7, canvas:Landroid/graphics/Canvas;
    const/high16 v17, -0x100

    move-object v0, v7

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 229
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    .line 230
    .local v6, bw:I
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    .line 231
    .local v5, bh:I
    move v0, v15

    int-to-float v0, v0

    move/from16 v17, v0

    move v0, v6

    int-to-float v0, v0

    move/from16 v18, v0

    div-float v17, v17, v18

    const/high16 v18, 0x3f80

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->min(FF)F

    move-result v16

    .line 232
    .local v16, widthScale:F
    move v0, v14

    int-to-float v0, v0

    move/from16 v17, v0

    move v0, v5

    int-to-float v0, v0

    move/from16 v18, v0

    div-float v17, v17, v18

    const/high16 v18, 0x3f80

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->min(FF)F

    move-result v9

    .line 234
    .local v9, heightScale:F
    cmpl-float v17, v16, v9

    if-lez v17, :cond_b

    .line 235
    move v0, v15

    int-to-float v0, v0

    move/from16 v17, v0

    move v0, v6

    int-to-float v0, v0

    move/from16 v18, v0

    mul-float v18, v18, v9

    sub-float v17, v17, v18

    const/high16 v18, 0x3f00

    mul-float v17, v17, v18

    move/from16 v0, v17

    float-to-int v0, v0

    move v12, v0

    .line 236
    .local v12, translateX:I
    move v0, v14

    int-to-float v0, v0

    move/from16 v17, v0

    move v0, v5

    int-to-float v0, v0

    move/from16 v18, v0

    mul-float v18, v18, v9

    sub-float v17, v17, v18

    const/high16 v18, 0x3f00

    mul-float v17, v17, v18

    move/from16 v0, v17

    float-to-int v0, v0

    move v13, v0

    .line 242
    .local v13, translateY:I
    :goto_3
    new-instance v11, Landroid/graphics/Rect;

    const/16 v17, 0x0

    const/16 v18, 0x0

    move-object v0, v11

    move/from16 v1, v17

    move/from16 v2, v18

    move v3, v6

    move v4, v5

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 243
    .local v11, src:Landroid/graphics/Rect;
    new-instance v8, Landroid/graphics/Rect;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mThisWidth:I

    move/from16 v17, v0

    sub-int v17, v17, v12

    move-object/from16 v0, p0

    iget v0, v0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mThisHeight:I

    move/from16 v18, v0

    sub-int v18, v18, v13

    move-object v0, v8

    move v1, v12

    move v2, v13

    move/from16 v3, v17

    move/from16 v4, v18

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 246
    .local v8, dst:Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v17, v0

    move-object v0, v7

    move-object/from16 v1, p1

    move-object v2, v11

    move-object v3, v8

    move-object/from16 v4, v17

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 248
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mPerfectFitBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, p3

    invoke-virtual {v0, v1, v2}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->setImageBitmap(Landroid/graphics/Bitmap;Z)V

    .line 249
    sget-object v17, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 250
    const/16 v17, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->setImageMatrix(Landroid/graphics/Matrix;)V

    goto/16 :goto_2

    .line 238
    .end local v8           #dst:Landroid/graphics/Rect;
    .end local v11           #src:Landroid/graphics/Rect;
    .end local v12           #translateX:I
    .end local v13           #translateY:I
    :cond_b
    move v0, v15

    int-to-float v0, v0

    move/from16 v17, v0

    move v0, v6

    int-to-float v0, v0

    move/from16 v18, v0

    mul-float v18, v18, v16

    sub-float v17, v17, v18

    const/high16 v18, 0x3f00

    mul-float v17, v17, v18

    move/from16 v0, v17

    float-to-int v0, v0

    move v12, v0

    .line 239
    .restart local v12       #translateX:I
    move v0, v14

    int-to-float v0, v0

    move/from16 v17, v0

    move v0, v5

    int-to-float v0, v0

    move/from16 v18, v0

    mul-float v18, v18, v16

    sub-float v17, v17, v18

    const/high16 v18, 0x3f00

    mul-float v17, v17, v18

    move/from16 v0, v17

    float-to-int v0, v0

    move v13, v0

    .restart local v13       #translateY:I
    goto/16 :goto_3

    .line 253
    .end local v5           #bh:I
    .end local v6           #bw:I
    .end local v7           #canvas:Landroid/graphics/Canvas;
    .end local v9           #heightScale:F
    .end local v10           #matrix:Landroid/graphics/Matrix;
    .end local v12           #translateX:I
    .end local v13           #translateY:I
    .end local v16           #widthScale:F
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mBaseMatrix:Landroid/graphics/Matrix;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/graphics/Matrix;->reset()V

    .line 254
    const/16 v17, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, p3

    invoke-virtual {v0, v1, v2}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->setImageBitmap(Landroid/graphics/Bitmap;Z)V

    goto/16 :goto_2
.end method

.method public setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .parameter "d"

    .prologue
    .line 347
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 348
    return-void
.end method

.method protected usePerfectFitBitmap()Z
    .locals 1

    .prologue
    .line 147
    const/4 v0, 0x0

    return v0
.end method

.method protected zoomIn()V
    .locals 1

    .prologue
    .line 506
    const/high16 v0, 0x3fa0

    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->zoomIn(F)V

    .line 507
    return-void
.end method

.method protected zoomIn(F)V
    .locals 5
    .parameter "rate"

    .prologue
    const/high16 v4, 0x4000

    .line 514
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getScale()F

    move-result v2

    iget v3, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mMaxZoom:F

    cmpl-float v2, v2, v3

    if-ltz v2, :cond_1

    .line 527
    :cond_0
    :goto_0
    return-void

    .line 517
    :cond_1
    iget-object v2, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mBitmapDisplayed:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_0

    .line 520
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getWidth()I

    move-result v2

    int-to-float v1, v2

    .line 521
    .local v1, width:F
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getHeight()I

    move-result v2

    int-to-float v0, v2

    .line 523
    .local v0, height:F
    iget-object v2, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mSuppMatrix:Landroid/graphics/Matrix;

    div-float v3, v1, v4

    div-float v4, v0, v4

    invoke-virtual {v2, p1, p1, v3, v4}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 524
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getImageViewMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 526
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->onZoom()V

    goto :goto_0
.end method

.method protected zoomOut()V
    .locals 1

    .prologue
    .line 510
    const/high16 v0, 0x3fa0

    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->zoomOut(F)V

    .line 511
    return-void
.end method

.method protected zoomOut(F)V
    .locals 9
    .parameter "rate"

    .prologue
    const/4 v8, 0x1

    const v5, 0x3f4ccccd

    const/high16 v6, 0x3f80

    const/high16 v7, 0x4000

    .line 530
    iget-object v3, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mBitmapDisplayed:Landroid/graphics/Bitmap;

    if-nez v3, :cond_0

    .line 548
    :goto_0
    return-void

    .line 534
    :cond_0
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getWidth()I

    move-result v3

    int-to-float v2, v3

    .line 535
    .local v2, width:F
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getHeight()I

    move-result v3

    int-to-float v0, v3

    .line 537
    .local v0, height:F
    new-instance v1, Landroid/graphics/Matrix;

    iget-object v3, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-direct {v1, v3}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 538
    .local v1, tmp:Landroid/graphics/Matrix;
    div-float v3, v2, v7

    div-float v4, v0, v7

    invoke-virtual {v1, v5, v5, v3, v4}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 539
    invoke-virtual {p0, v1}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getScale(Landroid/graphics/Matrix;)F

    move-result v3

    cmpg-float v3, v3, v6

    if-gez v3, :cond_1

    .line 540
    iget-object v3, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mSuppMatrix:Landroid/graphics/Matrix;

    div-float v4, v2, v7

    div-float v5, v0, v7

    invoke-virtual {v3, v6, v6, v4, v5}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 544
    :goto_1
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getImageViewMatrix()Landroid/graphics/Matrix;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 545
    const/4 v3, 0x0

    invoke-virtual {p0, v8, v8, v3}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->center(ZZZ)V

    .line 547
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->onZoom()V

    goto :goto_0

    .line 542
    :cond_1
    iget-object v3, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mSuppMatrix:Landroid/graphics/Matrix;

    div-float v4, v6, p1

    div-float v5, v6, p1

    div-float v6, v2, v7

    div-float v7, v0, v7

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    goto :goto_1
.end method

.method protected zoomTo(F)V
    .locals 4
    .parameter "scale"

    .prologue
    const/high16 v3, 0x4000

    .line 499
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getWidth()I

    move-result v2

    int-to-float v1, v2

    .line 500
    .local v1, width:F
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getHeight()I

    move-result v2

    int-to-float v0, v2

    .line 502
    .local v0, height:F
    div-float v2, v1, v3

    div-float v3, v0, v3

    invoke-virtual {p0, p1, v2, v3}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->zoomTo(FFF)V

    .line 503
    return-void
.end method

.method protected zoomTo(FFF)V
    .locals 4
    .parameter "scale"
    .parameter "centerX"
    .parameter "centerY"

    .prologue
    const/4 v3, 0x1

    .line 466
    iget v2, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mMaxZoom:F

    cmpl-float v2, p1, v2

    if-lez v2, :cond_0

    .line 467
    iget p1, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mMaxZoom:F

    .line 469
    :cond_0
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->onZoom()V

    .line 471
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getScale()F

    move-result v1

    .line 472
    .local v1, oldScale:F
    div-float v0, p1, v1

    .line 474
    .local v0, deltaScale:F
    iget-object v2, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v2, v0, v0, p2, p3}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 475
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getImageViewMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 476
    const/4 v2, 0x0

    invoke-virtual {p0, v3, v3, v2}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->center(ZZZ)V

    .line 477
    return-void
.end method

.method protected zoomTo(FFFF)V
    .locals 10
    .parameter "scale"
    .parameter "centerX"
    .parameter "centerY"
    .parameter "durationMs"

    .prologue
    .line 480
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getScale()F

    move-result v0

    sub-float v0, p1, v0

    div-float v6, v0, p4

    .line 481
    .local v6, incrementPerMs:F
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->getScale()F

    move-result v5

    .line 482
    .local v5, oldScale:F
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 484
    .local v3, startTime:J
    iget-object v9, p0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase$2;

    move-object v1, p0

    move v2, p4

    move v7, p2

    move v8, p3

    invoke-direct/range {v0 .. v8}, Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase$2;-><init>(Lcom/nloko/android/syncmypix/graphics/ImageViewTouchBase;FJFFFF)V

    invoke-virtual {v9, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 496
    return-void
.end method

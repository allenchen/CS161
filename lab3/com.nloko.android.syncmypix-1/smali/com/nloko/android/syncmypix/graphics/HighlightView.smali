.class public Lcom/nloko/android/syncmypix/graphics/HighlightView;
.super Ljava/lang/Object;
.source "HighlightView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;
    }
.end annotation


# static fields
.field public static final GROW_BOTTOM_EDGE:I = 0x10

.field public static final GROW_LEFT_EDGE:I = 0x2

.field public static final GROW_NONE:I = 0x1

.field public static final GROW_RIGHT_EDGE:I = 0x4

.field public static final GROW_TOP_EDGE:I = 0x8

.field public static final MOVE:I = 0x20

.field private static final TAG:Ljava/lang/String; = "CropImage"


# instance fields
.field mCircle:Z

.field mContext:Landroid/view/View;

.field mCropRect:Landroid/graphics/RectF;

.field mDrawRect:Landroid/graphics/Rect;

.field mFocusPaint:Landroid/graphics/Paint;

.field mHidden:Z

.field mImageRect:Landroid/graphics/RectF;

.field mInitialAspectRatio:F

.field mIsFocused:Z

.field mMaintainAspectRatio:Z

.field mMatrix:Landroid/graphics/Matrix;

.field mMode:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

.field mMotionMode:I

.field mNoFocusPaint:Landroid/graphics/Paint;

.field mOutlinePaint:Landroid/graphics/Paint;

.field mPath:Landroid/graphics/Path;

.field mResizeDrawableDiagonal:Landroid/graphics/drawable/Drawable;

.field mResizeDrawableHeight:Landroid/graphics/drawable/Drawable;

.field mResizeDrawableWidth:Landroid/graphics/drawable/Drawable;

.field mViewDrawingRect:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 2
    .parameter "ctx"

    .prologue
    const/4 v1, 0x0

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mViewDrawingRect:Landroid/graphics/Rect;

    .line 415
    sget-object v0, Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;->None:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mMode:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    .line 422
    iput-boolean v1, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mMaintainAspectRatio:Z

    .line 424
    iput-boolean v1, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCircle:Z

    .line 428
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mFocusPaint:Landroid/graphics/Paint;

    .line 429
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mNoFocusPaint:Landroid/graphics/Paint;

    .line 430
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mOutlinePaint:Landroid/graphics/Paint;

    .line 55
    iput-object p1, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mContext:Landroid/view/View;

    .line 56
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mPath:Landroid/graphics/Path;

    .line 57
    return-void
.end method

.method private computeLayout()Landroid/graphics/Rect;
    .locals 6

    .prologue
    .line 342
    new-instance v0, Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCropRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    iget-object v2, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCropRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    iget-object v3, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCropRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    iget-object v4, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCropRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 343
    .local v0, r:Landroid/graphics/RectF;
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 344
    new-instance v1, Landroid/graphics/Rect;

    iget v2, v0, Landroid/graphics/RectF;->left:F

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    iget v3, v0, Landroid/graphics/RectF;->top:F

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    iget v4, v0, Landroid/graphics/RectF;->right:F

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    iget v5, v0, Landroid/graphics/RectF;->bottom:F

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    invoke-direct {v1, v2, v3, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object v1
.end method

.method private initHighlightView()V
    .locals 2

    .prologue
    .line 60
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mContext:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 61
    .local v0, resources:Landroid/content/res/Resources;
    const v1, 0x7f020002

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mResizeDrawableWidth:Landroid/graphics/drawable/Drawable;

    .line 62
    const v1, 0x7f020001

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mResizeDrawableHeight:Landroid/graphics/drawable/Drawable;

    .line 63
    const v1, 0x7f02000f

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mResizeDrawableDiagonal:Landroid/graphics/drawable/Drawable;

    .line 64
    return-void
.end method

.method private shift(Landroid/graphics/RectF;FF)V
    .locals 1
    .parameter "r"
    .parameter "dx"
    .parameter "dy"

    .prologue
    .line 259
    iget v0, p1, Landroid/graphics/RectF;->left:F

    add-float/2addr v0, p2

    iput v0, p1, Landroid/graphics/RectF;->left:F

    .line 260
    iget v0, p1, Landroid/graphics/RectF;->right:F

    add-float/2addr v0, p2

    iput v0, p1, Landroid/graphics/RectF;->right:F

    .line 261
    iget v0, p1, Landroid/graphics/RectF;->top:F

    add-float/2addr v0, p3

    iput v0, p1, Landroid/graphics/RectF;->top:F

    .line 262
    iget v0, p1, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v0, p3

    iput v0, p1, Landroid/graphics/RectF;->bottom:F

    .line 263
    return-void
.end method


# virtual methods
.method protected draw(Landroid/graphics/Canvas;)V
    .locals 26
    .parameter "canvas"

    .prologue
    .line 82
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mHidden:Z

    move/from16 v20, v0

    if-eqz v20, :cond_1

    .line 150
    :cond_0
    :goto_0
    return-void

    .line 85
    :cond_1
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    .line 86
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mPath:Landroid/graphics/Path;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/graphics/Path;->reset()V

    .line 87
    invoke-virtual/range {p0 .. p0}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->hasFocus()Z

    move-result v20

    if-nez v20, :cond_2

    .line 88
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mOutlinePaint:Landroid/graphics/Paint;

    move-object/from16 v20, v0

    const/high16 v21, -0x100

    invoke-virtual/range {v20 .. v21}, Landroid/graphics/Paint;->setColor(I)V

    .line 89
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mOutlinePaint:Landroid/graphics/Paint;

    move-object/from16 v21, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto :goto_0

    .line 91
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mContext:Landroid/view/View;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mViewDrawingRect:Landroid/graphics/Rect;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 92
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCircle:Z

    move/from16 v20, v0

    if-eqz v20, :cond_3

    .line 93
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/graphics/Rect;->width()I

    move-result v20

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    invoke-virtual/range {p0 .. p0}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->getPaddingLeft()F

    move-result v21

    invoke-virtual/range {p0 .. p0}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->getPaddingRight()F

    move-result v22

    add-float v21, v21, v22

    sub-float v13, v20, v21

    .line 94
    .local v13, width:F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/graphics/Rect;->height()I

    move-result v20

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    invoke-virtual/range {p0 .. p0}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->getPaddingTop()F

    move-result v21

    invoke-virtual/range {p0 .. p0}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->getPaddingBottom()F

    move-result v22

    add-float v21, v21, v22

    sub-float v7, v20, v21

    .line 95
    .local v7, height:F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mPath:Landroid/graphics/Path;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget v0, v0, Landroid/graphics/Rect;->left:I

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v21, v0

    invoke-virtual/range {p0 .. p0}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->getPaddingLeft()F

    move-result v22

    add-float v21, v21, v22

    const/high16 v22, 0x4000

    div-float v22, v13, v22

    add-float v21, v21, v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget v0, v0, Landroid/graphics/Rect;->top:I

    move/from16 v22, v0

    move/from16 v0, v22

    int-to-float v0, v0

    move/from16 v22, v0

    invoke-virtual/range {p0 .. p0}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->getPaddingTop()F

    move-result v23

    add-float v22, v22, v23

    const/high16 v23, 0x4000

    div-float v23, v7, v23

    add-float v22, v22, v23

    const/high16 v23, 0x4000

    div-float v23, v13, v23

    sget-object v24, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual/range {v20 .. v24}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 100
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mOutlinePaint:Landroid/graphics/Paint;

    move-object/from16 v20, v0

    const v21, -0x10fb2a

    invoke-virtual/range {v20 .. v21}, Landroid/graphics/Paint;->setColor(I)V

    .line 105
    .end local v7           #height:F
    .end local v13           #width:F
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mPath:Landroid/graphics/Path;

    move-object/from16 v20, v0

    sget-object v21, Landroid/graphics/Region$Op;->DIFFERENCE:Landroid/graphics/Region$Op;

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;Landroid/graphics/Region$Op;)Z

    .line 106
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mViewDrawingRect:Landroid/graphics/Rect;

    move-object/from16 v20, v0

    invoke-virtual/range {p0 .. p0}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->hasFocus()Z

    move-result v21

    if-eqz v21, :cond_4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mFocusPaint:Landroid/graphics/Paint;

    move-object/from16 v21, v0

    :goto_2
    move-object/from16 v0, p1

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 108
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    .line 109
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mPath:Landroid/graphics/Path;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mOutlinePaint:Landroid/graphics/Paint;

    move-object/from16 v21, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 111
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mMode:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    move-object/from16 v20, v0

    sget-object v21, Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;->Grow:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    if-ne v0, v1, :cond_0

    .line 112
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCircle:Z

    move/from16 v20, v0

    if-eqz v20, :cond_5

    .line 113
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mResizeDrawableDiagonal:Landroid/graphics/drawable/Drawable;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v13

    .line 114
    .local v13, width:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mResizeDrawableDiagonal:Landroid/graphics/drawable/Drawable;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v7

    .line 116
    .local v7, height:I
    const-wide v20, 0x3fe921fb54442d18L

    invoke-static/range {v20 .. v21}, Ljava/lang/Math;->cos(D)D

    move-result-wide v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Landroid/graphics/Rect;->width()I

    move-result v22

    move/from16 v0, v22

    int-to-double v0, v0

    move-wide/from16 v22, v0

    const-wide/high16 v24, 0x4000

    div-double v22, v22, v24

    mul-double v20, v20, v22

    invoke-static/range {v20 .. v21}, Ljava/lang/Math;->round(D)J

    move-result-wide v20

    move-wide/from16 v0, v20

    long-to-int v0, v0

    move v6, v0

    .line 117
    .local v6, d:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/graphics/Rect;->left:I

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/graphics/Rect;->width()I

    move-result v21

    div-int/lit8 v21, v21, 0x2

    add-int v20, v20, v21

    add-int v20, v20, v6

    div-int/lit8 v21, v13, 0x2

    sub-int v16, v20, v21

    .line 118
    .local v16, x:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/graphics/Rect;->top:I

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/graphics/Rect;->height()I

    move-result v21

    div-int/lit8 v21, v21, 0x2

    add-int v20, v20, v21

    sub-int v20, v20, v6

    div-int/lit8 v21, v7, 0x2

    sub-int v18, v20, v21

    .line 119
    .local v18, y:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mResizeDrawableDiagonal:Landroid/graphics/drawable/Drawable;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mResizeDrawableDiagonal:Landroid/graphics/drawable/Drawable;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v21

    add-int v21, v21, v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mResizeDrawableDiagonal:Landroid/graphics/drawable/Drawable;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v22

    add-int v22, v22, v18

    move-object/from16 v0, v20

    move/from16 v1, v16

    move/from16 v2, v18

    move/from16 v3, v21

    move/from16 v4, v22

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 120
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mResizeDrawableDiagonal:Landroid/graphics/drawable/Drawable;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto/16 :goto_0

    .line 102
    .end local v6           #d:I
    .end local v7           #height:I
    .end local v13           #width:I
    .end local v16           #x:I
    .end local v18           #y:I
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mPath:Landroid/graphics/Path;

    move-object/from16 v20, v0

    new-instance v21, Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    move-object/from16 v22, v0

    invoke-direct/range {v21 .. v22}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    sget-object v22, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual/range {v20 .. v22}, Landroid/graphics/Path;->addRect(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    .line 103
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mOutlinePaint:Landroid/graphics/Paint;

    move-object/from16 v20, v0

    const/16 v21, -0x7600

    invoke-virtual/range {v20 .. v21}, Landroid/graphics/Paint;->setColor(I)V

    goto/16 :goto_1

    .line 106
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mNoFocusPaint:Landroid/graphics/Paint;

    move-object/from16 v21, v0

    goto/16 :goto_2

    .line 122
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/graphics/Rect;->left:I

    move/from16 v20, v0

    add-int/lit8 v10, v20, 0x1

    .line 123
    .local v10, left:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/graphics/Rect;->right:I

    move/from16 v20, v0

    add-int/lit8 v11, v20, 0x1

    .line 124
    .local v11, right:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/graphics/Rect;->top:I

    move/from16 v20, v0

    add-int/lit8 v12, v20, 0x4

    .line 125
    .local v12, top:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    move/from16 v20, v0

    add-int/lit8 v5, v20, 0x3

    .line 127
    .local v5, bottom:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mResizeDrawableWidth:Landroid/graphics/drawable/Drawable;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v20

    div-int/lit8 v15, v20, 0x2

    .line 128
    .local v15, widthWidth:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mResizeDrawableWidth:Landroid/graphics/drawable/Drawable;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v20

    div-int/lit8 v14, v20, 0x2

    .line 129
    .local v14, widthHeight:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mResizeDrawableHeight:Landroid/graphics/drawable/Drawable;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v20

    div-int/lit8 v8, v20, 0x2

    .line 130
    .local v8, heightHeight:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mResizeDrawableHeight:Landroid/graphics/drawable/Drawable;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v20

    div-int/lit8 v9, v20, 0x2

    .line 132
    .local v9, heightWidth:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/graphics/Rect;->left:I

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget v0, v0, Landroid/graphics/Rect;->right:I

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget v0, v0, Landroid/graphics/Rect;->left:I

    move/from16 v22, v0

    sub-int v21, v21, v22

    div-int/lit8 v21, v21, 0x2

    add-int v17, v20, v21

    .line 133
    .local v17, xMiddle:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Landroid/graphics/Rect;->top:I

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget v0, v0, Landroid/graphics/Rect;->top:I

    move/from16 v22, v0

    sub-int v21, v21, v22

    div-int/lit8 v21, v21, 0x2

    add-int v19, v20, v21

    .line 135
    .local v19, yMiddle:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mResizeDrawableWidth:Landroid/graphics/drawable/Drawable;

    move-object/from16 v20, v0

    sub-int v21, v10, v15

    sub-int v22, v19, v14

    add-int v23, v10, v15

    add-int v24, v19, v14

    invoke-virtual/range {v20 .. v24}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 136
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mResizeDrawableWidth:Landroid/graphics/drawable/Drawable;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 138
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mResizeDrawableWidth:Landroid/graphics/drawable/Drawable;

    move-object/from16 v20, v0

    sub-int v21, v11, v15

    sub-int v22, v19, v14

    add-int v23, v11, v15

    add-int v24, v19, v14

    invoke-virtual/range {v20 .. v24}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 139
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mResizeDrawableWidth:Landroid/graphics/drawable/Drawable;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 141
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mResizeDrawableHeight:Landroid/graphics/drawable/Drawable;

    move-object/from16 v20, v0

    sub-int v21, v17, v9

    sub-int v22, v12, v8

    add-int v23, v17, v9

    add-int v24, v12, v8

    invoke-virtual/range {v20 .. v24}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 142
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mResizeDrawableHeight:Landroid/graphics/drawable/Drawable;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 144
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mResizeDrawableHeight:Landroid/graphics/drawable/Drawable;

    move-object/from16 v20, v0

    sub-int v21, v17, v9

    sub-int v22, v5, v8

    add-int v23, v17, v9

    add-int v24, v5, v8

    invoke-virtual/range {v20 .. v24}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 145
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mResizeDrawableHeight:Landroid/graphics/drawable/Drawable;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto/16 :goto_0
.end method

.method public getCropRect()Landroid/graphics/Rect;
    .locals 5

    .prologue
    .line 338
    new-instance v0, Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCropRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    float-to-int v1, v1

    iget-object v2, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCropRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    float-to-int v2, v2

    iget-object v3, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCropRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    float-to-int v3, v3

    iget-object v4, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCropRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    float-to-int v4, v4

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object v0
.end method

.method public getHit(FF)I
    .locals 12
    .parameter "x"
    .parameter "y"

    .prologue
    .line 170
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->computeLayout()Landroid/graphics/Rect;

    move-result-object v6

    .line 171
    .local v6, r:Landroid/graphics/Rect;
    const/high16 v5, 0x41a0

    .line 172
    .local v5, hysteresis:F
    const/4 v8, 0x1

    .line 174
    .local v8, retval:I
    iget-boolean v10, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCircle:Z

    if-eqz v10, :cond_6

    .line 175
    invoke-virtual {v6}, Landroid/graphics/Rect;->centerX()I

    move-result v10

    int-to-float v10, v10

    sub-float v1, p1, v10

    .line 176
    .local v1, distX:F
    invoke-virtual {v6}, Landroid/graphics/Rect;->centerY()I

    move-result v10

    int-to-float v10, v10

    sub-float v2, p2, v10

    .line 177
    .local v2, distY:F
    mul-float v10, v1, v1

    mul-float v11, v2, v2

    add-float/2addr v10, v11

    float-to-double v10, v10

    invoke-static {v10, v11}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v10

    double-to-int v3, v10

    .line 178
    .local v3, distanceFromCenter:I
    iget-object v10, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    invoke-virtual {v10}, Landroid/graphics/Rect;->width()I

    move-result v10

    int-to-float v10, v10

    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->getPaddingLeft()F

    move-result v11

    sub-float/2addr v10, v11

    float-to-int v10, v10

    div-int/lit8 v7, v10, 0x2

    .line 179
    .local v7, radius:I
    sub-int v0, v3, v7

    .line 180
    .local v0, delta:I
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v10

    int-to-float v10, v10

    const/high16 v11, 0x41a0

    cmpg-float v10, v10, v11

    if-gtz v10, :cond_4

    .line 181
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v10

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v11

    cmpl-float v10, v10, v11

    if-lez v10, :cond_2

    .line 182
    const/4 v10, 0x0

    cmpg-float v10, v2, v10

    if-gez v10, :cond_1

    .line 183
    const/16 v8, 0x8

    .line 214
    .end local v0           #delta:I
    .end local v1           #distX:F
    .end local v2           #distY:F
    .end local v3           #distanceFromCenter:I
    .end local v7           #radius:I
    :cond_0
    :goto_0
    return v8

    .line 185
    .restart local v0       #delta:I
    .restart local v1       #distX:F
    .restart local v2       #distY:F
    .restart local v3       #distanceFromCenter:I
    .restart local v7       #radius:I
    :cond_1
    const/16 v8, 0x10

    goto :goto_0

    .line 187
    :cond_2
    const/4 v10, 0x0

    cmpg-float v10, v1, v10

    if-gez v10, :cond_3

    .line 188
    const/4 v8, 0x2

    goto :goto_0

    .line 190
    :cond_3
    const/4 v8, 0x4

    goto :goto_0

    .line 192
    :cond_4
    if-ge v3, v7, :cond_5

    .line 193
    const/16 v8, 0x20

    goto :goto_0

    .line 195
    :cond_5
    const/4 v8, 0x1

    goto :goto_0

    .line 199
    .end local v0           #delta:I
    .end local v1           #distX:F
    .end local v2           #distY:F
    .end local v3           #distanceFromCenter:I
    .end local v7           #radius:I
    :cond_6
    iget v10, v6, Landroid/graphics/Rect;->top:I

    int-to-float v10, v10

    const/high16 v11, 0x41a0

    sub-float/2addr v10, v11

    cmpl-float v10, p2, v10

    if-ltz v10, :cond_b

    iget v10, v6, Landroid/graphics/Rect;->bottom:I

    int-to-float v10, v10

    const/high16 v11, 0x41a0

    add-float/2addr v10, v11

    cmpg-float v10, p2, v10

    if-gez v10, :cond_b

    const/4 v10, 0x1

    move v9, v10

    .line 200
    .local v9, verticalCheck:Z
    :goto_1
    iget v10, v6, Landroid/graphics/Rect;->left:I

    int-to-float v10, v10

    const/high16 v11, 0x41a0

    sub-float/2addr v10, v11

    cmpl-float v10, p1, v10

    if-ltz v10, :cond_c

    iget v10, v6, Landroid/graphics/Rect;->right:I

    int-to-float v10, v10

    const/high16 v11, 0x41a0

    add-float/2addr v10, v11

    cmpg-float v10, p1, v10

    if-gez v10, :cond_c

    const/4 v10, 0x1

    move v4, v10

    .line 202
    .local v4, horizCheck:Z
    :goto_2
    iget v10, v6, Landroid/graphics/Rect;->left:I

    int-to-float v10, v10

    sub-float/2addr v10, p1

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v10

    const/high16 v11, 0x41a0

    cmpg-float v10, v10, v11

    if-gez v10, :cond_7

    if-eqz v9, :cond_7

    .line 203
    or-int/lit8 v8, v8, 0x2

    .line 204
    :cond_7
    iget v10, v6, Landroid/graphics/Rect;->right:I

    int-to-float v10, v10

    sub-float/2addr v10, p1

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v10

    const/high16 v11, 0x41a0

    cmpg-float v10, v10, v11

    if-gez v10, :cond_8

    if-eqz v9, :cond_8

    .line 205
    or-int/lit8 v8, v8, 0x4

    .line 206
    :cond_8
    iget v10, v6, Landroid/graphics/Rect;->top:I

    int-to-float v10, v10

    sub-float/2addr v10, p2

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v10

    const/high16 v11, 0x41a0

    cmpg-float v10, v10, v11

    if-gez v10, :cond_9

    if-eqz v4, :cond_9

    .line 207
    or-int/lit8 v8, v8, 0x8

    .line 208
    :cond_9
    iget v10, v6, Landroid/graphics/Rect;->bottom:I

    int-to-float v10, v10

    sub-float/2addr v10, p2

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v10

    const/high16 v11, 0x41a0

    cmpg-float v10, v10, v11

    if-gez v10, :cond_a

    if-eqz v4, :cond_a

    .line 209
    or-int/lit8 v8, v8, 0x10

    .line 211
    :cond_a
    const/4 v10, 0x1

    if-ne v8, v10, :cond_0

    float-to-int v10, p1

    float-to-int v11, p2

    invoke-virtual {v6, v10, v11}, Landroid/graphics/Rect;->contains(II)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 212
    const/16 v8, 0x20

    goto/16 :goto_0

    .line 199
    .end local v4           #horizCheck:Z
    .end local v9           #verticalCheck:Z
    :cond_b
    const/4 v10, 0x0

    move v9, v10

    goto :goto_1

    .line 200
    .restart local v9       #verticalCheck:Z
    :cond_c
    const/4 v10, 0x0

    move v4, v10

    goto :goto_2
.end method

.method public getMode()Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;
    .locals 1

    .prologue
    .line 158
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mMode:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    return-object v0
.end method

.method getPaddingBottom()F
    .locals 1

    .prologue
    .line 153
    const/4 v0, 0x0

    return v0
.end method

.method getPaddingLeft()F
    .locals 1

    .prologue
    .line 154
    const/4 v0, 0x0

    return v0
.end method

.method getPaddingRight()F
    .locals 1

    .prologue
    .line 155
    const/4 v0, 0x0

    return v0
.end method

.method getPaddingTop()F
    .locals 1

    .prologue
    .line 152
    const/4 v0, 0x0

    return v0
.end method

.method growBy(FF)V
    .locals 9
    .parameter "dx"
    .parameter "dy"

    .prologue
    const/high16 v8, 0x41c8

    const/high16 v7, 0x4000

    const/4 v6, 0x0

    .line 267
    iget-boolean v4, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mMaintainAspectRatio:Z

    if-eqz v4, :cond_0

    .line 268
    cmpl-float v4, p1, v6

    if-eqz v4, :cond_7

    .line 269
    iget v4, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mInitialAspectRatio:F

    div-float p2, p1, v4

    .line 275
    :cond_0
    :goto_0
    new-instance v2, Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCropRect:Landroid/graphics/RectF;

    invoke-direct {v2, v4}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 276
    .local v2, r:Landroid/graphics/RectF;
    cmpl-float v4, p1, v6

    if-lez v4, :cond_1

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v4

    mul-float v5, v7, p1

    add-float/2addr v4, v5

    iget-object v5, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mImageRect:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->width()F

    move-result v5

    cmpl-float v4, v4, v5

    if-lez v4, :cond_1

    .line 277
    iget-object v4, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mImageRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v4

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v5

    sub-float/2addr v4, v5

    div-float v0, v4, v7

    .line 278
    .local v0, adjustment:F
    move p1, v0

    .line 279
    iget-boolean v4, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mMaintainAspectRatio:Z

    if-eqz v4, :cond_1

    .line 280
    iget v4, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mInitialAspectRatio:F

    div-float p2, p1, v4

    .line 282
    .end local v0           #adjustment:F
    :cond_1
    cmpl-float v4, p2, v6

    if-lez v4, :cond_2

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v4

    mul-float v5, v7, p2

    add-float/2addr v4, v5

    iget-object v5, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mImageRect:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    move-result v5

    cmpl-float v4, v4, v5

    if-lez v4, :cond_2

    .line 283
    iget-object v4, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mImageRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v4

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v5

    sub-float/2addr v4, v5

    div-float v0, v4, v7

    .line 284
    .restart local v0       #adjustment:F
    move p2, v0

    .line 285
    iget-boolean v4, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mMaintainAspectRatio:Z

    if-eqz v4, :cond_2

    .line 286
    iget v4, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mInitialAspectRatio:F

    mul-float p1, p2, v4

    .line 289
    .end local v0           #adjustment:F
    :cond_2
    neg-float v4, p1

    neg-float v5, p2

    invoke-virtual {v2, v4, v5}, Landroid/graphics/RectF;->inset(FF)V

    .line 291
    const/high16 v3, 0x41c8

    .line 292
    .local v3, widthCap:F
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v4

    cmpg-float v4, v4, v8

    if-gez v4, :cond_3

    .line 293
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v4

    sub-float v4, v8, v4

    neg-float v4, v4

    div-float/2addr v4, v7

    invoke-virtual {v2, v4, v6}, Landroid/graphics/RectF;->inset(FF)V

    .line 295
    :cond_3
    iget-boolean v4, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mMaintainAspectRatio:Z

    if-eqz v4, :cond_8

    iget v4, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mInitialAspectRatio:F

    div-float v4, v3, v4

    move v1, v4

    .line 296
    .local v1, heightCap:F
    :goto_1
    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v4

    cmpg-float v4, v4, v1

    if-gez v4, :cond_4

    .line 297
    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v4

    sub-float v4, v1, v4

    neg-float v4, v4

    div-float/2addr v4, v7

    invoke-virtual {v2, v6, v4}, Landroid/graphics/RectF;->inset(FF)V

    .line 300
    :cond_4
    iget v4, v2, Landroid/graphics/RectF;->left:F

    iget-object v5, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mImageRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->left:F

    cmpg-float v4, v4, v5

    if-gez v4, :cond_9

    .line 301
    iget-object v4, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mImageRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    iget v5, v2, Landroid/graphics/RectF;->left:F

    sub-float/2addr v4, v5

    invoke-direct {p0, v2, v4, v6}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->shift(Landroid/graphics/RectF;FF)V

    .line 305
    :cond_5
    :goto_2
    iget v4, v2, Landroid/graphics/RectF;->top:F

    iget-object v5, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mImageRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->top:F

    cmpg-float v4, v4, v5

    if-gez v4, :cond_a

    .line 306
    iget-object v4, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mImageRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    iget v5, v2, Landroid/graphics/RectF;->top:F

    sub-float/2addr v4, v5

    invoke-direct {p0, v2, v6, v4}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->shift(Landroid/graphics/RectF;FF)V

    .line 332
    :cond_6
    :goto_3
    iget-object v4, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v4, v2}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 333
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->computeLayout()Landroid/graphics/Rect;

    move-result-object v4

    iput-object v4, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    .line 334
    iget-object v4, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mContext:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->invalidate()V

    .line 335
    return-void

    .line 270
    .end local v1           #heightCap:F
    .end local v2           #r:Landroid/graphics/RectF;
    .end local v3           #widthCap:F
    :cond_7
    cmpl-float v4, p2, v6

    if-eqz v4, :cond_0

    .line 271
    iget v4, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mInitialAspectRatio:F

    mul-float p1, p2, v4

    goto/16 :goto_0

    .restart local v2       #r:Landroid/graphics/RectF;
    .restart local v3       #widthCap:F
    :cond_8
    move v1, v3

    .line 295
    goto :goto_1

    .line 302
    .restart local v1       #heightCap:F
    :cond_9
    iget v4, v2, Landroid/graphics/RectF;->right:F

    iget-object v5, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mImageRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    cmpl-float v4, v4, v5

    if-lez v4, :cond_5

    .line 303
    iget v4, v2, Landroid/graphics/RectF;->right:F

    iget-object v5, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mImageRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    sub-float/2addr v4, v5

    neg-float v4, v4

    invoke-direct {p0, v2, v4, v6}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->shift(Landroid/graphics/RectF;FF)V

    goto :goto_2

    .line 307
    :cond_a
    iget v4, v2, Landroid/graphics/RectF;->bottom:F

    iget-object v5, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mImageRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->bottom:F

    cmpl-float v4, v4, v5

    if-lez v4, :cond_6

    .line 308
    iget v4, v2, Landroid/graphics/RectF;->bottom:F

    iget-object v5, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mImageRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v4, v5

    neg-float v4, v4

    invoke-direct {p0, v2, v6, v4}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->shift(Landroid/graphics/RectF;FF)V

    goto :goto_3
.end method

.method handleMotion(IFF)V
    .locals 7
    .parameter "edge"
    .parameter "dx"
    .parameter "dy"

    .prologue
    const/4 v6, -0x1

    const/4 v5, 0x1

    .line 218
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->computeLayout()Landroid/graphics/Rect;

    move-result-object v0

    .line 219
    .local v0, r:Landroid/graphics/Rect;
    if-ne p1, v5, :cond_0

    .line 238
    :goto_0
    return-void

    .line 221
    :cond_0
    const/16 v3, 0x20

    if-ne p1, v3, :cond_1

    .line 222
    iget-object v3, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    mul-float/2addr v3, p2

    iget-object v4, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v4

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v4, v5

    mul-float/2addr v4, p3

    invoke-virtual {p0, v3, v4}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->moveBy(FF)V

    goto :goto_0

    .line 225
    :cond_1
    and-int/lit8 v3, p1, 0x6

    if-nez v3, :cond_2

    .line 226
    const/4 p2, 0x0

    .line 228
    :cond_2
    and-int/lit8 v3, p1, 0x18

    if-nez v3, :cond_3

    .line 229
    const/4 p3, 0x0

    .line 231
    :cond_3
    iget-object v3, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    mul-float v1, p2, v3

    .line 232
    .local v1, xDelta:F
    iget-object v3, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    mul-float v2, p3, v3

    .line 233
    .local v2, yDelta:F
    and-int/lit8 v3, p1, 0x2

    if-eqz v3, :cond_4

    move v3, v6

    :goto_1
    int-to-float v3, v3

    mul-float/2addr v3, v1

    and-int/lit8 v4, p1, 0x8

    if-eqz v4, :cond_5

    move v4, v6

    :goto_2
    int-to-float v4, v4

    mul-float/2addr v4, v2

    invoke-virtual {p0, v3, v4}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->growBy(FF)V

    goto :goto_0

    :cond_4
    move v3, v5

    goto :goto_1

    :cond_5
    move v4, v5

    goto :goto_2
.end method

.method public hasFocus()Z
    .locals 1

    .prologue
    .line 70
    iget-boolean v0, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mIsFocused:Z

    return v0
.end method

.method public invalidate()V
    .locals 1

    .prologue
    .line 348
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->computeLayout()Landroid/graphics/Rect;

    move-result-object v0

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    .line 349
    return-void
.end method

.method public modify(IJ)V
    .locals 7
    .parameter "keyCode"
    .parameter "repeatCount"

    .prologue
    const v6, 0x3c23d70a

    const/4 v5, 0x0

    .line 377
    const v3, 0x3dcccccd

    long-to-float v4, p2

    mul-float/2addr v4, v6

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-static {v6, v3}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 378
    .local v0, factor:F
    iget-object v3, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mContext:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v3

    int-to-float v3, v3

    mul-float v2, v0, v3

    .line 379
    .local v2, widthUnits:F
    move v1, v2

    .line 381
    .local v1, heightUnits:F
    packed-switch p1, :pswitch_data_0

    .line 411
    :cond_0
    :goto_0
    return-void

    .line 384
    :pswitch_0
    iget-object v3, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mMode:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    sget-object v4, Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;->Move:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    if-ne v3, v4, :cond_1

    .line 385
    neg-float v3, v2

    invoke-virtual {p0, v3, v5}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->moveBy(FF)V

    goto :goto_0

    .line 386
    :cond_1
    iget-object v3, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mMode:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    sget-object v4, Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;->Grow:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    if-ne v3, v4, :cond_0

    .line 387
    neg-float v3, v2

    invoke-virtual {p0, v3, v5}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->growBy(FF)V

    goto :goto_0

    .line 391
    :pswitch_1
    iget-object v3, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mMode:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    sget-object v4, Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;->Move:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    if-ne v3, v4, :cond_2

    .line 392
    invoke-virtual {p0, v2, v5}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->moveBy(FF)V

    goto :goto_0

    .line 393
    :cond_2
    iget-object v3, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mMode:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    sget-object v4, Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;->Grow:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    if-ne v3, v4, :cond_0

    .line 394
    invoke-virtual {p0, v2, v5}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->growBy(FF)V

    goto :goto_0

    .line 398
    :pswitch_2
    iget-object v3, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mMode:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    sget-object v4, Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;->Move:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    if-ne v3, v4, :cond_3

    .line 399
    neg-float v3, v1

    invoke-virtual {p0, v5, v3}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->moveBy(FF)V

    goto :goto_0

    .line 400
    :cond_3
    iget-object v3, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mMode:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    sget-object v4, Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;->Grow:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    if-ne v3, v4, :cond_0

    .line 401
    neg-float v3, v1

    invoke-virtual {p0, v5, v3}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->growBy(FF)V

    goto :goto_0

    .line 405
    :pswitch_3
    iget-object v3, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mMode:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    sget-object v4, Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;->Move:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    if-ne v3, v4, :cond_4

    .line 406
    invoke-virtual {p0, v5, v1}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->moveBy(FF)V

    goto :goto_0

    .line 407
    :cond_4
    iget-object v3, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mMode:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    sget-object v4, Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;->Grow:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    if-ne v3, v4, :cond_0

    .line 408
    invoke-virtual {p0, v5, v1}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->growBy(FF)V

    goto :goto_0

    .line 381
    nop

    :pswitch_data_0
    .packed-switch 0x13
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method moveBy(FF)V
    .locals 7
    .parameter "dx"
    .parameter "dy"

    .prologue
    const/16 v6, -0xa

    const/4 v5, 0x0

    .line 241
    new-instance v0, Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    invoke-direct {v0, v1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 243
    .local v0, invalRect:Landroid/graphics/Rect;
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v1, p1, p2}, Landroid/graphics/RectF;->offset(FF)V

    .line 244
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCropRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mImageRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    iget-object v3, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCropRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->left:F

    sub-float/2addr v2, v3

    invoke-static {v5, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iget-object v3, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mImageRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->top:F

    iget-object v4, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCropRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    sub-float/2addr v3, v4

    invoke-static {v5, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/RectF;->offset(FF)V

    .line 248
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCropRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mImageRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->right:F

    iget-object v3, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCropRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    sub-float/2addr v2, v3

    invoke-static {v5, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iget-object v3, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mImageRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->bottom:F

    iget-object v4, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCropRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v3, v4

    invoke-static {v5, v3}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/RectF;->offset(FF)V

    .line 252
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->computeLayout()Landroid/graphics/Rect;

    move-result-object v1

    iput-object v1, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    .line 253
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/Rect;->union(Landroid/graphics/Rect;)V

    .line 254
    invoke-virtual {v0, v6, v6}, Landroid/graphics/Rect;->inset(II)V

    .line 255
    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mContext:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->invalidate(Landroid/graphics/Rect;)V

    .line 256
    return-void
.end method

.method public setFocus(Z)V
    .locals 0
    .parameter "f"

    .prologue
    .line 74
    iput-boolean p1, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mIsFocused:Z

    .line 75
    return-void
.end method

.method public setHidden(Z)V
    .locals 0
    .parameter "hidden"

    .prologue
    .line 78
    iput-boolean p1, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mHidden:Z

    .line 79
    return-void
.end method

.method public setMode(Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;)V
    .locals 1
    .parameter "mode"

    .prologue
    .line 163
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mMode:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    if-eq p1, v0, :cond_0

    .line 164
    iput-object p1, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mMode:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    .line 165
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mContext:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    .line 167
    :cond_0
    return-void
.end method

.method public setup(Landroid/graphics/Matrix;Landroid/graphics/Rect;Landroid/graphics/RectF;ZZ)V
    .locals 4
    .parameter "m"
    .parameter "imageRect"
    .parameter "cropRect"
    .parameter "circle"
    .parameter "maintainAspectRatio"

    .prologue
    const/16 v3, 0x7d

    const/16 v2, 0x32

    .line 353
    if-eqz p4, :cond_0

    .line 354
    const/4 p5, 0x1

    .line 355
    :cond_0
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0, p1}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mMatrix:Landroid/graphics/Matrix;

    .line 357
    iput-object p3, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCropRect:Landroid/graphics/RectF;

    .line 358
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0, p2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mImageRect:Landroid/graphics/RectF;

    .line 359
    iput-boolean p5, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mMaintainAspectRatio:Z

    .line 360
    iput-boolean p4, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCircle:Z

    .line 362
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    iget-object v1, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mCropRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    div-float/2addr v0, v1

    iput v0, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mInitialAspectRatio:F

    .line 363
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->computeLayout()Landroid/graphics/Rect;

    move-result-object v0

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mDrawRect:Landroid/graphics/Rect;

    .line 365
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mFocusPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v3, v2, v2, v2}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 366
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mNoFocusPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v3, v2, v2, v2}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 367
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mOutlinePaint:Landroid/graphics/Paint;

    const/high16 v1, 0x4040

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 368
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mOutlinePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 369
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mOutlinePaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 371
    sget-object v0, Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;->None:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/HighlightView;->mMode:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    .line 372
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/graphics/HighlightView;->initHighlightView()V

    .line 373
    return-void
.end method

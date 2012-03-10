.class public Lcom/nloko/android/syncmypix/graphics/CropImage;
.super Landroid/app/Activity;
.source "CropImage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "CropImage"


# instance fields
.field private mAspectX:I

.field private mAspectY:I

.field mBitmap:Landroid/graphics/Bitmap;

.field private mCircleCrop:Z

.field mContentResolver:Landroid/content/ContentResolver;

.field mCrop:Lcom/nloko/android/syncmypix/graphics/HighlightView;

.field mCroppedImage:Landroid/graphics/Bitmap;

.field private mDoFaceDetection:Z

.field private mFaceDetectionDialog:Landroid/app/ProgressDialog;

.field mHandler:Landroid/os/Handler;

.field mImage:Ljava/lang/Object;

.field mImageView:Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;

.field private mOutputX:I

.field private mOutputY:I

.field mRunFaceDetection:Ljava/lang/Runnable;

.field private mSaveFormat:Landroid/graphics/Bitmap$CompressFormat;

.field private mSaveUri:Landroid/net/Uri;

.field private mSaving:Z

.field private mSavingProgressDialog:Landroid/app/ProgressDialog;

.field private mScale:Z

.field private mScaleUp:Z

.field private mWaitingToPick:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 85
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 61
    iput-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mFaceDetectionDialog:Landroid/app/ProgressDialog;

    .line 62
    iput-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mSavingProgressDialog:Landroid/app/ProgressDialog;

    .line 64
    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mSaveFormat:Landroid/graphics/Bitmap$CompressFormat;

    .line 65
    iput-object v1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mSaveUri:Landroid/net/Uri;

    .line 68
    iput-boolean v2, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mDoFaceDetection:Z

    .line 69
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mCircleCrop:Z

    .line 73
    iput-boolean v2, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mScaleUp:Z

    .line 673
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mHandler:Landroid/os/Handler;

    .line 675
    new-instance v0, Lcom/nloko/android/syncmypix/graphics/CropImage$4;

    invoke-direct {v0, p0}, Lcom/nloko/android/syncmypix/graphics/CropImage$4;-><init>(Lcom/nloko/android/syncmypix/graphics/CropImage;)V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mRunFaceDetection:Ljava/lang/Runnable;

    .line 86
    return-void
.end method

.method static synthetic access$000(Lcom/nloko/android/syncmypix/graphics/CropImage;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 59
    iget-boolean v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mSaving:Z

    return v0
.end method

.method static synthetic access$002(Lcom/nloko/android/syncmypix/graphics/CropImage;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 59
    iput-boolean p1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mSaving:Z

    return p1
.end method

.method static synthetic access$100(Lcom/nloko/android/syncmypix/graphics/CropImage;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 59
    iget-boolean v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mWaitingToPick:Z

    return v0
.end method

.method static synthetic access$1000(Lcom/nloko/android/syncmypix/graphics/CropImage;)Landroid/graphics/Bitmap$CompressFormat;
    .locals 1
    .parameter "x0"

    .prologue
    .line 59
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mSaveFormat:Landroid/graphics/Bitmap$CompressFormat;

    return-object v0
.end method

.method static synthetic access$102(Lcom/nloko/android/syncmypix/graphics/CropImage;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 59
    iput-boolean p1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mWaitingToPick:Z

    return p1
.end method

.method static synthetic access$1100(Lcom/nloko/android/syncmypix/graphics/CropImage;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 59
    iget v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mAspectX:I

    return v0
.end method

.method static synthetic access$1200(Lcom/nloko/android/syncmypix/graphics/CropImage;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 59
    iget v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mAspectY:I

    return v0
.end method

.method static synthetic access$1300(Lcom/nloko/android/syncmypix/graphics/CropImage;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 59
    iget-boolean v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mDoFaceDetection:Z

    return v0
.end method

.method static synthetic access$1600(Lcom/nloko/android/syncmypix/graphics/CropImage;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 59
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/graphics/CropImage;->closeProgressDialog()V

    return-void
.end method

.method static synthetic access$202(Lcom/nloko/android/syncmypix/graphics/CropImage;Landroid/app/ProgressDialog;)Landroid/app/ProgressDialog;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 59
    iput-object p1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mFaceDetectionDialog:Landroid/app/ProgressDialog;

    return-object p1
.end method

.method static synthetic access$300(Lcom/nloko/android/syncmypix/graphics/CropImage;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 59
    iget-boolean v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mCircleCrop:Z

    return v0
.end method

.method static synthetic access$400(Lcom/nloko/android/syncmypix/graphics/CropImage;IILandroid/graphics/Canvas;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 59
    invoke-direct {p0, p1, p2, p3}, Lcom/nloko/android/syncmypix/graphics/CropImage;->fillCanvas(IILandroid/graphics/Canvas;)V

    return-void
.end method

.method static synthetic access$500(Lcom/nloko/android/syncmypix/graphics/CropImage;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 59
    iget v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mOutputX:I

    return v0
.end method

.method static synthetic access$600(Lcom/nloko/android/syncmypix/graphics/CropImage;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 59
    iget v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mOutputY:I

    return v0
.end method

.method static synthetic access$700(Lcom/nloko/android/syncmypix/graphics/CropImage;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 59
    iget-boolean v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mScale:Z

    return v0
.end method

.method static synthetic access$802(Lcom/nloko/android/syncmypix/graphics/CropImage;Landroid/app/ProgressDialog;)Landroid/app/ProgressDialog;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 59
    iput-object p1, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mSavingProgressDialog:Landroid/app/ProgressDialog;

    return-object p1
.end method

.method static synthetic access$900(Lcom/nloko/android/syncmypix/graphics/CropImage;)Landroid/net/Uri;
    .locals 1
    .parameter "x0"

    .prologue
    .line 59
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mSaveUri:Landroid/net/Uri;

    return-object v0
.end method

.method private declared-synchronized closeProgressDialog()V
    .locals 1

    .prologue
    .line 836
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mFaceDetectionDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    .line 837
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mFaceDetectionDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 838
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mFaceDetectionDialog:Landroid/app/ProgressDialog;

    .line 840
    :cond_0
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mSavingProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_1

    .line 841
    iget-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mSavingProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 842
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mSavingProgressDialog:Landroid/app/ProgressDialog;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 844
    :cond_1
    monitor-exit p0

    return-void

    .line 836
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private fillCanvas(IILandroid/graphics/Canvas;)V
    .locals 6
    .parameter "width"
    .parameter "height"
    .parameter "c"

    .prologue
    const/4 v1, 0x0

    .line 347
    new-instance v5, Landroid/graphics/Paint;

    invoke-direct {v5}, Landroid/graphics/Paint;-><init>()V

    .line 348
    .local v5, paint:Landroid/graphics/Paint;
    const/4 v0, 0x0

    invoke-virtual {v5, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 349
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 350
    const/4 v0, 0x1

    invoke-virtual {v5, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 351
    new-instance v0, Landroid/graphics/PorterDuffXfermode;

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v0, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v5, v0}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 352
    int-to-float v3, p1

    int-to-float v4, p2

    move-object v0, p3

    move v2, v1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 353
    return-void
.end method


# virtual methods
.method protected finalize()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 825
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 826
    const-string v0, "CropImage"

    const-string v1, "FINALIZED"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 827
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 12
    .parameter "icicle"

    .prologue
    const/4 v10, 0x1

    .line 357
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 358
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/CropImage;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    iput-object v8, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mContentResolver:Landroid/content/ContentResolver;

    .line 360
    invoke-virtual {p0, v10}, Lcom/nloko/android/syncmypix/graphics/CropImage;->requestWindowFeature(I)Z

    .line 361
    const v8, 0x7f030001

    invoke-virtual {p0, v8}, Lcom/nloko/android/syncmypix/graphics/CropImage;->setContentView(I)V

    .line 363
    const v8, 0x7f070008

    invoke-virtual {p0, v8}, Lcom/nloko/android/syncmypix/graphics/CropImage;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;

    iput-object v8, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mImageView:Lcom/nloko/android/syncmypix/graphics/CropImage$CropImageView;

    .line 368
    :try_start_0
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/CropImage;->getIntent()Landroid/content/Intent;

    move-result-object v6

    .line 369
    .local v6, intent:Landroid/content/Intent;
    invoke-virtual {v6}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v4

    .line 372
    .local v4, extras:Landroid/os/Bundle;
    if-eqz v4, :cond_3

    .line 373
    invoke-virtual {v4}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    goto :goto_0

    .line 377
    :cond_0
    const-string v8, "circleCrop"

    invoke-virtual {v4, v8}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_1

    .line 378
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mCircleCrop:Z

    .line 379
    const/4 v8, 0x1

    iput v8, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mAspectX:I

    .line 380
    const/4 v8, 0x1

    iput v8, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mAspectY:I

    .line 382
    :cond_1
    const-string v8, "output"

    invoke-virtual {v4, v8}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v8

    check-cast v8, Landroid/net/Uri;

    iput-object v8, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mSaveUri:Landroid/net/Uri;

    .line 383
    iget-object v8, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mSaveUri:Landroid/net/Uri;

    if-eqz v8, :cond_2

    .line 384
    const-string v8, "outputFormat"

    invoke-virtual {v4, v8}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 385
    .local v0, compressFormatString:Ljava/lang/String;
    if-eqz v0, :cond_2

    .line 386
    invoke-static {v0}, Landroid/graphics/Bitmap$CompressFormat;->valueOf(Ljava/lang/String;)Landroid/graphics/Bitmap$CompressFormat;

    move-result-object v8

    iput-object v8, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mSaveFormat:Landroid/graphics/Bitmap$CompressFormat;

    .line 388
    .end local v0           #compressFormatString:Ljava/lang/String;
    :cond_2
    const-string v8, "data"

    invoke-virtual {v4, v8}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v8

    check-cast v8, Landroid/graphics/Bitmap;

    iput-object v8, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mBitmap:Landroid/graphics/Bitmap;

    .line 389
    const-string v8, "aspectX"

    invoke-virtual {v4, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v8

    iput v8, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mAspectX:I

    .line 390
    const-string v8, "aspectY"

    invoke-virtual {v4, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v8

    iput v8, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mAspectY:I

    .line 391
    const-string v8, "outputX"

    invoke-virtual {v4, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v8

    iput v8, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mOutputX:I

    .line 392
    const-string v8, "outputY"

    invoke-virtual {v4, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v8

    iput v8, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mOutputY:I

    .line 393
    const-string v8, "scale"

    const/4 v9, 0x1

    invoke-virtual {v4, v8, v9}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    iput-boolean v8, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mScale:Z

    .line 394
    const-string v8, "scaleUpIfNeeded"

    const/4 v9, 0x1

    invoke-virtual {v4, v8, v9}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    iput-boolean v8, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mScaleUp:Z

    .line 395
    const-string v8, "noFaceDetection"

    invoke-virtual {v4, v8}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_6

    const-string v8, "noFaceDetection"

    invoke-virtual {v4, v8}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_5

    move v8, v10

    :goto_1
    iput-boolean v8, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mDoFaceDetection:Z

    .line 398
    .end local v5           #i$:Ljava/util/Iterator;
    :cond_3
    iget-object v8, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mBitmap:Landroid/graphics/Bitmap;

    if-nez v8, :cond_4

    .line 399
    invoke-virtual {v6}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    .line 400
    .local v1, contact:Landroid/net/Uri;
    invoke-virtual {v1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v7

    .line 401
    .local v7, segments:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v8

    sub-int/2addr v8, v10

    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 402
    .local v2, contactId:Ljava/lang/String;
    new-instance v8, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;

    invoke-direct {v8}, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;-><init>()V

    iget-object v9, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mContentResolver:Landroid/content/ContentResolver;

    invoke-virtual {v8, v9, v2}, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;->getPhoto(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v8

    invoke-static {v8}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v8

    iput-object v8, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mBitmap:Landroid/graphics/Bitmap;

    .line 419
    .end local v1           #contact:Landroid/net/Uri;
    .end local v2           #contactId:Ljava/lang/String;
    .end local v7           #segments:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    :cond_4
    iget-object v8, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mBitmap:Landroid/graphics/Bitmap;

    if-nez v8, :cond_7

    .line 420
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/CropImage;->finish()V

    .line 666
    .end local v4           #extras:Landroid/os/Bundle;
    .end local v6           #intent:Landroid/content/Intent;
    :goto_2
    return-void

    .line 395
    .restart local v4       #extras:Landroid/os/Bundle;
    .restart local v5       #i$:Ljava/util/Iterator;
    .restart local v6       #intent:Landroid/content/Intent;
    :cond_5
    const/4 v8, 0x0

    goto :goto_1

    :cond_6
    move v8, v10

    goto :goto_1

    .line 424
    .end local v5           #i$:Ljava/util/Iterator;
    :cond_7
    iget-object v8, p0, Lcom/nloko/android/syncmypix/graphics/CropImage;->mHandler:Landroid/os/Handler;

    new-instance v9, Lcom/nloko/android/syncmypix/graphics/CropImage$1;

    invoke-direct {v9, p0}, Lcom/nloko/android/syncmypix/graphics/CropImage$1;-><init>(Lcom/nloko/android/syncmypix/graphics/CropImage;)V

    const-wide/16 v10, 0x64

    invoke-virtual {v8, v9, v10, v11}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 464
    .end local v4           #extras:Landroid/os/Bundle;
    .end local v6           #intent:Landroid/content/Intent;
    :goto_3
    const v8, 0x7f07000a

    invoke-virtual {p0, v8}, Lcom/nloko/android/syncmypix/graphics/CropImage;->findViewById(I)Landroid/view/View;

    move-result-object v8

    new-instance v9, Lcom/nloko/android/syncmypix/graphics/CropImage$2;

    invoke-direct {v9, p0}, Lcom/nloko/android/syncmypix/graphics/CropImage$2;-><init>(Lcom/nloko/android/syncmypix/graphics/CropImage;)V

    invoke-virtual {v8, v9}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 471
    const v8, 0x7f070009

    invoke-virtual {p0, v8}, Lcom/nloko/android/syncmypix/graphics/CropImage;->findViewById(I)Landroid/view/View;

    move-result-object v8

    new-instance v9, Lcom/nloko/android/syncmypix/graphics/CropImage$3;

    invoke-direct {v9, p0}, Lcom/nloko/android/syncmypix/graphics/CropImage$3;-><init>(Lcom/nloko/android/syncmypix/graphics/CropImage;)V

    invoke-virtual {v8, v9}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_2

    .line 459
    :catch_0
    move-exception v8

    move-object v3, v8

    .line 460
    .local v3, e:Ljava/lang/Exception;
    const-string v8, "CropImage"

    const-string v9, "Failed to load bitmap"

    invoke-static {v8, v9, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 461
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/graphics/CropImage;->finish()V

    goto :goto_3
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 1
    .parameter "menu"

    .prologue
    .line 90
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateOptionsMenu(Landroid/view/Menu;)Z

    move-result v0

    return v0
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 831
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 832
    const-string v0, "CropImage"

    const-string v1, "onDestroy"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 833
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 670
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 671
    return-void
.end method

.method public onStop()V
    .locals 0

    .prologue
    .line 817
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/graphics/CropImage;->closeProgressDialog()V

    .line 818
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 821
    return-void
.end method

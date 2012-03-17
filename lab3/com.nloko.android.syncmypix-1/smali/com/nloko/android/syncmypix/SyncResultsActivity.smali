.class public Lcom/nloko/android/syncmypix/SyncResultsActivity;
.super Landroid/app/Activity;
.source "SyncResultsActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nloko/android/syncmypix/SyncResultsActivity$ResultsListAdapter;,
        Lcom/nloko/android/syncmypix/SyncResultsActivity$DownloadImageHandler;,
        Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;,
        Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;,
        Lcom/nloko/android/syncmypix/SyncResultsActivity$MainHandler;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "SyncResults"


# instance fields
.field private final CONTEXTMENU_CROP:I

.field private final CONTEXTMENU_SELECT_CONTACT:I

.field private final CONTEXTMENU_UNLINK:I

.field private final CONTEXTMENU_VIEW_CONTACT:I

.field private final DELETE_DIALOG:I

.field private final DELETING:I

.field private final HELP_DIALOG:I

.field private final MENU_FILTER:I

.field private final MENU_FILTER_ALL:I

.field private final MENU_FILTER_ERROR:I

.field private final MENU_FILTER_NOTFOUND:I

.field private final MENU_FILTER_SKIPPED:I

.field private final MENU_FILTER_UPDATED:I

.field private final PICK_CONTACT:I

.field private final REQUEST_CROP_PHOTO:I

.field private final UPDATE_CONTACT:I

.field private final ZOOM_PIC:I

.field private final mCache:Lcom/nloko/android/ThumbnailCache;

.field private mContactImage:Landroid/graphics/Bitmap;

.field private mContactUtils:Lcom/nloko/android/syncmypix/contactutils/ContactUtils;

.field private mDbHelper:Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;

.field private mDeleteButton:Landroid/widget/ImageButton;

.field private mDownloadHandler:Lcom/nloko/android/syncmypix/SyncResultsActivity$DownloadImageHandler;

.field private mHelpButton:Landroid/widget/ImageButton;

.field private mHomeButton:Landroid/widget/ImageButton;

.field private mInitResultsThread:Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;

.field private mListview:Landroid/widget/ListView;

.field private mMainHandler:Landroid/os/Handler;

.field private mProgress:Landroid/widget/ProgressBar;

.field private final mProjection:[Ljava/lang/String;

.field private mSdCache:Lcom/nloko/android/PhotoCache;

.field private mThumbnailHandler:Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;

.field private mUriOfSelected:Landroid/net/Uri;


# direct methods
.method public constructor <init>()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x5

    const/4 v5, 0x4

    const/4 v4, 0x3

    const/4 v3, 0x6

    .line 88
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 99
    new-instance v0, Lcom/nloko/android/ThumbnailCache;

    invoke-direct {v0}, Lcom/nloko/android/ThumbnailCache;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mCache:Lcom/nloko/android/ThumbnailCache;

    .line 107
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mUriOfSelected:Landroid/net/Uri;

    .line 109
    iput v7, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->MENU_FILTER:I

    .line 110
    const/4 v0, 0x2

    iput v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->MENU_FILTER_ALL:I

    .line 111
    iput v4, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->MENU_FILTER_NOTFOUND:I

    .line 112
    iput v5, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->MENU_FILTER_UPDATED:I

    .line 113
    iput v6, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->MENU_FILTER_SKIPPED:I

    .line 114
    iput v3, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->MENU_FILTER_ERROR:I

    .line 117
    iput v7, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->ZOOM_PIC:I

    .line 118
    iput v4, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->UPDATE_CONTACT:I

    .line 119
    iput v5, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->HELP_DIALOG:I

    .line 120
    iput v6, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->DELETE_DIALOG:I

    .line 121
    iput v3, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->DELETING:I

    .line 125
    iput v4, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->CONTEXTMENU_CROP:I

    .line 126
    iput v5, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->CONTEXTMENU_SELECT_CONTACT:I

    .line 127
    iput v6, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->CONTEXTMENU_VIEW_CONTACT:I

    .line 128
    iput v3, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->CONTEXTMENU_UNLINK:I

    .line 130
    iput v3, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->PICK_CONTACT:I

    .line 131
    const/4 v0, 0x7

    iput v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->REQUEST_CROP_PHOTO:I

    .line 133
    const/4 v0, 0x7

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "_id"

    aput-object v2, v0, v1

    const-string v1, "name"

    aput-object v1, v0, v7

    const/4 v1, 0x2

    const-string v2, "description"

    aput-object v2, v0, v1

    const-string v1, "pic_url"

    aput-object v1, v0, v4

    const-string v1, "contact_id"

    aput-object v1, v0, v5

    const-string v1, "date_started"

    aput-object v1, v0, v6

    const-string v1, "date_completed"

    aput-object v1, v0, v3

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mProjection:[Ljava/lang/String;

    .line 1337
    return-void
.end method

.method static synthetic access$000(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 88
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mThumbnailHandler:Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;

    return-object v0
.end method

.method static synthetic access$100(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Landroid/widget/ListView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 88
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mListview:Landroid/widget/ListView;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/nloko/android/syncmypix/SyncResultsActivity;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->crop(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 88
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mMainHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/PhotoCache;
    .locals 1
    .parameter "x0"

    .prologue
    .line 88
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mSdCache:Lcom/nloko/android/PhotoCache;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/nloko/android/syncmypix/SyncResultsActivity;)[Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 88
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mProjection:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/ThumbnailCache;
    .locals 1
    .parameter "x0"

    .prologue
    .line 88
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mCache:Lcom/nloko/android/ThumbnailCache;

    return-object v0
.end method

.method static synthetic access$300(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Landroid/widget/ProgressBar;
    .locals 1
    .parameter "x0"

    .prologue
    .line 88
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mProgress:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method static synthetic access$400(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/syncmypix/SyncResultsActivity$DownloadImageHandler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 88
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mDownloadHandler:Lcom/nloko/android/syncmypix/SyncResultsActivity$DownloadImageHandler;

    return-object v0
.end method

.method static synthetic access$502(Lcom/nloko/android/syncmypix/SyncResultsActivity;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 88
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mContactImage:Landroid/graphics/Bitmap;

    return-object p1
.end method

.method static synthetic access$600(Lcom/nloko/android/syncmypix/SyncResultsActivity;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->unlink(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$700(Lcom/nloko/android/syncmypix/SyncResultsActivity;Ljava/lang/String;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 88
    invoke-direct {p0, p1, p2}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->unlink(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic access$800(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/syncmypix/contactutils/ContactUtils;
    .locals 1
    .parameter "x0"

    .prologue
    .line 88
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mContactUtils:Lcom/nloko/android/syncmypix/contactutils/ContactUtils;

    return-object v0
.end method

.method static synthetic access$900(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;
    .locals 1
    .parameter "x0"

    .prologue
    .line 88
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mDbHelper:Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;

    return-object v0
.end method

.method private crop(Ljava/lang/String;)V
    .locals 5
    .parameter "id"

    .prologue
    const/16 v4, 0x60

    const/4 v3, 0x1

    .line 579
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.android.camera.action.CROP"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 581
    .local v0, intent:Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/nloko/android/syncmypix/graphics/CropImage;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 582
    sget-object v1, Landroid/provider/Contacts$People;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v1, p1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 583
    const-string v1, "crop"

    const-string v2, "true"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 584
    const-string v1, "aspectX"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 585
    const-string v1, "aspectY"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 586
    const-string v1, "outputX"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 587
    const-string v1, "outputY"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 588
    const-string v1, "return-data"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 589
    const/4 v1, 0x7

    invoke-virtual {p0, v0, v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 590
    return-void
.end method

.method private getResultsUriFromListPosition(I)Landroid/net/Uri;
    .locals 3
    .parameter "pos"

    .prologue
    .line 566
    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mListview:Landroid/widget/ListView;

    invoke-virtual {v2}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p0

    .end local p0
    check-cast p0, Landroid/widget/SimpleCursorAdapter;

    invoke-virtual {p0}, Landroid/widget/SimpleCursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 568
    .local v0, cursor:Landroid/database/Cursor;
    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 569
    const-string v2, "_id"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 570
    .local v1, id:Ljava/lang/String;
    sget-object v2, Lcom/nloko/android/syncmypix/SyncMyPix$Results;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v2, v1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 573
    .end local v1           #id:Ljava/lang/String;
    :goto_0
    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private showZoomDialog()Landroid/app/Dialog;
    .locals 15

    .prologue
    const/16 v14, 0xf

    const/4 v13, 0x1

    .line 750
    new-instance v11, Landroid/app/Dialog;

    invoke-direct {v11, p0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 751
    .local v11, zoomedDialog:Landroid/app/Dialog;
    invoke-virtual {v11, v13}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    .line 752
    const v12, 0x7f03000a

    invoke-virtual {v11, v12}, Landroid/app/Dialog;->setContentView(I)V

    .line 753
    invoke-virtual {v11, v13}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 755
    const v12, 0x7f070008

    invoke-virtual {v11, v12}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 757
    .local v1, image:Landroid/widget/ImageView;
    const/16 v5, 0xf

    .line 759
    .local v5, padding:I
    iget-object v12, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mContactImage:Landroid/graphics/Bitmap;

    invoke-virtual {v12}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    .line 760
    .local v8, width:I
    iget-object v12, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mContactImage:Landroid/graphics/Bitmap;

    invoke-virtual {v12}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    .line 762
    .local v0, height:I
    move v4, v8

    .line 763
    .local v4, newWidth:I
    move v3, v0

    .line 765
    .local v3, newHeight:I
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v12

    invoke-interface {v12}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v12

    invoke-virtual {v12}, Landroid/view/Display;->getHeight()I

    move-result v9

    .line 766
    .local v9, windowHeight:I
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v12

    invoke-interface {v12}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v12

    invoke-virtual {v12}, Landroid/view/Display;->getWidth()I

    move-result v10

    .line 768
    .local v10, windowWidth:I
    const/4 v7, 0x0

    .line 771
    .local v7, scale:Z
    if-lt v3, v9, :cond_0

    .line 772
    int-to-float v12, v4

    int-to-float v13, v3

    div-float v6, v12, v13

    .line 773
    .local v6, ratio:F
    sub-int v3, v9, v14

    .line 774
    int-to-float v12, v3

    mul-float/2addr v12, v6

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v4

    .line 776
    const/4 v7, 0x1

    .line 779
    .end local v6           #ratio:F
    :cond_0
    if-lt v4, v10, :cond_1

    .line 780
    int-to-float v12, v3

    int-to-float v13, v4

    div-float v6, v12, v13

    .line 781
    .restart local v6       #ratio:F
    sub-int v4, v10, v14

    .line 782
    int-to-float v12, v4

    mul-float/2addr v12, v6

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v3

    .line 784
    const/4 v7, 0x1

    .line 787
    .end local v6           #ratio:F
    :cond_1
    iget-object v12, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mContactImage:Landroid/graphics/Bitmap;

    invoke-virtual {v1, v12}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 789
    if-eqz v7, :cond_2

    .line 790
    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    .line 791
    .local v2, m:Landroid/graphics/Matrix;
    int-to-float v12, v4

    int-to-float v13, v8

    div-float/2addr v12, v13

    int-to-float v13, v3

    int-to-float v14, v0

    div-float/2addr v13, v14

    invoke-virtual {v2, v12, v13}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 792
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 794
    invoke-virtual {v11}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v12

    invoke-virtual {v12, v4, v3}, Landroid/view/Window;->setLayout(II)V

    .line 797
    .end local v2           #m:Landroid/graphics/Matrix;
    :cond_2
    new-instance v12, Lcom/nloko/android/syncmypix/SyncResultsActivity$10;

    invoke-direct {v12, p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$10;-><init>(Lcom/nloko/android/syncmypix/SyncResultsActivity;)V

    invoke-virtual {v11, v12}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 803
    return-object v11
.end method

.method private unlink(Ljava/lang/String;)V
    .locals 1
    .parameter "id"

    .prologue
    .line 724
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->unlink(Ljava/lang/String;Z)V

    .line 725
    return-void
.end method

.method private unlink(Ljava/lang/String;Z)V
    .locals 6
    .parameter "id"
    .parameter "purge"

    .prologue
    const/4 v5, 0x0

    .line 729
    if-nez p1, :cond_1

    .line 746
    :cond_0
    :goto_0
    return-void

    .line 733
    :cond_1
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 734
    .local v0, resolver:Landroid/content/ContentResolver;
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 735
    .local v1, values:Landroid/content/ContentValues;
    const-string v2, "description"

    const v3, 0x7f060050

    invoke-virtual {p0, v3}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 736
    const-string v2, "contact_id"

    invoke-virtual {v1, v2}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    .line 737
    sget-object v2, Lcom/nloko/android/syncmypix/SyncMyPix$Results;->CONTENT_URI:Landroid/net/Uri;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "contact_id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v1, v3, v5}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 742
    if-eqz p2, :cond_0

    .line 743
    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mDbHelper:Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;

    invoke-virtual {v2, p1}, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->deletePicture(Ljava/lang/String;)V

    .line 744
    sget-object v2, Lcom/nloko/android/syncmypix/SyncMyPix$Contacts;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v2, p1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v2, v5, v5}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0
.end method

.method private updateContactWithSelection(Landroid/net/Uri;)V
    .locals 22
    .parameter "contact"

    .prologue
    .line 599
    if-eqz p1, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mUriOfSelected:Landroid/net/Uri;

    move-object v4, v0

    if-nez v4, :cond_1

    .line 600
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f060045

    const/4 v6, 0x1

    invoke-static {v4, v5, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    .line 720
    :goto_0
    return-void

    .line 606
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    .line 607
    .local v3, resolver:Landroid/content/ContentResolver;
    move-object/from16 v17, p1

    .line 608
    .local v17, contactUri:Landroid/net/Uri;
    invoke-virtual/range {v17 .. v17}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v20

    .line 609
    .local v20, segments:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface/range {v20 .. v20}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x1

    sub-int/2addr v4, v5

    move-object/from16 v0, v20

    move v1, v4

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 610
    .local v9, contactId:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mContactUtils:Lcom/nloko/android/syncmypix/contactutils/ContactUtils;

    move-object v4, v0

    move-object v0, v4

    move-object v1, v3

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;->getLookup(Landroid/content/ContentResolver;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v12

    .line 612
    .local v12, lookup:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mUriOfSelected:Landroid/net/Uri;

    move-object v4, v0

    const/4 v5, 0x5

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "_id"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "contact_id"

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-string v7, "pic_url"

    aput-object v7, v5, v6

    const/4 v6, 0x3

    const-string v7, "friend_id"

    aput-object v7, v5, v6

    const/4 v6, 0x4

    const-string v7, "source"

    aput-object v7, v5, v6

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v18

    .line 622
    .local v18, cursor:Landroid/database/Cursor;
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 623
    new-instance v19, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;

    invoke-virtual/range {p0 .. p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    move-object/from16 v0, v19

    move-object v1, v4

    invoke-direct {v0, v1}, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;-><init>(Landroid/content/Context;)V

    .line 626
    .local v19, prefs:Lcom/nloko/android/syncmypix/SyncMyPixPreferences;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mContactUtils:Lcom/nloko/android/syncmypix/contactutils/ContactUtils;

    move-object v4, v0

    invoke-virtual {v4, v3, v9}, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;->isContactUpdatable(Landroid/content/ContentResolver;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    invoke-virtual/range {v19 .. v19}, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->overrideReadOnlyCheck()Z

    move-result v4

    if-nez v4, :cond_2

    .line 627
    invoke-virtual/range {p0 .. p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f06003b

    const/4 v6, 0x1

    invoke-static {v4, v5, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 633
    :cond_2
    const/4 v4, 0x3

    move-object/from16 v0, p0

    move v1, v4

    invoke-virtual {v0, v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->showDialog(I)V

    .line 635
    const-string v4, "_id"

    move-object/from16 v0, v18

    move-object v1, v4

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    move-object/from16 v0, v18

    move v1, v4

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v15

    .line 636
    .local v15, id:J
    const-string v4, "pic_url"

    move-object/from16 v0, v18

    move-object v1, v4

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    move-object/from16 v0, v18

    move v1, v4

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 637
    .local v6, url:Ljava/lang/String;
    const-string v4, "friend_id"

    move-object/from16 v0, v18

    move-object v1, v4

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    move-object/from16 v0, v18

    move v1, v4

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 638
    .local v13, friendId:Ljava/lang/String;
    const-string v4, "source"

    move-object/from16 v0, v18

    move-object v1, v4

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    move-object/from16 v0, v18

    move v1, v4

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 639
    .local v14, source:Ljava/lang/String;
    const-string v4, "contact_id"

    move-object/from16 v0, v18

    move-object v1, v4

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    move-object/from16 v0, v18

    move v1, v4

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 641
    .local v10, oldContactId:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mSdCache:Lcom/nloko/android/PhotoCache;

    move-object v7, v0

    .line 643
    .local v7, sdCache:Lcom/nloko/android/PhotoCache;
    new-instance v21, Ljava/lang/Thread;

    new-instance v4, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;

    move-object/from16 v5, p0

    move-object/from16 v8, v17

    move-object v11, v3

    invoke-direct/range {v4 .. v16}, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;-><init>(Lcom/nloko/android/syncmypix/SyncResultsActivity;Ljava/lang/String;Lcom/nloko/android/PhotoCache;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    move-object/from16 v0, v21

    move-object v1, v4

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 716
    .local v21, thread:Ljava/lang/Thread;
    invoke-virtual/range {v21 .. v21}, Ljava/lang/Thread;->start()V

    .line 719
    .end local v6           #url:Ljava/lang/String;
    .end local v7           #sdCache:Lcom/nloko/android/PhotoCache;
    .end local v10           #oldContactId:Ljava/lang/String;
    .end local v13           #friendId:Ljava/lang/String;
    .end local v14           #source:Ljava/lang/String;
    .end local v15           #id:J
    .end local v19           #prefs:Lcom/nloko/android/syncmypix/SyncMyPixPreferences;
    .end local v21           #thread:Ljava/lang/Thread;
    :cond_3
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->close()V

    goto/16 :goto_0
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
    .line 333
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 334
    const-string v0, "SyncResults"

    const-string v1, "FINALIZED"

    invoke-static {v0, v1}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 335
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 16
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 514
    invoke-super/range {p0 .. p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 515
    const/4 v3, -0x1

    move/from16 v0, p2

    move v1, v3

    if-eq v0, v1, :cond_1

    .line 562
    :cond_0
    :goto_0
    return-void

    .line 521
    :cond_1
    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 523
    :pswitch_0
    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v11

    .line 524
    .local v11, contactData:Landroid/net/Uri;
    move-object/from16 v0, p0

    move-object v1, v11

    invoke-direct {v0, v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->updateContactWithSelection(Landroid/net/Uri;)V

    goto :goto_0

    .line 529
    .end local v11           #contactData:Landroid/net/Uri;
    :pswitch_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mUriOfSelected:Landroid/net/Uri;

    move-object v3, v0

    if-eqz v3, :cond_0

    .line 533
    invoke-virtual/range {p0 .. p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 534
    .local v2, resolver:Landroid/content/ContentResolver;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mUriOfSelected:Landroid/net/Uri;

    move-object v3, v0

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "contact_id"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string v6, "pic_url"

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-string v6, "lookup_key"

    aput-object v6, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v12

    .line 540
    .local v12, cursor:Landroid/database/Cursor;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mListview:Landroid/widget/ListView;

    move-object v3, v0

    invoke-virtual {v3}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v8

    check-cast v8, Lcom/nloko/android/syncmypix/SyncResultsActivity$ResultsListAdapter;

    .line 542
    .local v8, adapter:Lcom/nloko/android/syncmypix/SyncResultsActivity$ResultsListAdapter;
    invoke-interface {v12}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 543
    const-string v3, "contact_id"

    invoke-interface {v12, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v12, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 544
    .local v13, id:Ljava/lang/String;
    const-string v3, "pic_url"

    invoke-interface {v12, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v12, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 545
    .local v15, url:Ljava/lang/String;
    const-string v3, "lookup_key"

    invoke-interface {v12, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v12, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 547
    .local v14, lookup:Ljava/lang/String;
    const-string v3, "data"

    move-object/from16 v0, p3

    move-object v1, v3

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v9

    check-cast v9, Landroid/graphics/Bitmap;

    .line 548
    .local v9, bitmap:Landroid/graphics/Bitmap;
    if-eqz v9, :cond_2

    .line 549
    invoke-static {v9}, Lcom/nloko/android/Utils;->bitmapToPNG(Landroid/graphics/Bitmap;)[B

    move-result-object v10

    .line 551
    .local v10, bytes:[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mContactUtils:Lcom/nloko/android/syncmypix/contactutils/ContactUtils;

    move-object v3, v0

    invoke-virtual/range {p0 .. p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-virtual {v3, v4, v10, v13}, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;->updatePhoto(Landroid/content/ContentResolver;[BLjava/lang/String;)V

    .line 552
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mDbHelper:Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;

    move-object v3, v0

    const/4 v4, 0x0

    invoke-virtual {v3, v13, v14, v4, v10}, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->updateHashes(Ljava/lang/String;Ljava/lang/String;[B[B)V

    .line 554
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mCache:Lcom/nloko/android/ThumbnailCache;

    move-object v3, v0

    invoke-virtual {v3, v15, v9}, Lcom/nloko/android/ThumbnailCache;->add(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 555
    invoke-virtual {v8}, Lcom/nloko/android/syncmypix/SyncResultsActivity$ResultsListAdapter;->notifyDataSetChanged()V

    .line 559
    .end local v9           #bitmap:Landroid/graphics/Bitmap;
    .end local v10           #bytes:[B
    .end local v13           #id:Ljava/lang/String;
    .end local v14           #lookup:Ljava/lang/String;
    .end local v15           #url:Ljava/lang/String;
    :cond_2
    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    goto/16 :goto_0

    .line 521
    nop

    :pswitch_data_0
    .packed-switch 0x6
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 8
    .parameter "item"

    .prologue
    const/4 v7, 0x1

    .line 453
    invoke-interface {p1}, Landroid/view/MenuItem;->getMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;

    move-result-object v3

    check-cast v3, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .line 460
    .local v3, menuInfo:Landroid/widget/AdapterView$AdapterContextMenuInfo;
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v5

    packed-switch v5, :pswitch_data_0

    .line 509
    invoke-super {p0, p1}, Landroid/app/Activity;->onContextItemSelected(Landroid/view/MenuItem;)Z

    move-result v5

    :goto_0
    return v5

    .line 462
    :pswitch_0
    iget v4, v3, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    .line 463
    .local v4, position:I
    iget-object v5, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mListview:Landroid/widget/ListView;

    invoke-virtual {v5}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v5

    check-cast v5, Landroid/widget/SimpleCursorAdapter;

    invoke-virtual {v5}, Landroid/widget/SimpleCursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 465
    .local v0, cursor:Landroid/database/Cursor;
    invoke-interface {v0, v4}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 466
    const-string v5, "contact_id"

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 467
    .local v1, id:Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 468
    new-instance v2, Landroid/content/Intent;

    const-string v5, "android.intent.action.VIEW"

    iget-object v6, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mContactUtils:Lcom/nloko/android/syncmypix/contactutils/ContactUtils;

    invoke-virtual {v6}, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;->getContentUri()Landroid/net/Uri;

    move-result-object v6

    invoke-static {v6, v1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-direct {v2, v5, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 469
    .local v2, intent:Landroid/content/Intent;
    invoke-virtual {p0, v2}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->startActivity(Landroid/content/Intent;)V

    .end local v1           #id:Ljava/lang/String;
    .end local v2           #intent:Landroid/content/Intent;
    :cond_0
    move v5, v7

    .line 473
    goto :goto_0

    .line 476
    .end local v0           #cursor:Landroid/database/Cursor;
    .end local v4           #position:I
    :pswitch_1
    iget v4, v3, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    .line 477
    .restart local v4       #position:I
    invoke-direct {p0, v4}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getResultsUriFromListPosition(I)Landroid/net/Uri;

    move-result-object v5

    iput-object v5, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mUriOfSelected:Landroid/net/Uri;

    .line 479
    new-instance v2, Landroid/content/Intent;

    const-string v5, "android.intent.action.PICK"

    iget-object v6, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mContactUtils:Lcom/nloko/android/syncmypix/contactutils/ContactUtils;

    invoke-virtual {v6}, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;->getContentUri()Landroid/net/Uri;

    move-result-object v6

    invoke-direct {v2, v5, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 480
    .restart local v2       #intent:Landroid/content/Intent;
    const/4 v5, 0x6

    invoke-virtual {p0, v2, v5}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->startActivityForResult(Landroid/content/Intent;I)V

    move v5, v7

    .line 481
    goto :goto_0

    .line 484
    .end local v2           #intent:Landroid/content/Intent;
    .end local v4           #position:I
    :pswitch_2
    iget v4, v3, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    .line 485
    .restart local v4       #position:I
    invoke-direct {p0, v4}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getResultsUriFromListPosition(I)Landroid/net/Uri;

    move-result-object v5

    iput-object v5, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mUriOfSelected:Landroid/net/Uri;

    .line 487
    iget-object v5, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mListview:Landroid/widget/ListView;

    invoke-virtual {v5}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v5

    check-cast v5, Landroid/widget/SimpleCursorAdapter;

    invoke-virtual {v5}, Landroid/widget/SimpleCursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 488
    .restart local v0       #cursor:Landroid/database/Cursor;
    invoke-interface {v0, v4}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 489
    const-string v5, "contact_id"

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 490
    .restart local v1       #id:Ljava/lang/String;
    iget-object v5, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mContactUtils:Lcom/nloko/android/syncmypix/contactutils/ContactUtils;

    invoke-virtual {v5}, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;->getContentUri()Landroid/net/Uri;

    move-result-object v5

    invoke-static {v5, v1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->updateContactWithSelection(Landroid/net/Uri;)V

    .end local v1           #id:Ljava/lang/String;
    :cond_1
    move v5, v7

    .line 494
    goto/16 :goto_0

    .line 497
    .end local v0           #cursor:Landroid/database/Cursor;
    .end local v4           #position:I
    :pswitch_3
    iget v4, v3, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    .line 498
    .restart local v4       #position:I
    invoke-direct {p0, v4}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getResultsUriFromListPosition(I)Landroid/net/Uri;

    move-result-object v5

    iput-object v5, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mUriOfSelected:Landroid/net/Uri;

    .line 500
    iget-object v5, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mListview:Landroid/widget/ListView;

    invoke-virtual {v5}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v5

    check-cast v5, Landroid/widget/SimpleCursorAdapter;

    invoke-virtual {v5}, Landroid/widget/SimpleCursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 501
    .restart local v0       #cursor:Landroid/database/Cursor;
    invoke-interface {v0, v4}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 502
    const-string v5, "contact_id"

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 503
    .restart local v1       #id:Ljava/lang/String;
    invoke-direct {p0, v1, v7}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->unlink(Ljava/lang/String;Z)V

    .end local v1           #id:Ljava/lang/String;
    :cond_2
    move v5, v7

    .line 506
    goto/16 :goto_0

    .line 460
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 9
    .parameter "savedInstanceState"

    .prologue
    const/4 v3, 0x0

    const/4 v8, 0x2

    const/4 v7, 0x0

    .line 144
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 145
    const v1, 0x7f030005

    invoke-virtual {p0, v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->setContentView(I)V

    .line 147
    new-instance v1, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;

    invoke-direct {v1}, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;-><init>()V

    iput-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mContactUtils:Lcom/nloko/android/syncmypix/contactutils/ContactUtils;

    .line 149
    new-instance v1, Lcom/nloko/android/PhotoCache;

    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/nloko/android/PhotoCache;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mSdCache:Lcom/nloko/android/PhotoCache;

    .line 150
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020006

    invoke-static {v1, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v6

    .line 152
    .local v6, defaultImage:Landroid/graphics/Bitmap;
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mCache:Lcom/nloko/android/ThumbnailCache;

    invoke-virtual {v1, v6}, Lcom/nloko/android/ThumbnailCache;->setDefaultImage(Landroid/graphics/Bitmap;)V

    .line 154
    new-instance v1, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;

    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mDbHelper:Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;

    .line 156
    sget-object v1, Lcom/nloko/android/syncmypix/SyncMyPix$Results;->CONTENT_URI:Landroid/net/Uri;

    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mProjection:[Ljava/lang/String;

    const-string v5, "name ASC"

    move-object v0, p0

    move-object v4, v3

    invoke-virtual/range {v0 .. v5}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->managedQuery(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3

    .line 158
    .local v3, cursor:Landroid/database/Cursor;
    const v1, 0x7f070035

    invoke-virtual {p0, v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    iput-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mProgress:Landroid/widget/ProgressBar;

    .line 159
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v7}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 160
    const v1, 0x7f070021

    invoke-virtual {p0, v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    iput-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mListview:Landroid/widget/ListView;

    .line 162
    new-instance v0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ResultsListAdapter;

    const v2, 0x7f030006

    new-array v4, v8, [Ljava/lang/String;

    const-string v1, "name"

    aput-object v1, v4, v7

    const/4 v1, 0x1

    const-string v5, "description"

    aput-object v5, v4, v1

    new-array v5, v8, [I

    fill-array-data v5, :array_0

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/nloko/android/syncmypix/SyncResultsActivity$ResultsListAdapter;-><init>(Lcom/nloko/android/syncmypix/SyncResultsActivity;ILandroid/database/Cursor;[Ljava/lang/String;[I)V

    .line 170
    .local v0, adapter:Landroid/widget/SimpleCursorAdapter;
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mListview:Landroid/widget/ListView;

    invoke-virtual {v1, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 172
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mCache:Lcom/nloko/android/ThumbnailCache;

    new-instance v2, Lcom/nloko/android/syncmypix/SyncResultsActivity$1;

    invoke-direct {v2, p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$1;-><init>(Lcom/nloko/android/syncmypix/SyncResultsActivity;)V

    invoke-virtual {v1, v2}, Lcom/nloko/android/ThumbnailCache;->setImageProvider(Lcom/nloko/android/ThumbnailCache$ImageProvider;)V

    .line 185
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mCache:Lcom/nloko/android/ThumbnailCache;

    new-instance v2, Lcom/nloko/android/syncmypix/SyncResultsActivity$2;

    invoke-direct {v2, p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$2;-><init>(Lcom/nloko/android/syncmypix/SyncResultsActivity;)V

    invoke-virtual {v1, v2}, Lcom/nloko/android/ThumbnailCache;->setImageListener(Lcom/nloko/android/ThumbnailCache$ImageListener;)V

    .line 206
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mListview:Landroid/widget/ListView;

    new-instance v2, Lcom/nloko/android/syncmypix/SyncResultsActivity$3;

    invoke-direct {v2, p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$3;-><init>(Lcom/nloko/android/syncmypix/SyncResultsActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    .line 214
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mListview:Landroid/widget/ListView;

    new-instance v2, Lcom/nloko/android/syncmypix/SyncResultsActivity$4;

    invoke-direct {v2, p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$4;-><init>(Lcom/nloko/android/syncmypix/SyncResultsActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 234
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mListview:Landroid/widget/ListView;

    new-instance v2, Lcom/nloko/android/syncmypix/SyncResultsActivity$5;

    invoke-direct {v2, p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$5;-><init>(Lcom/nloko/android/syncmypix/SyncResultsActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setOnCreateContextMenuListener(Landroid/view/View$OnCreateContextMenuListener;)V

    .line 261
    const v1, 0x7f070019

    invoke-virtual {p0, v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mHomeButton:Landroid/widget/ImageButton;

    .line 262
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mHomeButton:Landroid/widget/ImageButton;

    new-instance v2, Lcom/nloko/android/syncmypix/SyncResultsActivity$6;

    invoke-direct {v2, p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$6;-><init>(Lcom/nloko/android/syncmypix/SyncResultsActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 271
    const v1, 0x7f070018

    invoke-virtual {p0, v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mHelpButton:Landroid/widget/ImageButton;

    .line 272
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mHelpButton:Landroid/widget/ImageButton;

    new-instance v2, Lcom/nloko/android/syncmypix/SyncResultsActivity$7;

    invoke-direct {v2, p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$7;-><init>(Lcom/nloko/android/syncmypix/SyncResultsActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 279
    const v1, 0x7f070017

    invoke-virtual {p0, v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mDeleteButton:Landroid/widget/ImageButton;

    .line 280
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mDeleteButton:Landroid/widget/ImageButton;

    new-instance v2, Lcom/nloko/android/syncmypix/SyncResultsActivity$8;

    invoke-direct {v2, p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$8;-><init>(Lcom/nloko/android/syncmypix/SyncResultsActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 286
    new-instance v1, Lcom/nloko/android/syncmypix/SyncResultsActivity$MainHandler;

    invoke-direct {v1, p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$MainHandler;-><init>(Lcom/nloko/android/syncmypix/SyncResultsActivity;)V

    iput-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mMainHandler:Landroid/os/Handler;

    .line 287
    return-void

    .line 162
    nop

    :array_0
    .array-data 0x4
        0x24t 0x0t 0x7t 0x7ft
        0x23t 0x0t 0x7t 0x7ft
    .end array-data
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 7
    .parameter "id"

    .prologue
    const/4 v6, 0x0

    .line 808
    packed-switch p1, :pswitch_data_0

    .line 865
    :cond_0
    :pswitch_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateDialog(I)Landroid/app/Dialog;

    move-result-object v4

    :goto_0
    return-object v4

    .line 810
    :pswitch_1
    iget-object v4, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mContactImage:Landroid/graphics/Bitmap;

    if-eqz v4, :cond_0

    .line 811
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->showZoomDialog()Landroid/app/Dialog;

    move-result-object v4

    goto :goto_0

    .line 815
    :pswitch_2
    new-instance v3, Landroid/app/ProgressDialog;

    invoke-direct {v3, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 816
    .local v3, sync:Landroid/app/ProgressDialog;
    invoke-virtual {v3, v6}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 817
    const v4, 0x7f06003f

    invoke-virtual {p0, v4}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 818
    invoke-virtual {v3, v6}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    move-object v4, v3

    .line 819
    goto :goto_0

    .line 821
    .end local v3           #sync:Landroid/app/ProgressDialog;
    :pswitch_3
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 822
    .local v1, deleteBuilder:Landroid/app/AlertDialog$Builder;
    const v4, 0x7f060041

    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x1080027

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x7f060042

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    invoke-virtual {v4, v6}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const-string v5, "Yes"

    new-instance v6, Lcom/nloko/android/syncmypix/SyncResultsActivity$12;

    invoke-direct {v6, p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$12;-><init>(Lcom/nloko/android/syncmypix/SyncResultsActivity;)V

    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const-string v5, "No"

    new-instance v6, Lcom/nloko/android/syncmypix/SyncResultsActivity$11;

    invoke-direct {v6, p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$11;-><init>(Lcom/nloko/android/syncmypix/SyncResultsActivity;)V

    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 853
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .local v0, delete:Landroid/app/AlertDialog;
    move-object v4, v0

    .line 854
    goto :goto_0

    .line 857
    .end local v0           #delete:Landroid/app/AlertDialog;
    .end local v1           #deleteBuilder:Landroid/app/AlertDialog$Builder;
    :pswitch_4
    new-instance v2, Landroid/app/ProgressDialog;

    invoke-direct {v2, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 858
    .local v2, deleting:Landroid/app/ProgressDialog;
    invoke-virtual {v2, v6}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 859
    const v4, 0x7f060043

    invoke-virtual {p0, v4}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 860
    invoke-virtual {v2, v6}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    move-object v4, v2

    .line 861
    goto :goto_0

    .line 808
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 5
    .parameter "menu"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 410
    const v1, 0x7f06003c

    invoke-interface {p1, v3, v4, v3, v1}, Landroid/view/Menu;->addSubMenu(IIII)Landroid/view/SubMenu;

    move-result-object v0

    .line 411
    .local v0, options:Landroid/view/SubMenu;
    const/4 v1, 0x2

    const-string v2, "All"

    invoke-interface {v0, v3, v1, v3, v2}, Landroid/view/SubMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 412
    const/4 v1, 0x6

    const-string v2, "Errors"

    invoke-interface {v0, v3, v1, v3, v2}, Landroid/view/SubMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 413
    const/4 v1, 0x3

    const-string v2, "Not found"

    invoke-interface {v0, v3, v1, v3, v2}, Landroid/view/SubMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 414
    const/4 v1, 0x5

    const-string v2, "Skipped"

    invoke-interface {v0, v3, v1, v3, v2}, Landroid/view/SubMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 415
    const/4 v1, 0x4

    const-string v2, "Updated"

    invoke-interface {v0, v3, v1, v3, v2}, Landroid/view/SubMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 417
    const v1, 0x108009c

    invoke-interface {v0, v1}, Landroid/view/SubMenu;->setIcon(I)Landroid/view/SubMenu;

    .line 418
    return v4
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 394
    const-string v0, "SyncResults"

    const-string v1, "onDestroy"

    invoke-static {v0, v1}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 395
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 396
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mThumbnailHandler:Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;

    if-eqz v0, :cond_0

    .line 397
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mThumbnailHandler:Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;

    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->stopRunning()V

    .line 399
    :cond_0
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mCache:Lcom/nloko/android/ThumbnailCache;

    invoke-virtual {v0}, Lcom/nloko/android/ThumbnailCache;->destroy()V

    .line 401
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mSdCache:Lcom/nloko/android/PhotoCache;

    if-eqz v0, :cond_1

    .line 402
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mSdCache:Lcom/nloko/android/PhotoCache;

    invoke-virtual {v0}, Lcom/nloko/android/PhotoCache;->releaseResources()V

    .line 404
    :cond_1
    return-void
.end method

.method public onLowMemory()V
    .locals 1

    .prologue
    .line 361
    invoke-super {p0}, Landroid/app/Activity;->onLowMemory()V

    .line 363
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mCache:Lcom/nloko/android/ThumbnailCache;

    if-eqz v0, :cond_0

    .line 364
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mCache:Lcom/nloko/android/ThumbnailCache;

    invoke-virtual {v0}, Lcom/nloko/android/ThumbnailCache;->empty()V

    .line 366
    :cond_0
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 5
    .parameter "item"

    .prologue
    const/4 v4, 0x1

    .line 424
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mListview:Landroid/widget/ListView;

    invoke-virtual {v1}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Landroid/widget/SimpleCursorAdapter;

    .line 426
    .local v0, adapter:Landroid/widget/SimpleCursorAdapter;
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 448
    const/4 v1, 0x0

    :goto_0
    return v1

    .line 428
    :pswitch_0
    invoke-virtual {v0}, Landroid/widget/SimpleCursorAdapter;->getFilter()Landroid/widget/Filter;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/Filter;->filter(Ljava/lang/CharSequence;)V

    move v1, v4

    .line 429
    goto :goto_0

    .line 431
    :pswitch_1
    invoke-virtual {v0}, Landroid/widget/SimpleCursorAdapter;->getFilter()Landroid/widget/Filter;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const v3, 0x7f060057

    invoke-virtual {p0, v3}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\',"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const v3, 0x7f060056

    invoke-virtual {p0, v3}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Filter;->filter(Ljava/lang/CharSequence;)V

    move v1, v4

    .line 433
    goto :goto_0

    .line 435
    :pswitch_2
    invoke-virtual {v0}, Landroid/widget/SimpleCursorAdapter;->getFilter()Landroid/widget/Filter;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const v3, 0x7f060050

    invoke-virtual {p0, v3}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Filter;->filter(Ljava/lang/CharSequence;)V

    move v1, v4

    .line 436
    goto :goto_0

    .line 438
    :pswitch_3
    invoke-virtual {v0}, Landroid/widget/SimpleCursorAdapter;->getFilter()Landroid/widget/Filter;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const v3, 0x7f060051

    invoke-virtual {p0, v3}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\',"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const v3, 0x7f060055

    invoke-virtual {p0, v3}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Filter;->filter(Ljava/lang/CharSequence;)V

    move v1, v4

    .line 440
    goto/16 :goto_0

    .line 442
    :pswitch_4
    invoke-virtual {v0}, Landroid/widget/SimpleCursorAdapter;->getFilter()Landroid/widget/Filter;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const v3, 0x7f060052

    invoke-virtual {p0, v3}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\',"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const v3, 0x7f060054

    invoke-virtual {p0, v3}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\',"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const v3, 0x7f060053

    invoke-virtual {p0, v3}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Filter;->filter(Ljava/lang/CharSequence;)V

    move v1, v4

    .line 445
    goto/16 :goto_0

    .line 426
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_1
    .end packed-switch
.end method

.method protected onPause()V
    .locals 2

    .prologue
    .line 339
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 341
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mCache:Lcom/nloko/android/ThumbnailCache;

    if-eqz v0, :cond_0

    .line 342
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mCache:Lcom/nloko/android/ThumbnailCache;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/nloko/android/ThumbnailCache;->togglePauseOnDownloader(Z)V

    .line 343
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mCache:Lcom/nloko/android/ThumbnailCache;

    invoke-virtual {v0}, Lcom/nloko/android/ThumbnailCache;->empty()V

    .line 350
    :cond_0
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mDownloadHandler:Lcom/nloko/android/syncmypix/SyncResultsActivity$DownloadImageHandler;

    if-eqz v0, :cond_1

    .line 351
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mDownloadHandler:Lcom/nloko/android/syncmypix/SyncResultsActivity$DownloadImageHandler;

    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$DownloadImageHandler;->stopRunning()V

    .line 354
    :cond_1
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mInitResultsThread:Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;

    if-eqz v0, :cond_2

    .line 355
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mInitResultsThread:Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;

    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;->stopRunning()V

    .line 357
    :cond_2
    return-void
.end method

.method protected onResume()V
    .locals 5

    .prologue
    .line 370
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 371
    new-instance v0, Landroid/os/HandlerThread;

    const-string v3, "ImageDownload"

    invoke-direct {v0, v3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 372
    .local v0, downloadThread:Landroid/os/HandlerThread;
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 373
    new-instance v3, Lcom/nloko/android/syncmypix/SyncResultsActivity$DownloadImageHandler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-direct {v3, p0, v4}, Lcom/nloko/android/syncmypix/SyncResultsActivity$DownloadImageHandler;-><init>(Lcom/nloko/android/syncmypix/SyncResultsActivity;Landroid/os/Looper;)V

    iput-object v3, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mDownloadHandler:Lcom/nloko/android/syncmypix/SyncResultsActivity$DownloadImageHandler;

    .line 375
    iget-object v3, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mInitResultsThread:Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;

    if-nez v3, :cond_0

    .line 376
    new-instance v3, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;

    invoke-direct {v3, p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;-><init>(Lcom/nloko/android/syncmypix/SyncResultsActivity;)V

    iput-object v3, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mInitResultsThread:Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;

    .line 377
    iget-object v3, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mInitResultsThread:Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;

    invoke-virtual {v3}, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;->start()V

    .line 380
    :cond_0
    iget-object v3, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mThumbnailHandler:Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;

    if-nez v3, :cond_1

    .line 381
    new-instance v2, Landroid/os/HandlerThread;

    const-string v3, "Thumbnail"

    invoke-direct {v2, v3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 382
    .local v2, thumbnailThread:Landroid/os/HandlerThread;
    invoke-virtual {v2}, Landroid/os/HandlerThread;->start()V

    .line 383
    new-instance v3, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-direct {v3, p0, v4}, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;-><init>(Lcom/nloko/android/syncmypix/SyncResultsActivity;Landroid/os/Looper;)V

    iput-object v3, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mThumbnailHandler:Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;

    .line 386
    .end local v2           #thumbnailThread:Landroid/os/HandlerThread;
    :cond_1
    iget-object v3, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity;->mCache:Lcom/nloko/android/ThumbnailCache;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/nloko/android/ThumbnailCache;->togglePauseOnDownloader(Z)V

    .line 388
    const-string v3, "notification"

    invoke-virtual {p0, v3}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    .line 389
    .local v1, notifyManager:Landroid/app/NotificationManager;
    const v3, 0x7f060049

    invoke-virtual {v1, v3}, Landroid/app/NotificationManager;->cancel(I)V

    .line 390
    return-void
.end method

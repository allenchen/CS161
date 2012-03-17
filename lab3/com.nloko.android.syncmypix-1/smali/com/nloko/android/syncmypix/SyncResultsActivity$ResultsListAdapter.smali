.class public Lcom/nloko/android/syncmypix/SyncResultsActivity$ResultsListAdapter;
.super Landroid/widget/SimpleCursorAdapter;
.source "SyncResultsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nloko/android/syncmypix/SyncResultsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ResultsListAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nloko/android/syncmypix/SyncResultsActivity$ResultsListAdapter$Viewholder;
    }
.end annotation


# instance fields
.field private final mActivity:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/nloko/android/syncmypix/SyncResultsActivity;",
            ">;"
        }
    .end annotation
.end field

.field private mNeutralFace:Landroid/graphics/Bitmap;

.field private mSadFace:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Lcom/nloko/android/syncmypix/SyncResultsActivity;ILandroid/database/Cursor;[Ljava/lang/String;[I)V
    .locals 2
    .parameter "context"
    .parameter "layout"
    .parameter "c"
    .parameter "from"
    .parameter "to"

    .prologue
    .line 1352
    invoke-direct/range {p0 .. p5}, Landroid/widget/SimpleCursorAdapter;-><init>(Landroid/content/Context;ILandroid/database/Cursor;[Ljava/lang/String;[I)V

    .line 1353
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ResultsListAdapter;->mActivity:Ljava/lang/ref/WeakReference;

    .line 1356
    invoke-virtual {p1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020012

    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ResultsListAdapter;->mNeutralFace:Landroid/graphics/Bitmap;

    .line 1358
    invoke-virtual {p1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f020014

    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ResultsListAdapter;->mSadFace:Landroid/graphics/Bitmap;

    .line 1360
    return-void
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 11
    .parameter "view"
    .parameter "context"
    .parameter "cursor"

    .prologue
    .line 1386
    iget-object v9, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ResultsListAdapter;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nloko/android/syncmypix/SyncResultsActivity;

    .line 1387
    .local v0, activity:Lcom/nloko/android/syncmypix/SyncResultsActivity;
    if-nez v0, :cond_1

    .line 1427
    :cond_0
    :goto_0
    return-void

    .line 1391
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nloko/android/syncmypix/SyncResultsActivity$ResultsListAdapter$Viewholder;

    .line 1392
    .local v2, holder:Lcom/nloko/android/syncmypix/SyncResultsActivity$ResultsListAdapter$Viewholder;
    if-eqz v2, :cond_0

    .line 1396
    const-string v9, "contact_id"

    invoke-interface {p3, v9}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v9

    invoke-interface {p3, v9}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    .line 1397
    .local v3, id:J
    const-string v9, "name"

    invoke-interface {p3, v9}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v9

    invoke-interface {p3, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 1398
    .local v7, name:Ljava/lang/String;
    const-string v9, "pic_url"

    invoke-interface {p3, v9}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v9

    invoke-interface {p3, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 1399
    .local v8, url:Ljava/lang/String;
    if-eqz v8, :cond_2

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    move-object v8, v9

    .line 1400
    :goto_1
    const-string v9, "description"

    invoke-interface {p3, v9}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v9

    invoke-interface {p3, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 1402
    .local v1, description:Ljava/lang/String;
    iget-object v9, v2, Lcom/nloko/android/syncmypix/SyncResultsActivity$ResultsListAdapter$Viewholder;->name:Landroid/widget/TextView;

    invoke-virtual {v9, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1403
    iget-object v9, v2, Lcom/nloko/android/syncmypix/SyncResultsActivity$ResultsListAdapter$Viewholder;->status:Landroid/widget/TextView;

    invoke-virtual {v9, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1404
    iput-object v8, v2, Lcom/nloko/android/syncmypix/SyncResultsActivity$ResultsListAdapter$Viewholder;->url:Ljava/lang/String;

    .line 1408
    iget-object v5, v2, Lcom/nloko/android/syncmypix/SyncResultsActivity$ResultsListAdapter$Viewholder;->image:Landroid/widget/ImageView;

    .line 1409
    .local v5, image:Landroid/widget/ImageView;
    invoke-virtual {v5, v8}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 1411
    const-wide/16 v9, 0x0

    cmp-long v9, v3, v9

    if-lez v9, :cond_3

    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$200(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/ThumbnailCache;

    move-result-object v9

    invoke-virtual {v9, v8}, Lcom/nloko/android/ThumbnailCache;->contains(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_3

    .line 1414
    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$000(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;

    move-result-object v9

    invoke-virtual {v9}, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->obtainMessage()Landroid/os/Message;

    move-result-object v6

    .line 1415
    .local v6, msg:Landroid/os/Message;
    iput-object v8, v6, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 1416
    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$000(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;

    move-result-object v9

    invoke-virtual {v9, v6}, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler;->sendMessage(Landroid/os/Message;)Z

    .line 1418
    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$200(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/ThumbnailCache;

    move-result-object v9

    invoke-virtual {v9}, Lcom/nloko/android/ThumbnailCache;->getDefaultImage()Landroid/graphics/Bitmap;

    move-result-object v9

    invoke-virtual {v5, v9}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_0

    .line 1399
    .end local v1           #description:Ljava/lang/String;
    .end local v5           #image:Landroid/widget/ImageView;
    .end local v6           #msg:Landroid/os/Message;
    :cond_2
    const/4 v9, 0x0

    move-object v8, v9

    goto :goto_1

    .line 1419
    .restart local v1       #description:Ljava/lang/String;
    .restart local v5       #image:Landroid/widget/ImageView;
    :cond_3
    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$200(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/ThumbnailCache;

    move-result-object v9

    invoke-virtual {v9, v8}, Lcom/nloko/android/ThumbnailCache;->contains(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 1421
    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$200(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/ThumbnailCache;

    move-result-object v9

    invoke-virtual {v9, v8}, Lcom/nloko/android/ThumbnailCache;->get(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v9

    invoke-virtual {v5, v9}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto/16 :goto_0

    .line 1422
    :cond_4
    const v9, 0x7f060050

    invoke-virtual {p2, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 1423
    iget-object v9, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ResultsListAdapter;->mNeutralFace:Landroid/graphics/Bitmap;

    invoke-virtual {v5, v9}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto/16 :goto_0

    .line 1425
    :cond_5
    iget-object v9, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ResultsListAdapter;->mSadFace:Landroid/graphics/Bitmap;

    invoke-virtual {v5, v9}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto/16 :goto_0
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3
    .parameter "context"
    .parameter "cursor"
    .parameter "parent"

    .prologue
    .line 1365
    invoke-super {p0, p1, p2, p3}, Landroid/widget/SimpleCursorAdapter;->newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 1366
    .local v1, view:Landroid/view/View;
    new-instance v0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ResultsListAdapter$Viewholder;

    invoke-direct {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$ResultsListAdapter$Viewholder;-><init>()V

    .line 1367
    .local v0, holder:Lcom/nloko/android/syncmypix/SyncResultsActivity$ResultsListAdapter$Viewholder;
    const v2, 0x7f070022

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    .end local p0
    check-cast p0, Landroid/widget/ImageView;

    iput-object p0, v0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ResultsListAdapter$Viewholder;->image:Landroid/widget/ImageView;

    .line 1368
    const v2, 0x7f070024

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    iput-object p0, v0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ResultsListAdapter$Viewholder;->name:Landroid/widget/TextView;

    .line 1369
    const v2, 0x7f070023

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    iput-object p0, v0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ResultsListAdapter$Viewholder;->status:Landroid/widget/TextView;

    .line 1370
    invoke-virtual {v1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 1371
    return-object v1
.end method

.method public runQueryOnBackgroundThread(Ljava/lang/CharSequence;)Landroid/database/Cursor;
    .locals 7
    .parameter "constraint"

    .prologue
    const/4 v4, 0x0

    .line 1431
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ResultsListAdapter;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/nloko/android/syncmypix/SyncResultsActivity;

    .line 1432
    .local v6, activity:Lcom/nloko/android/syncmypix/SyncResultsActivity;
    if-nez v6, :cond_0

    move-object v1, v4

    .line 1445
    :goto_0
    return-object v1

    .line 1435
    :cond_0
    invoke-virtual {v6}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 1436
    .local v0, resolver:Landroid/content/ContentResolver;
    if-nez v0, :cond_1

    move-object v1, v4

    .line 1437
    goto :goto_0

    .line 1440
    :cond_1
    const/4 v3, 0x0

    .line 1441
    .local v3, where:Ljava/lang/String;
    if-eqz p1, :cond_2

    .line 1442
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "description IN ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1445
    :cond_2
    sget-object v1, Lcom/nloko/android/syncmypix/SyncMyPix$Results;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v6}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$1300(Lcom/nloko/android/syncmypix/SyncResultsActivity;)[Ljava/lang/String;

    move-result-object v2

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    goto :goto_0
.end method

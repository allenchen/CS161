.class Lcom/nloko/android/syncmypix/SyncResultsActivity$9;
.super Ljava/lang/Object;
.source "SyncResultsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/SyncResultsActivity;->updateContactWithSelection(Landroid/net/Uri;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

.field final synthetic val$contactId:Ljava/lang/String;

.field final synthetic val$contactUri:Landroid/net/Uri;

.field final synthetic val$friendId:Ljava/lang/String;

.field final synthetic val$id:J

.field final synthetic val$lookup:Ljava/lang/String;

.field final synthetic val$oldContactId:Ljava/lang/String;

.field final synthetic val$resolver:Landroid/content/ContentResolver;

.field final synthetic val$sdCache:Lcom/nloko/android/PhotoCache;

.field final synthetic val$source:Ljava/lang/String;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/SyncResultsActivity;Ljava/lang/String;Lcom/nloko/android/PhotoCache;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 643
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    iput-object p2, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$url:Ljava/lang/String;

    iput-object p3, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$sdCache:Lcom/nloko/android/PhotoCache;

    iput-object p4, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$contactUri:Landroid/net/Uri;

    iput-object p5, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$contactId:Ljava/lang/String;

    iput-object p6, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$oldContactId:Ljava/lang/String;

    iput-object p7, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$resolver:Landroid/content/ContentResolver;

    iput-object p8, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$lookup:Ljava/lang/String;

    iput-object p9, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$friendId:Ljava/lang/String;

    iput-object p10, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$source:Ljava/lang/String;

    iput-wide p11, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$id:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 14

    .prologue
    .line 646
    :try_start_0
    iget-object v9, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$url:Ljava/lang/String;

    invoke-static {v9}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    invoke-virtual {v9}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v5

    .line 647
    .local v5, filename:Ljava/lang/String;
    iget-object v9, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$sdCache:Lcom/nloko/android/PhotoCache;

    invoke-virtual {v9, v5}, Lcom/nloko/android/PhotoCache;->get(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    .line 648
    .local v6, friend:Ljava/io/InputStream;
    if-nez v6, :cond_0

    .line 649
    iget-object v9, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$url:Ljava/lang/String;

    invoke-static {v9}, Lcom/nloko/android/Utils;->downloadPictureAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    .line 651
    :cond_0
    if-eqz v6, :cond_3

    .line 652
    invoke-static {v6}, Lcom/nloko/android/Utils;->getByteArrayFromInputStream(Ljava/io/InputStream;)[B

    move-result-object v1

    .line 653
    .local v1, bytes:[B
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    .line 654
    iget-object v9, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$sdCache:Lcom/nloko/android/PhotoCache;

    invoke-virtual {v9, v5, v1}, Lcom/nloko/android/PhotoCache;->add(Ljava/lang/String;[B)V

    .line 656
    const/4 v9, 0x0

    array-length v10, v1

    invoke-static {v1, v9, v10}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 657
    .local v0, bitmap:Landroid/graphics/Bitmap;
    iget-object v9, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-static {v9}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$200(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/ThumbnailCache;

    move-result-object v9

    iget-object v10, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$url:Ljava/lang/String;

    invoke-virtual {v9, v10, v0}, Lcom/nloko/android/ThumbnailCache;->add(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 658
    invoke-static {v1}, Lcom/nloko/android/Utils;->getMd5Hash([B)Ljava/lang/String;

    move-result-object v7

    .line 659
    .local v7, origHash:Ljava/lang/String;
    invoke-static {v0}, Lcom/nloko/android/Utils;->bitmapToPNG(Landroid/graphics/Bitmap;)[B

    move-result-object v1

    .line 660
    invoke-static {v1}, Lcom/nloko/android/Utils;->getMd5Hash([B)Ljava/lang/String;

    move-result-object v2

    .line 663
    .local v2, dbHash:Ljava/lang/String;
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 665
    const-string v9, "SyncResults"

    iget-object v10, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$contactUri:Landroid/net/Uri;

    invoke-virtual {v10}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 666
    iget-object v9, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    iget-object v10, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$contactId:Ljava/lang/String;

    invoke-static {v9, v10}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$600(Lcom/nloko/android/syncmypix/SyncResultsActivity;Ljava/lang/String;)V

    .line 667
    iget-object v9, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$oldContactId:Ljava/lang/String;

    if-eqz v9, :cond_1

    .line 668
    iget-object v9, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    iget-object v10, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$oldContactId:Ljava/lang/String;

    const/4 v11, 0x1

    invoke-static {v9, v10, v11}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$700(Lcom/nloko/android/syncmypix/SyncResultsActivity;Ljava/lang/String;Z)V

    .line 671
    :cond_1
    iget-object v9, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-static {v9}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$800(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/syncmypix/contactutils/ContactUtils;

    move-result-object v9

    iget-object v10, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$resolver:Landroid/content/ContentResolver;

    iget-object v11, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$contactId:Ljava/lang/String;

    invoke-virtual {v9, v10, v1, v11}, Lcom/nloko/android/syncmypix/contactutils/ContactUtils;->updatePhoto(Landroid/content/ContentResolver;[BLjava/lang/String;)V

    .line 672
    iget-object v9, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-static {v9}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$900(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;

    move-result-object v9

    iget-object v10, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$contactId:Ljava/lang/String;

    iget-object v11, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$lookup:Ljava/lang/String;

    invoke-virtual {v9, v10, v11, v7, v2}, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->updateHashes(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 674
    iget-object v9, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$friendId:Ljava/lang/String;

    if-eqz v9, :cond_2

    iget-object v9, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$friendId:Ljava/lang/String;

    const-string v10, ""

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_2

    .line 675
    iget-object v9, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-static {v9}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$900(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;

    move-result-object v9

    iget-object v10, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$contactId:Ljava/lang/String;

    iget-object v11, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$lookup:Ljava/lang/String;

    iget-object v12, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$friendId:Ljava/lang/String;

    iget-object v13, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$source:Ljava/lang/String;

    invoke-virtual {v9, v10, v11, v12, v13}, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->updateLink(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 678
    :cond_2
    new-instance v8, Landroid/content/ContentValues;

    invoke-direct {v8}, Landroid/content/ContentValues;-><init>()V

    .line 679
    .local v8, values:Landroid/content/ContentValues;
    const-string v9, "description"

    iget-object v10, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    const v11, 0x7f060051

    invoke-virtual {v10, v11}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 680
    const-string v9, "contact_id"

    iget-object v10, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$contactId:Ljava/lang/String;

    invoke-static {v10}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 681
    iget-object v9, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$resolver:Landroid/content/ContentResolver;

    sget-object v10, Lcom/nloko/android/syncmypix/SyncMyPix$Results;->CONTENT_URI:Landroid/net/Uri;

    iget-wide v11, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$id:J

    invoke-static {v11, v12}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v10

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-virtual {v9, v10, v8, v11, v12}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 686
    iget-object v9, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    new-instance v10, Lcom/nloko/android/syncmypix/SyncResultsActivity$9$1;

    invoke-direct {v10, p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$9$1;-><init>(Lcom/nloko/android/syncmypix/SyncResultsActivity$9;)V

    invoke-virtual {v9, v10}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 703
    .end local v0           #bitmap:Landroid/graphics/Bitmap;
    .end local v1           #bytes:[B
    .end local v2           #dbHash:Ljava/lang/String;
    .end local v7           #origHash:Ljava/lang/String;
    .end local v8           #values:Landroid/content/ContentValues;
    :goto_0
    iget-object v9, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    new-instance v10, Lcom/nloko/android/syncmypix/SyncResultsActivity$9$2;

    invoke-direct {v10, p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$9$2;-><init>(Lcom/nloko/android/syncmypix/SyncResultsActivity$9;)V

    invoke-virtual {v9, v10}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 713
    .end local v5           #filename:Ljava/lang/String;
    .end local v6           #friend:Ljava/io/InputStream;
    :goto_1
    return-void

    .line 693
    .restart local v5       #filename:Ljava/lang/String;
    .restart local v6       #friend:Ljava/io/InputStream;
    :cond_3
    :try_start_1
    iget-object v9, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-static {v9}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$1100(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Landroid/os/Handler;

    move-result-object v9

    const/4 v10, 0x3

    invoke-virtual {v9, v10}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/net/UnknownHostException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 695
    .end local v5           #filename:Ljava/lang/String;
    .end local v6           #friend:Ljava/io/InputStream;
    :catch_0
    move-exception v9

    move-object v4, v9

    .line 696
    .local v4, ex:Ljava/net/UnknownHostException;
    :try_start_2
    invoke-virtual {v4}, Ljava/net/UnknownHostException;->printStackTrace()V

    .line 697
    iget-object v9, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-static {v9}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$1100(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Landroid/os/Handler;

    move-result-object v9

    const/4 v10, 0x2

    invoke-virtual {v9, v10}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 703
    iget-object v9, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    new-instance v10, Lcom/nloko/android/syncmypix/SyncResultsActivity$9$2;

    invoke-direct {v10, p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$9$2;-><init>(Lcom/nloko/android/syncmypix/SyncResultsActivity$9;)V

    invoke-virtual {v9, v10}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 698
    .end local v4           #ex:Ljava/net/UnknownHostException;
    :catch_1
    move-exception v9

    move-object v3, v9

    .line 699
    .local v3, e:Ljava/lang/Exception;
    :try_start_3
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    .line 700
    iget-object v9, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-static {v9}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$1100(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Landroid/os/Handler;

    move-result-object v9

    const/4 v10, 0x3

    invoke-virtual {v9, v10}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 703
    iget-object v9, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    new-instance v10, Lcom/nloko/android/syncmypix/SyncResultsActivity$9$2;

    invoke-direct {v10, p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$9$2;-><init>(Lcom/nloko/android/syncmypix/SyncResultsActivity$9;)V

    invoke-virtual {v9, v10}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_1

    .end local v3           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v9

    iget-object v10, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    new-instance v11, Lcom/nloko/android/syncmypix/SyncResultsActivity$9$2;

    invoke-direct {v11, p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$9$2;-><init>(Lcom/nloko/android/syncmypix/SyncResultsActivity$9;)V

    invoke-virtual {v10, v11}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    throw v9
.end method

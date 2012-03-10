.class Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;
.super Ljava/lang/Thread;
.source "SyncResultsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nloko/android/syncmypix/SyncResultsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "InitializeResultsThread"
.end annotation


# instance fields
.field private cursor:Landroid/database/Cursor;

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

.field private running:Z


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/SyncResultsActivity;)V
    .locals 1
    .parameter "activity"

    .prologue
    .line 876
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 870
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;->running:Z

    .line 877
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;->mActivity:Ljava/lang/ref/WeakReference;

    .line 878
    return-void
.end method

.method private closeQuery()V
    .locals 1

    .prologue
    .line 898
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;->cursor:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    .line 899
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;->cursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 901
    :cond_0
    return-void
.end method

.method private ensureQuery()V
    .locals 7

    .prologue
    const/4 v3, 0x0

    .line 882
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/nloko/android/syncmypix/SyncResultsActivity;

    .line 883
    .local v6, activity:Lcom/nloko/android/syncmypix/SyncResultsActivity;
    if-nez v6, :cond_0

    .line 894
    :goto_0
    return-void

    .line 887
    :cond_0
    invoke-virtual {v6}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/nloko/android/syncmypix/SyncMyPix$Results;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "updated"

    aput-object v5, v2, v4

    const/4 v4, 0x1

    const-string v5, "skipped"

    aput-object v5, v2, v4

    const/4 v4, 0x2

    const-string v5, "not_found"

    aput-object v5, v2, v4

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;->cursor:Landroid/database/Cursor;

    goto :goto_0
.end method

.method private hideDialog()V
    .locals 2

    .prologue
    .line 913
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nloko/android/syncmypix/SyncResultsActivity;

    .line 914
    .local v0, activity:Lcom/nloko/android/syncmypix/SyncResultsActivity;
    if-nez v0, :cond_0

    .line 923
    :goto_0
    return-void

    .line 918
    :cond_0
    new-instance v1, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$1;

    invoke-direct {v1, p0, v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$1;-><init>(Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;Lcom/nloko/android/syncmypix/SyncResultsActivity;)V

    invoke-virtual {v0, v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method


# virtual methods
.method public run()V
    .locals 13

    .prologue
    .line 927
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nloko/android/syncmypix/SyncResultsActivity;

    .line 928
    .local v2, activity:Lcom/nloko/android/syncmypix/SyncResultsActivity;
    if-nez v2, :cond_0

    .line 977
    :goto_0
    return-void

    .line 934
    :cond_0
    monitor-enter p0

    .line 935
    :try_start_0
    iget-boolean v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;->running:Z

    if-eqz v0, :cond_2

    .line 936
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;->ensureQuery()V

    .line 937
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;->cursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 938
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;->cursor:Landroid/database/Cursor;

    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;->cursor:Landroid/database/Cursor;

    const-string v12, "updated"

    invoke-interface {v1, v12}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    .line 939
    .local v5, updated:I
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;->cursor:Landroid/database/Cursor;

    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;->cursor:Landroid/database/Cursor;

    const-string v12, "skipped"

    invoke-interface {v1, v12}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    .line 940
    .local v7, skipped:I
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;->cursor:Landroid/database/Cursor;

    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;->cursor:Landroid/database/Cursor;

    const-string v12, "not_found"

    invoke-interface {v1, v12}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    .line 950
    .local v9, notFound:I
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 952
    const v0, 0x7f07001c

    invoke-virtual {v2, v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 953
    .local v4, text1:Landroid/widget/TextView;
    const v0, 0x7f07001e

    invoke-virtual {v2, v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 954
    .local v6, text2:Landroid/widget/TextView;
    const v0, 0x7f070020

    invoke-virtual {v2, v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 956
    .local v8, text3:Landroid/widget/TextView;
    const v0, 0x7f07001b

    invoke-virtual {v2, v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 957
    .local v3, label1:Landroid/widget/TextView;
    const v0, 0x7f07001d

    invoke-virtual {v2, v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    .line 958
    .local v10, label2:Landroid/widget/TextView;
    const v0, 0x7f07001f

    invoke-virtual {v2, v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/TextView;

    .line 960
    .local v11, label3:Landroid/widget/TextView;
    new-instance v0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$2;

    move-object v1, p0

    invoke-direct/range {v0 .. v11}, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$2;-><init>(Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;Lcom/nloko/android/syncmypix/SyncResultsActivity;Landroid/widget/TextView;Landroid/widget/TextView;ILandroid/widget/TextView;ILandroid/widget/TextView;ILandroid/widget/TextView;Landroid/widget/TextView;)V

    invoke-virtual {v2, v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 942
    .end local v3           #label1:Landroid/widget/TextView;
    .end local v4           #text1:Landroid/widget/TextView;
    .end local v5           #updated:I
    .end local v6           #text2:Landroid/widget/TextView;
    .end local v7           #skipped:I
    .end local v8           #text3:Landroid/widget/TextView;
    .end local v9           #notFound:I
    .end local v10           #label2:Landroid/widget/TextView;
    .end local v11           #label3:Landroid/widget/TextView;
    :cond_1
    const/4 v5, 0x0

    .line 943
    .restart local v5       #updated:I
    const/4 v7, 0x0

    .line 944
    .restart local v7       #skipped:I
    const/4 v9, 0x0

    .restart local v9       #notFound:I
    goto :goto_1

    .line 947
    .end local v5           #updated:I
    .end local v7           #skipped:I
    .end local v9           #notFound:I
    :cond_2
    :try_start_1
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;->hideDialog()V

    .line 948
    monitor-exit p0

    goto/16 :goto_0

    .line 950
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public stopRunning()V
    .locals 1

    .prologue
    .line 905
    monitor-enter p0

    .line 906
    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;->running:Z

    .line 907
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;->closeQuery()V

    .line 908
    monitor-exit p0

    .line 909
    return-void

    .line 908
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

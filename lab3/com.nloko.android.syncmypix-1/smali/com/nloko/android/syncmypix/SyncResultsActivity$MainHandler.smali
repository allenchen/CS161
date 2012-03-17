.class Lcom/nloko/android/syncmypix/SyncResultsActivity$MainHandler;
.super Landroid/os/Handler;
.source "SyncResultsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nloko/android/syncmypix/SyncResultsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MainHandler"
.end annotation


# static fields
.field private static final MANUAL_LINK_ERROR:I = 0x3

.field private static final UNKNOWN_HOST_ERROR:I = 0x2


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


# direct methods
.method public constructor <init>(Lcom/nloko/android/syncmypix/SyncResultsActivity;)V
    .locals 1
    .parameter "activity"

    .prologue
    .line 297
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 298
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$MainHandler;->mActivity:Ljava/lang/ref/WeakReference;

    .line 299
    return-void
.end method

.method private handleWhat(Landroid/os/Message;)V
    .locals 4
    .parameter "msg"

    .prologue
    const/4 v3, 0x1

    .line 317
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$MainHandler;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nloko/android/syncmypix/SyncResultsActivity;

    .line 318
    .local v0, activity:Lcom/nloko/android/syncmypix/SyncResultsActivity;
    if-eqz v0, :cond_0

    .line 319
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 328
    :cond_0
    :goto_0
    return-void

    .line 321
    :pswitch_0
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f060039

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 324
    :pswitch_1
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f06003a

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 319
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .parameter "msg"

    .prologue
    .line 303
    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$MainHandler;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nloko/android/syncmypix/SyncResultsActivity;

    .line 304
    .local v0, activity:Lcom/nloko/android/syncmypix/SyncResultsActivity;
    if-eqz v0, :cond_1

    .line 305
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/Bitmap;

    .line 306
    .local v1, bitmap:Landroid/graphics/Bitmap;
    if-eqz v1, :cond_0

    .line 307
    invoke-static {v0, v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$502(Lcom/nloko/android/syncmypix/SyncResultsActivity;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 308
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->showDialog(I)V

    .line 311
    :cond_0
    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$300(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Landroid/widget/ProgressBar;

    move-result-object v2

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 312
    invoke-direct {p0, p1}, Lcom/nloko/android/syncmypix/SyncResultsActivity$MainHandler;->handleWhat(Landroid/os/Message;)V

    .line 314
    .end local v1           #bitmap:Landroid/graphics/Bitmap;
    :cond_1
    return-void
.end method

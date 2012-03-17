.class Lcom/nloko/android/syncmypix/DonateActivity$ChromeClient;
.super Landroid/webkit/WebChromeClient;
.source "DonateActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nloko/android/syncmypix/DonateActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ChromeClient"
.end annotation


# instance fields
.field private final mActivity:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 1
    .parameter "activity"

    .prologue
    .line 52
    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    .line 53
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/DonateActivity$ChromeClient;->mActivity:Ljava/lang/ref/WeakReference;

    .line 54
    return-void
.end method

.method private setProgress(I)V
    .locals 2
    .parameter "progress"

    .prologue
    .line 64
    iget-object v1, p0, Lcom/nloko/android/syncmypix/DonateActivity$ChromeClient;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 65
    .local v0, activity:Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 66
    mul-int/lit8 v1, p1, 0x64

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setProgress(I)V

    .line 67
    const/16 v1, 0x64

    if-ge p1, v1, :cond_1

    const/4 v1, 0x1

    :goto_0
    invoke-virtual {v0, v1}, Landroid/app/Activity;->setProgressBarIndeterminateVisibility(Z)V

    .line 69
    :cond_0
    return-void

    .line 67
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public onProgressChanged(Landroid/webkit/WebView;I)V
    .locals 0
    .parameter "view"
    .parameter "newProgress"

    .prologue
    .line 58
    invoke-super {p0, p1, p2}, Landroid/webkit/WebChromeClient;->onProgressChanged(Landroid/webkit/WebView;I)V

    .line 59
    invoke-direct {p0, p2}, Lcom/nloko/android/syncmypix/DonateActivity$ChromeClient;->setProgress(I)V

    .line 60
    return-void
.end method

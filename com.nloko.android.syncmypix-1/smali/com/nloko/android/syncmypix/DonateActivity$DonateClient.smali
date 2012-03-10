.class Lcom/nloko/android/syncmypix/DonateActivity$DonateClient;
.super Landroid/webkit/WebViewClient;
.source "DonateActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nloko/android/syncmypix/DonateActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DonateClient"
.end annotation


# instance fields
.field private final mActivity:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/nloko/android/syncmypix/DonateActivity;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/nloko/android/syncmypix/DonateActivity;)V
    .locals 1
    .parameter "activity"

    .prologue
    .line 77
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    .line 78
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/DonateActivity$DonateClient;->mActivity:Ljava/lang/ref/WeakReference;

    .line 79
    return-void
.end method


# virtual methods
.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 6
    .parameter "view"
    .parameter "errorCode"
    .parameter "description"
    .parameter "failingUrl"

    .prologue
    const/4 v5, 0x1

    .line 84
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    .line 85
    const-string v2, "URL %s failed to load with error %d %s"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p4, v3, v4

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    const/4 v4, 0x2

    aput-object p3, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 87
    .local v1, msg:Ljava/lang/String;
    iget-object v2, p0, Lcom/nloko/android/syncmypix/DonateActivity$DonateClient;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nloko/android/syncmypix/DonateActivity;

    .line 88
    .local v0, activity:Lcom/nloko/android/syncmypix/DonateActivity;
    if-eqz v0, :cond_0

    .line 89
    const-string v2, "DonateActivity"

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/DonateActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v1, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 92
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/DonateActivity;->finish()V

    .line 94
    :cond_0
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 4
    .parameter "view"
    .parameter "url"

    .prologue
    .line 98
    const-string v2, "file:///android_asset/donate.html"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 99
    const/4 v2, 0x0

    .line 108
    :goto_0
    return v2

    .line 101
    :cond_0
    iget-object v2, p0, Lcom/nloko/android/syncmypix/DonateActivity$DonateClient;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nloko/android/syncmypix/DonateActivity;

    .line 102
    .local v0, activity:Lcom/nloko/android/syncmypix/DonateActivity;
    if-eqz v0, :cond_1

    .line 103
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 104
    .local v1, viewIntent:Landroid/content/Intent;
    invoke-virtual {v0, v1}, Lcom/nloko/android/syncmypix/DonateActivity;->startActivity(Landroid/content/Intent;)V

    .line 108
    .end local v1           #viewIntent:Landroid/content/Intent;
    :cond_1
    const/4 v2, 0x1

    goto :goto_0
.end method

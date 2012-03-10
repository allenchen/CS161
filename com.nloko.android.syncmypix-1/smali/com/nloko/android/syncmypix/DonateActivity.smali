.class public Lcom/nloko/android/syncmypix/DonateActivity;
.super Landroid/app/Activity;
.source "DonateActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nloko/android/syncmypix/DonateActivity$DonateClient;,
        Lcom/nloko/android/syncmypix/DonateActivity$ChromeClient;
    }
.end annotation


# static fields
.field private static final DONATE_URL:Ljava/lang/String; = "file:///android_asset/donate.html"

.field private static final TAG:Ljava/lang/String; = "DonateActivity"


# instance fields
.field private webview:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 72
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
    .line 148
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 149
    const-string v0, "DonateActivity"

    const-string v1, "FINALIZED"

    invoke-static {v0, v1}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 114
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 116
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/DonateActivity;->requestWindowFeature(I)Z

    .line 117
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/DonateActivity;->requestWindowFeature(I)Z

    .line 118
    const v0, 0x7f030002

    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/DonateActivity;->setContentView(I)V

    .line 120
    const v0, 0x7f07000b

    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/DonateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    iput-object v0, p0, Lcom/nloko/android/syncmypix/DonateActivity;->webview:Landroid/webkit/WebView;

    .line 121
    iget-object v0, p0, Lcom/nloko/android/syncmypix/DonateActivity;->webview:Landroid/webkit/WebView;

    new-instance v1, Lcom/nloko/android/syncmypix/DonateActivity$ChromeClient;

    invoke-direct {v1, p0}, Lcom/nloko/android/syncmypix/DonateActivity$ChromeClient;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 122
    iget-object v0, p0, Lcom/nloko/android/syncmypix/DonateActivity;->webview:Landroid/webkit/WebView;

    new-instance v1, Lcom/nloko/android/syncmypix/DonateActivity$DonateClient;

    invoke-direct {v1, p0}, Lcom/nloko/android/syncmypix/DonateActivity$DonateClient;-><init>(Lcom/nloko/android/syncmypix/DonateActivity;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 123
    iget-object v0, p0, Lcom/nloko/android/syncmypix/DonateActivity;->webview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 124
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 140
    const-string v0, "DonateActivity"

    const-string v1, "onDestroy"

    invoke-static {v0, v1}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 143
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nloko/android/syncmypix/DonateActivity;->webview:Landroid/webkit/WebView;

    .line 144
    return-void
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 134
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 135
    iget-object v0, p0, Lcom/nloko/android/syncmypix/DonateActivity;->webview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V

    .line 136
    return-void
.end method

.method protected onStart()V
    .locals 2

    .prologue
    .line 128
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 129
    iget-object v0, p0, Lcom/nloko/android/syncmypix/DonateActivity;->webview:Landroid/webkit/WebView;

    const-string v1, "file:///android_asset/donate.html"

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 130
    return-void
.end method

.class public Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;
.super Landroid/app/Activity;
.source "FacebookLoginWebView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView$FacebookClient;,
        Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView$ChromeClient;
    }
.end annotation


# instance fields
.field private final AUTH_DIALOG:I

.field private final TAG:Ljava/lang/String;

.field private authDialog:Landroid/app/ProgressDialog;

.field private final login:Lcom/nloko/simplyfacebook/net/login/FacebookLogin;

.field private webview:Landroid/webkit/WebView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 46
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 48
    const-string v0, "FacebookLoginWebView"

    iput-object v0, p0, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->TAG:Ljava/lang/String;

    .line 49
    new-instance v0, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;

    invoke-direct {v0}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->login:Lcom/nloko/simplyfacebook/net/login/FacebookLogin;

    .line 51
    const/4 v0, 0x0

    iput v0, p0, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->AUTH_DIALOG:I

    .line 52
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->authDialog:Landroid/app/ProgressDialog;

    .line 81
    return-void
.end method

.method static synthetic access$000(Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;)Landroid/app/ProgressDialog;
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget-object v0, p0, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->authDialog:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$100(Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;)Lcom/nloko/simplyfacebook/net/login/FacebookLogin;
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget-object v0, p0, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->login:Lcom/nloko/simplyfacebook/net/login/FacebookLogin;

    return-object v0
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
    .line 214
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 215
    const-string v0, "FacebookLoginWebView"

    const-string v1, "FINALIZED"

    invoke-static {v0, v1}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 216
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 176
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 178
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->requestWindowFeature(I)Z

    .line 179
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->requestWindowFeature(I)Z

    .line 180
    const v0, 0x7f030002

    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->setContentView(I)V

    .line 182
    iget-object v0, p0, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->login:Lcom/nloko/simplyfacebook/net/login/FacebookLogin;

    const-string v1, "d03f3dcb1ebb264e1ea701bd16f44e5a"

    invoke-virtual {v0, v1}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->setAPIKey(Ljava/lang/String;)V

    .line 184
    const v0, 0x7f07000b

    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/webkit/WebView;

    iput-object v0, p0, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->webview:Landroid/webkit/WebView;

    .line 185
    iget-object v0, p0, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->webview:Landroid/webkit/WebView;

    new-instance v1, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView$ChromeClient;

    invoke-direct {v1, p0}, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView$ChromeClient;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 186
    iget-object v0, p0, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->webview:Landroid/webkit/WebView;

    new-instance v1, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView$FacebookClient;

    invoke-direct {v1, p0}, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView$FacebookClient;-><init>(Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 187
    iget-object v0, p0, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->webview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 188
    return-void
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 2
    .parameter "id"

    .prologue
    .line 220
    packed-switch p1, :pswitch_data_0

    .line 229
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateDialog(I)Landroid/app/Dialog;

    move-result-object v0

    :goto_0
    return-object v0

    .line 222
    :pswitch_0
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->authDialog:Landroid/app/ProgressDialog;

    .line 223
    iget-object v0, p0, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->authDialog:Landroid/app/ProgressDialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 224
    iget-object v0, p0, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->authDialog:Landroid/app/ProgressDialog;

    const v1, 0x7f06002e

    invoke-virtual {p0, v1}, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 225
    iget-object v0, p0, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->authDialog:Landroid/app/ProgressDialog;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 226
    iget-object v0, p0, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->authDialog:Landroid/app/ProgressDialog;

    goto :goto_0

    .line 220
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method protected onDestroy()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 205
    const-string v0, "FacebookLoginWebView"

    const-string v1, "onDestroy"

    invoke-static {v0, v1}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 208
    iput-object v2, p0, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->authDialog:Landroid/app/ProgressDialog;

    .line 209
    iput-object v2, p0, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->webview:Landroid/webkit/WebView;

    .line 210
    return-void
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 199
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 200
    iget-object v0, p0, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->webview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V

    .line 201
    return-void
.end method

.method protected onStart()V
    .locals 2

    .prologue
    .line 192
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 193
    const-string v0, "FacebookLoginWebView"

    iget-object v1, p0, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->login:Lcom/nloko/simplyfacebook/net/login/FacebookLogin;

    invoke-virtual {v1}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->getFullLoginUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    iget-object v0, p0, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->webview:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->login:Lcom/nloko/simplyfacebook/net/login/FacebookLogin;

    invoke-virtual {v1}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->getFullLoginUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 195
    return-void
.end method

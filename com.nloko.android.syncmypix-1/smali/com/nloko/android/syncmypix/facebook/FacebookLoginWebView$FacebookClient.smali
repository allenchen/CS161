.class Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView$FacebookClient;
.super Landroid/webkit/WebViewClient;
.source "FacebookLoginWebView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FacebookClient"
.end annotation


# instance fields
.field private final mActivity:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;)V
    .locals 1
    .parameter "activity"

    .prologue
    .line 86
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    .line 87
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView$FacebookClient;->mActivity:Ljava/lang/ref/WeakReference;

    .line 88
    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 3
    .parameter "view"
    .parameter "url"

    .prologue
    .line 92
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 93
    iget-object v2, p0, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView$FacebookClient;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;

    .line 94
    .local v0, activity:Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;
    if-eqz v0, :cond_0

    .line 95
    invoke-static {v0}, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->access$000(Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;)Landroid/app/ProgressDialog;

    move-result-object v1

    .line 96
    .local v1, dialog:Landroid/app/Dialog;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/app/Dialog;->isShowing()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 97
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->dismissDialog(I)V

    .line 100
    .end local v1           #dialog:Landroid/app/Dialog;
    :cond_0
    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 8
    .parameter "view"
    .parameter "url"
    .parameter "favicon"

    .prologue
    const/4 v7, 0x1

    const/4 v5, 0x0

    .line 125
    invoke-super {p0, p1, p2, p3}, Landroid/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 126
    iget-object v4, p0, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView$FacebookClient;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v4}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;

    .line 127
    .local v0, activity:Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;
    if-nez v0, :cond_1

    .line 166
    :cond_0
    :goto_0
    return-void

    .line 131
    :cond_1
    invoke-static {v0}, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->access$100(Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;)Lcom/nloko/simplyfacebook/net/login/FacebookLogin;

    move-result-object v2

    .line 132
    .local v2, login:Lcom/nloko/simplyfacebook/net/login/FacebookLogin;
    if-eqz v2, :cond_0

    .line 136
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->isFinishing()Z

    move-result v4

    if-nez v4, :cond_2

    invoke-virtual {v2}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->getFullLoginUrl()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 137
    invoke-virtual {v0, v5}, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->showDialog(I)V

    .line 141
    :cond_2
    :try_start_0
    const-string v4, "FacebookLoginWebView"

    invoke-static {v4, p2}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    const-string v4, "FacebookLoginWebView"

    invoke-virtual {v2}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->getNextUrl()Ljava/net/URL;

    move-result-object v5

    invoke-virtual {v5}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    new-instance v3, Ljava/net/URL;

    invoke-static {p2}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 146
    .local v3, page:Ljava/net/URL;
    invoke-virtual {v3}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->getNextUrl()Ljava/net/URL;

    move-result-object v5

    invoke-virtual {v5}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 147
    invoke-virtual {v2, v3}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->setResponseFromExternalBrowser(Ljava/net/URL;)V

    .line 148
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f06002d

    const/4 v6, 0x1

    invoke-static {v4, v5, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    .line 150
    invoke-virtual {v2}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->isLoggedIn()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 151
    const-string v4, "SyncMyPixPrefs"

    const/4 v5, 0x0

    invoke-virtual {v0, v4, v5}, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string v5, "session_key"

    invoke-virtual {v2}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->getSessionKey()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/nloko/android/Utils;->setString(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    const-string v4, "SyncMyPixPrefs"

    const/4 v5, 0x0

    invoke-virtual {v0, v4, v5}, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string v5, "secret"

    invoke-virtual {v2}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->getSecret()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/nloko/android/Utils;->setString(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    const-string v4, "SyncMyPixPrefs"

    const/4 v5, 0x0

    invoke-virtual {v0, v4, v5}, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string v5, "uid"

    invoke-virtual {v2}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->getUid()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/nloko/android/Utils;->setString(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    :cond_3
    const/4 v4, -0x1

    invoke-virtual {v0, v4}, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->setResult(I)V

    .line 157
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->finish()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 162
    .end local v3           #page:Ljava/net/URL;
    :catch_0
    move-exception v4

    move-object v1, v4

    .line 163
    .local v1, ex:Ljava/lang/Exception;
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f060047

    invoke-static {v4, v5, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    .line 164
    invoke-static {v1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    goto/16 :goto_0

    .line 158
    .end local v1           #ex:Ljava/lang/Exception;
    .restart local v3       #page:Ljava/net/URL;
    :cond_4
    :try_start_1
    invoke-virtual {v3}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->getCancelUrl()Ljava/net/URL;

    move-result-object v5

    invoke-virtual {v5}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 159
    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->setResult(I)V

    .line 160
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->finish()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 8
    .parameter "view"
    .parameter "errorCode"
    .parameter "description"
    .parameter "failingUrl"

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 105
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    .line 106
    const-string v3, "URL %s failed to load with error %d %s"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p4, v4, v6

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v7

    const/4 v5, 0x2

    aput-object p3, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 108
    .local v2, msg:Ljava/lang/String;
    iget-object v3, p0, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView$FacebookClient;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;

    .line 109
    .local v0, activity:Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;
    if-eqz v0, :cond_1

    .line 110
    const-string v3, "FacebookLoginWebView"

    invoke-static {v3, v2}, Lcom/nloko/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3, v2, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 113
    invoke-static {v0}, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->access$000(Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;)Landroid/app/ProgressDialog;

    move-result-object v1

    .line 114
    .local v1, dialog:Landroid/app/Dialog;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/app/Dialog;->isShowing()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 115
    invoke-virtual {v0, v6}, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->removeDialog(I)V

    .line 118
    :cond_0
    invoke-virtual {v0, v6}, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->setResult(I)V

    .line 119
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;->finish()V

    .line 121
    .end local v1           #dialog:Landroid/app/Dialog;
    :cond_1
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 1
    .parameter "view"
    .parameter "url"

    .prologue
    .line 170
    const/4 v0, 0x0

    return v0
.end method

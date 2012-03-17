.class public Lcom/nloko/simplyfacebook/net/login/FacebookLogin;
.super Lcom/nloko/simplyfacebook/net/FacebookRequest;
.source "FacebookLogin.java"


# instance fields
.field private cancelUrl:Ljava/net/URL;

.field private nextUrl:Ljava/net/URL;

.field private response:Ljava/net/URL;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 38
    invoke-direct {p0}, Lcom/nloko/simplyfacebook/net/FacebookRequest;-><init>()V

    .line 65
    iput-object v0, p0, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->nextUrl:Ljava/net/URL;

    .line 80
    iput-object v0, p0, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->cancelUrl:Ljava/net/URL;

    .line 153
    iput-object v0, p0, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->response:Ljava/net/URL;

    .line 41
    :try_start_0
    const-string v0, "https://ssl.facebook.com/login.php"

    invoke-virtual {p0, v0}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->setUrl(Ljava/lang/String;)V

    .line 42
    const-string v0, "https://ssl.facebook.com/connect/login_success.html"

    invoke-virtual {p0, v0}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->setNextUrl(Ljava/lang/String;)V

    .line 43
    const-string v0, "https://ssl.facebook.com/connect/login_failure.html"

    invoke-virtual {p0, v0}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->setCancelUrl(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    :goto_0
    return-void

    .line 45
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "nextUrl"
    .parameter "cancelUrl"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 50
    invoke-direct {p0}, Lcom/nloko/simplyfacebook/net/FacebookRequest;-><init>()V

    .line 65
    iput-object v0, p0, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->nextUrl:Ljava/net/URL;

    .line 80
    iput-object v0, p0, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->cancelUrl:Ljava/net/URL;

    .line 153
    iput-object v0, p0, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->response:Ljava/net/URL;

    .line 52
    :try_start_0
    const-string v0, "https://ssl.facebook.com/login.php"

    invoke-virtual {p0, v0}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->setUrl(Ljava/lang/String;)V

    .line 53
    invoke-virtual {p0, p1}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->setNextUrl(Ljava/lang/String;)V

    .line 54
    invoke-virtual {p0, p2}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->setCancelUrl(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    :goto_0
    return-void

    .line 56
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter "nextUrl"
    .parameter "cancelUrl"
    .parameter "apiKey"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 61
    invoke-direct {p0, p1, p2}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    invoke-virtual {p0, p3}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->setAPIKey(Ljava/lang/String;)V

    .line 63
    return-void
.end method


# virtual methods
.method public getCancelUrl()Ljava/net/URL;
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->cancelUrl:Ljava/net/URL;

    return-object v0
.end method

.method public getFullLoginUrl()Ljava/lang/String;
    .locals 3

    .prologue
    .line 172
    :try_start_0
    invoke-virtual {p0}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->getUrl()Ljava/net/URL;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->getRequiredQueryString()Ljava/util/Map;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/nloko/simplyfacebook/util/Utilities;->buildUrl(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 177
    :goto_0
    return-object v1

    .line 173
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 174
    .local v0, e:Ljava/net/MalformedURLException;
    invoke-virtual {v0}, Ljava/net/MalformedURLException;->printStackTrace()V

    .line 177
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getNextUrl()Ljava/net/URL;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->nextUrl:Ljava/net/URL;

    return-object v0
.end method

.method protected getRequiredQueryString()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 104
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 105
    .local v0, query:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "api_key"

    invoke-virtual {p0}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->getAPIKey()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    const-string v1, "fbconnect"

    const-string v2, "true"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    const-string v1, "v"

    invoke-virtual {p0}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->getVersion()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    const-string v1, "connect_display"

    const-string v2, "popup"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    const-string v1, "next"

    invoke-virtual {p0}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->getNextUrl()Ljava/net/URL;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    const-string v1, "cancel_url"

    invoke-virtual {p0}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->getCancelUrl()Ljava/net/URL;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    const-string v1, "return_session"

    const-string v2, "true"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    const-string v1, "req_perms"

    const-string v2, "offline_access"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    return-object v0
.end method

.method protected getResponse()Ljava/net/URL;
    .locals 1

    .prologue
    .line 166
    iget-object v0, p0, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->response:Ljava/net/URL;

    return-object v0
.end method

.method public isLoggedIn()Z
    .locals 1

    .prologue
    .line 97
    invoke-virtual {p0}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->getUid()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->getSessionKey()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->getSecret()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected parseResponse()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 119
    invoke-virtual {p0}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->getResponse()Ljava/net/URL;

    move-result-object v3

    if-nez v3, :cond_1

    .line 151
    :cond_0
    :goto_0
    return-void

    .line 123
    :cond_1
    invoke-virtual {p0}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->getResponse()Ljava/net/URL;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v2

    .line 124
    .local v2, query:Ljava/lang/String;
    if-nez v2, :cond_2

    .line 125
    new-instance v3, Ljava/io/IOException;

    const-string v4, "Querystring is empty."

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 128
    :cond_2
    const-string v3, "session="

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 133
    :try_start_0
    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 139
    new-instance v1, Lorg/json/JSONObject;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 140
    .local v1, obj:Lorg/json/JSONObject;
    const-string v3, "session_key"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 141
    const-string v3, "session_key"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->setSessionKey(Ljava/lang/String;)V

    .line 144
    :cond_3
    const-string v3, "uid"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 145
    const-string v3, "uid"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->setUid(Ljava/lang/String;)V

    .line 148
    :cond_4
    const-string v3, "secret"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 149
    const-string v3, "secret"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->setSecret(Ljava/lang/String;)V

    goto :goto_0

    .line 134
    .end local v1           #obj:Lorg/json/JSONObject;
    :catch_0
    move-exception v3

    move-object v0, v3

    .line 135
    .local v0, e:Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0
.end method

.method public setCancelUrl(Ljava/lang/String;)V
    .locals 2
    .parameter "url"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 88
    if-nez p1, :cond_0

    .line 89
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "url"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 92
    :cond_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->cancelUrl:Ljava/net/URL;

    .line 93
    return-void
.end method

.method public setNextUrl(Ljava/lang/String;)V
    .locals 2
    .parameter "url"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 73
    if-nez p1, :cond_0

    .line 74
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "url"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 77
    :cond_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->nextUrl:Ljava/net/URL;

    .line 78
    return-void
.end method

.method public setResponseFromExternalBrowser(Ljava/net/URL;)V
    .locals 2
    .parameter "response"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 156
    if-nez p1, :cond_0

    .line 157
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "response"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 160
    :cond_0
    iput-object p1, p0, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->response:Ljava/net/URL;

    .line 161
    invoke-virtual {p0}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->parseResponse()V

    .line 162
    return-void
.end method

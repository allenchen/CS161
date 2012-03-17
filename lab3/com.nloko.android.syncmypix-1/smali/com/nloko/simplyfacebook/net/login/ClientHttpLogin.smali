.class public Lcom/nloko/simplyfacebook/net/login/ClientHttpLogin;
.super Lcom/nloko/simplyfacebook/net/Request;
.source "ClientHttpLogin.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/nloko/simplyfacebook/net/Request;-><init>()V

    .line 37
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "loginUrl"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lcom/nloko/simplyfacebook/net/Request;-><init>(Ljava/lang/String;)V

    .line 42
    return-void
.end method


# virtual methods
.method public login(Ljava/lang/String;Ljava/util/Map;)Lcom/nloko/simplyfacebook/net/Response;
    .locals 2
    .parameter "url"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/nloko/simplyfacebook/net/Response;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 55
    .local p2, params:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p2, :cond_0

    .line 56
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "params"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 59
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/nloko/simplyfacebook/net/login/ClientHttpLogin;->login(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)Lcom/nloko/simplyfacebook/net/Response;

    move-result-object v0

    return-object v0
.end method

.method public login(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)Lcom/nloko/simplyfacebook/net/Response;
    .locals 1
    .parameter "url"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/nloko/simplyfacebook/net/Response;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 66
    .local p2, params:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p3, headers:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p0, p1, p2, p3}, Lcom/nloko/simplyfacebook/net/login/ClientHttpLogin;->postRequest(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)Lcom/nloko/simplyfacebook/net/Response;

    move-result-object v0

    return-object v0
.end method

.method public login(Ljava/util/Map;)Lcom/nloko/simplyfacebook/net/Response;
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/nloko/simplyfacebook/net/Response;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 48
    .local p1, params:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p0}, Lcom/nloko/simplyfacebook/net/login/ClientHttpLogin;->getUrl()Ljava/net/URL;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Lcom/nloko/simplyfacebook/net/login/ClientHttpLogin;->login(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)Lcom/nloko/simplyfacebook/net/Response;

    move-result-object v0

    return-object v0
.end method

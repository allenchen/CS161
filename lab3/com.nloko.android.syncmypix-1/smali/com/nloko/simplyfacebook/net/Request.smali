.class public abstract Lcom/nloko/simplyfacebook/net/Request;
.super Ljava/lang/Object;
.source "Request.java"


# instance fields
.field private Url:Ljava/net/URL;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nloko/simplyfacebook/net/Request;->Url:Ljava/net/URL;

    .line 44
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "url"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nloko/simplyfacebook/net/Request;->Url:Ljava/net/URL;

    .line 48
    invoke-virtual {p0, p1}, Lcom/nloko/simplyfacebook/net/Request;->setUrl(Ljava/lang/String;)V

    .line 49
    return-void
.end method


# virtual methods
.method protected getRequest(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)Lcom/nloko/simplyfacebook/net/Response;
    .locals 7
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
    .line 70
    .local p2, params:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p3, headers:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p1, :cond_0

    .line 71
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "url"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 74
    :cond_0
    const/4 v2, 0x0

    .line 75
    .local v2, get:Lorg/apache/http/client/methods/HttpGet;
    if-eqz p2, :cond_1

    .line 76
    new-instance v2, Lorg/apache/http/client/methods/HttpGet;

    .end local v2           #get:Lorg/apache/http/client/methods/HttpGet;
    invoke-static {p1, p2}, Lcom/nloko/simplyfacebook/util/Utilities;->buildUrl(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 82
    .restart local v2       #get:Lorg/apache/http/client/methods/HttpGet;
    :goto_0
    if-eqz p3, :cond_2

    .line 83
    invoke-interface {p3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 84
    .local v1, e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v2, v5, v6}, Lorg/apache/http/client/methods/HttpGet;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 79
    .end local v1           #e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v4           #i$:Ljava/util/Iterator;
    :cond_1
    new-instance v2, Lorg/apache/http/client/methods/HttpGet;

    .end local v2           #get:Lorg/apache/http/client/methods/HttpGet;
    invoke-direct {v2, p1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .restart local v2       #get:Lorg/apache/http/client/methods/HttpGet;
    goto :goto_0

    .line 88
    :cond_2
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 89
    .local v0, client:Lorg/apache/http/impl/client/DefaultHttpClient;
    new-instance v3, Lcom/nloko/simplyfacebook/net/Request$1;

    invoke-direct {v3, p0}, Lcom/nloko/simplyfacebook/net/Request$1;-><init>(Lcom/nloko/simplyfacebook/net/Request;)V

    .line 101
    .local v3, handler:Lorg/apache/http/client/ResponseHandler;,"Lorg/apache/http/client/ResponseHandler<Lcom/nloko/simplyfacebook/net/Response;>;"
    invoke-virtual {v0, v2, v3}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/client/ResponseHandler;)Ljava/lang/Object;

    move-result-object p0

    .end local p0
    check-cast p0, Lcom/nloko/simplyfacebook/net/Response;

    return-object p0
.end method

.method public getUrl()Ljava/net/URL;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/nloko/simplyfacebook/net/Request;->Url:Ljava/net/URL;

    return-object v0
.end method

.method protected postRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Lcom/nloko/simplyfacebook/net/Response;
    .locals 5
    .parameter "url"
    .parameter "contentType"
    .parameter "body"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
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
    .line 108
    .local p4, headers:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p1, :cond_0

    .line 109
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "url"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 112
    :cond_0
    if-nez p2, :cond_1

    .line 113
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "contentType"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 116
    :cond_1
    if-nez p3, :cond_2

    .line 117
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "body"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 120
    :cond_2
    new-instance v2, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v2, p1}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 121
    .local v2, post:Lorg/apache/http/client/methods/HttpPost;
    const-string v3, "Content-Type"

    invoke-virtual {v2, v3, p2}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    if-eqz p4, :cond_3

    .line 124
    invoke-interface {p4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 125
    .local v0, e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 129
    .end local v0           #e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1           #i$:Ljava/util/Iterator;
    :cond_3
    new-instance v3, Lorg/apache/http/entity/StringEntity;

    invoke-direct {v3, p3}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 131
    invoke-virtual {p0, v2}, Lcom/nloko/simplyfacebook/net/Request;->postRequest(Lorg/apache/http/client/methods/HttpPost;)Lcom/nloko/simplyfacebook/net/Response;

    move-result-object v3

    return-object v3
.end method

.method protected postRequest(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)Lcom/nloko/simplyfacebook/net/Response;
    .locals 6
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
    .line 138
    .local p2, params:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p3, headers:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p1, :cond_0

    .line 139
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "url"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 142
    :cond_0
    new-instance v2, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v2, p1}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 144
    .local v2, post:Lorg/apache/http/client/methods/HttpPost;
    if-eqz p3, :cond_1

    .line 145
    invoke-interface {p3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 146
    .local v0, e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/apache/http/client/methods/HttpPost;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 150
    .end local v0           #e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1           #i$:Ljava/util/Iterator;
    :cond_1
    if-eqz p2, :cond_2

    .line 151
    const-string v3, "Content-Type"

    const-string v4, "application/x-www-form-urlencoded"

    invoke-virtual {v2, v3, v4}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    new-instance v3, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    invoke-static {p2}, Lcom/nloko/simplyfacebook/util/Utilities;->convertMapToNameValuePairList(Ljava/util/Map;)Ljava/util/List;

    move-result-object v4

    const-string v5, "UTF-8"

    invoke-direct {v3, v4, v5}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 155
    :cond_2
    invoke-virtual {p0, v2}, Lcom/nloko/simplyfacebook/net/Request;->postRequest(Lorg/apache/http/client/methods/HttpPost;)Lcom/nloko/simplyfacebook/net/Response;

    move-result-object v3

    return-object v3
.end method

.method protected postRequest(Lorg/apache/http/client/methods/HttpPost;)Lcom/nloko/simplyfacebook/net/Response;
    .locals 2
    .parameter "post"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 160
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 162
    .local v0, client:Lorg/apache/http/impl/client/DefaultHttpClient;
    new-instance v1, Lcom/nloko/simplyfacebook/net/Request$2;

    invoke-direct {v1, p0}, Lcom/nloko/simplyfacebook/net/Request$2;-><init>(Lcom/nloko/simplyfacebook/net/Request;)V

    .line 174
    .local v1, handler:Lorg/apache/http/client/ResponseHandler;,"Lorg/apache/http/client/ResponseHandler<Lcom/nloko/simplyfacebook/net/Response;>;"
    invoke-virtual {v0, p1, v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/client/ResponseHandler;)Ljava/lang/Object;

    move-result-object p0

    .end local p0
    check-cast p0, Lcom/nloko/simplyfacebook/net/Response;

    return-object p0
.end method

.method public setUrl(Ljava/lang/String;)V
    .locals 2
    .parameter "url"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 59
    if-nez p1, :cond_0

    .line 60
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "url"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 63
    :cond_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/nloko/simplyfacebook/net/Request;->Url:Ljava/net/URL;

    .line 64
    return-void
.end method

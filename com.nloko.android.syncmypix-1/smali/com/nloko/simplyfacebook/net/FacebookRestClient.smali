.class public Lcom/nloko/simplyfacebook/net/FacebookRestClient;
.super Lcom/nloko/simplyfacebook/net/FacebookRequest;
.source "FacebookRestClient.java"


# instance fields
.field private format:Ljava/lang/String;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/nloko/simplyfacebook/net/FacebookRequest;-><init>()V

    .line 95
    const-string v0, "JSON"

    iput-object v0, p0, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->format:Ljava/lang/String;

    .line 42
    :try_start_0
    const-string v0, "http://api.facebook.com/restserver.php"

    invoke-virtual {p0, v0}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->setUrl(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    :goto_0
    return-void

    .line 44
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public constructor <init>(Lcom/nloko/simplyfacebook/net/login/FacebookLogin;)V
    .locals 2
    .parameter "login"

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;-><init>()V

    .line 51
    if-nez p1, :cond_0

    .line 52
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "login"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 55
    :cond_0
    invoke-virtual {p1}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->isLoggedIn()Z

    move-result v0

    if-nez v0, :cond_1

    .line 56
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Not logged in."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 59
    :cond_1
    invoke-virtual {p1}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->getUid()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->setUid(Ljava/lang/String;)V

    .line 60
    invoke-virtual {p1}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->getAPIKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->setAPIKey(Ljava/lang/String;)V

    .line 61
    invoke-virtual {p1}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->getSecret()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->setSecret(Ljava/lang/String;)V

    .line 62
    invoke-virtual {p1}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->getSessionKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->setSessionKey(Ljava/lang/String;)V

    .line 63
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "apiKey"
    .parameter "uid"
    .parameter "session"
    .parameter "secret"

    .prologue
    .line 67
    invoke-direct {p0}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;-><init>()V

    .line 69
    if-nez p1, :cond_0

    .line 70
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "apiKey"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 73
    :cond_0
    if-nez p2, :cond_1

    .line 74
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "uid"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 77
    :cond_1
    if-nez p3, :cond_2

    .line 78
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "session"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 81
    :cond_2
    if-nez p4, :cond_3

    .line 82
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "secret"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 85
    :cond_3
    invoke-virtual {p0, p1}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->setAPIKey(Ljava/lang/String;)V

    .line 86
    invoke-virtual {p0, p2}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->setUid(Ljava/lang/String;)V

    .line 87
    invoke-virtual {p0, p4}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->setSecret(Ljava/lang/String;)V

    .line 88
    invoke-virtual {p0, p3}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->setSessionKey(Ljava/lang/String;)V

    .line 90
    invoke-virtual {p0}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->isSessionValid()Z

    move-result v0

    if-nez v0, :cond_4

    .line 91
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Failed to validate session."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 93
    :cond_4
    return-void
.end method


# virtual methods
.method protected addRequiredParams(Ljava/util/Map;)Ljava/util/Map;
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
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 201
    .local p1, params:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p0}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->getSessionKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->getSecret()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->addRequiredParams(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method protected addRequiredParams(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;
    .locals 3
    .parameter
    .parameter "session"
    .parameter "secret"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 206
    .local p1, params:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p1, :cond_0

    .line 207
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "params"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 210
    :cond_0
    if-nez p2, :cond_1

    .line 211
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "session"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 214
    :cond_1
    if-nez p3, :cond_2

    .line 215
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "secret"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 218
    :cond_2
    const-string v0, "api_key"

    invoke-virtual {p0}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->getAPIKey()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 219
    const-string v0, "session_key"

    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    const-string v0, "call_id"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 221
    const-string v0, "v"

    invoke-virtual {p0}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->getVersion()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    const-string v0, "format"

    invoke-virtual {p0}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->getFormat()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    const-string v0, "sig"

    invoke-virtual {p0, p1, p3}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->getSig(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 225
    return-object p1
.end method

.method public getData(Ljava/lang/String;)Lcom/nloko/simplyfacebook/net/Response;
    .locals 1
    .parameter "method"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 230
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->getData(Ljava/lang/String;Ljava/util/Map;)Lcom/nloko/simplyfacebook/net/Response;

    move-result-object v0

    return-object v0
.end method

.method public getData(Ljava/lang/String;Ljava/util/Map;)Lcom/nloko/simplyfacebook/net/Response;
    .locals 2
    .parameter "method"
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
    .line 235
    .local p2, params:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p1, :cond_0

    .line 236
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "method"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 239
    :cond_0
    if-nez p2, :cond_1

    .line 240
    new-instance p2, Ljava/util/HashMap;

    .end local p2           #params:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 243
    .restart local p2       #params:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    const-string v0, "method"

    invoke-interface {p2, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 245
    invoke-virtual {p0, p2}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->getData(Ljava/util/Map;)Lcom/nloko/simplyfacebook/net/Response;

    move-result-object v0

    return-object v0
.end method

.method public getData(Ljava/util/Map;)Lcom/nloko/simplyfacebook/net/Response;
    .locals 1
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
    .line 250
    .local p1, params:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->getData(Ljava/util/Map;Z)Lcom/nloko/simplyfacebook/net/Response;

    move-result-object v0

    return-object v0
.end method

.method public getData(Ljava/util/Map;Z)Lcom/nloko/simplyfacebook/net/Response;
    .locals 3
    .parameter
    .parameter "addRequired"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z)",
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
    .line 255
    .local p1, params:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p1, :cond_0

    .line 256
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "params"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 259
    :cond_0
    if-eqz p2, :cond_1

    .line 260
    invoke-virtual {p0, p1}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->addRequiredParams(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    .line 263
    :cond_1
    invoke-virtual {p0}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->getUrl()Ljava/net/URL;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v1, p1, v2}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->postRequest(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)Lcom/nloko/simplyfacebook/net/Response;

    move-result-object v0

    .line 264
    .local v0, r:Lcom/nloko/simplyfacebook/net/Response;
    invoke-virtual {p0}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->getFormat()Ljava/lang/String;

    move-result-object v1

    const-string v2, "JSON"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 265
    invoke-static {v0}, Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;->From(Lcom/nloko/simplyfacebook/net/Response;)Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;

    move-result-object v1

    .line 268
    :goto_0
    return-object v1

    :cond_2
    move-object v1, v0

    goto :goto_0
.end method

.method public getFormat()Ljava/lang/String;
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->format:Ljava/lang/String;

    return-object v0
.end method

.method protected getSig(Ljava/util/Map;)Ljava/lang/String;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 176
    .local p1, params:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p0}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->getSecret()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->getSig(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getSig(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .parameter
    .parameter "key"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 181
    .local p1, params:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p1, :cond_0

    .line 182
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "params"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 185
    :cond_0
    if-nez p2, :cond_1

    .line 186
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "key"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 189
    :cond_1
    new-instance v3, Ljava/util/TreeMap;

    invoke-direct {v3, p1}, Ljava/util/TreeMap;-><init>(Ljava/util/Map;)V

    .line 190
    .local v3, sortedParams:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 192
    .local v2, sb:Ljava/lang/StringBuilder;
    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .end local p0
    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 193
    .local v0, e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 196
    .end local v0           #e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/nloko/simplyfacebook/util/SimpleMD5;->hash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method protected isSessionValid()Z
    .locals 3

    .prologue
    .line 142
    invoke-virtual {p0}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->getUid()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->getSessionKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->getSecret()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->isSessionValid(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method protected isSessionValid(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5
    .parameter "uid"
    .parameter "session"
    .parameter "secret"

    .prologue
    const/4 v4, 0x0

    .line 147
    if-nez p2, :cond_0

    .line 148
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "session"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 151
    :cond_0
    if-nez p3, :cond_1

    .line 152
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "secret"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 155
    :cond_1
    if-nez p1, :cond_2

    .line 156
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "uid"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 159
    :cond_2
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 160
    .local v0, params:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "method"

    const-string v3, "users.getLoggedInUser"

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    invoke-virtual {p0, v0, p2, p3}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->addRequiredParams(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    .line 164
    const/4 v2, 0x0

    :try_start_0
    invoke-virtual {p0, v0, v2}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->getData(Ljava/util/Map;Z)Lcom/nloko/simplyfacebook/net/Response;

    move-result-object v1

    check-cast v1, Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;

    .line 165
    .local v1, r:Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;->isError()Z

    move-result v2

    if-nez v2, :cond_3

    iget-object v2, v1, Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;->data:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->getUid()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    if-eqz v2, :cond_3

    .line 166
    const/4 v2, 0x1

    .line 171
    .end local v1           #r:Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;
    :goto_0
    return v2

    .line 169
    :catch_0
    move-exception v2

    :cond_3
    move v2, v4

    .line 171
    goto :goto_0
.end method

.method public setFormat(Ljava/lang/String;)V
    .locals 2
    .parameter "format"

    .prologue
    .line 103
    if-nez p1, :cond_0

    .line 104
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "format"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 107
    :cond_0
    iput-object p1, p0, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->format:Ljava/lang/String;

    .line 108
    return-void
.end method

.method public setNewSession(Lcom/nloko/simplyfacebook/net/login/FacebookLogin;)Z
    .locals 3
    .parameter "login"

    .prologue
    .line 112
    invoke-virtual {p1}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->getUid()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->getSessionKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/nloko/simplyfacebook/net/login/FacebookLogin;->getSecret()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->setNewSession(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public setNewSession(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .parameter "uid"
    .parameter "session"
    .parameter "secret"

    .prologue
    .line 117
    if-nez p1, :cond_0

    .line 118
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "uid"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 121
    :cond_0
    if-nez p2, :cond_1

    .line 122
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "session"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 125
    :cond_1
    if-nez p3, :cond_2

    .line 126
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "secret"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 129
    :cond_2
    invoke-virtual {p0, p1, p2, p3}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->isSessionValid(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 130
    invoke-virtual {p0, p1}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->setUid(Ljava/lang/String;)V

    .line 131
    invoke-virtual {p0, p2}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->setSessionKey(Ljava/lang/String;)V

    .line 132
    invoke-virtual {p0, p3}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->setSecret(Ljava/lang/String;)V

    .line 134
    const/4 v0, 0x1

    .line 137
    :goto_0
    return v0

    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method

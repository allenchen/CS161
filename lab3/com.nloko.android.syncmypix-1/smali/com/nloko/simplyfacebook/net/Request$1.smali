.class Lcom/nloko/simplyfacebook/net/Request$1;
.super Ljava/lang/Object;
.source "Request.java"

# interfaces
.implements Lorg/apache/http/client/ResponseHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/simplyfacebook/net/Request;->getRequest(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)Lcom/nloko/simplyfacebook/net/Response;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/apache/http/client/ResponseHandler",
        "<",
        "Lcom/nloko/simplyfacebook/net/Response;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nloko/simplyfacebook/net/Request;


# direct methods
.method constructor <init>(Lcom/nloko/simplyfacebook/net/Request;)V
    .locals 0
    .parameter

    .prologue
    .line 89
    iput-object p1, p0, Lcom/nloko/simplyfacebook/net/Request$1;->this$0:Lcom/nloko/simplyfacebook/net/Request;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleResponse(Lorg/apache/http/HttpResponse;)Lcom/nloko/simplyfacebook/net/Response;
    .locals 4
    .parameter "response"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 92
    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    .line 93
    .local v0, entity:Lorg/apache/http/HttpEntity;
    if-eqz v0, :cond_0

    .line 94
    new-instance v1, Lcom/nloko/simplyfacebook/net/Response;

    invoke-interface {p1}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v2

    invoke-static {v0}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/nloko/simplyfacebook/net/Response;-><init>(ILjava/lang/String;)V

    .line 96
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public bridge synthetic handleResponse(Lorg/apache/http/HttpResponse;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 89
    invoke-virtual {p0, p1}, Lcom/nloko/simplyfacebook/net/Request$1;->handleResponse(Lorg/apache/http/HttpResponse;)Lcom/nloko/simplyfacebook/net/Response;

    move-result-object v0

    return-object v0
.end method

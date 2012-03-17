.class public abstract Lcom/nloko/simplyfacebook/net/FacebookRequest;
.super Lcom/nloko/simplyfacebook/net/Request;
.source "FacebookRequest.java"


# instance fields
.field private apiKey:Ljava/lang/String;

.field private secret:Ljava/lang/String;

.field private sessionKey:Ljava/lang/String;

.field private uid:Ljava/lang/String;

.field private version:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 24
    invoke-direct {p0}, Lcom/nloko/simplyfacebook/net/Request;-><init>()V

    .line 26
    iput-object v1, p0, Lcom/nloko/simplyfacebook/net/FacebookRequest;->uid:Ljava/lang/String;

    .line 41
    iput-object v1, p0, Lcom/nloko/simplyfacebook/net/FacebookRequest;->apiKey:Ljava/lang/String;

    .line 56
    const-string v0, "1.0"

    iput-object v0, p0, Lcom/nloko/simplyfacebook/net/FacebookRequest;->version:Ljava/lang/String;

    .line 71
    iput-object v1, p0, Lcom/nloko/simplyfacebook/net/FacebookRequest;->sessionKey:Ljava/lang/String;

    .line 86
    iput-object v1, p0, Lcom/nloko/simplyfacebook/net/FacebookRequest;->secret:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getAPIKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/nloko/simplyfacebook/net/FacebookRequest;->apiKey:Ljava/lang/String;

    return-object v0
.end method

.method public getSecret()Ljava/lang/String;
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lcom/nloko/simplyfacebook/net/FacebookRequest;->secret:Ljava/lang/String;

    return-object v0
.end method

.method public getSessionKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/nloko/simplyfacebook/net/FacebookRequest;->sessionKey:Ljava/lang/String;

    return-object v0
.end method

.method public getUid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/nloko/simplyfacebook/net/FacebookRequest;->uid:Ljava/lang/String;

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/nloko/simplyfacebook/net/FacebookRequest;->version:Ljava/lang/String;

    return-object v0
.end method

.method public setAPIKey(Ljava/lang/String;)V
    .locals 2
    .parameter "key"

    .prologue
    .line 49
    if-nez p1, :cond_0

    .line 50
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "key"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 53
    :cond_0
    iput-object p1, p0, Lcom/nloko/simplyfacebook/net/FacebookRequest;->apiKey:Ljava/lang/String;

    .line 54
    return-void
.end method

.method protected setSecret(Ljava/lang/String;)V
    .locals 2
    .parameter "secret"

    .prologue
    .line 94
    if-nez p1, :cond_0

    .line 95
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "secret"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 98
    :cond_0
    iput-object p1, p0, Lcom/nloko/simplyfacebook/net/FacebookRequest;->secret:Ljava/lang/String;

    .line 99
    return-void
.end method

.method protected setSessionKey(Ljava/lang/String;)V
    .locals 2
    .parameter "key"

    .prologue
    .line 79
    if-nez p1, :cond_0

    .line 80
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "key"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 83
    :cond_0
    iput-object p1, p0, Lcom/nloko/simplyfacebook/net/FacebookRequest;->sessionKey:Ljava/lang/String;

    .line 84
    return-void
.end method

.method protected setUid(Ljava/lang/String;)V
    .locals 2
    .parameter "uid"

    .prologue
    .line 34
    if-nez p1, :cond_0

    .line 35
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "uid"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 38
    :cond_0
    iput-object p1, p0, Lcom/nloko/simplyfacebook/net/FacebookRequest;->uid:Ljava/lang/String;

    .line 39
    return-void
.end method

.method public setVersion(Ljava/lang/String;)V
    .locals 2
    .parameter "version"

    .prologue
    .line 64
    if-nez p1, :cond_0

    .line 65
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "version"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 68
    :cond_0
    iput-object p1, p0, Lcom/nloko/simplyfacebook/net/FacebookRequest;->version:Ljava/lang/String;

    .line 69
    return-void
.end method

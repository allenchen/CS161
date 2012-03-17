.class public Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;
.super Lcom/nloko/simplyfacebook/net/Response;
.source "FacebookJSONResponse.java"


# instance fields
.field private error:I

.field private errorMsg:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/nloko/simplyfacebook/net/Response;-><init>()V

    .line 65
    const/4 v0, 0x0

    iput v0, p0, Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;->error:I

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;->errorMsg:Ljava/lang/String;

    .line 31
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 1
    .parameter "status"
    .parameter "data"

    .prologue
    .line 35
    invoke-direct {p0, p1, p2}, Lcom/nloko/simplyfacebook/net/Response;-><init>(ILjava/lang/String;)V

    .line 65
    const/4 v0, 0x0

    iput v0, p0, Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;->error:I

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;->errorMsg:Ljava/lang/String;

    .line 36
    invoke-virtual {p0}, Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;->parseJSON()V

    .line 37
    return-void
.end method

.method public static From(Lcom/nloko/simplyfacebook/net/Response;)Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;
    .locals 3
    .parameter "r"

    .prologue
    .line 41
    new-instance v0, Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;

    iget v1, p0, Lcom/nloko/simplyfacebook/net/Response;->status:I

    iget-object v2, p0, Lcom/nloko/simplyfacebook/net/Response;->data:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;-><init>(ILjava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public getError()I
    .locals 1

    .prologue
    .line 68
    iget v0, p0, Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;->error:I

    return v0
.end method

.method public getErrorMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;->errorMsg:Ljava/lang/String;

    return-object v0
.end method

.method public isError()Z
    .locals 1

    .prologue
    .line 62
    iget v0, p0, Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;->error:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected parseJSON()V
    .locals 3

    .prologue
    .line 46
    iget v1, p0, Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;->status:I

    const/16 v2, 0xc8

    if-eq v1, v2, :cond_1

    .line 58
    :cond_0
    :goto_0
    return-void

    .line 51
    :cond_1
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    iget-object v1, p0, Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;->data:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 52
    .local v0, obj:Lorg/json/JSONObject;
    const-string v1, "error_code"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 53
    const-string v1, "error_code"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;->error:I

    .line 54
    const-string v1, "error_msg"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;->errorMsg:Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 57
    .end local v0           #obj:Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    goto :goto_0
.end method

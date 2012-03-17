.class public Lcom/nloko/android/syncmypix/facebook/FacebookApi;
.super Ljava/lang/Object;
.source "FacebookApi.java"


# static fields
.field public static final API_KEY:Ljava/lang/String; = "d03f3dcb1ebb264e1ea701bd16f44e5a"


# instance fields
.field private client:Lcom/nloko/simplyfacebook/net/FacebookRestClient;


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    return-void
.end method

.method public constructor <init>(Lcom/nloko/simplyfacebook/net/FacebookRestClient;)V
    .locals 2
    .parameter "client"

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    if-nez p1, :cond_0

    .line 54
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "client"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 57
    :cond_0
    iput-object p1, p0, Lcom/nloko/android/syncmypix/facebook/FacebookApi;->client:Lcom/nloko/simplyfacebook/net/FacebookRestClient;

    .line 58
    return-void
.end method

.method private setHighResPhotos(Ljava/lang/String;Ljava/util/Map;)V
    .locals 16
    .parameter "uids"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/nloko/android/syncmypix/SocialNetworkUser;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 134
    .local p2, userMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lcom/nloko/android/syncmypix/SocialNetworkUser;>;"
    if-nez p1, :cond_0

    .line 135
    new-instance v14, Ljava/lang/IllegalArgumentException;

    const-string v15, "uids"

    invoke-direct {v14, v15}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 138
    :cond_0
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 140
    .local v7, params:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v9, "SELECT owner, cover_pid, aid, name FROM album WHERE owner IN (%s) AND name IN (\"Profile Pictures\")"

    .line 144
    .local v9, pid_query:Ljava/lang/String;
    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    aput-object p1, v14, v15

    invoke-static {v9, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 146
    const-string v8, "SELECT owner, src_big FROM photo WHERE pid IN (SELECT cover_pid FROM #query1) "

    .line 149
    .local v8, photo:Ljava/lang/String;
    const/4 v13, 0x0

    .line 150
    .local v13, user:Lcom/nloko/android/syncmypix/SocialNetworkUser;
    const/4 v12, 0x0

    .line 151
    .local v12, url:Ljava/lang/String;
    const/4 v11, 0x0

    .line 154
    .local v11, uid:Ljava/lang/String;
    :try_start_0
    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10}, Lorg/json/JSONObject;-><init>()V

    .line 155
    .local v10, queries:Lorg/json/JSONObject;
    const-string v14, "query1"

    invoke-virtual {v10, v14, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 156
    const-string v14, "query2"

    invoke-virtual {v10, v14, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 158
    const-string v14, "queries"

    invoke-virtual {v10}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-interface {v7, v14, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/facebook/FacebookApi;->client:Lcom/nloko/simplyfacebook/net/FacebookRestClient;

    move-object v14, v0

    const-string v15, "Fql.multiquery"

    invoke-virtual {v14, v15, v7}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->getData(Ljava/lang/String;Ljava/util/Map;)Lcom/nloko/simplyfacebook/net/Response;

    move-result-object v5

    check-cast v5, Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;

    .line 162
    .local v5, jr:Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;
    new-instance v2, Lorg/json/JSONArray;

    iget-object v14, v5, Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;->data:Ljava/lang/String;

    invoke-direct {v2, v14}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 163
    .local v2, array:Lorg/json/JSONArray;
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v14

    const/4 v15, 0x1

    if-le v14, v15, :cond_2

    .line 164
    const/4 v14, 0x1

    invoke-virtual {v2, v14}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    .line 165
    .local v6, obj:Lorg/json/JSONObject;
    const-string v14, "fql_result_set"

    invoke-virtual {v6, v14}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 167
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-ge v4, v14, :cond_2

    .line 168
    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    .line 169
    const-string v14, "owner"

    invoke-virtual {v6, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 171
    move-object/from16 v0, p2

    move-object v1, v11

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_1

    .line 172
    const-string v14, "src_big"

    invoke-virtual {v6, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 173
    move-object/from16 v0, p2

    move-object v1, v11

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    move-object v0, v14

    check-cast v0, Lcom/nloko/android/syncmypix/SocialNetworkUser;

    move-object v13, v0

    .line 174
    iput-object v12, v13, Lcom/nloko/android/syncmypix/SocialNetworkUser;->picUrl:Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 167
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 179
    .end local v2           #array:Lorg/json/JSONArray;
    .end local v4           #i:I
    .end local v5           #jr:Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;
    .end local v6           #obj:Lorg/json/JSONObject;
    .end local v10           #queries:Lorg/json/JSONObject;
    :catch_0
    move-exception v14

    move-object v3, v14

    .line 180
    .local v3, e:Lorg/json/JSONException;
    const/4 v14, 0x0

    invoke-static {v3}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/nloko/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    .end local v3           #e:Lorg/json/JSONException;
    :cond_2
    return-void
.end method


# virtual methods
.method public getFriends()Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 62
    iget-object v4, p0, Lcom/nloko/android/syncmypix/facebook/FacebookApi;->client:Lcom/nloko/simplyfacebook/net/FacebookRestClient;

    const-string v5, "Friends.get"

    invoke-virtual {v4, v5}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->getData(Ljava/lang/String;)Lcom/nloko/simplyfacebook/net/Response;

    move-result-object v2

    check-cast v2, Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;

    .line 63
    .local v2, response:Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;->isError()Z

    move-result v4

    if-nez v4, :cond_1

    .line 64
    new-instance v0, Lorg/json/JSONArray;

    iget-object v4, v2, Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;->data:Ljava/lang/String;

    invoke-direct {v0, v4}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 65
    .local v0, friends:Lorg/json/JSONArray;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 66
    .local v3, sb:Ljava/lang/StringBuilder;
    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 68
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v4

    const/4 v5, 0x1

    if-le v4, v5, :cond_0

    .line 69
    const/4 v1, 0x1

    .local v1, i:I
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v1, v4, :cond_0

    .line 70
    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 69
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 75
    .end local v1           #i:I
    :cond_0
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 78
    .end local v0           #friends:Lorg/json/JSONArray;
    .end local v3           #sb:Ljava/lang/StringBuilder;
    :goto_1
    return-object v4

    :cond_1
    const/4 v4, 0x0

    goto :goto_1
.end method

.method public getUserInfo(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .parameter "uids"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/nloko/android/syncmypix/SocialNetworkUser;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 83
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/nloko/android/syncmypix/facebook/FacebookApi;->getUserInfo(Ljava/lang/String;Z)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getUserInfo(Ljava/lang/String;Z)Ljava/util/List;
    .locals 11
    .parameter "uids"
    .parameter "highQuality"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/List",
            "<",
            "Lcom/nloko/android/syncmypix/SocialNetworkUser;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    .line 88
    if-nez p1, :cond_0

    .line 89
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "uids"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 92
    :cond_0
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 93
    .local v3, params:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v8, "uids"

    invoke-interface {v3, v8, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    const-string v8, "fields"

    const-string v9, "uid,first_name,last_name,name,email,pic_big"

    invoke-interface {v3, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    iget-object v8, p0, Lcom/nloko/android/syncmypix/facebook/FacebookApi;->client:Lcom/nloko/simplyfacebook/net/FacebookRestClient;

    const-string v9, "Users.getInfo"

    invoke-virtual {v8, v9, v3}, Lcom/nloko/simplyfacebook/net/FacebookRestClient;->getData(Ljava/lang/String;Ljava/util/Map;)Lcom/nloko/simplyfacebook/net/Response;

    move-result-object v4

    check-cast v4, Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;

    .line 97
    .local v4, response:Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;
    if-eqz v4, :cond_1

    invoke-virtual {v4}, Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;->isError()Z

    move-result v8

    if-eqz v8, :cond_2

    :cond_1
    move-object v8, v10

    .line 129
    :goto_0
    return-object v8

    .line 101
    :cond_2
    new-instance v7, Lorg/json/JSONArray;

    iget-object v8, v4, Lcom/nloko/simplyfacebook/net/FacebookJSONResponse;->data:Ljava/lang/String;

    invoke-direct {v7, v8}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 103
    .local v7, users:Lorg/json/JSONArray;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 104
    .local v2, list:Ljava/util/List;,"Ljava/util/List<Lcom/nloko/android/syncmypix/SocialNetworkUser;>;"
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 106
    .local v6, userMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lcom/nloko/android/syncmypix/SocialNetworkUser;>;"
    const/4 v0, 0x0

    .line 107
    .local v0, fbUser:Lcom/nloko/android/syncmypix/SocialNetworkUser;
    const/4 v5, 0x0

    .line 109
    .local v5, user:Lorg/json/JSONObject;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v1, v8, :cond_5

    .line 110
    invoke-virtual {v7, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    .line 111
    new-instance v0, Lcom/nloko/android/syncmypix/SocialNetworkUser;

    .end local v0           #fbUser:Lcom/nloko/android/syncmypix/SocialNetworkUser;
    invoke-direct {v0}, Lcom/nloko/android/syncmypix/SocialNetworkUser;-><init>()V

    .line 112
    .restart local v0       #fbUser:Lcom/nloko/android/syncmypix/SocialNetworkUser;
    const-string v8, "uid"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v0, Lcom/nloko/android/syncmypix/SocialNetworkUser;->uid:Ljava/lang/String;

    .line 113
    const-string v8, "first_name"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v0, Lcom/nloko/android/syncmypix/SocialNetworkUser;->firstName:Ljava/lang/String;

    .line 114
    const-string v8, "last_name"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v0, Lcom/nloko/android/syncmypix/SocialNetworkUser;->lastName:Ljava/lang/String;

    .line 115
    const-string v8, "name"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v0, Lcom/nloko/android/syncmypix/SocialNetworkUser;->name:Ljava/lang/String;

    .line 116
    const-string v8, "email"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v0, Lcom/nloko/android/syncmypix/SocialNetworkUser;->email:Ljava/lang/String;

    .line 117
    const-string v8, "pic_big"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "null"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_3

    const-string v8, "pic_big"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, ""

    if-ne v8, v9, :cond_4

    :cond_3
    move-object v8, v10

    :goto_2
    iput-object v8, v0, Lcom/nloko/android/syncmypix/SocialNetworkUser;->picUrl:Ljava/lang/String;

    .line 121
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 122
    const-string v8, "uid"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v8, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 117
    :cond_4
    const-string v8, "pic_big"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    goto :goto_2

    .line 125
    :cond_5
    if-eqz p2, :cond_6

    .line 126
    invoke-direct {p0, p1, v6}, Lcom/nloko/android/syncmypix/facebook/FacebookApi;->setHighResPhotos(Ljava/lang/String;Ljava/util/Map;)V

    :cond_6
    move-object v8, v2

    .line 129
    goto/16 :goto_0
.end method

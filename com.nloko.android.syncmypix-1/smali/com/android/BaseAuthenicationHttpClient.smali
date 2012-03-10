.class public Lcom/android/BaseAuthenicationHttpClient;
.super Ljava/lang/Object;
.source "BaseAuthenicationHttpClient.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static doRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .parameter "urlString"
    .parameter "name"
    .parameter "password"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 68
    :try_start_0
    new-instance v6, Ljava/net/URL;

    invoke-direct {v6, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 70
    .local v6, url:Ljava/net/URL;
    invoke-virtual {v6}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v5

    .line 72
    .local v5, uc:Ljava/net/URLConnection;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v9, ":"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 73
    .local v7, userPassword:Ljava/lang/String;
    invoke-static {v7}, Lcom/android/Base64;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 75
    .local v2, encoding:Ljava/lang/String;
    const-string v8, "Authorization"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "Basic "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v8, v9}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    const-string v8, "User-Agent"

    const-string v9, "Mozilla/5.0"

    invoke-virtual {v5, v8, v9}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    invoke-virtual {v5}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 79
    .local v0, content:Ljava/io/InputStream;
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v8, Ljava/io/InputStreamReader;

    const-string v9, "UTF-8"

    invoke-direct {v8, v0, v9}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v3, v8}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 80
    .local v3, in:Ljava/io/BufferedReader;
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 82
    .local v4, line:Ljava/lang/String;
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V

    .line 83
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v8

    return-object v8

    .line 84
    .end local v0           #content:Ljava/io/InputStream;
    .end local v2           #encoding:Ljava/lang/String;
    .end local v3           #in:Ljava/io/BufferedReader;
    .end local v4           #line:Ljava/lang/String;
    .end local v5           #uc:Ljava/net/URLConnection;
    .end local v6           #url:Ljava/net/URL;
    .end local v7           #userPassword:Ljava/lang/String;
    :catch_0
    move-exception v8

    move-object v1, v8

    .line 85
    .local v1, e:Ljava/io/IOException;
    new-instance v8, Ljava/lang/Exception;

    invoke-direct {v8, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    throw v8
.end method

.method public static doRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;
    .locals 3
    .parameter "urlString"
    .parameter "name"
    .parameter "password"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 26
    .local p3, params:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 27
    .local v0, url:Ljava/net/URL;
    new-instance p0, Ljava/lang/StringBuilder;

    .end local p0
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .end local p1
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p1, ":"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 29
    .local p0, userPassword:Ljava/lang/String;
    invoke-static {p0}, Lcom/android/Base64;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .end local p0           #userPassword:Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 32
    .local p0, encoding:Ljava/lang/String;
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p2

    .end local p2
    check-cast p2, Ljava/net/HttpURLConnection;

    .line 33
    .local p2, uc:Ljava/net/HttpURLConnection;
    const-string p1, "Authorization"

    new-instance v0, Ljava/lang/StringBuilder;

    .end local v0           #url:Ljava/net/URL;
    const-string v1, "Basic "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .end local p0           #encoding:Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p1, p0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    const-string p0, "User-Agent"

    const-string p1, "Mozilla/5.0"

    invoke-virtual {p2, p0, p1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    const/4 p0, 0x1

    invoke-virtual {p2, p0}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 37
    const/4 p0, 0x1

    invoke-virtual {p2, p0}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 38
    const-string p0, "POST"

    invoke-virtual {p2, p0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 41
    if-eqz p3, :cond_0

    invoke-virtual {p3}, Ljava/util/HashMap;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_0

    .line 42
    new-instance p0, Ljava/lang/StringBuffer;

    invoke-direct {p0}, Ljava/lang/StringBuffer;-><init>()V

    .line 43
    .local p0, buf:Ljava/lang/StringBuffer;
    invoke-virtual {p3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-nez p1, :cond_1

    .line 46
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuffer;->deleteCharAt(I)Ljava/lang/StringBuffer;

    .line 47
    invoke-virtual {p2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p1

    invoke-virtual {p0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    .end local p0           #buf:Ljava/lang/StringBuffer;
    const-string p3, "UTF-8"

    .end local p3           #params:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p0, p3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/io/OutputStream;->write([B)V

    .line 48
    invoke-virtual {p2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V

    .line 51
    :cond_0
    invoke-virtual {p2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p0

    .line 52
    .local p0, content:Ljava/io/InputStream;
    new-instance p1, Ljava/io/BufferedReader;

    new-instance p2, Ljava/io/InputStreamReader;

    .end local p2           #uc:Ljava/net/HttpURLConnection;
    const-string p3, "UTF-8"

    invoke-direct {p2, p0, p3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {p1, p2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 53
    .local p1, in:Ljava/io/BufferedReader;
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object p0

    .line 57
    .local p0, line:Ljava/lang/String;
    invoke-virtual {p1}, Ljava/io/BufferedReader;->close()V

    .line 58
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .end local p0           #line:Ljava/lang/String;
    return-object p0

    .line 43
    .end local p1           #in:Ljava/io/BufferedReader;
    .local p0, buf:Ljava/lang/StringBuffer;
    .restart local p2       #uc:Ljava/net/HttpURLConnection;
    .restart local p3       #params:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 44
    .local p1, key:Ljava/lang/String;
    const-string v1, "&"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p3, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .end local p1           #key:Ljava/lang/String;
    check-cast p1, Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 59
    .end local p0           #buf:Ljava/lang/StringBuffer;
    .end local p2           #uc:Ljava/net/HttpURLConnection;
    .end local p3           #params:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_0
    move-exception p0

    .line 60
    .local p0, e:Ljava/io/IOException;
    new-instance p1, Ljava/lang/Exception;

    invoke-direct {p1, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    throw p1
.end method

.method public static getCodeByURL(Ljava/lang/String;I)I
    .locals 8
    .parameter "urlString"
    .parameter "i"

    .prologue
    const/4 v7, 0x1

    .line 125
    const/4 v2, 0x0

    .line 127
    .local v2, responseCode:I
    :try_start_0
    new-instance v3, Ljava/net/URL;

    invoke-direct {v3, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 128
    .local v3, url:Ljava/net/URL;
    invoke-virtual {v3}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    .line 129
    .local v1, httpConnection:Ljava/net/HttpURLConnection;
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 131
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->connect()V

    .line 132
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 136
    .end local v1           #httpConnection:Ljava/net/HttpURLConnection;
    .end local v3           #url:Ljava/net/URL;
    :goto_0
    const/16 v4, 0xc8

    if-eq v2, v4, :cond_0

    if-ge p1, v7, :cond_0

    .line 137
    add-int/lit8 p1, p1, 0x1

    .line 138
    invoke-static {p0, p1}, Lcom/android/BaseAuthenicationHttpClient;->getCodeByURL(Ljava/lang/String;I)I

    move-result v2

    .line 140
    :cond_0
    return v2

    .line 133
    :catch_0
    move-exception v4

    move-object v0, v4

    .line 134
    .local v0, e:Ljava/io/IOException;
    const-string v4, "info"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "getCodeByURL:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static getStringByURL(Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .parameter "urlString"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 96
    const/4 v5, 0x0

    .line 97
    .local v5, responseCode:I
    new-instance v6, Ljava/net/URL;

    invoke-direct {v6, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 98
    .local v6, url:Ljava/net/URL;
    invoke-virtual {v6}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    .line 99
    .local v1, httpConnection:Ljava/net/HttpURLConnection;
    const/4 v7, 0x1

    invoke-virtual {v1, v7}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 101
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->connect()V

    .line 102
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v5

    .line 103
    const/16 v7, 0xc8

    if-ne v5, v7, :cond_1

    .line 104
    new-instance v2, Ljava/io/InputStreamReader;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    const-string v8, "UTF-8"

    invoke-direct {v2, v7, v8}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 105
    .local v2, in:Ljava/io/InputStreamReader;
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 106
    .local v0, buffer:Ljava/io/BufferedReader;
    const-string v3, ""

    .line 107
    .local v3, inputData:Ljava/lang/String;
    const/4 v4, 0x0

    .line 108
    .local v4, inputLine:Ljava/lang/String;
    :goto_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_0

    .line 111
    const-string v7, "info"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "test:"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    invoke-virtual {v2}, Ljava/io/InputStreamReader;->close()V

    .line 116
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    move-object v7, v3

    .line 120
    .end local v0           #buffer:Ljava/io/BufferedReader;
    .end local v2           #in:Ljava/io/InputStreamReader;
    .end local v3           #inputData:Ljava/lang/String;
    .end local v4           #inputLine:Ljava/lang/String;
    :goto_1
    return-object v7

    .line 109
    .restart local v0       #buffer:Ljava/io/BufferedReader;
    .restart local v2       #in:Ljava/io/InputStreamReader;
    .restart local v3       #inputData:Ljava/lang/String;
    .restart local v4       #inputLine:Ljava/lang/String;
    :cond_0
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 120
    .end local v0           #buffer:Ljava/io/BufferedReader;
    .end local v2           #in:Ljava/io/InputStreamReader;
    .end local v3           #inputData:Ljava/lang/String;
    .end local v4           #inputLine:Ljava/lang/String;
    :cond_1
    const/4 v7, 0x0

    goto :goto_1
.end method

.method public static getXboxStrByURL(Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .parameter "urlString"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-string v10, "gzip, deflate"

    const-string v9, "Accept-Encoding"

    .line 144
    const/4 v5, 0x0

    .line 145
    .local v5, responseCode:I
    new-instance v6, Ljava/net/URL;

    invoke-direct {v6, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 146
    .local v6, url:Ljava/net/URL;
    invoke-virtual {v6}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    .line 147
    .local v1, httpConnection:Ljava/net/HttpURLConnection;
    const/16 v7, 0x2710

    invoke-virtual {v1, v7}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 148
    const-string v7, "User-Agent"

    const-string v8, "NokiaN7610-1/4.0850.43.1.1 Series60/3.0 Profile/MIDP-2.0 Configuration/CLDC-1.1"

    invoke-virtual {v1, v7, v8}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    const-string v7, "Accept"

    const-string v8, "*/*"

    invoke-virtual {v1, v7, v8}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    const-string v7, "Accept-Encoding"

    const-string v7, "gzip, deflate"

    invoke-virtual {v1, v9, v10}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    const-string v7, "Accept-Charset"

    const-string v8, "UTF-8"

    invoke-virtual {v1, v7, v8}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    const-string v7, "Accept-Encoding"

    const-string v7, "gzip, deflate"

    invoke-virtual {v1, v9, v10}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    const-string v7, "info"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getRequestProperties()Ljava/util/Map;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->connect()V

    .line 158
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v5

    .line 159
    const/16 v7, 0xc8

    if-ne v5, v7, :cond_1

    .line 160
    new-instance v2, Ljava/io/InputStreamReader;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v2, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 161
    .local v2, in:Ljava/io/InputStreamReader;
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 162
    .local v0, buffer:Ljava/io/BufferedReader;
    const-string v3, ""

    .line 163
    .local v3, inputData:Ljava/lang/String;
    const/4 v4, 0x0

    .line 164
    .local v4, inputLine:Ljava/lang/String;
    :goto_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_0

    .line 168
    invoke-virtual {v2}, Ljava/io/InputStreamReader;->close()V

    .line 171
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    move-object v7, v3

    .line 175
    .end local v0           #buffer:Ljava/io/BufferedReader;
    .end local v2           #in:Ljava/io/InputStreamReader;
    .end local v3           #inputData:Ljava/lang/String;
    .end local v4           #inputLine:Ljava/lang/String;
    :goto_1
    return-object v7

    .line 165
    .restart local v0       #buffer:Ljava/io/BufferedReader;
    .restart local v2       #in:Ljava/io/InputStreamReader;
    .restart local v3       #inputData:Ljava/lang/String;
    .restart local v4       #inputLine:Ljava/lang/String;
    :cond_0
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 175
    .end local v0           #buffer:Ljava/io/BufferedReader;
    .end local v2           #in:Ljava/io/InputStreamReader;
    .end local v3           #inputData:Ljava/lang/String;
    .end local v4           #inputLine:Ljava/lang/String;
    :cond_1
    const/4 v7, 0x0

    goto :goto_1
.end method

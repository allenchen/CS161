.class public final Lcom/nloko/android/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Utils"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bitmapToJpeg(Landroid/graphics/Bitmap;I)[B
    .locals 4
    .parameter "bitmap"
    .parameter "quality"

    .prologue
    .line 317
    if-nez p0, :cond_0

    .line 318
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "bitmap"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 321
    :cond_0
    const/4 v1, 0x0

    .line 324
    .local v1, image:[B
    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 326
    .local v0, bytes:Ljava/io/ByteArrayOutputStream;
    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {p0, v2, p1, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 327
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    .line 328
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 331
    .end local v0           #bytes:Ljava/io/ByteArrayOutputStream;
    :goto_0
    return-object v1

    .line 329
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public static bitmapToPNG(Landroid/graphics/Bitmap;)[B
    .locals 4
    .parameter "bitmap"

    .prologue
    .line 336
    if-nez p0, :cond_0

    .line 337
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "bitmap"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 340
    :cond_0
    const/4 v1, 0x0

    .line 343
    .local v1, image:[B
    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 345
    .local v0, bytes:Ljava/io/ByteArrayOutputStream;
    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v3, 0x64

    invoke-virtual {p0, v2, v3, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 346
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    .line 347
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 350
    .end local v0           #bytes:Ljava/io/ByteArrayOutputStream;
    :goto_0
    return-object v1

    .line 348
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public static buildNameSelection(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .parameter "field"
    .parameter "firstName"
    .parameter "lastName"

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 120
    if-nez p0, :cond_0

    .line 121
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "field"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 124
    :cond_0
    if-nez p1, :cond_1

    .line 125
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "firstName"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 128
    :cond_1
    if-nez p2, :cond_2

    .line 129
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "lastName"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 133
    :cond_2
    const-string v1, "\'"

    const-string v2, "\'\'"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 134
    const-string v1, "\'"

    const-string v2, "\'\'"

    invoke-virtual {p2, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    .line 136
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 137
    .local v0, sb:Ljava/lang/StringBuilder;
    const-string v1, "%s = \'%s %s\' OR "

    new-array v2, v6, [Ljava/lang/Object;

    aput-object p0, v2, v3

    aput-object p1, v2, v4

    aput-object p2, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    const-string v1, "%s = \'%s, %s\' OR "

    new-array v2, v6, [Ljava/lang/Object;

    aput-object p0, v2, v3

    aput-object p2, v2, v4

    aput-object p1, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    const-string v1, "%s = \'%s,%s\'"

    new-array v2, v6, [Ljava/lang/Object;

    aput-object p0, v2, v3

    aput-object p2, v2, v4

    aput-object p1, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static centerCrop(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .locals 4
    .parameter "bitmap"
    .parameter "destHeight"
    .parameter "destWidth"

    .prologue
    const/4 v3, 0x0

    .line 178
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    if-le v1, v2, :cond_0

    .line 179
    invoke-static {p0, v3, p2}, Lcom/nloko/android/Utils;->resize(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 185
    .local v0, resized:Landroid/graphics/Bitmap;
    :goto_0
    invoke-static {v0, p2, p2}, Lcom/nloko/android/Utils;->crop(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v1

    return-object v1

    .line 182
    .end local v0           #resized:Landroid/graphics/Bitmap;
    :cond_0
    invoke-static {p0, p1, v3}, Lcom/nloko/android/Utils;->resize(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v0

    .restart local v0       #resized:Landroid/graphics/Bitmap;
    goto :goto_0
.end method

.method public static crop(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .locals 13
    .parameter "bitmapToCrop"
    .parameter "destHeight"
    .parameter "destWidth"

    .prologue
    .line 190
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    .line 191
    .local v8, width:I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    .line 192
    .local v2, height:I
    if-gt v8, p2, :cond_0

    if-gt v2, p1, :cond_0

    move-object v9, p0

    .line 212
    :goto_0
    return-object v9

    .line 196
    :cond_0
    sget-object v9, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p2, v9}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 197
    .local v0, b:Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 199
    .local v1, c1:Landroid/graphics/Canvas;
    div-int/lit8 v4, v8, 0x2

    .line 200
    .local v4, midpointX:I
    div-int/lit8 v5, v2, 0x2

    .line 202
    .local v5, midpointY:I
    new-instance v6, Landroid/graphics/Rect;

    div-int/lit8 v9, p2, 0x2

    sub-int v9, v4, v9

    div-int/lit8 v10, p1, 0x2

    sub-int v10, v5, v10

    div-int/lit8 v11, p2, 0x2

    add-int/2addr v11, v4

    div-int/lit8 v12, p1, 0x2

    add-int/2addr v12, v5

    invoke-direct {v6, v9, v10, v11, v12}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 207
    .local v6, r:Landroid/graphics/Rect;
    const/4 v3, 0x0

    .line 208
    .local v3, left:I
    const/4 v7, 0x0

    .line 209
    .local v7, top:I
    new-instance v9, Landroid/graphics/Rect;

    add-int v10, v3, p2

    add-int v11, v7, p1

    invoke-direct {v9, v3, v7, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    const/4 v10, 0x0

    invoke-virtual {v1, p0, v6, v9, v10}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    move-object v9, v0

    .line 212
    goto :goto_0
.end method

.method public static determineOsVersion()I
    .locals 1

    .prologue
    .line 60
    sget-object v0, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static downloadPictureAsStream(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 11
    .parameter "url"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 274
    if-nez p0, :cond_0

    .line 275
    new-instance v9, Ljava/lang/IllegalArgumentException;

    const-string v10, "url"

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 278
    :cond_0
    const/4 v3, 0x0

    .line 279
    .local v3, httpclient:Lorg/apache/http/client/HttpClient;
    const/4 v8, 0x0

    .line 281
    .local v8, stream:Ljava/io/InputStream;
    :try_start_0
    new-instance v6, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v6}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 283
    .local v6, params:Lorg/apache/http/params/HttpParams;
    const/16 v9, 0x1388

    invoke-static {v6, v9}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 286
    const/16 v9, 0x2710

    invoke-static {v6, v9}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 288
    new-instance v4, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v4, v6}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/params/HttpParams;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 289
    .end local v3           #httpclient:Lorg/apache/http/client/HttpClient;
    .local v4, httpclient:Lorg/apache/http/client/HttpClient;
    :try_start_1
    new-instance v5, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v5, p0}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 291
    .local v5, httpget:Lorg/apache/http/client/methods/HttpGet;
    invoke-interface {v4, v5}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v7

    .line 292
    .local v7, response:Lorg/apache/http/HttpResponse;
    invoke-interface {v7}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    .line 293
    .local v1, entity:Lorg/apache/http/HttpEntity;
    if-eqz v1, :cond_1

    .line 294
    new-instance v0, Lorg/apache/http/entity/BufferedHttpEntity;

    invoke-direct {v0, v1}, Lorg/apache/http/entity/BufferedHttpEntity;-><init>(Lorg/apache/http/HttpEntity;)V

    .line 295
    .local v0, buff:Lorg/apache/http/entity/BufferedHttpEntity;
    invoke-virtual {v0}, Lorg/apache/http/entity/BufferedHttpEntity;->getContent()Ljava/io/InputStream;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    move-result-object v8

    .line 303
    .end local v0           #buff:Lorg/apache/http/entity/BufferedHttpEntity;
    :cond_1
    if-eqz v4, :cond_2

    .line 304
    :try_start_2
    invoke-interface {v4}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 306
    :cond_2
    if-eqz v8, :cond_3

    .line 307
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    .line 312
    :cond_3
    :goto_0
    return-object v8

    .line 298
    .end local v1           #entity:Lorg/apache/http/HttpEntity;
    .end local v4           #httpclient:Lorg/apache/http/client/HttpClient;
    .end local v5           #httpget:Lorg/apache/http/client/methods/HttpGet;
    .end local v6           #params:Lorg/apache/http/params/HttpParams;
    .end local v7           #response:Lorg/apache/http/HttpResponse;
    .restart local v3       #httpclient:Lorg/apache/http/client/HttpClient;
    :catch_0
    move-exception v9

    move-object v2, v9

    .line 299
    .local v2, ex:Ljava/io/IOException;
    :goto_1
    const/4 v9, 0x0

    :try_start_3
    invoke-static {v2}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/nloko/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 302
    .end local v2           #ex:Ljava/io/IOException;
    :catchall_0
    move-exception v9

    .line 303
    :goto_2
    if-eqz v3, :cond_4

    .line 304
    :try_start_4
    invoke-interface {v3}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v10

    invoke-interface {v10}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 306
    :cond_4
    if-eqz v8, :cond_5

    .line 307
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 309
    :cond_5
    :goto_3
    throw v9

    :catch_1
    move-exception v10

    goto :goto_3

    .line 302
    .end local v3           #httpclient:Lorg/apache/http/client/HttpClient;
    .restart local v4       #httpclient:Lorg/apache/http/client/HttpClient;
    .restart local v6       #params:Lorg/apache/http/params/HttpParams;
    :catchall_1
    move-exception v9

    move-object v3, v4

    .end local v4           #httpclient:Lorg/apache/http/client/HttpClient;
    .restart local v3       #httpclient:Lorg/apache/http/client/HttpClient;
    goto :goto_2

    .line 298
    .end local v3           #httpclient:Lorg/apache/http/client/HttpClient;
    .restart local v4       #httpclient:Lorg/apache/http/client/HttpClient;
    :catch_2
    move-exception v9

    move-object v2, v9

    move-object v3, v4

    .end local v4           #httpclient:Lorg/apache/http/client/HttpClient;
    .restart local v3       #httpclient:Lorg/apache/http/client/HttpClient;
    goto :goto_1

    .line 309
    .end local v3           #httpclient:Lorg/apache/http/client/HttpClient;
    .restart local v1       #entity:Lorg/apache/http/HttpEntity;
    .restart local v4       #httpclient:Lorg/apache/http/client/HttpClient;
    .restart local v5       #httpget:Lorg/apache/http/client/methods/HttpGet;
    .restart local v7       #response:Lorg/apache/http/HttpResponse;
    :catch_3
    move-exception v9

    goto :goto_0
.end method

.method public static downloadPictureAsStream(Ljava/lang/String;I)Ljava/io/InputStream;
    .locals 5
    .parameter "url"
    .parameter "retries"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 255
    if-nez p0, :cond_0

    .line 256
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "url"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 259
    :cond_0
    const/4 v2, 0x0

    .line 260
    .local v2, image:Ljava/io/InputStream;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-gt v1, p1, :cond_1

    .line 263
    :try_start_0
    invoke-static {p0}, Lcom/nloko/android/Utils;->downloadPictureAsStream(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    if-eqz v2, :cond_2

    .line 269
    :cond_1
    return-object v2

    .line 264
    :catch_0
    move-exception v0

    .line 265
    .local v0, e:Ljava/io/IOException;
    if-ne v1, p1, :cond_2

    throw v0

    .line 260
    .end local v0           #e:Ljava/io/IOException;
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static getByteArrayFromInputStream(Ljava/io/InputStream;)[B
    .locals 8
    .parameter "is"

    .prologue
    .line 146
    if-nez p0, :cond_0

    .line 147
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "is"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 150
    :cond_0
    const/16 v5, 0x2000

    .line 151
    .local v5, size:I
    const/4 v4, 0x0

    .line 152
    .local v4, read:I
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2, v5}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 153
    .local v2, bytes:Ljava/io/ByteArrayOutputStream;
    new-array v1, v5, [B

    .line 154
    .local v1, buffer:[B
    const/4 v0, 0x0

    .line 157
    .local v0, array:[B
    :goto_0
    const/4 v6, 0x0

    :try_start_0
    array-length v7, v1

    invoke-virtual {p0, v1, v6, v7}, Ljava/io/InputStream;->read([BII)I

    move-result v4

    if-lez v4, :cond_2

    .line 158
    const/4 v6, 0x0

    invoke-virtual {v2, v1, v6, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 161
    :catch_0
    move-exception v6

    move-object v3, v6

    .line 162
    .local v3, ex:Ljava/io/IOException;
    const/4 v6, 0x0

    .line 165
    if-eqz v2, :cond_1

    .line 166
    :try_start_1
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    .line 167
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 172
    .end local v3           #ex:Ljava/io/IOException;
    :cond_1
    :goto_1
    return-object v6

    .line 165
    :cond_2
    if-eqz v2, :cond_3

    .line 166
    :try_start_2
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    .line 167
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    :cond_3
    :goto_2
    move-object v6, v0

    .line 172
    goto :goto_1

    .line 164
    :catchall_0
    move-exception v6

    .line 165
    if-eqz v2, :cond_4

    .line 166
    :try_start_3
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    .line 167
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 169
    :cond_4
    :goto_3
    throw v6

    :catch_1
    move-exception v7

    goto :goto_3

    .restart local v3       #ex:Ljava/io/IOException;
    :catch_2
    move-exception v7

    goto :goto_1

    .end local v3           #ex:Ljava/io/IOException;
    :catch_3
    move-exception v6

    goto :goto_2
.end method

.method public static getMd5Hash([B)Ljava/lang/String;
    .locals 7
    .parameter "input"

    .prologue
    .line 93
    if-nez p0, :cond_0

    .line 94
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "input"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 98
    :cond_0
    :try_start_0
    const-string v5, "MD5"

    invoke-static {v5}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    .line 99
    .local v1, md:Ljava/security/MessageDigest;
    invoke-virtual {v1, p0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v3

    .line 100
    .local v3, messageDigest:[B
    new-instance v4, Ljava/math/BigInteger;

    const/4 v5, 0x1

    invoke-direct {v4, v5, v3}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 102
    .local v4, number:Ljava/math/BigInteger;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 103
    .local v2, md5:Ljava/lang/StringBuffer;
    const/16 v5, 0x10

    invoke-virtual {v4, v5}, Ljava/math/BigInteger;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 105
    :goto_0
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->length()I

    move-result v5

    const/16 v6, 0x20

    if-ge v5, v6, :cond_1

    .line 107
    const/4 v5, 0x0

    const-string v6, "0"

    invoke-virtual {v2, v5, v6}, Ljava/lang/StringBuffer;->insert(ILjava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 112
    .end local v1           #md:Ljava/security/MessageDigest;
    .end local v2           #md5:Ljava/lang/StringBuffer;
    .end local v3           #messageDigest:[B
    .end local v4           #number:Ljava/math/BigInteger;
    :catch_0
    move-exception v5

    move-object v0, v5

    .line 113
    .local v0, e:Ljava/security/NoSuchAlgorithmException;
    const-string v5, "MD5"

    invoke-virtual {v0}, Ljava/security/NoSuchAlgorithmException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/nloko/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    const/4 v5, 0x0

    .end local v0           #e:Ljava/security/NoSuchAlgorithmException;
    :goto_1
    return-object v5

    .line 110
    .restart local v1       #md:Ljava/security/MessageDigest;
    .restart local v2       #md5:Ljava/lang/StringBuffer;
    .restart local v3       #messageDigest:[B
    .restart local v4       #number:Ljava/math/BigInteger;
    :cond_1
    :try_start_1
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v5

    goto :goto_1
.end method

.method public static hasInternetConnection(Landroid/content/Context;)Z
    .locals 4
    .parameter "context"

    .prologue
    .line 81
    if-nez p0, :cond_0

    .line 82
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "context"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 85
    :cond_0
    const-string v2, "connectivity"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 86
    .local v0, connMgr:Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 88
    .local v1, info:Landroid/net/NetworkInfo;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static join([Ljava/lang/String;C)Ljava/lang/String;
    .locals 3
    .parameter "array"
    .parameter "separator"

    .prologue
    .line 65
    if-nez p0, :cond_0

    .line 66
    const/4 v2, 0x0

    .line 76
    :goto_0
    return-object v2

    .line 69
    :cond_0
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 71
    .local v1, sb:Ljava/lang/StringBuffer;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_1

    .line 72
    aget-object v2, p0, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 73
    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 71
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 76
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public static resize(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .locals 12
    .parameter "bitmap"
    .parameter "maxHeight"
    .parameter "maxWidth"

    .prologue
    const/4 v1, 0x0

    .line 217
    if-nez p0, :cond_0

    .line 218
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "bitmap"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 221
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    .line 222
    .local v4, height:I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    .line 224
    .local v3, width:I
    if-lez p1, :cond_1

    if-gt v4, p1, :cond_1

    if-lez p2, :cond_1

    if-gt v3, p2, :cond_1

    move-object v0, p0

    .line 250
    :goto_0
    return-object v0

    .line 228
    :cond_1
    move v7, v4

    .line 229
    .local v7, newHeight:I
    move v8, v3

    .line 233
    .local v8, newWidth:I
    if-le v7, p1, :cond_2

    if-lez p1, :cond_2

    .line 234
    int-to-float v0, v8

    int-to-float v2, v7

    div-float v9, v0, v2

    .line 235
    .local v9, ratio:F
    move v7, p1

    .line 236
    int-to-float v0, v7

    mul-float/2addr v0, v9

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v8

    .line 239
    .end local v9           #ratio:F
    :cond_2
    if-le v8, p2, :cond_3

    if-lez p2, :cond_3

    .line 240
    int-to-float v0, v7

    int-to-float v2, v8

    div-float v9, v0, v2

    .line 241
    .restart local v9       #ratio:F
    move v8, p2

    .line 242
    int-to-float v0, v8

    mul-float/2addr v0, v9

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v7

    .line 245
    .end local v9           #ratio:F
    :cond_3
    int-to-float v0, v8

    int-to-float v2, v3

    div-float v11, v0, v2

    .line 246
    .local v11, scaleWidth:F
    int-to-float v0, v7

    int-to-float v2, v4

    div-float v10, v0, v2

    .line 247
    .local v10, scaleHeight:F
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 248
    .local v5, matrix:Landroid/graphics/Matrix;
    invoke-virtual {v5, v11, v10}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 250
    const/4 v6, 0x1

    move-object v0, p0

    move v2, v1

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_0
.end method

.method public static setBoolean(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V
    .locals 3
    .parameter "settings"
    .parameter "key"
    .parameter "value"

    .prologue
    .line 355
    if-nez p0, :cond_0

    .line 356
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "settings"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 359
    :cond_0
    if-nez p1, :cond_1

    .line 360
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "key"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 363
    :cond_1
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 364
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 367
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 368
    return-void
.end method

.method public static setInt(Landroid/content/SharedPreferences;Ljava/lang/String;I)V
    .locals 3
    .parameter "settings"
    .parameter "key"
    .parameter "value"

    .prologue
    .line 389
    if-nez p0, :cond_0

    .line 390
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "settings"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 393
    :cond_0
    if-nez p1, :cond_1

    .line 394
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "key"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 397
    :cond_1
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 398
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 401
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 402
    return-void
.end method

.method public static setLong(Landroid/content/SharedPreferences;Ljava/lang/String;J)V
    .locals 3
    .parameter "settings"
    .parameter "key"
    .parameter "value"

    .prologue
    .line 406
    if-nez p0, :cond_0

    .line 407
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "settings"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 410
    :cond_0
    if-nez p1, :cond_1

    .line 411
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "key"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 414
    :cond_1
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 415
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 418
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 419
    return-void
.end method

.method public static setString(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .parameter "settings"
    .parameter "key"
    .parameter "value"

    .prologue
    .line 372
    if-nez p0, :cond_0

    .line 373
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "settings"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 376
    :cond_0
    if-nez p1, :cond_1

    .line 377
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "key"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 380
    :cond_1
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 381
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 384
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 385
    return-void
.end method

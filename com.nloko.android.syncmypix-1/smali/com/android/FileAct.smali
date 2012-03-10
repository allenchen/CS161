.class public Lcom/android/FileAct;
.super Ljava/lang/Object;
.source "FileAct.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static readByte(Ljava/lang/String;)[B
    .locals 9
    .parameter "path"

    .prologue
    .line 40
    const/4 v0, 0x0

    check-cast v0, [B

    .line 41
    .local v0, data:[B
    const/4 v2, 0x0

    .line 42
    .local v2, file:Ljava/io/File;
    const/4 v4, 0x0

    .line 44
    .local v4, in:Ljava/io/FileInputStream;
    :try_start_0
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .end local v2           #file:Ljava/io/File;
    .local v3, file:Ljava/io/File;
    :try_start_1
    invoke-virtual {v3}, Ljava/io/File;->exists()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_5

    move-result v7

    if-nez v7, :cond_1

    .line 52
    if-eqz v4, :cond_0

    .line 54
    :try_start_2
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    :cond_0
    :goto_0
    move-object v2, v3

    .end local v3           #file:Ljava/io/File;
    .restart local v2       #file:Ljava/io/File;
    move-object v1, v0

    .line 59
    .end local v0           #data:[B
    .local v1, data:[B
    :goto_1
    return-object v1

    .line 46
    .end local v1           #data:[B
    .end local v2           #file:Ljava/io/File;
    .restart local v0       #data:[B
    .restart local v3       #file:Ljava/io/File;
    :cond_1
    :try_start_3
    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_5

    .line 47
    .end local v4           #in:Ljava/io/FileInputStream;
    .local v5, in:Ljava/io/FileInputStream;
    :try_start_4
    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v7

    long-to-int v6, v7

    .line 48
    .local v6, length:I
    new-array v0, v6, [B

    .line 49
    const/4 v7, 0x0

    invoke-virtual {v5, v0, v7, v6}, Ljava/io/FileInputStream;->read([BII)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_6

    .line 52
    if-eqz v5, :cond_4

    .line 54
    :try_start_5
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    move-object v4, v5

    .end local v5           #in:Ljava/io/FileInputStream;
    .restart local v4       #in:Ljava/io/FileInputStream;
    move-object v2, v3

    .end local v3           #file:Ljava/io/File;
    .end local v6           #length:I
    .restart local v2       #file:Ljava/io/File;
    :cond_2
    :goto_2
    move-object v1, v0

    .line 59
    .end local v0           #data:[B
    .restart local v1       #data:[B
    goto :goto_1

    .line 50
    .end local v1           #data:[B
    .restart local v0       #data:[B
    :catch_0
    move-exception v7

    .line 52
    :goto_3
    if-eqz v4, :cond_2

    .line 54
    :try_start_6
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1

    goto :goto_2

    .line 55
    :catch_1
    move-exception v7

    goto :goto_2

    .line 51
    :catchall_0
    move-exception v7

    .line 52
    :goto_4
    if-eqz v4, :cond_3

    .line 54
    :try_start_7
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_4

    .line 58
    :cond_3
    :goto_5
    throw v7

    .line 55
    .end local v2           #file:Ljava/io/File;
    .end local v4           #in:Ljava/io/FileInputStream;
    .restart local v3       #file:Ljava/io/File;
    .restart local v5       #in:Ljava/io/FileInputStream;
    .restart local v6       #length:I
    :catch_2
    move-exception v7

    move-object v4, v5

    .end local v5           #in:Ljava/io/FileInputStream;
    .restart local v4       #in:Ljava/io/FileInputStream;
    move-object v2, v3

    .end local v3           #file:Ljava/io/File;
    .restart local v2       #file:Ljava/io/File;
    goto :goto_2

    .end local v2           #file:Ljava/io/File;
    .end local v6           #length:I
    .restart local v3       #file:Ljava/io/File;
    :catch_3
    move-exception v7

    goto :goto_0

    .end local v3           #file:Ljava/io/File;
    .restart local v2       #file:Ljava/io/File;
    :catch_4
    move-exception v8

    goto :goto_5

    .line 51
    .end local v2           #file:Ljava/io/File;
    .restart local v3       #file:Ljava/io/File;
    :catchall_1
    move-exception v7

    move-object v2, v3

    .end local v3           #file:Ljava/io/File;
    .restart local v2       #file:Ljava/io/File;
    goto :goto_4

    .end local v2           #file:Ljava/io/File;
    .end local v4           #in:Ljava/io/FileInputStream;
    .restart local v3       #file:Ljava/io/File;
    .restart local v5       #in:Ljava/io/FileInputStream;
    :catchall_2
    move-exception v7

    move-object v4, v5

    .end local v5           #in:Ljava/io/FileInputStream;
    .restart local v4       #in:Ljava/io/FileInputStream;
    move-object v2, v3

    .end local v3           #file:Ljava/io/File;
    .restart local v2       #file:Ljava/io/File;
    goto :goto_4

    .line 50
    .end local v2           #file:Ljava/io/File;
    .restart local v3       #file:Ljava/io/File;
    :catch_5
    move-exception v7

    move-object v2, v3

    .end local v3           #file:Ljava/io/File;
    .restart local v2       #file:Ljava/io/File;
    goto :goto_3

    .end local v2           #file:Ljava/io/File;
    .end local v4           #in:Ljava/io/FileInputStream;
    .restart local v3       #file:Ljava/io/File;
    .restart local v5       #in:Ljava/io/FileInputStream;
    :catch_6
    move-exception v7

    move-object v4, v5

    .end local v5           #in:Ljava/io/FileInputStream;
    .restart local v4       #in:Ljava/io/FileInputStream;
    move-object v2, v3

    .end local v3           #file:Ljava/io/File;
    .restart local v2       #file:Ljava/io/File;
    goto :goto_3

    .end local v2           #file:Ljava/io/File;
    .end local v4           #in:Ljava/io/FileInputStream;
    .restart local v3       #file:Ljava/io/File;
    .restart local v5       #in:Ljava/io/FileInputStream;
    .restart local v6       #length:I
    :cond_4
    move-object v4, v5

    .end local v5           #in:Ljava/io/FileInputStream;
    .restart local v4       #in:Ljava/io/FileInputStream;
    move-object v2, v3

    .end local v3           #file:Ljava/io/File;
    .restart local v2       #file:Ljava/io/File;
    goto :goto_2
.end method

.method public static readString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "path"

    .prologue
    .line 63
    const-string v1, ""

    .line 64
    .local v1, str:Ljava/lang/String;
    invoke-static {p0}, Lcom/android/FileAct;->readByte(Ljava/lang/String;)[B

    move-result-object v0

    .line 65
    .local v0, data:[B
    if-eqz v0, :cond_0

    .line 66
    new-instance v1, Ljava/lang/String;

    .end local v1           #str:Ljava/lang/String;
    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([B)V

    .line 67
    .restart local v1       #str:Ljava/lang/String;
    :cond_0
    return-object v1
.end method

.method public static writeByte([BLjava/lang/String;)V
    .locals 6
    .parameter "data"
    .parameter "path"

    .prologue
    .line 11
    const/4 v1, 0x0

    .line 12
    .local v1, file:Ljava/io/File;
    const/4 v3, 0x0

    .line 14
    .local v3, out:Ljava/io/FileOutputStream;
    :try_start_0
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .end local v1           #file:Ljava/io/File;
    .local v2, file:Ljava/io/File;
    :try_start_1
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 16
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 18
    :cond_0
    invoke-virtual {v2}, Ljava/io/File;->createNewFile()Z

    .line 19
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4

    .line 20
    .end local v3           #out:Ljava/io/FileOutputStream;
    .local v4, out:Ljava/io/FileOutputStream;
    :try_start_2
    invoke-virtual {v4, p0}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_5

    .line 24
    if-eqz v4, :cond_3

    .line 26
    :try_start_3
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    move-object v3, v4

    .end local v4           #out:Ljava/io/FileOutputStream;
    .restart local v3       #out:Ljava/io/FileOutputStream;
    move-object v1, v2

    .line 32
    .end local v2           #file:Ljava/io/File;
    .restart local v1       #file:Ljava/io/File;
    :cond_1
    :goto_0
    return-void

    .line 21
    :catch_0
    move-exception v5

    move-object v0, v5

    .line 22
    .local v0, e:Ljava/io/IOException;
    :goto_1
    :try_start_4
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 24
    if-eqz v3, :cond_1

    .line 26
    :try_start_5
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_0

    .line 27
    :catch_1
    move-exception v0

    .line 28
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 23
    .end local v0           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v5

    .line 24
    :goto_2
    if-eqz v3, :cond_2

    .line 26
    :try_start_6
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2

    .line 31
    :cond_2
    :goto_3
    throw v5

    .line 27
    :catch_2
    move-exception v0

    .line 28
    .restart local v0       #e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3

    .line 27
    .end local v0           #e:Ljava/io/IOException;
    .end local v1           #file:Ljava/io/File;
    .end local v3           #out:Ljava/io/FileOutputStream;
    .restart local v2       #file:Ljava/io/File;
    .restart local v4       #out:Ljava/io/FileOutputStream;
    :catch_3
    move-exception v0

    .line 28
    .restart local v0       #e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .end local v0           #e:Ljava/io/IOException;
    :cond_3
    move-object v3, v4

    .end local v4           #out:Ljava/io/FileOutputStream;
    .restart local v3       #out:Ljava/io/FileOutputStream;
    move-object v1, v2

    .end local v2           #file:Ljava/io/File;
    .restart local v1       #file:Ljava/io/File;
    goto :goto_0

    .line 23
    .end local v1           #file:Ljava/io/File;
    .restart local v2       #file:Ljava/io/File;
    :catchall_1
    move-exception v5

    move-object v1, v2

    .end local v2           #file:Ljava/io/File;
    .restart local v1       #file:Ljava/io/File;
    goto :goto_2

    .end local v1           #file:Ljava/io/File;
    .end local v3           #out:Ljava/io/FileOutputStream;
    .restart local v2       #file:Ljava/io/File;
    .restart local v4       #out:Ljava/io/FileOutputStream;
    :catchall_2
    move-exception v5

    move-object v3, v4

    .end local v4           #out:Ljava/io/FileOutputStream;
    .restart local v3       #out:Ljava/io/FileOutputStream;
    move-object v1, v2

    .end local v2           #file:Ljava/io/File;
    .restart local v1       #file:Ljava/io/File;
    goto :goto_2

    .line 21
    .end local v1           #file:Ljava/io/File;
    .restart local v2       #file:Ljava/io/File;
    :catch_4
    move-exception v5

    move-object v0, v5

    move-object v1, v2

    .end local v2           #file:Ljava/io/File;
    .restart local v1       #file:Ljava/io/File;
    goto :goto_1

    .end local v1           #file:Ljava/io/File;
    .end local v3           #out:Ljava/io/FileOutputStream;
    .restart local v2       #file:Ljava/io/File;
    .restart local v4       #out:Ljava/io/FileOutputStream;
    :catch_5
    move-exception v5

    move-object v0, v5

    move-object v3, v4

    .end local v4           #out:Ljava/io/FileOutputStream;
    .restart local v3       #out:Ljava/io/FileOutputStream;
    move-object v1, v2

    .end local v2           #file:Ljava/io/File;
    .restart local v1       #file:Ljava/io/File;
    goto :goto_1
.end method

.method public static writeString(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "str"
    .parameter "path"

    .prologue
    .line 35
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 36
    .local v0, data:[B
    invoke-static {v0, p1}, Lcom/android/FileAct;->writeByte([BLjava/lang/String;)V

    .line 37
    return-void
.end method

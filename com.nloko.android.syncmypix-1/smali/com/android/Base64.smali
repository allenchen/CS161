.class public Lcom/android/Base64;
.super Ljava/lang/Object;
.source "Base64.java"


# static fields
.field public static final BASE64CODE:Ljava/lang/String; = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

.field public static final BASE64DECODE:Ljava/lang/String; = "ABCDEGHIJKLMQRSTUVWXYZabcdefghijlmnopqrstwxyz0123456789."

.field public static final SPLIT_LINES_AT:I = 0x4c


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static encode(Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .parameter "string"

    .prologue
    const/4 v10, 0x0

    const-string v9, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

    .line 25
    const-string v0, ""

    .line 28
    .local v0, encoded:Ljava/lang/String;
    :try_start_0
    const-string v7, "UTF-8"

    invoke-virtual {p0, v7}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 33
    .local v6, stringArray:[B
    :goto_0
    const/4 v7, 0x3

    array-length v8, v6

    rem-int/lit8 v8, v8, 0x3

    sub-int/2addr v7, v8

    rem-int/lit8 v4, v7, 0x3

    .line 35
    .local v4, paddingCount:I
    array-length v7, v6

    add-int/2addr v7, v4

    invoke-static {v7, v6}, Lcom/android/Base64;->zeroPad(I[B)[B

    move-result-object v6

    .line 38
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    array-length v7, v6

    if-lt v1, v7, :cond_0

    .line 47
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v8

    .line 48
    sub-int/2addr v8, v4

    invoke-virtual {v0, v10, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "=="

    invoke-virtual {v8, v10, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 47
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/android/Base64;->splitLines(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 49
    .local v5, ret:Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    return-object v7

    .line 29
    .end local v1           #i:I
    .end local v4           #paddingCount:I
    .end local v5           #ret:Ljava/lang/String;
    .end local v6           #stringArray:[B
    :catch_0
    move-exception v7

    move-object v2, v7

    .line 30
    .local v2, ignored:Ljava/lang/Exception;
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    .restart local v6       #stringArray:[B
    goto :goto_0

    .line 39
    .end local v2           #ignored:Ljava/lang/Exception;
    .restart local v1       #i:I
    .restart local v4       #paddingCount:I
    :cond_0
    aget-byte v7, v6, v1

    shl-int/lit8 v7, v7, 0x10

    add-int/lit8 v8, v1, 0x1

    aget-byte v8, v6, v8

    shl-int/lit8 v8, v8, 0x8

    add-int/2addr v7, v8

    .line 40
    add-int/lit8 v8, v1, 0x2

    aget-byte v8, v6, v8

    .line 39
    add-int v3, v7, v8

    .line 41
    .local v3, j:I
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

    shr-int/lit8 v8, v3, 0x12

    and-int/lit8 v8, v8, 0x3f

    invoke-virtual {v9, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 42
    const-string v8, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

    shr-int/lit8 v8, v3, 0xc

    and-int/lit8 v8, v8, 0x3f

    invoke-virtual {v9, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 43
    const-string v8, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

    shr-int/lit8 v8, v3, 0x6

    and-int/lit8 v8, v8, 0x3f

    invoke-virtual {v9, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 44
    const-string v8, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

    and-int/lit8 v8, v3, 0x3f

    invoke-virtual {v9, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 41
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 38
    add-int/lit8 v1, v1, 0x3

    goto/16 :goto_1
.end method

.method public static encode(Ljava/lang/String;I)Ljava/lang/String;
    .locals 8
    .parameter "string"
    .parameter "len"

    .prologue
    const/4 v6, 0x3

    const-string v7, "."

    .line 54
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0xa

    if-ge v4, v5, :cond_1

    :cond_0
    const-string v4, ""

    .line 63
    :goto_0
    return-object v4

    .line 55
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 56
    .local v1, lens:I
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 57
    .local v2, sb:Ljava/lang/StringBuffer;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    div-int/lit8 v4, v1, 0x2

    if-lt v0, v4, :cond_2

    .line 61
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    .line 62
    new-instance v4, Ljava/lang/StringBuilder;

    const/4 v5, 0x0

    invoke-virtual {p0, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "."

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v5, v6

    invoke-virtual {p0, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "."

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v5, v6

    invoke-virtual {p0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    move-object v4, p0

    .line 63
    goto :goto_0

    .line 58
    :cond_2
    mul-int/lit8 v4, v0, 0x2

    add-int/2addr v4, p1

    mul-int/lit8 v5, v0, 0x2

    add-int/2addr v5, p1

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 59
    .local v3, tmpstr:Ljava/lang/String;
    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 57
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static splitLines(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .parameter "string"

    .prologue
    .line 68
    const-string v1, ""

    .line 69
    .local v1, lines:Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-lt v0, v2, :cond_0

    .line 75
    return-object v1

    .line 71
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v4, v0, 0x4c

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-virtual {p0, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 72
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "\r\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 69
    add-int/lit8 v0, v0, 0x4c

    goto :goto_0
.end method

.method public static zeroPad(I[B)[B
    .locals 3
    .parameter "length"
    .parameter "bytes"

    .prologue
    const/4 v2, 0x0

    .line 18
    new-array v0, p0, [B

    .line 19
    .local v0, padded:[B
    array-length v1, p1

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 20
    return-object v0
.end method

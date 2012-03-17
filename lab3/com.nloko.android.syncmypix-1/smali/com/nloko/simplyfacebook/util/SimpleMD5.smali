.class public Lcom/nloko/simplyfacebook/util/SimpleMD5;
.super Ljava/lang/Object;
.source "SimpleMD5.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static convertToHex([B)Ljava/lang/String;
    .locals 6
    .parameter "data"

    .prologue
    .line 10
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 12
    .local v0, buf:Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    array-length v5, p0

    if-ge v2, v5, :cond_1

    .line 13
    aget-byte v5, p0, v2

    ushr-int/lit8 v5, v5, 0x4

    and-int/lit8 v1, v5, 0xf

    .line 14
    .local v1, halfbyte:I
    const/4 v3, 0x0

    .local v3, two_halfs:I
    move v4, v3

    .line 17
    .end local v3           #two_halfs:I
    .local v4, two_halfs:I
    :goto_1
    if-ltz v1, :cond_0

    const/16 v5, 0x9

    if-gt v1, v5, :cond_0

    .line 18
    add-int/lit8 v5, v1, 0x30

    int-to-char v5, v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 21
    :goto_2
    aget-byte v5, p0, v2

    and-int/lit8 v1, v5, 0xf

    .line 22
    add-int/lit8 v3, v4, 0x1

    .end local v4           #two_halfs:I
    .restart local v3       #two_halfs:I
    const/4 v5, 0x1

    if-lt v4, v5, :cond_2

    .line 12
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 20
    .end local v3           #two_halfs:I
    .restart local v4       #two_halfs:I
    :cond_0
    const/16 v5, 0xa

    sub-int v5, v1, v5

    add-int/lit8 v5, v5, 0x61

    int-to-char v5, v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 26
    .end local v1           #halfbyte:I
    .end local v4           #two_halfs:I
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .restart local v1       #halfbyte:I
    .restart local v3       #two_halfs:I
    :cond_2
    move v4, v3

    .end local v3           #two_halfs:I
    .restart local v4       #two_halfs:I
    goto :goto_1
.end method

.method public static hash(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .parameter "text"

    .prologue
    .line 34
    :try_start_0
    const-string v4, "MD5"

    invoke-static {v4}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 35
    .local v0, md:Ljava/security/MessageDigest;
    const/16 v4, 0x20

    new-array v1, v4, [B

    .line 36
    .local v1, md5hash:[B
    const-string v4, "iso-8859-1"

    invoke-virtual {p0, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v0, v4, v5, v6}, Ljava/security/MessageDigest;->update([BII)V

    .line 37
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v1

    .line 39
    invoke-static {v1}, Lcom/nloko/simplyfacebook/util/SimpleMD5;->convertToHex([B)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v4

    .line 48
    .end local v0           #md:Ljava/security/MessageDigest;
    .end local v1           #md5hash:[B
    :goto_0
    return-object v4

    .line 41
    :catch_0
    move-exception v4

    move-object v3, v4

    .line 42
    .local v3, uee:Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v3}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    .line 48
    .end local v3           #uee:Ljava/io/UnsupportedEncodingException;
    :goto_1
    const/4 v4, 0x0

    goto :goto_0

    .line 44
    :catch_1
    move-exception v4

    move-object v2, v4

    .line 45
    .local v2, nsae:Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v2}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    goto :goto_1
.end method

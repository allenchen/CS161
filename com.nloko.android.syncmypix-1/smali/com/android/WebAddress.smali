.class public Lcom/android/WebAddress;
.super Ljava/lang/Object;
.source "WebAddress.java"


# static fields
.field private static final LOGTAG:Ljava/lang/String; = "http"

.field static final MATCH_GROUP_AUTHORITY:I = 0x2

.field static final MATCH_GROUP_HOST:I = 0x3

.field static final MATCH_GROUP_PATH:I = 0x5

.field static final MATCH_GROUP_PORT:I = 0x4

.field static final MATCH_GROUP_SCHEME:I = 0x1

.field static sAddressPattern:Ljava/util/regex/Pattern;


# instance fields
.field public mAuthInfo:Ljava/lang/String;

.field public mHost:Ljava/lang/String;

.field public mPath:Ljava/lang/String;

.field public mPort:I

.field public mScheme:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 26
    const-string v0, "(?:(http|HTTP|https|HTTPS|file|FILE)\\:\\/\\/)?(?:([-A-Za-z0-9$_.+!*\'(),;?&=]+(?:\\:[-A-Za-z0-9$_.+!*\'(),;?&=]+)?)@)?([-A-Za-z0-9%]+(?:\\.[-A-Za-z0-9%]+)*)?(?:\\:([0-9]+))?(\\/?.*)?"

    .line 25
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 24
    sput-object v0, Lcom/android/WebAddress;->sAddressPattern:Ljava/util/regex/Pattern;

    .line 8
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 10
    .parameter "address"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/ParseException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x1bb

    const/4 v6, -0x1

    const-string v9, "https"

    const-string v8, "/"

    const-string v5, ""

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    if-nez p1, :cond_0

    .line 37
    new-instance v3, Ljava/lang/NullPointerException;

    invoke-direct {v3}, Ljava/lang/NullPointerException;-><init>()V

    throw v3

    .line 42
    :cond_0
    const-string v3, ""

    iput-object v5, p0, Lcom/android/WebAddress;->mScheme:Ljava/lang/String;

    .line 43
    const-string v3, ""

    iput-object v5, p0, Lcom/android/WebAddress;->mHost:Ljava/lang/String;

    .line 44
    iput v6, p0, Lcom/android/WebAddress;->mPort:I

    .line 45
    const-string v3, "/"

    iput-object v8, p0, Lcom/android/WebAddress;->mPath:Ljava/lang/String;

    .line 46
    const-string v3, ""

    iput-object v5, p0, Lcom/android/WebAddress;->mAuthInfo:Ljava/lang/String;

    .line 48
    sget-object v3, Lcom/android/WebAddress;->sAddressPattern:Ljava/util/regex/Pattern;

    invoke-virtual {v3, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 50
    .local v1, m:Ljava/util/regex/Matcher;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v3

    if-eqz v3, :cond_9

    .line 51
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    .line 52
    .local v2, t:Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 53
    iput-object v2, p0, Lcom/android/WebAddress;->mScheme:Ljava/lang/String;

    .line 54
    :cond_1
    const/4 v3, 0x2

    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    .line 55
    if-eqz v2, :cond_2

    .line 56
    iput-object v2, p0, Lcom/android/WebAddress;->mAuthInfo:Ljava/lang/String;

    .line 57
    :cond_2
    const/4 v3, 0x3

    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    .line 58
    if-eqz v2, :cond_3

    .line 59
    iput-object v2, p0, Lcom/android/WebAddress;->mHost:Ljava/lang/String;

    .line 60
    :cond_3
    const/4 v3, 0x4

    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    .line 61
    if-eqz v2, :cond_4

    .line 63
    :try_start_0
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/android/WebAddress;->mPort:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    :cond_4
    const/4 v3, 0x5

    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    .line 69
    if-eqz v2, :cond_5

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_5

    .line 74
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x2f

    if-ne v3, v4, :cond_8

    .line 75
    iput-object v2, p0, Lcom/android/WebAddress;->mPath:Ljava/lang/String;

    .line 89
    :cond_5
    :goto_0
    iget v3, p0, Lcom/android/WebAddress;->mPort:I

    if-ne v3, v7, :cond_a

    iget-object v3, p0, Lcom/android/WebAddress;->mScheme:Ljava/lang/String;

    const-string v4, ""

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 90
    const-string v3, "https"

    iput-object v9, p0, Lcom/android/WebAddress;->mScheme:Ljava/lang/String;

    .line 97
    :cond_6
    :goto_1
    iget-object v3, p0, Lcom/android/WebAddress;->mScheme:Ljava/lang/String;

    const-string v4, ""

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 98
    const-string v3, "http"

    iput-object v3, p0, Lcom/android/WebAddress;->mScheme:Ljava/lang/String;

    .line 99
    :cond_7
    return-void

    .line 64
    :catch_0
    move-exception v3

    move-object v0, v3

    .line 65
    .local v0, ex:Ljava/lang/NumberFormatException;
    new-instance v3, Lorg/apache/http/ParseException;

    const-string v4, "Bad port"

    invoke-direct {v3, v4}, Lorg/apache/http/ParseException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 77
    .end local v0           #ex:Ljava/lang/NumberFormatException;
    :cond_8
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "/"

    invoke-direct {v3, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/WebAddress;->mPath:Ljava/lang/String;

    goto :goto_0

    .line 83
    .end local v2           #t:Ljava/lang/String;
    :cond_9
    new-instance v3, Lorg/apache/http/ParseException;

    const-string v4, "Bad address"

    invoke-direct {v3, v4}, Lorg/apache/http/ParseException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 91
    .restart local v2       #t:Ljava/lang/String;
    :cond_a
    iget v3, p0, Lcom/android/WebAddress;->mPort:I

    if-ne v3, v6, :cond_6

    .line 92
    iget-object v3, p0, Lcom/android/WebAddress;->mScheme:Ljava/lang/String;

    const-string v4, "https"

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 93
    iput v7, p0, Lcom/android/WebAddress;->mPort:I

    goto :goto_1

    .line 95
    :cond_b
    const/16 v3, 0x50

    iput v3, p0, Lcom/android/WebAddress;->mPort:I

    goto :goto_1
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 102
    const-string v1, ""

    .line 103
    .local v1, port:Ljava/lang/String;
    iget v2, p0, Lcom/android/WebAddress;->mPort:I

    const/16 v3, 0x1bb

    if-eq v2, v3, :cond_0

    iget-object v2, p0, Lcom/android/WebAddress;->mScheme:Ljava/lang/String;

    const-string v3, "https"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 104
    :cond_0
    iget v2, p0, Lcom/android/WebAddress;->mPort:I

    const/16 v3, 0x50

    if-eq v2, v3, :cond_2

    iget-object v2, p0, Lcom/android/WebAddress;->mScheme:Ljava/lang/String;

    const-string v3, "http"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 105
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, ":"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, p0, Lcom/android/WebAddress;->mPort:I

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 107
    :cond_2
    const-string v0, ""

    .line 108
    .local v0, authInfo:Ljava/lang/String;
    iget-object v2, p0, Lcom/android/WebAddress;->mAuthInfo:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_3

    .line 109
    new-instance v2, Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/WebAddress;->mAuthInfo:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "@"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 112
    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/WebAddress;->mScheme:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "://"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/WebAddress;->mHost:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/WebAddress;->mPath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.class public Lcom/nloko/android/syncmypix/namematcher/NameMatcher;
.super Ljava/lang/Object;
.source "NameMatcher.java"


# instance fields
.field protected final TAG:Ljava/lang/String;

.field protected final mBadChars:Ljava/lang/String;

.field protected final mContext:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private final mDiminutives:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final mFirstNames:Ljava/util/TreeMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/nloko/android/syncmypix/PhoneContact;",
            ">;>;"
        }
    .end annotation
.end field

.field protected final mGoodChars:Ljava/lang/String;

.field private final mLastNames:Ljava/util/TreeMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/nloko/android/syncmypix/PhoneContact;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mNickNames:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/nloko/android/syncmypix/PhoneContact;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/io/InputStream;Z)V
    .locals 1
    .parameter "context"
    .parameter "diminutives"
    .parameter "withPhone"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const-string v0, "NameMatcher"

    iput-object v0, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->TAG:Ljava/lang/String;

    .line 55
    const-string v0, "\u0160\u017d\u0161\u017e\u0178\u00c0\u00c1\u00c2\u00c3\u00c4\u00c5\u00c7\u00c8\u00c9\u00ca\u00cb\u00cc\u00cd\u00ce\u00cf\u00d0\u00d1\u00d2\u00d3\u00d4\u00d5\u00d6\u00d9\u00da\u00db\u00dc\u00dd\u00e0\u00e1\u00e2\u00e3\u00e4\u00e5\u00e7\u00e8\u00e9\u00ea\u00eb\u00ec\u00ed\u00ee\u00ef\u00f0\u00f1\u00f2\u00f3\u00f4\u00f5\u00f6\u00f9\u00fa\u00fb\u00fc\u00fd\u00ff"

    iput-object v0, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mBadChars:Ljava/lang/String;

    .line 56
    const-string v0, "SZszYAAAAAACEEEEIIIIDNOOOOOUUUUYaaaaaaceeeeiiiidnooooouuuuyy "

    iput-object v0, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mGoodChars:Ljava/lang/String;

    .line 58
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mFirstNames:Ljava/util/TreeMap;

    .line 59
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mLastNames:Ljava/util/TreeMap;

    .line 60
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mNickNames:Ljava/util/HashMap;

    .line 61
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mDiminutives:Ljava/util/HashMap;

    .line 66
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mContext:Ljava/lang/ref/WeakReference;

    .line 67
    invoke-direct {p0, p2}, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->loadDiminutives(Ljava/io/InputStream;)V

    .line 71
    invoke-virtual {p0, p3}, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->loadPhoneContacts(Z)V

    .line 72
    return-void
.end method

.method private exactMatch(Ljava/lang/String;Z)Lcom/nloko/android/syncmypix/PhoneContact;
    .locals 12
    .parameter "name"
    .parameter "reverse"

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 314
    if-nez p1, :cond_0

    move-object v6, v11

    .line 343
    :goto_0
    return-object v6

    .line 318
    :cond_0
    invoke-direct {p0, p1}, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->normalizeName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 320
    .local v0, components:[Ljava/lang/String;
    if-eqz p2, :cond_1

    .line 321
    invoke-direct {p0, v0}, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->reverse([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 324
    :cond_1
    iget-object v6, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mFirstNames:Ljava/util/TreeMap;

    aget-object v7, v0, v10

    invoke-virtual {v6, v7}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/ArrayList;

    .line 325
    .local v4, possibilities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/nloko/android/syncmypix/PhoneContact;>;"
    if-eqz v4, :cond_5

    .line 326
    sget-boolean v6, Lcom/nloko/android/Log;->debug:Z

    if-eqz v6, :cond_2

    const-string v6, "NameMatcher"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "prefix match from "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    aget-object v8, v0, v10

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 327
    :cond_2
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/nloko/android/syncmypix/PhoneContact;

    .line 328
    .local v5, u:Lcom/nloko/android/syncmypix/PhoneContact;
    sget-boolean v6, Lcom/nloko/android/Log;->debug:Z

    if-eqz v6, :cond_4

    const-string v6, "NameMatcher"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "   "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v5, Lcom/nloko/android/syncmypix/PhoneContact;->name:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 330
    :cond_4
    iget-object v6, v5, Lcom/nloko/android/syncmypix/PhoneContact;->name:Ljava/lang/String;

    invoke-direct {p0, v6}, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->normalizeName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 331
    .local v3, matchParts:[Ljava/lang/String;
    array-length v6, v3

    sub-int/2addr v6, v9

    aget-object v2, v3, v6

    .line 333
    .local v2, lname:Ljava/lang/String;
    if-eqz v2, :cond_3

    array-length v6, v0

    sub-int/2addr v6, v9

    aget-object v6, v0, v6

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    move-object v6, v5

    .line 334
    goto/16 :goto_0

    .line 339
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #lname:Ljava/lang/String;
    .end local v3           #matchParts:[Ljava/lang/String;
    .end local v5           #u:Lcom/nloko/android/syncmypix/PhoneContact;
    :cond_5
    if-nez p2, :cond_6

    .line 340
    invoke-direct {p0, p1, v9}, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->exactMatch(Ljava/lang/String;Z)Lcom/nloko/android/syncmypix/PhoneContact;

    move-result-object v6

    goto/16 :goto_0

    :cond_6
    move-object v6, v11

    .line 343
    goto/16 :goto_0
.end method

.method private getWordCount(Ljava/lang/String;)I
    .locals 1
    .parameter "phrase"

    .prologue
    .line 491
    if-nez p1, :cond_0

    .line 492
    const/4 v0, 0x0

    .line 495
    :goto_0
    return v0

    :cond_0
    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    array-length v0, v0

    goto :goto_0
.end method

.method private loadDiminutives(Ljava/io/InputStream;)V
    .locals 14
    .parameter "diminutivesFile"

    .prologue
    .line 205
    const/4 v6, 0x0

    .line 209
    .local v6, reader:Ljava/io/BufferedReader;
    :try_start_0
    new-instance v7, Ljava/io/BufferedReader;

    new-instance v9, Ljava/io/InputStreamReader;

    const-string v10, "UTF-8"

    invoke-direct {v9, p1, v10}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    const/16 v10, 0x2000

    invoke-direct {v7, v9, v10}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 211
    .end local v6           #reader:Ljava/io/BufferedReader;
    .local v7, reader:Ljava/io/BufferedReader;
    :cond_0
    :try_start_1
    invoke-virtual {v7}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .local v3, line:Ljava/lang/String;
    if-eqz v3, :cond_7

    .line 212
    const/4 v8, 0x0

    .line 213
    .local v8, sentinel:Ljava/lang/Object;
    const-string v9, ","

    invoke-virtual {v3, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 216
    .local v4, names:[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    array-length v9, v4

    if-ge v2, v9, :cond_1

    .line 217
    iget-object v9, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mDiminutives:Ljava/util/HashMap;

    aget-object v10, v4, v2

    invoke-virtual {v9, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 218
    .local v5, o:Ljava/lang/Object;
    if-eqz v5, :cond_3

    .line 219
    move-object v8, v5

    .line 223
    .end local v5           #o:Ljava/lang/Object;
    .end local v8           #sentinel:Ljava/lang/Object;
    :cond_1
    if-eqz v8, :cond_4

    move-object v9, v8

    .line 230
    :goto_1
    const/4 v2, 0x0

    :goto_2
    array-length v10, v4

    if-ge v2, v10, :cond_0

    .line 231
    iget-object v10, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mDiminutives:Ljava/util/HashMap;

    aget-object v11, v4, v2

    invoke-virtual {v10, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 232
    .local v1, existingSentinel:Ljava/lang/Object;
    if-eqz v1, :cond_5

    if-eq v1, v9, :cond_5

    .line 236
    sget-boolean v10, Lcom/nloko/android/Log;->debug:Z

    if-eqz v10, :cond_2

    const-string v10, "NameMatcher"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "THREE LINE CONFLICT  "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mDiminutives:Ljava/util/HashMap;

    aget-object v13, v4, v2

    invoke-virtual {v12, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 230
    :cond_2
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 216
    .end local v1           #existingSentinel:Ljava/lang/Object;
    .restart local v5       #o:Ljava/lang/Object;
    .restart local v8       #sentinel:Ljava/lang/Object;
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 228
    .end local v5           #o:Ljava/lang/Object;
    .end local v8           #sentinel:Ljava/lang/Object;
    :cond_4
    new-instance v8, Ljava/lang/Object;

    invoke-direct {v8}, Ljava/lang/Object;-><init>()V

    .restart local v8       #sentinel:Ljava/lang/Object;
    move-object v9, v8

    goto :goto_1

    .line 238
    .end local v8           #sentinel:Ljava/lang/Object;
    .restart local v1       #existingSentinel:Ljava/lang/Object;
    :cond_5
    iget-object v10, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mDiminutives:Ljava/util/HashMap;

    aget-object v11, v4, v2

    invoke-virtual {v10, v11, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4

    goto :goto_3

    .line 247
    .end local v1           #existingSentinel:Ljava/lang/Object;
    .end local v2           #i:I
    .end local v3           #line:Ljava/lang/String;
    .end local v4           #names:[Ljava/lang/String;
    :catch_0
    move-exception v9

    move-object v0, v9

    move-object v6, v7

    .line 249
    .end local v7           #reader:Ljava/io/BufferedReader;
    .local v0, e:Ljava/io/UnsupportedEncodingException;
    .restart local v6       #reader:Ljava/io/BufferedReader;
    :goto_4
    :try_start_2
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    .line 250
    new-instance v9, Ljava/lang/Error;

    invoke-direct {v9, v0}, Ljava/lang/Error;-><init>(Ljava/lang/Throwable;)V

    throw v9
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 256
    .end local v0           #e:Ljava/io/UnsupportedEncodingException;
    :catchall_0
    move-exception v9

    .line 257
    :goto_5
    if-eqz v6, :cond_6

    .line 258
    :try_start_3
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    .line 260
    :cond_6
    :goto_6
    throw v9

    .line 257
    .end local v6           #reader:Ljava/io/BufferedReader;
    .restart local v3       #line:Ljava/lang/String;
    .restart local v7       #reader:Ljava/io/BufferedReader;
    :cond_7
    if-eqz v7, :cond_8

    .line 258
    :try_start_4
    invoke-virtual {v7}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 262
    :cond_8
    :goto_7
    return-void

    .line 251
    .end local v3           #line:Ljava/lang/String;
    .end local v7           #reader:Ljava/io/BufferedReader;
    .restart local v6       #reader:Ljava/io/BufferedReader;
    :catch_1
    move-exception v9

    move-object v0, v9

    .line 253
    .local v0, e:Ljava/io/IOException;
    :goto_8
    :try_start_5
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 254
    new-instance v9, Ljava/lang/Error;

    invoke-direct {v9, v0}, Ljava/lang/Error;-><init>(Ljava/lang/Throwable;)V

    throw v9
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 260
    .end local v0           #e:Ljava/io/IOException;
    .end local v6           #reader:Ljava/io/BufferedReader;
    .restart local v3       #line:Ljava/lang/String;
    .restart local v7       #reader:Ljava/io/BufferedReader;
    :catch_2
    move-exception v9

    goto :goto_7

    .end local v3           #line:Ljava/lang/String;
    .end local v7           #reader:Ljava/io/BufferedReader;
    .restart local v6       #reader:Ljava/io/BufferedReader;
    :catch_3
    move-exception v10

    goto :goto_6

    .line 256
    .end local v6           #reader:Ljava/io/BufferedReader;
    .restart local v7       #reader:Ljava/io/BufferedReader;
    :catchall_1
    move-exception v9

    move-object v6, v7

    .end local v7           #reader:Ljava/io/BufferedReader;
    .restart local v6       #reader:Ljava/io/BufferedReader;
    goto :goto_5

    .line 251
    .end local v6           #reader:Ljava/io/BufferedReader;
    .restart local v7       #reader:Ljava/io/BufferedReader;
    :catch_4
    move-exception v9

    move-object v0, v9

    move-object v6, v7

    .end local v7           #reader:Ljava/io/BufferedReader;
    .restart local v6       #reader:Ljava/io/BufferedReader;
    goto :goto_8

    .line 247
    :catch_5
    move-exception v9

    move-object v0, v9

    goto :goto_4
.end method

.method private match(Ljava/lang/String;ZZ)Lcom/nloko/android/syncmypix/PhoneContact;
    .locals 19
    .parameter "name"
    .parameter "firstNameOnlyMatches"
    .parameter "reverse"

    .prologue
    .line 353
    if-nez p1, :cond_0

    .line 354
    const/16 v16, 0x0

    .line 452
    .end local p0
    :goto_0
    return-object v16

    .line 358
    .restart local p0
    :cond_0
    invoke-direct/range {p0 .. p1}, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->normalizeName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    const-string v17, " "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 360
    .local v5, components:[Ljava/lang/String;
    if-eqz p3, :cond_1

    .line 361
    move-object/from16 v0, p0

    move-object v1, v5

    invoke-direct {v0, v1}, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->reverse([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 364
    :cond_1
    sget-boolean v16, Lcom/nloko/android/Log;->debug:Z

    if-eqz v16, :cond_2

    const-string v16, "NameMatcher"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Trying to match: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const/16 v18, 0x20

    move-object v0, v5

    move/from16 v1, v18

    invoke-static {v0, v1}, Lcom/nloko/android/Utils;->join([Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 376
    :cond_2
    new-instance v11, Ljava/util/TreeSet;

    const/16 v16, 0x0

    aget-object v16, v5, v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mFirstNames:Ljava/util/TreeMap;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, v17

    invoke-direct {v0, v1, v2}, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->prefixMatch(Ljava/lang/String;Ljava/util/TreeMap;)Ljava/util/ArrayList;

    move-result-object v16

    move-object v0, v11

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Ljava/util/TreeSet;-><init>(Ljava/util/Collection;)V

    .line 377
    .local v11, possibilities:Ljava/util/TreeSet;,"Ljava/util/TreeSet<Lcom/nloko/android/syncmypix/PhoneContact;>;"
    invoke-virtual {v11}, Ljava/util/TreeSet;->size()I

    move-result v16

    if-lez v16, :cond_5

    .line 378
    sget-boolean v16, Lcom/nloko/android/Log;->debug:Z

    if-eqz v16, :cond_3

    const-string v16, "NameMatcher"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "prefix match from "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const/16 v18, 0x0

    aget-object v18, v5, v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, " to "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 379
    :cond_3
    invoke-virtual {v11}, Ljava/util/TreeSet;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, i$:Ljava/util/Iterator;
    :cond_4
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_5

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/nloko/android/syncmypix/PhoneContact;

    .line 380
    .local v14, u:Lcom/nloko/android/syncmypix/PhoneContact;
    sget-boolean v16, Lcom/nloko/android/Log;->debug:Z

    if-eqz v16, :cond_4

    const-string v16, "NameMatcher"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "   "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object v0, v14

    iget-object v0, v0, Lcom/nloko/android/syncmypix/PhoneContact;->name:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 383
    .end local v7           #i$:Ljava/util/Iterator;
    .end local v14           #u:Lcom/nloko/android/syncmypix/PhoneContact;
    :cond_5
    const/16 v16, 0x0

    aget-object v16, v5, v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->nicknameMatch(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v10

    .line 384
    .local v10, matches:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/nloko/android/syncmypix/PhoneContact;>;"
    if-eqz v10, :cond_e

    .line 385
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v16

    const/16 v17, 0x1

    move/from16 v0, v16

    move/from16 v1, v17

    if-le v0, v1, :cond_8

    .line 386
    sget-boolean v16, Lcom/nloko/android/Log;->debug:Z

    if-eqz v16, :cond_6

    const-string v16, "NameMatcher"

    const-string v17, "multiple nickname matches:"

    invoke-static/range {v16 .. v17}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 387
    :cond_6
    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .restart local v7       #i$:Ljava/util/Iterator;
    :cond_7
    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_9

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/nloko/android/syncmypix/PhoneContact;

    .local v13, temp:Lcom/nloko/android/syncmypix/PhoneContact;
    sget-boolean v16, Lcom/nloko/android/Log;->debug:Z

    if-eqz v16, :cond_7

    const-string v16, "NameMatcher"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "   "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object v0, v13

    iget-object v0, v0, Lcom/nloko/android/syncmypix/PhoneContact;->name:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 388
    .end local v7           #i$:Ljava/util/Iterator;
    .end local v13           #temp:Lcom/nloko/android/syncmypix/PhoneContact;
    :cond_8
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v16

    const/16 v17, 0x1

    move/from16 v0, v16

    move/from16 v1, v17

    if-ne v0, v1, :cond_9

    .line 389
    sget-boolean v16, Lcom/nloko/android/Log;->debug:Z

    if-eqz v16, :cond_9

    const-string v16, "NameMatcher"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "nickname matched "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const/16 v18, 0x0

    aget-object v18, v5, v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, " to "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const/16 v18, 0x0

    move-object v0, v10

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nloko/android/syncmypix/PhoneContact;

    move-object v0, v4

    iget-object v0, v0, Lcom/nloko/android/syncmypix/PhoneContact;->name:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 391
    :cond_9
    invoke-virtual {v11, v10}, Ljava/util/TreeSet;->addAll(Ljava/util/Collection;)Z

    .line 395
    :cond_a
    :goto_3
    invoke-virtual {v11}, Ljava/util/TreeSet;->size()I

    move-result v16

    if-lez v16, :cond_15

    .line 397
    move-object v0, v5

    array-length v0, v0

    move/from16 v16, v0

    const/16 v17, 0x1

    move/from16 v0, v16

    move/from16 v1, v17

    if-le v0, v1, :cond_10

    .line 399
    invoke-virtual {v11}, Ljava/util/TreeSet;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .restart local v7       #i$:Ljava/util/Iterator;
    :cond_b
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_f

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/nloko/android/syncmypix/PhoneContact;

    .line 400
    .local v12, possibility:Lcom/nloko/android/syncmypix/PhoneContact;
    move-object v0, v12

    iget-object v0, v0, Lcom/nloko/android/syncmypix/PhoneContact;->name:Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->normalizeName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    const-string v17, " "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v9

    .line 401
    .local v9, matchParts:[Ljava/lang/String;
    move-object v0, v9

    array-length v0, v0

    move/from16 v16, v0

    const/16 v17, 0x1

    sub-int v16, v16, v17

    aget-object v8, v9, v16

    .line 402
    .local v8, lname:Ljava/lang/String;
    move-object v0, v5

    array-length v0, v0

    move/from16 v16, v0

    const/16 v17, 0x1

    sub-int v16, v16, v17

    aget-object v16, v5, v16

    move-object v0, v8

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v16

    if-nez v16, :cond_c

    move-object v0, v5

    array-length v0, v0

    move/from16 v16, v0

    const/16 v17, 0x1

    sub-int v16, v16, v17

    aget-object v16, v5, v16

    move-object/from16 v0, v16

    move-object v1, v8

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_b

    .line 404
    :cond_c
    sget-boolean v16, Lcom/nloko/android/Log;->debug:Z

    if-eqz v16, :cond_d

    const-string v16, "NameMatcher"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "matched "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, " to "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object v0, v12

    iget-object v0, v0, Lcom/nloko/android/syncmypix/PhoneContact;->name:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_d
    move-object/from16 v16, v12

    .line 405
    goto/16 :goto_0

    .line 393
    .end local v7           #i$:Ljava/util/Iterator;
    .end local v8           #lname:Ljava/lang/String;
    .end local v9           #matchParts:[Ljava/lang/String;
    .end local v12           #possibility:Lcom/nloko/android/syncmypix/PhoneContact;
    :cond_e
    sget-boolean v16, Lcom/nloko/android/Log;->debug:Z

    if-eqz v16, :cond_a

    const-string v16, "NameMatcher"

    const-string v17, "no nickname matches"

    invoke-static/range {v16 .. v17}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3

    .line 408
    .restart local v7       #i$:Ljava/util/Iterator;
    :cond_f
    sget-boolean v16, Lcom/nloko/android/Log;->debug:Z

    if-eqz v16, :cond_10

    const-string v16, "NameMatcher"

    const-string v17, "all inexact first name matches violated last name constraints"

    invoke-static/range {v16 .. v17}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 409
    .end local v7           #i$:Ljava/util/Iterator;
    :cond_10
    if-eqz p2, :cond_15

    .line 410
    invoke-virtual {v11}, Ljava/util/TreeSet;->size()I

    move-result v16

    const/16 v17, 0x1

    move/from16 v0, v16

    move/from16 v1, v17

    if-ne v0, v1, :cond_12

    .line 413
    invoke-virtual {v11}, Ljava/util/TreeSet;->iterator()Ljava/util/Iterator;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nloko/android/syncmypix/PhoneContact;

    .line 415
    .local v4, answer:Lcom/nloko/android/syncmypix/PhoneContact;
    move-object v0, v4

    iget-object v0, v0, Lcom/nloko/android/syncmypix/PhoneContact;->name:Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->getWordCount(Ljava/lang/String;)I

    move-result v16

    const/16 v17, 0x1

    move/from16 v0, v16

    move/from16 v1, v17

    if-ne v0, v1, :cond_15

    .line 416
    sget-boolean v16, Lcom/nloko/android/Log;->debug:Z

    if-eqz v16, :cond_11

    const-string v16, "NameMatcher"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "only one possibility, matched "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, " to "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object v0, v4

    iget-object v0, v0, Lcom/nloko/android/syncmypix/PhoneContact;->name:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_11
    move-object/from16 v16, v4

    .line 417
    goto/16 :goto_0

    .line 426
    .end local v4           #answer:Lcom/nloko/android/syncmypix/PhoneContact;
    :cond_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mFirstNames:Ljava/util/TreeMap;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    aget-object v17, v5, v17

    invoke-virtual/range {v16 .. v17}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/ArrayList;

    .line 427
    .local v6, exactMatches:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/nloko/android/syncmypix/PhoneContact;>;"
    if-eqz v6, :cond_14

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v16

    const/16 v17, 0x1

    move/from16 v0, v16

    move/from16 v1, v17

    if-ne v0, v1, :cond_14

    const/16 v16, 0x0

    move-object v0, v6

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nloko/android/syncmypix/PhoneContact;

    move-object v0, v4

    iget-object v0, v0, Lcom/nloko/android/syncmypix/PhoneContact;->name:Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->getWordCount(Ljava/lang/String;)I

    move-result v16

    const/16 v17, 0x1

    move/from16 v0, v16

    move/from16 v1, v17

    if-ne v0, v1, :cond_14

    .line 430
    sget-boolean v16, Lcom/nloko/android/Log;->debug:Z

    if-eqz v16, :cond_13

    const-string v16, "NameMatcher"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "exact first name match "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const/16 v18, 0x0

    aget-object v18, v5, v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, " to "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const/16 v18, 0x0

    move-object v0, v6

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .end local p0
    check-cast p0, Lcom/nloko/android/syncmypix/PhoneContact;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/PhoneContact;->name:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 431
    :cond_13
    const/16 v16, 0x0

    move-object v0, v6

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/nloko/android/syncmypix/PhoneContact;

    move-object/from16 v16, p0

    goto/16 :goto_0

    .line 433
    .restart local p0
    :cond_14
    sget-boolean v16, Lcom/nloko/android/Log;->debug:Z

    if-eqz v16, :cond_15

    const-string v16, "NameMatcher"

    const-string v17, "first name matched multiple people and there is no disambiguating last name"

    invoke-static/range {v16 .. v17}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 439
    .end local v6           #exactMatches:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/nloko/android/syncmypix/PhoneContact;>;"
    :cond_15
    move-object v0, v5

    array-length v0, v0

    move/from16 v16, v0

    const/16 v17, 0x1

    move/from16 v0, v16

    move/from16 v1, v17

    if-ne v0, v1, :cond_17

    .line 440
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mLastNames:Ljava/util/TreeMap;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    aget-object v17, v5, v17

    invoke-virtual/range {v16 .. v17}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/util/ArrayList;

    .line 441
    .local v15, users:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/nloko/android/syncmypix/PhoneContact;>;"
    if-eqz v15, :cond_18

    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v16

    const/16 v17, 0x1

    move/from16 v0, v16

    move/from16 v1, v17

    if-ne v0, v1, :cond_18

    .line 442
    sget-boolean v16, Lcom/nloko/android/Log;->debug:Z

    if-eqz v16, :cond_16

    const-string v16, "NameMatcher"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "exact last name match: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const/16 v18, 0x0

    move-object v0, v15

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    .end local p0
    check-cast p0, Lcom/nloko/android/syncmypix/PhoneContact;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nloko/android/syncmypix/PhoneContact;->name:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 443
    :cond_16
    const/16 v16, 0x0

    invoke-virtual/range {v15 .. v16}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/nloko/android/syncmypix/PhoneContact;

    move-object/from16 v16, p0

    goto/16 :goto_0

    .line 445
    .end local v15           #users:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/nloko/android/syncmypix/PhoneContact;>;"
    .restart local p0
    :cond_17
    if-nez p3, :cond_18

    .line 448
    const/16 v16, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, v16

    invoke-direct {v0, v1, v2, v3}, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->match(Ljava/lang/String;ZZ)Lcom/nloko/android/syncmypix/PhoneContact;

    move-result-object v16

    goto/16 :goto_0

    .line 451
    :cond_18
    sget-boolean v16, Lcom/nloko/android/Log;->debug:Z

    if-eqz v16, :cond_19

    const-string v16, "NameMatcher"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "No match found for "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 452
    :cond_19
    const/16 v16, 0x0

    goto/16 :goto_0
.end method

.method private nicknameMatch(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 3
    .parameter "nickname"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/nloko/android/syncmypix/PhoneContact;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 456
    if-nez p1, :cond_0

    move-object v1, v2

    .line 464
    .end local p0
    :goto_0
    return-object v1

    .line 460
    .restart local p0
    :cond_0
    iget-object v1, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mDiminutives:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 461
    .local v0, sentinel:Ljava/lang/Object;
    if-nez v0, :cond_1

    move-object v1, v2

    .line 462
    goto :goto_0

    .line 464
    :cond_1
    iget-object v1, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mNickNames:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0
    check-cast p0, Ljava/util/ArrayList;

    move-object v1, p0

    goto :goto_0
.end method

.method private normalizeName(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .parameter "name"

    .prologue
    const/4 v8, 0x1

    const/16 v7, 0x20

    .line 268
    if-nez p1, :cond_0

    .line 269
    const/4 v6, 0x0

    .line 299
    :goto_0
    return-object v6

    .line 272
    :cond_0
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 274
    .local v4, newName:Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .line 275
    .local v1, bracket:I
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->length()I

    move-result v5

    .line 276
    .local v5, newNameLength:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_1
    if-ge v3, v5, :cond_8

    .line 277
    invoke-virtual {v4, v3}, Ljava/lang/StringBuffer;->charAt(I)C

    move-result v2

    .line 280
    .local v2, c:C
    const-string v6, "\u0160\u017d\u0161\u017e\u0178\u00c0\u00c1\u00c2\u00c3\u00c4\u00c5\u00c7\u00c8\u00c9\u00ca\u00cb\u00cc\u00cd\u00ce\u00cf\u00d0\u00d1\u00d2\u00d3\u00d4\u00d5\u00d6\u00d9\u00da\u00db\u00dc\u00dd\u00e0\u00e1\u00e2\u00e3\u00e4\u00e5\u00e7\u00e8\u00e9\u00ea\u00eb\u00ec\u00ed\u00ee\u00ef\u00f0\u00f1\u00f2\u00f3\u00f4\u00f5\u00f6\u00f9\u00fa\u00fb\u00fc\u00fd\u00ff"

    invoke-virtual {v6, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 281
    .local v0, badIndex:I
    const/4 v6, -0x1

    if-le v0, v6, :cond_1

    .line 282
    const-string v6, "SZszYAAAAAACEEEEIIIIDNOOOOOUUUUYaaaaaaceeeeiiiidnooooouuuuyy "

    invoke-virtual {v6, v0}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-virtual {v4, v3, v6}, Ljava/lang/StringBuffer;->setCharAt(IC)V

    .line 286
    :cond_1
    const/16 v6, 0x28

    if-ne v2, v6, :cond_2

    add-int/lit8 v1, v1, 0x1

    .line 287
    :cond_2
    if-gtz v1, :cond_5

    sub-int v6, v5, v8

    if-ne v3, v6, :cond_3

    const/16 v6, 0x2d

    if-eq v2, v6, :cond_5

    :cond_3
    if-ne v2, v7, :cond_4

    if-eqz v3, :cond_5

    :cond_4
    if-ne v2, v7, :cond_7

    if-lez v3, :cond_7

    sub-int v6, v3, v8

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->charAt(I)C

    move-result v6

    if-ne v6, v7, :cond_7

    .line 291
    :cond_5
    const/16 v6, 0x29

    if-ne v2, v6, :cond_6

    add-int/lit8 v1, v1, -0x1

    .line 292
    :cond_6
    invoke-virtual {v4, v3}, Ljava/lang/StringBuffer;->deleteCharAt(I)Ljava/lang/StringBuffer;

    .line 293
    add-int/lit8 v5, v5, -0x1

    .line 294
    add-int/lit8 v3, v3, -0x1

    .line 276
    :cond_7
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 299
    .end local v0           #badIndex:I
    .end local v2           #c:C
    :cond_8
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_0
.end method

.method private prefixMatch(Ljava/lang/String;Ljava/util/TreeMap;)Ljava/util/ArrayList;
    .locals 9
    .parameter "part"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/TreeMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/nloko/android/syncmypix/PhoneContact;",
            ">;>;)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/nloko/android/syncmypix/PhoneContact;",
            ">;"
        }
    .end annotation

    .prologue
    .local p2, map:Ljava/util/TreeMap;,"Ljava/util/TreeMap<Ljava/lang/String;Ljava/util/ArrayList<Lcom/nloko/android/syncmypix/PhoneContact;>;>;"
    const/4 v8, 0x1

    .line 469
    new-instance v2, Ljava/util/ArrayList;

    const/4 v6, 0x3

    invoke-direct {v2, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 471
    .local v2, results:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/nloko/android/syncmypix/PhoneContact;>;"
    if-eqz p2, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_1

    .line 487
    .end local p0
    :cond_0
    return-object v2

    .line 475
    .restart local p0
    :cond_1
    move-object v5, p1

    .line 476
    .local v5, startKey:Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0, v5}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 477
    .local v0, endKey:Ljava/lang/StringBuffer;
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    sub-int/2addr v6, v8

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v7

    sub-int/2addr v7, v8

    invoke-virtual {v5, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    add-int/lit8 v7, v7, 0x1

    int-to-char v7, v7

    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuffer;->setCharAt(IC)V

    .line 479
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v5, v6}, Ljava/util/TreeMap;->subMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedMap;

    move-result-object v4

    .line 480
    .local v4, selection:Ljava/util/SortedMap;,"Ljava/util/SortedMap<Ljava/lang/String;Ljava/util/ArrayList<Lcom/nloko/android/syncmypix/PhoneContact;>;>;"
    invoke-interface {v4}, Ljava/util/SortedMap;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .end local p0
    .local v1, i$:Ljava/util/Iterator;
    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 481
    .local v3, s:Ljava/lang/String;
    invoke-virtual {v3, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 482
    invoke-interface {v4, v3}, Ljava/util/SortedMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Collection;

    invoke-virtual {v2, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 484
    :cond_3
    sget-boolean v6, Lcom/nloko/android/Log;->debug:Z

    if-eqz v6, :cond_2

    const-string v6, "NameMatcher"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "unexpected: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private reverse([Ljava/lang/String;)[Ljava/lang/String;
    .locals 4
    .parameter "components"

    .prologue
    .line 303
    array-length v2, p1

    new-array v1, v2, [Ljava/lang/String;

    .line 304
    .local v1, reversedComponents:[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v2, p1

    if-ge v0, v2, :cond_0

    .line 305
    array-length v2, p1

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    sub-int/2addr v2, v0

    aget-object v2, p1, v2

    aput-object v2, v1, v0

    .line 304
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 306
    :cond_0
    return-object v1
.end method


# virtual methods
.method protected createFromCursor(Landroid/database/Cursor;)Lcom/nloko/android/syncmypix/PhoneContact;
    .locals 5
    .parameter "cursor"

    .prologue
    .line 75
    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/database/Cursor;->isClosed()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 76
    :cond_0
    const/4 v2, 0x0

    .line 82
    :goto_0
    return-object v2

    .line 79
    :cond_1
    const-string v2, "_id"

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 80
    .local v0, id:Ljava/lang/String;
    const-string v2, "name"

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 81
    .local v1, name:Ljava/lang/String;
    sget-boolean v2, Lcom/nloko/android/Log;->debug:Z

    if-eqz v2, :cond_2

    const-string v2, "NameMatcher"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "NameMatcher is processing contact "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    :cond_2
    new-instance v2, Lcom/nloko/android/syncmypix/PhoneContact;

    invoke-direct {v2, v0, v1}, Lcom/nloko/android/syncmypix/PhoneContact;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public destroy()V
    .locals 1

    .prologue
    .line 151
    iget-object v0, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mFirstNames:Ljava/util/TreeMap;

    if-eqz v0, :cond_0

    .line 152
    iget-object v0, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mFirstNames:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->clear()V

    .line 154
    :cond_0
    iget-object v0, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mLastNames:Ljava/util/TreeMap;

    if-eqz v0, :cond_1

    .line 155
    iget-object v0, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mLastNames:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->clear()V

    .line 157
    :cond_1
    iget-object v0, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mNickNames:Ljava/util/HashMap;

    if-eqz v0, :cond_2

    .line 158
    iget-object v0, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mNickNames:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 160
    :cond_2
    iget-object v0, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mDiminutives:Ljava/util/HashMap;

    if-eqz v0, :cond_3

    .line 161
    iget-object v0, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mDiminutives:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 163
    :cond_3
    return-void
.end method

.method protected doQuery(Z)Landroid/database/Cursor;
    .locals 8
    .parameter "withPhone"

    .prologue
    const/4 v4, 0x0

    .line 133
    iget-object v0, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/Context;

    .line 134
    .local v6, context:Landroid/content/Context;
    if-nez v6, :cond_0

    move-object v0, v4

    .line 143
    :goto_0
    return-object v0

    .line 138
    :cond_0
    const-string v3, ""

    .line 139
    .local v3, where:Ljava/lang/String;
    if-eqz p1, :cond_1

    .line 140
    const-string v3, "primary_phone IS NOT NULL"

    .line 143
    :cond_1
    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/Contacts$People;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v7, "_id"

    aput-object v7, v2, v5

    const/4 v5, 0x1

    const-string v7, "name"

    aput-object v7, v2, v5

    const/4 v5, 0x2

    const-string v7, "primary_phone"

    aput-object v7, v2, v5

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    goto :goto_0
.end method

.method public dump()V
    .locals 11

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 166
    iget-object v5, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mFirstNames:Ljava/util/TreeMap;

    invoke-virtual {v5}, Ljava/util/TreeMap;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 167
    .local v3, name:Ljava/lang/String;
    sget-boolean v5, Lcom/nloko/android/Log;->debug:Z

    if-eqz v5, :cond_1

    const-string v5, "NameMatcher"

    const-string v6, "First name:%s"

    new-array v7, v10, [Ljava/lang/Object;

    aput-object v3, v7, v9

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    :cond_1
    iget-object v5, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mFirstNames:Ljava/util/TreeMap;

    invoke-virtual {v5, v3}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_2
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nloko/android/syncmypix/PhoneContact;

    .line 169
    .local v0, c:Lcom/nloko/android/syncmypix/PhoneContact;
    sget-boolean v5, Lcom/nloko/android/Log;->debug:Z

    if-eqz v5, :cond_2

    const-string v5, "NameMatcher"

    const-string v6, "Phone Contact:%s"

    new-array v7, v10, [Ljava/lang/Object;

    iget-object v8, v0, Lcom/nloko/android/syncmypix/PhoneContact;->name:Ljava/lang/String;

    aput-object v8, v7, v9

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 173
    .end local v0           #c:Lcom/nloko/android/syncmypix/PhoneContact;
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v3           #name:Ljava/lang/String;
    :cond_3
    iget-object v5, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mLastNames:Ljava/util/TreeMap;

    invoke-virtual {v5}, Ljava/util/TreeMap;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 174
    .restart local v3       #name:Ljava/lang/String;
    sget-boolean v5, Lcom/nloko/android/Log;->debug:Z

    if-eqz v5, :cond_5

    const-string v5, "NameMatcher"

    const-string v6, "Last name:%s"

    new-array v7, v10, [Ljava/lang/Object;

    aput-object v3, v7, v9

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    :cond_5
    iget-object v5, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mLastNames:Ljava/util/TreeMap;

    invoke-virtual {v5, v3}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .restart local v2       #i$:Ljava/util/Iterator;
    :cond_6
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nloko/android/syncmypix/PhoneContact;

    .line 176
    .restart local v0       #c:Lcom/nloko/android/syncmypix/PhoneContact;
    sget-boolean v5, Lcom/nloko/android/Log;->debug:Z

    if-eqz v5, :cond_6

    const-string v5, "NameMatcher"

    const-string v6, "Phone Contact:%s"

    new-array v7, v10, [Ljava/lang/Object;

    iget-object v8, v0, Lcom/nloko/android/syncmypix/PhoneContact;->name:Ljava/lang/String;

    aput-object v8, v7, v9

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 180
    .end local v0           #c:Lcom/nloko/android/syncmypix/PhoneContact;
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v3           #name:Ljava/lang/String;
    :cond_7
    iget-object v5, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mNickNames:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 181
    .local v4, o:Ljava/lang/Object;
    sget-boolean v5, Lcom/nloko/android/Log;->debug:Z

    if-eqz v5, :cond_9

    const-string v5, "NameMatcher"

    const-string v6, "Nick name:%s"

    new-array v7, v10, [Ljava/lang/Object;

    aput-object v4, v7, v9

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    :cond_9
    iget-object v5, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mNickNames:Ljava/util/HashMap;

    invoke-virtual {v5, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .restart local v2       #i$:Ljava/util/Iterator;
    :cond_a
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_8

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nloko/android/syncmypix/PhoneContact;

    .line 183
    .restart local v0       #c:Lcom/nloko/android/syncmypix/PhoneContact;
    sget-boolean v5, Lcom/nloko/android/Log;->debug:Z

    if-eqz v5, :cond_a

    const-string v5, "NameMatcher"

    const-string v6, "Phone Contact:%s"

    new-array v7, v10, [Ljava/lang/Object;

    iget-object v8, v0, Lcom/nloko/android/syncmypix/PhoneContact;->name:Ljava/lang/String;

    aput-object v8, v7, v9

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 186
    .end local v0           #c:Lcom/nloko/android/syncmypix/PhoneContact;
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v4           #o:Ljava/lang/Object;
    :cond_b
    return-void
.end method

.method public final exactMatch(Ljava/lang/String;)Lcom/nloko/android/syncmypix/PhoneContact;
    .locals 1
    .parameter "name"

    .prologue
    .line 310
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->exactMatch(Ljava/lang/String;Z)Lcom/nloko/android/syncmypix/PhoneContact;

    move-result-object v0

    return-object v0
.end method

.method protected loadPhoneContacts(Z)V
    .locals 11
    .parameter "withPhone"

    .prologue
    const/4 v10, 0x3

    .line 87
    invoke-virtual {p0, p1}, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->doQuery(Z)Landroid/database/Cursor;

    move-result-object v2

    .line 88
    .local v2, cursor:Landroid/database/Cursor;
    if-nez v2, :cond_0

    .line 130
    :goto_0
    return-void

    .line 92
    :cond_0
    :goto_1
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 93
    invoke-virtual {p0, v2}, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->createFromCursor(Landroid/database/Cursor;)Lcom/nloko/android/syncmypix/PhoneContact;

    move-result-object v1

    .line 94
    .local v1, contact:Lcom/nloko/android/syncmypix/PhoneContact;
    if-eqz v1, :cond_0

    .line 100
    iget-object v7, v1, Lcom/nloko/android/syncmypix/PhoneContact;->name:Ljava/lang/String;

    invoke-direct {p0, v7}, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->normalizeName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 101
    .local v5, name:Ljava/lang/String;
    if-eqz v5, :cond_0

    .line 105
    const-string v7, " "

    invoke-virtual {v5, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 106
    .local v0, components:[Ljava/lang/String;
    const/4 v7, 0x0

    aget-object v3, v0, v7

    .line 107
    .local v3, fname:Ljava/lang/String;
    array-length v7, v0

    const/4 v8, 0x1

    sub-int/2addr v7, v8

    aget-object v4, v0, v7

    .line 109
    .local v4, lname:Ljava/lang/String;
    iget-object v7, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mFirstNames:Ljava/util/TreeMap;

    invoke-virtual {v7, v3}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-nez v7, :cond_1

    .line 110
    iget-object v7, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mFirstNames:Ljava/util/TreeMap;

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8, v10}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v7, v3, v8}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    :cond_1
    iget-object v7, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mFirstNames:Ljava/util/TreeMap;

    invoke-virtual {v7, v3}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/ArrayList;

    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 112
    sget-boolean v7, Lcom/nloko/android/Log;->debug:Z

    if-eqz v7, :cond_2

    const-string v7, "NameMatcher"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "added "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " to mFirstNames = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, v1, Lcom/nloko/android/syncmypix/PhoneContact;->name:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    :cond_2
    iget-object v7, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mLastNames:Ljava/util/TreeMap;

    invoke-virtual {v7, v4}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-nez v7, :cond_3

    .line 115
    iget-object v7, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mLastNames:Ljava/util/TreeMap;

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8, v10}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v7, v4, v8}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    :cond_3
    iget-object v7, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mLastNames:Ljava/util/TreeMap;

    invoke-virtual {v7, v4}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/ArrayList;

    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 119
    iget-object v7, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mDiminutives:Ljava/util/HashMap;

    invoke-virtual {v7, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 120
    .local v6, sentinel:Ljava/lang/Object;
    if-eqz v6, :cond_0

    .line 121
    iget-object v7, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mNickNames:Ljava/util/HashMap;

    invoke-virtual {v7, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-nez v7, :cond_4

    .line 122
    iget-object v7, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mNickNames:Ljava/util/HashMap;

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8, v10}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v7, v6, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    :cond_4
    sget-boolean v7, Lcom/nloko/android/Log;->debug:Z

    if-eqz v7, :cond_5

    const-string v7, "NameMatcher"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "linking "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " with "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, v1, Lcom/nloko/android/syncmypix/PhoneContact;->name:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    :cond_5
    iget-object v7, p0, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->mNickNames:Ljava/util/HashMap;

    invoke-virtual {v7, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/ArrayList;

    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 129
    .end local v0           #components:[Ljava/lang/String;
    .end local v1           #contact:Lcom/nloko/android/syncmypix/PhoneContact;
    .end local v3           #fname:Ljava/lang/String;
    .end local v4           #lname:Ljava/lang/String;
    .end local v5           #name:Ljava/lang/String;
    .end local v6           #sentinel:Ljava/lang/Object;
    :cond_6
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    goto/16 :goto_0
.end method

.method public final match(Ljava/lang/String;Z)Lcom/nloko/android/syncmypix/PhoneContact;
    .locals 1
    .parameter "name"
    .parameter "firstNameOnlyMatches"

    .prologue
    .line 349
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/nloko/android/syncmypix/namematcher/NameMatcher;->match(Ljava/lang/String;ZZ)Lcom/nloko/android/syncmypix/PhoneContact;

    move-result-object v0

    return-object v0
.end method

.class public Lorg/json/CDL;
.super Ljava/lang/Object;
.source "CDL.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getValue(Lorg/json/JSONTokener;)Ljava/lang/String;
    .locals 5
    .parameter "x"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 60
    :cond_0
    invoke-virtual {p0}, Lorg/json/JSONTokener;->next()C

    move-result v0

    .line 61
    .local v0, c:C
    const/16 v3, 0x20

    if-eq v0, v3, :cond_0

    const/16 v3, 0x9

    if-eq v0, v3, :cond_0

    .line 62
    sparse-switch v0, :sswitch_data_0

    .line 84
    invoke-virtual {p0}, Lorg/json/JSONTokener;->back()V

    .line 85
    const/16 v3, 0x2c

    invoke-virtual {p0, v3}, Lorg/json/JSONTokener;->nextTo(C)Ljava/lang/String;

    move-result-object v3

    :goto_0
    return-object v3

    .line 64
    :sswitch_0
    const/4 v3, 0x0

    goto :goto_0

    .line 67
    :sswitch_1
    move v1, v0

    .line 68
    .local v1, q:C
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 70
    .local v2, sb:Ljava/lang/StringBuffer;
    :goto_1
    invoke-virtual {p0}, Lorg/json/JSONTokener;->next()C

    move-result v0

    .line 71
    if-ne v0, v1, :cond_1

    .line 79
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 74
    :cond_1
    if-eqz v0, :cond_2

    const/16 v3, 0xa

    if-eq v0, v3, :cond_2

    const/16 v3, 0xd

    if-ne v0, v3, :cond_3

    .line 75
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Missing close quote \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\'."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/json/JSONTokener;->syntaxError(Ljava/lang/String;)Lorg/json/JSONException;

    move-result-object v3

    throw v3

    .line 77
    :cond_3
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 81
    .end local v1           #q:C
    .end local v2           #sb:Ljava/lang/StringBuffer;
    :sswitch_2
    invoke-virtual {p0}, Lorg/json/JSONTokener;->back()V

    .line 82
    const-string v3, ""

    goto :goto_0

    .line 62
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x22 -> :sswitch_1
        0x27 -> :sswitch_1
        0x2c -> :sswitch_2
    .end sparse-switch
.end method

.method public static rowToJSONArray(Lorg/json/JSONTokener;)Lorg/json/JSONArray;
    .locals 5
    .parameter "x"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 96
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 98
    .local v1, ja:Lorg/json/JSONArray;
    :cond_0
    invoke-static {p0}, Lorg/json/CDL;->getValue(Lorg/json/JSONTokener;)Ljava/lang/String;

    move-result-object v2

    .line 99
    .local v2, value:Ljava/lang/String;
    if-eqz v2, :cond_1

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-nez v3, :cond_2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_2

    .line 100
    :cond_1
    const/4 v3, 0x0

    .line 110
    :goto_0
    return-object v3

    .line 102
    :cond_2
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 104
    :cond_3
    invoke-virtual {p0}, Lorg/json/JSONTokener;->next()C

    move-result v0

    .line 105
    .local v0, c:C
    const/16 v3, 0x2c

    if-eq v0, v3, :cond_0

    .line 108
    const/16 v3, 0x20

    if-eq v0, v3, :cond_3

    .line 109
    const/16 v3, 0xa

    if-eq v0, v3, :cond_4

    const/16 v3, 0xd

    if-eq v0, v3, :cond_4

    if-nez v0, :cond_5

    :cond_4
    move-object v3, v1

    .line 110
    goto :goto_0

    .line 112
    :cond_5
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Bad character \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/json/JSONTokener;->syntaxError(Ljava/lang/String;)Lorg/json/JSONException;

    move-result-object v3

    throw v3
.end method

.method public static rowToJSONObject(Lorg/json/JSONArray;Lorg/json/JSONTokener;)Lorg/json/JSONObject;
    .locals 2
    .parameter "names"
    .parameter "x"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 131
    invoke-static {p1}, Lorg/json/CDL;->rowToJSONArray(Lorg/json/JSONTokener;)Lorg/json/JSONArray;

    move-result-object v0

    .line 132
    .local v0, ja:Lorg/json/JSONArray;
    if-eqz v0, :cond_0

    invoke-virtual {v0, p0}, Lorg/json/JSONArray;->toJSONObject(Lorg/json/JSONArray;)Lorg/json/JSONObject;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static rowToString(Lorg/json/JSONArray;)Ljava/lang/String;
    .locals 12
    .parameter "ja"

    .prologue
    const/16 v11, 0x2c

    const/16 v10, 0xa

    const/4 v9, 0x0

    const/16 v8, 0x22

    .line 206
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    .line 207
    .local v6, sb:Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v1, v7, :cond_6

    .line 208
    if-lez v1, :cond_0

    .line 209
    invoke-virtual {v6, v11}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 211
    :cond_0
    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    move-result-object v4

    .line 212
    .local v4, o:Ljava/lang/Object;
    if-eqz v4, :cond_4

    .line 213
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 214
    .local v5, s:Ljava/lang/String;
    invoke-virtual {v5, v11}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    if-gez v7, :cond_1

    invoke-virtual {v5, v10}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    if-gez v7, :cond_1

    const/16 v7, 0xd

    invoke-virtual {v5, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    if-gez v7, :cond_1

    invoke-virtual {v5, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    if-gez v7, :cond_1

    invoke-virtual {v5, v9}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-ne v7, v8, :cond_5

    .line 217
    :cond_1
    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 218
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v3

    .line 219
    .local v3, length:I
    const/4 v2, 0x0

    .local v2, j:I
    :goto_1
    if-ge v2, v3, :cond_3

    .line 220
    invoke-virtual {v5, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 221
    .local v0, c:C
    const/16 v7, 0x20

    if-lt v0, v7, :cond_2

    if-eq v0, v8, :cond_2

    .line 222
    invoke-virtual {v6, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 219
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 225
    .end local v0           #c:C
    :cond_3
    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 207
    .end local v2           #j:I
    .end local v3           #length:I
    .end local v5           #s:Ljava/lang/String;
    :cond_4
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 227
    .restart local v5       #s:Ljava/lang/String;
    :cond_5
    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 231
    .end local v4           #o:Ljava/lang/Object;
    .end local v5           #s:Ljava/lang/String;
    :cond_6
    invoke-virtual {v6, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 232
    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7
.end method

.method public static toJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 1
    .parameter "string"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 143
    new-instance v0, Lorg/json/JSONTokener;

    invoke-direct {v0, p0}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lorg/json/CDL;->toJSONArray(Lorg/json/JSONTokener;)Lorg/json/JSONArray;

    move-result-object v0

    return-object v0
.end method

.method public static toJSONArray(Lorg/json/JSONArray;Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 1
    .parameter "names"
    .parameter "string"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 167
    new-instance v0, Lorg/json/JSONTokener;

    invoke-direct {v0, p1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0}, Lorg/json/CDL;->toJSONArray(Lorg/json/JSONArray;Lorg/json/JSONTokener;)Lorg/json/JSONArray;

    move-result-object v0

    return-object v0
.end method

.method public static toJSONArray(Lorg/json/JSONArray;Lorg/json/JSONTokener;)Lorg/json/JSONArray;
    .locals 4
    .parameter "names"
    .parameter "x"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 180
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-nez v2, :cond_1

    :cond_0
    move-object v2, v3

    .line 194
    :goto_0
    return-object v2

    .line 183
    :cond_1
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 185
    .local v0, ja:Lorg/json/JSONArray;
    :goto_1
    invoke-static {p0, p1}, Lorg/json/CDL;->rowToJSONObject(Lorg/json/JSONArray;Lorg/json/JSONTokener;)Lorg/json/JSONObject;

    move-result-object v1

    .line 186
    .local v1, jo:Lorg/json/JSONObject;
    if-nez v1, :cond_2

    .line 191
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-nez v2, :cond_3

    move-object v2, v3

    .line 192
    goto :goto_0

    .line 189
    :cond_2
    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_1

    :cond_3
    move-object v2, v0

    .line 194
    goto :goto_0
.end method

.method public static toJSONArray(Lorg/json/JSONTokener;)Lorg/json/JSONArray;
    .locals 1
    .parameter "x"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 154
    invoke-static {p0}, Lorg/json/CDL;->rowToJSONArray(Lorg/json/JSONTokener;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-static {v0, p0}, Lorg/json/CDL;->toJSONArray(Lorg/json/JSONArray;Lorg/json/JSONTokener;)Lorg/json/JSONArray;

    move-result-object v0

    return-object v0
.end method

.method public static toString(Lorg/json/JSONArray;)Ljava/lang/String;
    .locals 4
    .parameter "ja"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 244
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 245
    .local v0, jo:Lorg/json/JSONObject;
    if-eqz v0, :cond_0

    .line 246
    invoke-virtual {v0}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v1

    .line 247
    .local v1, names:Lorg/json/JSONArray;
    if-eqz v1, :cond_0

    .line 248
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v1}, Lorg/json/CDL;->rowToString(Lorg/json/JSONArray;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v1, p0}, Lorg/json/CDL;->toString(Lorg/json/JSONArray;Lorg/json/JSONArray;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 251
    .end local v1           #names:Lorg/json/JSONArray;
    :goto_0
    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static toString(Lorg/json/JSONArray;Lorg/json/JSONArray;)Ljava/lang/String;
    .locals 4
    .parameter "names"
    .parameter "ja"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 265
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-nez v3, :cond_1

    .line 266
    :cond_0
    const/4 v3, 0x0

    .line 275
    :goto_0
    return-object v3

    .line 268
    :cond_1
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 269
    .local v2, sb:Ljava/lang/StringBuffer;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v0, v3, :cond_3

    .line 270
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 271
    .local v1, jo:Lorg/json/JSONObject;
    if-eqz v1, :cond_2

    .line 272
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->toJSONArray(Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-static {v3}, Lorg/json/CDL;->rowToString(Lorg/json/JSONArray;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 269
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 275
    .end local v1           #jo:Lorg/json/JSONObject;
    :cond_3
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

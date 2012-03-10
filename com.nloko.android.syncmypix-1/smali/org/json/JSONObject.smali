.class public Lorg/json/JSONObject;
.super Ljava/lang/Object;
.source "JSONObject.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/json/JSONObject$1;,
        Lorg/json/JSONObject$Null;
    }
.end annotation


# static fields
.field public static final NULL:Ljava/lang/Object;


# instance fields
.field private map:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 141
    new-instance v0, Lorg/json/JSONObject$Null;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/json/JSONObject$Null;-><init>(Lorg/json/JSONObject$1;)V

    sput-object v0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 147
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 148
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/json/JSONObject;->map:Ljava/util/Map;

    .line 149
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .locals 1
    .parameter "bean"

    .prologue
    .line 285
    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 286
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/json/JSONObject;->populateInternalMap(Ljava/lang/Object;Z)V

    .line 287
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Z)V
    .locals 0
    .parameter "bean"
    .parameter "includeSuperClass"

    .prologue
    .line 307
    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 308
    invoke-direct {p0, p1, p2}, Lorg/json/JSONObject;->populateInternalMap(Ljava/lang/Object;Z)V

    .line 309
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;[Ljava/lang/String;)V
    .locals 4
    .parameter "object"
    .parameter "names"

    .prologue
    .line 397
    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 398
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 399
    .local v0, c:Ljava/lang/Class;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v3, p2

    if-ge v1, v3, :cond_0

    .line 400
    aget-object v2, p2, v1

    .line 402
    .local v2, name:Ljava/lang/String;
    :try_start_0
    invoke-virtual {v0, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 399
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 407
    .end local v2           #name:Ljava/lang/String;
    :cond_0
    return-void

    .line 403
    .restart local v2       #name:Ljava/lang/String;
    :catch_0
    move-exception v3

    goto :goto_1
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "source"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 420
    new-instance v0, Lorg/json/JSONTokener;

    invoke-direct {v0, p1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lorg/json/JSONObject;-><init>(Lorg/json/JSONTokener;)V

    .line 421
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 1
    .parameter "map"

    .prologue
    .line 235
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 236
    if-nez p1, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    :goto_0
    iput-object v0, p0, Lorg/json/JSONObject;->map:Ljava/util/Map;

    .line 237
    return-void

    :cond_0
    move-object v0, p1

    .line 236
    goto :goto_0
.end method

.method public constructor <init>(Ljava/util/Map;Z)V
    .locals 6
    .parameter "map"
    .parameter "includeSuperClass"

    .prologue
    .line 248
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 249
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lorg/json/JSONObject;->map:Ljava/util/Map;

    .line 250
    if-eqz p1, :cond_1

    .line 251
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 252
    .local v1, i:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 253
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 254
    .local v0, e:Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-static {v2}, Lorg/json/JSONObject;->isStandardProperty(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 255
    iget-object v2, p0, Lorg/json/JSONObject;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 257
    :cond_0
    iget-object v2, p0, Lorg/json/JSONObject;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    new-instance v4, Lorg/json/JSONObject;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    invoke-direct {v4, v5, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/Object;Z)V

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 262
    .end local v0           #e:Ljava/util/Map$Entry;
    .end local v1           #i:Ljava/util/Iterator;
    :cond_1
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;[Ljava/lang/String;)V
    .locals 3
    .parameter "jo"
    .parameter "names"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 161
    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 162
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v1, p2

    if-ge v0, v1, :cond_0

    .line 163
    aget-object v1, p2, v0

    aget-object v2, p2, v0

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->putOnce(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 162
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 165
    :cond_0
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONTokener;)V
    .locals 4
    .parameter "x"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 175
    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 179
    invoke-virtual {p1}, Lorg/json/JSONTokener;->nextClean()C

    move-result v2

    const/16 v3, 0x7b

    if-eq v2, v3, :cond_1

    .line 180
    const-string v2, "A JSONObject text must begin with \'{\'"

    invoke-virtual {p1, v2}, Lorg/json/JSONTokener;->syntaxError(Ljava/lang/String;)Lorg/json/JSONException;

    move-result-object v2

    throw v2

    .line 218
    .local v0, c:C
    .local v1, key:Ljava/lang/String;
    :cond_0
    invoke-virtual {p1}, Lorg/json/JSONTokener;->back()V

    .line 183
    .end local v0           #c:C
    .end local v1           #key:Ljava/lang/String;
    :cond_1
    invoke-virtual {p1}, Lorg/json/JSONTokener;->nextClean()C

    move-result v0

    .line 184
    .restart local v0       #c:C
    sparse-switch v0, :sswitch_data_0

    .line 190
    invoke-virtual {p1}, Lorg/json/JSONTokener;->back()V

    .line 191
    invoke-virtual {p1}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 198
    .restart local v1       #key:Ljava/lang/String;
    invoke-virtual {p1}, Lorg/json/JSONTokener;->nextClean()C

    move-result v0

    .line 199
    const/16 v2, 0x3d

    if-ne v0, v2, :cond_3

    .line 200
    invoke-virtual {p1}, Lorg/json/JSONTokener;->next()C

    move-result v2

    const/16 v3, 0x3e

    if-eq v2, v3, :cond_2

    .line 201
    invoke-virtual {p1}, Lorg/json/JSONTokener;->back()V

    .line 206
    :cond_2
    invoke-virtual {p1}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->putOnce(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 212
    invoke-virtual {p1}, Lorg/json/JSONTokener;->nextClean()C

    move-result v2

    sparse-switch v2, :sswitch_data_1

    .line 223
    const-string v2, "Expected a \',\' or \'}\'"

    invoke-virtual {p1, v2}, Lorg/json/JSONTokener;->syntaxError(Ljava/lang/String;)Lorg/json/JSONException;

    move-result-object v2

    throw v2

    .line 186
    .end local v1           #key:Ljava/lang/String;
    :sswitch_0
    const-string v2, "A JSONObject text must end with \'}\'"

    invoke-virtual {p1, v2}, Lorg/json/JSONTokener;->syntaxError(Ljava/lang/String;)Lorg/json/JSONException;

    move-result-object v2

    throw v2

    .line 203
    .restart local v1       #key:Ljava/lang/String;
    :cond_3
    const/16 v2, 0x3a

    if-eq v0, v2, :cond_2

    .line 204
    const-string v2, "Expected a \':\' after a key"

    invoke-virtual {p1, v2}, Lorg/json/JSONTokener;->syntaxError(Ljava/lang/String;)Lorg/json/JSONException;

    move-result-object v2

    throw v2

    .line 215
    :sswitch_1
    invoke-virtual {p1}, Lorg/json/JSONTokener;->nextClean()C

    move-result v2

    const/16 v3, 0x7d

    if-ne v2, v3, :cond_0

    .line 221
    .end local v1           #key:Ljava/lang/String;
    :sswitch_2
    return-void

    .line 184
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x7d -> :sswitch_2
    .end sparse-switch

    .line 212
    :sswitch_data_1
    .sparse-switch
        0x2c -> :sswitch_1
        0x3b -> :sswitch_1
        0x7d -> :sswitch_2
    .end sparse-switch
.end method

.method public static doubleToString(D)Ljava/lang/String;
    .locals 4
    .parameter "d"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 487
    invoke-static {p0, p1}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {p0, p1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 488
    :cond_0
    const-string v1, "null"

    .line 502
    :goto_0
    return-object v1

    .line 493
    :cond_1
    invoke-static {p0, p1}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v0

    .line 494
    .local v0, s:Ljava/lang/String;
    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-lez v1, :cond_3

    const/16 v1, 0x65

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-gez v1, :cond_3

    const/16 v1, 0x45

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-gez v1, :cond_3

    .line 495
    :goto_1
    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 496
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v1, v3

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 498
    :cond_2
    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 499
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v1, v3

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_3
    move-object v1, v0

    .line 502
    goto :goto_0
.end method

.method public static getNames(Ljava/lang/Object;)[Ljava/lang/String;
    .locals 6
    .parameter "object"

    .prologue
    const/4 v5, 0x0

    .line 662
    if-nez p0, :cond_1

    .line 675
    :cond_0
    :goto_0
    return-object v5

    .line 665
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    .line 666
    .local v2, klass:Ljava/lang/Class;
    invoke-virtual {v2}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v0

    .line 667
    .local v0, fields:[Ljava/lang/reflect/Field;
    array-length v3, v0

    .line 668
    .local v3, length:I
    if-eqz v3, :cond_0

    .line 671
    new-array v4, v3, [Ljava/lang/String;

    .line 672
    .local v4, names:[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    if-ge v1, v3, :cond_2

    .line 673
    aget-object v5, v0, v1

    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v1

    .line 672
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_2
    move-object v5, v4

    .line 675
    goto :goto_0
.end method

.method public static getNames(Lorg/json/JSONObject;)[Ljava/lang/String;
    .locals 5
    .parameter "jo"

    .prologue
    .line 641
    invoke-virtual {p0}, Lorg/json/JSONObject;->length()I

    move-result v2

    .line 642
    .local v2, length:I
    if-nez v2, :cond_0

    .line 643
    const/4 v4, 0x0

    .line 652
    .end local p0
    :goto_0
    return-object v4

    .line 645
    .restart local p0
    :cond_0
    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v0

    .line 646
    .local v0, i:Ljava/util/Iterator;
    new-array v3, v2, [Ljava/lang/String;

    .line 647
    .local v3, names:[Ljava/lang/String;
    const/4 v1, 0x0

    .line 648
    .end local p0
    .local v1, j:I
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 649
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    aput-object p0, v3, v1

    .line 650
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    move-object v4, v3

    .line 652
    goto :goto_0
.end method

.method static isStandardProperty(Ljava/lang/Class;)Z
    .locals 1
    .parameter "clazz"

    .prologue
    .line 372
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-nez v0, :cond_0

    const-class v0, Ljava/lang/Byte;

    invoke-virtual {p0, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_0

    const-class v0, Ljava/lang/Short;

    invoke-virtual {p0, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_0

    const-class v0, Ljava/lang/Integer;

    invoke-virtual {p0, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_0

    const-class v0, Ljava/lang/Long;

    invoke-virtual {p0, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_0

    const-class v0, Ljava/lang/Float;

    invoke-virtual {p0, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_0

    const-class v0, Ljava/lang/Double;

    invoke-virtual {p0, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_0

    const-class v0, Ljava/lang/Character;

    invoke-virtual {p0, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_0

    const-class v0, Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_0

    const-class v0, Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static numberToString(Ljava/lang/Number;)Ljava/lang/String;
    .locals 4
    .parameter "n"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 756
    if-nez p0, :cond_0

    .line 757
    new-instance v1, Lorg/json/JSONException;

    const-string v2, "Null pointer"

    invoke-direct {v1, v2}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 759
    :cond_0
    invoke-static {p0}, Lorg/json/JSONObject;->testValidity(Ljava/lang/Object;)V

    .line 763
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 764
    .local v0, s:Ljava/lang/String;
    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-lez v1, :cond_2

    const/16 v1, 0x65

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-gez v1, :cond_2

    const/16 v1, 0x45

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-gez v1, :cond_2

    .line 765
    :goto_0
    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 766
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v1, v3

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 768
    :cond_1
    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 769
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v1, v3

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 772
    :cond_2
    return-object v0
.end method

.method private populateInternalMap(Ljava/lang/Object;Z)V
    .locals 12
    .parameter "bean"
    .parameter "includeSuperClass"

    .prologue
    const/4 v11, 0x1

    .line 312
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    .line 316
    .local v3, klass:Ljava/lang/Class;
    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v8

    if-nez v8, :cond_0

    .line 317
    const/4 p2, 0x0

    .line 320
    :cond_0
    if-eqz p2, :cond_4

    invoke-virtual {v3}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v8

    move-object v5, v8

    .line 322
    .local v5, methods:[Ljava/lang/reflect/Method;
    :goto_0
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    array-length v8, v5

    if-ge v1, v8, :cond_e

    .line 324
    :try_start_0
    aget-object v4, v5, v1

    .line 325
    .local v4, method:Ljava/lang/reflect/Method;
    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v8

    invoke-static {v8}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 326
    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v6

    .line 327
    .local v6, name:Ljava/lang/String;
    const-string v2, ""

    .line 328
    .local v2, key:Ljava/lang/String;
    const-string v8, "get"

    invoke-virtual {v6, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 329
    const/4 v8, 0x3

    invoke-virtual {v6, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 333
    :cond_1
    :goto_2
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_3

    const/4 v8, 0x0

    invoke-virtual {v2, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-static {v8}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v8

    array-length v8, v8

    if-nez v8, :cond_3

    .line 336
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v8

    if-ne v8, v11, :cond_6

    .line 337
    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 343
    :cond_2
    :goto_3
    const/4 v8, 0x0

    check-cast v8, [Ljava/lang/Object;

    invoke-virtual {v4, p1, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 344
    .local v7, result:Ljava/lang/Object;
    if-nez v7, :cond_7

    .line 345
    iget-object v8, p0, Lorg/json/JSONObject;->map:Ljava/util/Map;

    sget-object v9, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    invoke-interface {v8, v2, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 322
    .end local v2           #key:Ljava/lang/String;
    .end local v6           #name:Ljava/lang/String;
    .end local v7           #result:Ljava/lang/Object;
    :cond_3
    :goto_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 320
    .end local v1           #i:I
    .end local v4           #method:Ljava/lang/reflect/Method;
    .end local v5           #methods:[Ljava/lang/reflect/Method;
    :cond_4
    invoke-virtual {v3}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v8

    move-object v5, v8

    goto :goto_0

    .line 330
    .restart local v1       #i:I
    .restart local v2       #key:Ljava/lang/String;
    .restart local v4       #method:Ljava/lang/reflect/Method;
    .restart local v5       #methods:[Ljava/lang/reflect/Method;
    .restart local v6       #name:Ljava/lang/String;
    :cond_5
    :try_start_1
    const-string v8, "is"

    invoke-virtual {v6, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 331
    const/4 v8, 0x2

    invoke-virtual {v6, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_2

    .line 338
    :cond_6
    const/4 v8, 0x1

    invoke-virtual {v2, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-static {v8}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v8

    if-nez v8, :cond_2

    .line 339
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v9, 0x0

    const/4 v10, 0x1

    invoke-virtual {v2, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const/4 v9, 0x1

    invoke-virtual {v2, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_3

    .line 346
    .restart local v7       #result:Ljava/lang/Object;
    :cond_7
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->isArray()Z

    move-result v8

    if-eqz v8, :cond_8

    .line 347
    iget-object v8, p0, Lorg/json/JSONObject;->map:Ljava/util/Map;

    new-instance v9, Lorg/json/JSONArray;

    invoke-direct {v9, v7, p2}, Lorg/json/JSONArray;-><init>(Ljava/lang/Object;Z)V

    invoke-interface {v8, v2, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_4

    .line 364
    .end local v2           #key:Ljava/lang/String;
    .end local v4           #method:Ljava/lang/reflect/Method;
    .end local v6           #name:Ljava/lang/String;
    .end local v7           #result:Ljava/lang/Object;
    :catch_0
    move-exception v8

    move-object v0, v8

    .line 365
    .local v0, e:Ljava/lang/Exception;
    new-instance v8, Ljava/lang/RuntimeException;

    invoke-direct {v8, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v8

    .line 348
    .end local v0           #e:Ljava/lang/Exception;
    .restart local v2       #key:Ljava/lang/String;
    .restart local v4       #method:Ljava/lang/reflect/Method;
    .restart local v6       #name:Ljava/lang/String;
    .restart local v7       #result:Ljava/lang/Object;
    :cond_8
    :try_start_2
    instance-of v8, v7, Ljava/util/Collection;

    if-eqz v8, :cond_9

    .line 349
    iget-object v8, p0, Lorg/json/JSONObject;->map:Ljava/util/Map;

    new-instance v9, Lorg/json/JSONArray;

    check-cast v7, Ljava/util/Collection;

    .end local v7           #result:Ljava/lang/Object;
    invoke-direct {v9, v7, p2}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;Z)V

    invoke-interface {v8, v2, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    .line 350
    .restart local v7       #result:Ljava/lang/Object;
    :cond_9
    instance-of v8, v7, Ljava/util/Map;

    if-eqz v8, :cond_a

    .line 351
    iget-object v8, p0, Lorg/json/JSONObject;->map:Ljava/util/Map;

    new-instance v9, Lorg/json/JSONObject;

    check-cast v7, Ljava/util/Map;

    .end local v7           #result:Ljava/lang/Object;
    invoke-direct {v9, v7, p2}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;Z)V

    invoke-interface {v8, v2, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_4

    .line 352
    .restart local v7       #result:Ljava/lang/Object;
    :cond_a
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-static {v8}, Lorg/json/JSONObject;->isStandardProperty(Ljava/lang/Class;)Z

    move-result v8

    if-eqz v8, :cond_b

    .line 353
    iget-object v8, p0, Lorg/json/JSONObject;->map:Ljava/util/Map;

    invoke-interface {v8, v2, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_4

    .line 355
    :cond_b
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v8

    const-string v9, "java"

    invoke-virtual {v8, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_c

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v8

    if-nez v8, :cond_d

    .line 357
    :cond_c
    iget-object v8, p0, Lorg/json/JSONObject;->map:Ljava/util/Map;

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v2, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_4

    .line 359
    :cond_d
    iget-object v8, p0, Lorg/json/JSONObject;->map:Ljava/util/Map;

    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9, v7, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/Object;Z)V

    invoke-interface {v8, v2, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_4

    .line 368
    .end local v2           #key:Ljava/lang/String;
    .end local v4           #method:Ljava/lang/reflect/Method;
    .end local v6           #name:Ljava/lang/String;
    .end local v7           #result:Ljava/lang/Object;
    :cond_e
    return-void
.end method

.method public static quote(Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .parameter "string"

    .prologue
    const/16 v10, 0x5c

    const/16 v9, 0x22

    .line 1129
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_1

    .line 1130
    :cond_0
    const-string v6, "\"\""

    .line 1182
    :goto_0
    return-object v6

    .line 1134
    :cond_1
    const/4 v1, 0x0

    .line 1136
    .local v1, c:C
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 1137
    .local v3, len:I
    new-instance v4, Ljava/lang/StringBuffer;

    add-int/lit8 v6, v3, 0x4

    invoke-direct {v4, v6}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 1140
    .local v4, sb:Ljava/lang/StringBuffer;
    invoke-virtual {v4, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1141
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1
    if-ge v2, v3, :cond_6

    .line 1142
    move v0, v1

    .line 1143
    .local v0, b:C
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 1144
    sparse-switch v1, :sswitch_data_0

    .line 1172
    const/16 v6, 0x20

    if-lt v1, v6, :cond_3

    const/16 v6, 0x80

    if-lt v1, v6, :cond_2

    const/16 v6, 0xa0

    if-lt v1, v6, :cond_3

    :cond_2
    const/16 v6, 0x2000

    if-lt v1, v6, :cond_5

    const/16 v6, 0x2100

    if-ge v1, v6, :cond_5

    .line 1174
    :cond_3
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "000"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1175
    .local v5, t:Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "\\u"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v7

    const/4 v8, 0x4

    sub-int/2addr v7, v8

    invoke-virtual {v5, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1141
    .end local v5           #t:Ljava/lang/String;
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1147
    :sswitch_0
    invoke-virtual {v4, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1148
    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 1151
    :sswitch_1
    const/16 v6, 0x3c

    if-ne v0, v6, :cond_4

    .line 1152
    invoke-virtual {v4, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1154
    :cond_4
    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 1157
    :sswitch_2
    const-string v6, "\\b"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 1160
    :sswitch_3
    const-string v6, "\\t"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 1163
    :sswitch_4
    const-string v6, "\\n"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 1166
    :sswitch_5
    const-string v6, "\\f"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 1169
    :sswitch_6
    const-string v6, "\\r"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 1177
    :cond_5
    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 1181
    .end local v0           #b:C
    :cond_6
    invoke-virtual {v4, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1182
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_0

    .line 1144
    :sswitch_data_0
    .sparse-switch
        0x8 -> :sswitch_2
        0x9 -> :sswitch_3
        0xa -> :sswitch_4
        0xc -> :sswitch_5
        0xd -> :sswitch_6
        0x22 -> :sswitch_0
        0x2f -> :sswitch_1
        0x5c -> :sswitch_0
    .end sparse-switch
.end method

.method public static stringToValue(Ljava/lang/String;)Ljava/lang/Object;
    .locals 8
    .parameter "s"

    .prologue
    const/16 v7, 0x30

    const/16 v6, 0x2e

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, -0x1

    .line 1212
    const-string v2, ""

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    move-object v2, p0

    .line 1267
    :goto_0
    return-object v2

    .line 1215
    :cond_0
    const-string v2, "true"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1216
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    .line 1218
    :cond_1
    const-string v2, "false"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1219
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    .line 1221
    :cond_2
    const-string v2, "null"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1222
    sget-object v2, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    goto :goto_0

    .line 1233
    :cond_3
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1234
    .local v0, b:C
    if-lt v0, v7, :cond_4

    const/16 v2, 0x39

    if-le v0, v2, :cond_5

    :cond_4
    if-eq v0, v6, :cond_5

    const/16 v2, 0x2d

    if-eq v0, v2, :cond_5

    const/16 v2, 0x2b

    if-ne v0, v2, :cond_b

    .line 1235
    :cond_5
    if-ne v0, v7, :cond_7

    .line 1236
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-le v2, v3, :cond_9

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x78

    if-eq v2, v3, :cond_6

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x58

    if-ne v2, v3, :cond_9

    .line 1239
    :cond_6
    :try_start_0
    new-instance v2, Ljava/lang/Integer;

    const/4 v3, 0x2

    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x10

    invoke-static {v3, v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v3

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1241
    :catch_0
    move-exception v2

    .line 1253
    :cond_7
    :goto_1
    const/16 v2, 0x2e

    :try_start_1
    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-gt v2, v5, :cond_8

    const/16 v2, 0x65

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-gt v2, v5, :cond_8

    const/16 v2, 0x45

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-le v2, v5, :cond_a

    .line 1254
    :cond_8
    invoke-static {p0}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    move-result-object v2

    goto :goto_0

    .line 1246
    :cond_9
    :try_start_2
    new-instance v2, Ljava/lang/Integer;

    const/16 v3, 0x8

    invoke-static {p0, v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v3

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_0

    .line 1247
    :catch_1
    move-exception v2

    goto :goto_1

    .line 1256
    :cond_a
    :try_start_3
    new-instance v1, Ljava/lang/Long;

    invoke-direct {v1, p0}, Ljava/lang/Long;-><init>(Ljava/lang/String;)V

    .line 1257
    .local v1, myLong:Ljava/lang/Long;
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v1}, Ljava/lang/Long;->intValue()I

    move-result v4

    int-to-long v4, v4

    cmp-long v2, v2, v4

    if-nez v2, :cond_c

    .line 1258
    new-instance v2, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Long;->intValue()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto/16 :goto_0

    .line 1263
    .end local v1           #myLong:Ljava/lang/Long;
    :catch_2
    move-exception v2

    :cond_b
    move-object v2, p0

    .line 1267
    goto/16 :goto_0

    .restart local v1       #myLong:Ljava/lang/Long;
    :cond_c
    move-object v2, v1

    .line 1260
    goto/16 :goto_0
.end method

.method static testValidity(Ljava/lang/Object;)V
    .locals 3
    .parameter "o"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1277
    if-eqz p0, :cond_3

    .line 1278
    instance-of v1, p0, Ljava/lang/Double;

    if-eqz v1, :cond_1

    .line 1279
    move-object v0, p0

    check-cast v0, Ljava/lang/Double;

    move-object v1, v0

    invoke-virtual {v1}, Ljava/lang/Double;->isInfinite()Z

    move-result v1

    if-nez v1, :cond_0

    check-cast p0, Ljava/lang/Double;

    .end local p0
    invoke-virtual {p0}, Ljava/lang/Double;->isNaN()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1280
    :cond_0
    new-instance v1, Lorg/json/JSONException;

    const-string v2, "JSON does not allow non-finite numbers."

    invoke-direct {v1, v2}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1283
    .restart local p0
    :cond_1
    instance-of v1, p0, Ljava/lang/Float;

    if-eqz v1, :cond_3

    .line 1284
    move-object v0, p0

    check-cast v0, Ljava/lang/Float;

    move-object v1, v0

    invoke-virtual {v1}, Ljava/lang/Float;->isInfinite()Z

    move-result v1

    if-nez v1, :cond_2

    check-cast p0, Ljava/lang/Float;

    .end local p0
    invoke-virtual {p0}, Ljava/lang/Float;->isNaN()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1285
    :cond_2
    new-instance v1, Lorg/json/JSONException;

    const-string v2, "JSON does not allow non-finite numbers."

    invoke-direct {v1, v2}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1290
    :cond_3
    return-void
.end method

.method static valueToString(Ljava/lang/Object;)Ljava/lang/String;
    .locals 5
    .parameter "value"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1442
    if-eqz p0, :cond_0

    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1443
    :cond_0
    const-string v2, "null"

    .line 1473
    .end local p0
    :goto_0
    return-object v2

    .line 1445
    .restart local p0
    :cond_1
    instance-of v2, p0, Lorg/json/JSONString;

    if-eqz v2, :cond_3

    .line 1448
    :try_start_0
    check-cast p0, Lorg/json/JSONString;

    .end local p0
    invoke-interface {p0}, Lorg/json/JSONString;->toJSONString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 1452
    .local v1, o:Ljava/lang/String;
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_2

    .line 1453
    check-cast v1, Ljava/lang/String;

    .end local v1           #o:Ljava/lang/String;
    move-object v2, v1

    goto :goto_0

    .line 1449
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 1450
    .local v0, e:Ljava/lang/Exception;
    new-instance v2, Lorg/json/JSONException;

    invoke-direct {v2, v0}, Lorg/json/JSONException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 1455
    .end local v0           #e:Ljava/lang/Exception;
    .restart local v1       #o:Ljava/lang/String;
    :cond_2
    new-instance v2, Lorg/json/JSONException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Bad value from toJSONString: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1457
    .end local v1           #o:Ljava/lang/String;
    .restart local p0
    :cond_3
    instance-of v2, p0, Ljava/lang/Number;

    if-eqz v2, :cond_4

    .line 1458
    check-cast p0, Ljava/lang/Number;

    .end local p0
    invoke-static {p0}, Lorg/json/JSONObject;->numberToString(Ljava/lang/Number;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 1460
    .restart local p0
    :cond_4
    instance-of v2, p0, Ljava/lang/Boolean;

    if-nez v2, :cond_5

    instance-of v2, p0, Lorg/json/JSONObject;

    if-nez v2, :cond_5

    instance-of v2, p0, Lorg/json/JSONArray;

    if-eqz v2, :cond_6

    .line 1462
    :cond_5
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 1464
    :cond_6
    instance-of v2, p0, Ljava/util/Map;

    if-eqz v2, :cond_7

    .line 1465
    new-instance v2, Lorg/json/JSONObject;

    check-cast p0, Ljava/util/Map;

    .end local p0
    invoke-direct {v2, p0}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 1467
    .restart local p0
    :cond_7
    instance-of v2, p0, Ljava/util/Collection;

    if-eqz v2, :cond_8

    .line 1468
    new-instance v2, Lorg/json/JSONArray;

    check-cast p0, Ljava/util/Collection;

    .end local p0
    invoke-direct {v2, p0}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 1470
    .restart local p0
    :cond_8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->isArray()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 1471
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0

    .line 1473
    :cond_9
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0
.end method

.method static valueToString(Ljava/lang/Object;II)Ljava/lang/String;
    .locals 3
    .parameter "value"
    .parameter "indentFactor"
    .parameter "indent"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1493
    if-eqz p0, :cond_0

    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1494
    :cond_0
    const-string v2, "null"

    .line 1527
    .end local p0
    :goto_0
    return-object v2

    .line 1497
    .restart local p0
    :cond_1
    :try_start_0
    instance-of v2, p0, Lorg/json/JSONString;

    if-eqz v2, :cond_2

    .line 1498
    move-object v0, p0

    check-cast v0, Lorg/json/JSONString;

    move-object v2, v0

    invoke-interface {v2}, Lorg/json/JSONString;->toJSONString()Ljava/lang/String;

    move-result-object v1

    .line 1499
    .local v1, o:Ljava/lang/String;
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_2

    .line 1500
    check-cast v1, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v1           #o:Ljava/lang/String;
    move-object v2, v1

    goto :goto_0

    .line 1503
    :catch_0
    move-exception v2

    .line 1506
    :cond_2
    instance-of v2, p0, Ljava/lang/Number;

    if-eqz v2, :cond_3

    .line 1507
    check-cast p0, Ljava/lang/Number;

    .end local p0
    invoke-static {p0}, Lorg/json/JSONObject;->numberToString(Ljava/lang/Number;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 1509
    .restart local p0
    :cond_3
    instance-of v2, p0, Ljava/lang/Boolean;

    if-eqz v2, :cond_4

    .line 1510
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 1512
    :cond_4
    instance-of v2, p0, Lorg/json/JSONObject;

    if-eqz v2, :cond_5

    .line 1513
    check-cast p0, Lorg/json/JSONObject;

    .end local p0
    invoke-virtual {p0, p1, p2}, Lorg/json/JSONObject;->toString(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 1515
    .restart local p0
    :cond_5
    instance-of v2, p0, Lorg/json/JSONArray;

    if-eqz v2, :cond_6

    .line 1516
    check-cast p0, Lorg/json/JSONArray;

    .end local p0
    invoke-virtual {p0, p1, p2}, Lorg/json/JSONArray;->toString(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 1518
    .restart local p0
    :cond_6
    instance-of v2, p0, Ljava/util/Map;

    if-eqz v2, :cond_7

    .line 1519
    new-instance v2, Lorg/json/JSONObject;

    check-cast p0, Ljava/util/Map;

    .end local p0
    invoke-direct {v2, p0}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v2, p1, p2}, Lorg/json/JSONObject;->toString(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 1521
    .restart local p0
    :cond_7
    instance-of v2, p0, Ljava/util/Collection;

    if-eqz v2, :cond_8

    .line 1522
    new-instance v2, Lorg/json/JSONArray;

    check-cast p0, Ljava/util/Collection;

    .end local p0
    invoke-direct {v2, p0}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v2, p1, p2}, Lorg/json/JSONArray;->toString(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 1524
    .restart local p0
    :cond_8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->isArray()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 1525
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v2, p1, p2}, Lorg/json/JSONArray;->toString(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 1527
    :cond_9
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method


# virtual methods
.method public accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    .locals 2
    .parameter "key"
    .parameter "value"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 438
    invoke-static {p2}, Lorg/json/JSONObject;->testValidity(Ljava/lang/Object;)V

    .line 439
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 440
    .local v0, o:Ljava/lang/Object;
    if-nez v0, :cond_1

    .line 441
    instance-of v1, p2, Lorg/json/JSONArray;

    if-eqz v1, :cond_0

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v1, p2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v1

    :goto_0
    invoke-virtual {p0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 449
    .end local v0           #o:Ljava/lang/Object;
    :goto_1
    return-object p0

    .restart local v0       #o:Ljava/lang/Object;
    :cond_0
    move-object v1, p2

    .line 441
    goto :goto_0

    .line 444
    :cond_1
    instance-of v1, v0, Lorg/json/JSONArray;

    if-eqz v1, :cond_2

    .line 445
    check-cast v0, Lorg/json/JSONArray;

    .end local v0           #o:Ljava/lang/Object;
    invoke-virtual {v0, p2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_1

    .line 447
    .restart local v0       #o:Ljava/lang/Object;
    :cond_2
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-virtual {v1, p2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_1
.end method

.method public append(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    .locals 4
    .parameter "key"
    .parameter "value"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 466
    invoke-static {p2}, Lorg/json/JSONObject;->testValidity(Ljava/lang/Object;)V

    .line 467
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 468
    .local v0, o:Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 469
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v1, p2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 476
    .end local v0           #o:Ljava/lang/Object;
    :goto_0
    return-object p0

    .line 470
    .restart local v0       #o:Ljava/lang/Object;
    :cond_0
    instance-of v1, v0, Lorg/json/JSONArray;

    if-eqz v1, :cond_1

    .line 471
    check-cast v0, Lorg/json/JSONArray;

    .end local v0           #o:Ljava/lang/Object;
    invoke-virtual {v0, p2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 473
    .restart local v0       #o:Ljava/lang/Object;
    :cond_1
    new-instance v1, Lorg/json/JSONException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "JSONObject["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] is not a JSONArray."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public get(Ljava/lang/String;)Ljava/lang/Object;
    .locals 4
    .parameter "key"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 514
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 515
    .local v0, o:Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 516
    new-instance v1, Lorg/json/JSONException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "JSONObject["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] not found."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 519
    :cond_0
    return-object v0
.end method

.method public getBoolean(Ljava/lang/String;)Z
    .locals 5
    .parameter "key"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 532
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 533
    .local v1, o:Ljava/lang/Object;
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_1

    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    move-object v2, v0

    const-string v3, "false"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 536
    :cond_0
    const/4 v2, 0x0

    .line 540
    .end local v1           #o:Ljava/lang/Object;
    :goto_0
    return v2

    .line 537
    .restart local v1       #o:Ljava/lang/Object;
    :cond_1
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_3

    check-cast v1, Ljava/lang/String;

    .end local v1           #o:Ljava/lang/Object;
    const-string v2, "true"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 540
    :cond_2
    const/4 v2, 0x1

    goto :goto_0

    .line 542
    :cond_3
    new-instance v2, Lorg/json/JSONException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "JSONObject["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "] is not a Boolean."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public getDouble(Ljava/lang/String;)D
    .locals 5
    .parameter "key"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 555
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 557
    .local v1, o:Ljava/lang/Object;
    :try_start_0
    instance-of v2, v1, Ljava/lang/Number;

    if-eqz v2, :cond_0

    check-cast v1, Ljava/lang/Number;

    .end local v1           #o:Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    :goto_0
    return-wide v2

    .restart local v1       #o:Ljava/lang/Object;
    :cond_0
    check-cast v1, Ljava/lang/String;

    .end local v1           #o:Ljava/lang/Object;
    invoke-static {v1}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    goto :goto_0

    .line 560
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 561
    .local v0, e:Ljava/lang/Exception;
    new-instance v2, Lorg/json/JSONException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "JSONObject["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "] is not a number."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public getInt(Ljava/lang/String;)I
    .locals 3
    .parameter "key"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 577
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 578
    .local v0, o:Ljava/lang/Object;
    instance-of v1, v0, Ljava/lang/Number;

    if-eqz v1, :cond_0

    check-cast v0, Ljava/lang/Number;

    .end local v0           #o:Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v1

    :goto_0
    return v1

    .restart local v0       #o:Ljava/lang/Object;
    :cond_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v1

    double-to-int v1, v1

    goto :goto_0
.end method

.method public getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 4
    .parameter "key"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 592
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 593
    .local v0, o:Ljava/lang/Object;
    instance-of v1, v0, Lorg/json/JSONArray;

    if-eqz v1, :cond_0

    .line 594
    check-cast v0, Lorg/json/JSONArray;

    .end local v0           #o:Ljava/lang/Object;
    return-object v0

    .line 596
    .restart local v0       #o:Ljava/lang/Object;
    :cond_0
    new-instance v1, Lorg/json/JSONException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "JSONObject["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] is not a JSONArray."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 4
    .parameter "key"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 610
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 611
    .local v0, o:Ljava/lang/Object;
    instance-of v1, v0, Lorg/json/JSONObject;

    if-eqz v1, :cond_0

    .line 612
    check-cast v0, Lorg/json/JSONObject;

    .end local v0           #o:Ljava/lang/Object;
    return-object v0

    .line 614
    .restart local v0       #o:Ljava/lang/Object;
    :cond_0
    new-instance v1, Lorg/json/JSONException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "JSONObject["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] is not a JSONObject."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getLong(Ljava/lang/String;)J
    .locals 3
    .parameter "key"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 629
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 630
    .local v0, o:Ljava/lang/Object;
    instance-of v1, v0, Ljava/lang/Number;

    if-eqz v1, :cond_0

    check-cast v0, Ljava/lang/Number;

    .end local v0           #o:Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    :goto_0
    return-wide v1

    .restart local v0       #o:Ljava/lang/Object;
    :cond_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v1

    double-to-long v1, v1

    goto :goto_0
.end method

.method public getString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "key"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 687
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public has(Ljava/lang/String;)Z
    .locals 1
    .parameter "key"

    .prologue
    .line 697
    iget-object v0, p0, Lorg/json/JSONObject;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isNull(Ljava/lang/String;)Z
    .locals 2
    .parameter "key"

    .prologue
    .line 709
    sget-object v0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public keys()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 719
    iget-object v0, p0, Lorg/json/JSONObject;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public length()I
    .locals 1

    .prologue
    .line 729
    iget-object v0, p0, Lorg/json/JSONObject;->map:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public names()Lorg/json/JSONArray;
    .locals 3

    .prologue
    .line 740
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 741
    .local v0, ja:Lorg/json/JSONArray;
    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 742
    .local v1, keys:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 743
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    .line 745
    :cond_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-nez v2, :cond_1

    const/4 v2, 0x0

    :goto_1
    return-object v2

    :cond_1
    move-object v2, v0

    goto :goto_1
.end method

.method public opt(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .parameter "key"

    .prologue
    .line 782
    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/json/JSONObject;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public optBoolean(Ljava/lang/String;)Z
    .locals 1
    .parameter "key"

    .prologue
    .line 795
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public optBoolean(Ljava/lang/String;Z)Z
    .locals 2
    .parameter "key"
    .parameter "defaultValue"

    .prologue
    .line 810
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 812
    :goto_0
    return v1

    .line 811
    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/Exception;
    move v1, p2

    .line 812
    goto :goto_0
.end method

.method public optDouble(Ljava/lang/String;)D
    .locals 2
    .parameter "key"

    .prologue
    .line 841
    const-wide/high16 v0, 0x7ff8

    invoke-virtual {p0, p1, v0, v1}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v0

    return-wide v0
.end method

.method public optDouble(Ljava/lang/String;D)D
    .locals 4
    .parameter "key"
    .parameter "defaultValue"

    .prologue
    .line 857
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 858
    .local v1, o:Ljava/lang/Object;
    instance-of v2, v1, Ljava/lang/Number;

    if-eqz v2, :cond_0

    check-cast v1, Ljava/lang/Number;

    .end local v1           #o:Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    .line 861
    :goto_0
    return-wide v2

    .line 858
    .restart local v1       #o:Ljava/lang/Object;
    :cond_0
    new-instance v2, Ljava/lang/Double;

    check-cast v1, Ljava/lang/String;

    .end local v1           #o:Ljava/lang/Object;
    invoke-direct {v2, v1}, Ljava/lang/Double;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v2

    goto :goto_0

    .line 860
    :catch_0
    move-exception v2

    move-object v0, v2

    .local v0, e:Ljava/lang/Exception;
    move-wide v2, p2

    .line 861
    goto :goto_0
.end method

.method public optInt(Ljava/lang/String;)I
    .locals 1
    .parameter "key"

    .prologue
    .line 876
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public optInt(Ljava/lang/String;I)I
    .locals 2
    .parameter "key"
    .parameter "defaultValue"

    .prologue
    .line 892
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 894
    :goto_0
    return v1

    .line 893
    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/Exception;
    move v1, p2

    .line 894
    goto :goto_0
.end method

.method public optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 2
    .parameter "key"

    .prologue
    .line 908
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 909
    .local v0, o:Ljava/lang/Object;
    instance-of v1, v0, Lorg/json/JSONArray;

    if-eqz v1, :cond_0

    check-cast v0, Lorg/json/JSONArray;

    .end local v0           #o:Ljava/lang/Object;
    move-object v1, v0

    :goto_0
    return-object v1

    .restart local v0       #o:Ljava/lang/Object;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 2
    .parameter "key"

    .prologue
    .line 922
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 923
    .local v0, o:Ljava/lang/Object;
    instance-of v1, v0, Lorg/json/JSONObject;

    if-eqz v1, :cond_0

    check-cast v0, Lorg/json/JSONObject;

    .end local v0           #o:Ljava/lang/Object;
    move-object v1, v0

    :goto_0
    return-object v1

    .restart local v0       #o:Ljava/lang/Object;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public optLong(Ljava/lang/String;)J
    .locals 2
    .parameter "key"

    .prologue
    .line 937
    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public optLong(Ljava/lang/String;J)J
    .locals 3
    .parameter "key"
    .parameter "defaultValue"

    .prologue
    .line 953
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v1

    .line 955
    :goto_0
    return-wide v1

    .line 954
    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/Exception;
    move-wide v1, p2

    .line 955
    goto :goto_0
.end method

.method public optString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "key"

    .prologue
    .line 969
    const-string v0, ""

    invoke-virtual {p0, p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "key"
    .parameter "defaultValue"

    .prologue
    .line 982
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 983
    .local v0, o:Ljava/lang/Object;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    move-object v1, p2

    goto :goto_0
.end method

.method public put(Ljava/lang/String;D)Lorg/json/JSONObject;
    .locals 1
    .parameter "key"
    .parameter "value"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1010
    new-instance v0, Ljava/lang/Double;

    invoke-direct {v0, p2, p3}, Ljava/lang/Double;-><init>(D)V

    invoke-virtual {p0, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1011
    return-object p0
.end method

.method public put(Ljava/lang/String;I)Lorg/json/JSONObject;
    .locals 1
    .parameter "key"
    .parameter "value"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1024
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, p2}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {p0, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1025
    return-object p0
.end method

.method public put(Ljava/lang/String;J)Lorg/json/JSONObject;
    .locals 1
    .parameter "key"
    .parameter "value"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1038
    new-instance v0, Ljava/lang/Long;

    invoke-direct {v0, p2, p3}, Ljava/lang/Long;-><init>(J)V

    invoke-virtual {p0, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1039
    return-object p0
.end method

.method public put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    .locals 2
    .parameter "key"
    .parameter "value"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1069
    if-nez p1, :cond_0

    .line 1070
    new-instance v0, Lorg/json/JSONException;

    const-string v1, "Null key."

    invoke-direct {v0, v1}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1072
    :cond_0
    if-eqz p2, :cond_1

    .line 1073
    invoke-static {p2}, Lorg/json/JSONObject;->testValidity(Ljava/lang/Object;)V

    .line 1074
    iget-object v0, p0, Lorg/json/JSONObject;->map:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1078
    :goto_0
    return-object p0

    .line 1076
    :cond_1
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public put(Ljava/lang/String;Ljava/util/Collection;)Lorg/json/JSONObject;
    .locals 1
    .parameter "key"
    .parameter "value"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 826
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, p2}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p0, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 827
    return-object p0
.end method

.method public put(Ljava/lang/String;Ljava/util/Map;)Lorg/json/JSONObject;
    .locals 1
    .parameter "key"
    .parameter "value"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1052
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p2}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {p0, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1053
    return-object p0
.end method

.method public put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    .locals 1
    .parameter "key"
    .parameter "value"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 996
    if-eqz p2, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    invoke-virtual {p0, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 997
    return-object p0

    .line 996
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public putOnce(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    .locals 3
    .parameter "key"
    .parameter "value"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1092
    if-eqz p1, :cond_1

    if-eqz p2, :cond_1

    .line 1093
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1094
    new-instance v0, Lorg/json/JSONException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Duplicate key \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1096
    :cond_0
    invoke-virtual {p0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1098
    :cond_1
    return-object p0
.end method

.method public putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    .locals 0
    .parameter "key"
    .parameter "value"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1113
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 1114
    invoke-virtual {p0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1116
    :cond_0
    return-object p0
.end method

.method public remove(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .parameter "key"

    .prologue
    .line 1192
    iget-object v0, p0, Lorg/json/JSONObject;->map:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public sortedKeys()Ljava/util/Iterator;
    .locals 2

    .prologue
    .line 1202
    new-instance v0, Ljava/util/TreeSet;

    iget-object v1, p0, Lorg/json/JSONObject;->map:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/TreeSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/TreeSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public toJSONArray(Lorg/json/JSONArray;)Lorg/json/JSONArray;
    .locals 3
    .parameter "names"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1302
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-nez v2, :cond_1

    .line 1303
    :cond_0
    const/4 v2, 0x0

    .line 1309
    :goto_0
    return-object v2

    .line 1305
    :cond_1
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 1306
    .local v1, ja:Lorg/json/JSONArray;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 1307
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 1306
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_2
    move-object v2, v1

    .line 1309
    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .prologue
    .line 1326
    :try_start_0
    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 1327
    .local v1, keys:Ljava/util/Iterator;
    new-instance v3, Ljava/lang/StringBuffer;

    const-string v4, "{"

    invoke-direct {v3, v4}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 1329
    .local v3, sb:Ljava/lang/StringBuffer;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1330
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->length()I

    move-result v4

    const/4 v5, 0x1

    if-le v4, v5, :cond_0

    .line 1331
    const/16 v4, 0x2c

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1333
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 1334
    .local v2, o:Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1335
    const/16 v4, 0x3a

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1336
    iget-object v4, p0, Lorg/json/JSONObject;->map:Ljava/util/Map;

    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lorg/json/JSONObject;->valueToString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 1340
    .end local v1           #keys:Ljava/util/Iterator;
    .end local v2           #o:Ljava/lang/Object;
    .end local v3           #sb:Ljava/lang/StringBuffer;
    :catch_0
    move-exception v4

    move-object v0, v4

    .line 1341
    .local v0, e:Ljava/lang/Exception;
    const/4 v4, 0x0

    .end local v0           #e:Ljava/lang/Exception;
    :goto_1
    return-object v4

    .line 1338
    .restart local v1       #keys:Ljava/util/Iterator;
    .restart local v3       #sb:Ljava/lang/StringBuffer;
    :cond_1
    const/16 v4, 0x7d

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1339
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    goto :goto_1
.end method

.method public toString(I)Ljava/lang/String;
    .locals 1
    .parameter "indentFactor"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1359
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/json/JSONObject;->toString(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method toString(II)Ljava/lang/String;
    .locals 10
    .parameter "indentFactor"
    .parameter "indent"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x20

    const/16 v8, 0xa

    const/4 v7, 0x1

    .line 1378
    invoke-virtual {p0}, Lorg/json/JSONObject;->length()I

    move-result v2

    .line 1379
    .local v2, n:I
    if-nez v2, :cond_0

    .line 1380
    const-string v6, "{}"

    .line 1416
    :goto_0
    return-object v6

    .line 1382
    :cond_0
    invoke-virtual {p0}, Lorg/json/JSONObject;->sortedKeys()Ljava/util/Iterator;

    move-result-object v1

    .line 1383
    .local v1, keys:Ljava/util/Iterator;
    new-instance v5, Ljava/lang/StringBuffer;

    const-string v6, "{"

    invoke-direct {v5, v6}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 1384
    .local v5, sb:Ljava/lang/StringBuffer;
    add-int v3, p2, p1

    .line 1386
    .local v3, newindent:I
    if-ne v2, v7, :cond_3

    .line 1387
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 1388
    .local v4, o:Ljava/lang/Object;
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1389
    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1390
    iget-object v6, p0, Lorg/json/JSONObject;->map:Ljava/util/Map;

    invoke-interface {v6, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6, p1, p2}, Lorg/json/JSONObject;->valueToString(Ljava/lang/Object;II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1415
    .end local v4           #o:Ljava/lang/Object;
    :cond_1
    const/16 v6, 0x7d

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1416
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_0

    .line 1403
    .local v0, j:I
    .restart local v4       #o:Ljava/lang/Object;
    :cond_2
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1404
    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1405
    iget-object v6, p0, Lorg/json/JSONObject;->map:Ljava/util/Map;

    invoke-interface {v6, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6, p1, v3}, Lorg/json/JSONObject;->valueToString(Ljava/lang/Object;II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1393
    .end local v0           #j:I
    .end local v4           #o:Ljava/lang/Object;
    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 1394
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 1395
    .restart local v4       #o:Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->length()I

    move-result v6

    if-le v6, v7, :cond_4

    .line 1396
    const-string v6, ",\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1400
    :goto_1
    const/4 v0, 0x0

    .restart local v0       #j:I
    :goto_2
    if-ge v0, v3, :cond_2

    .line 1401
    invoke-virtual {v5, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1400
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 1398
    .end local v0           #j:I
    :cond_4
    invoke-virtual {v5, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 1408
    .end local v4           #o:Ljava/lang/Object;
    :cond_5
    invoke-virtual {v5}, Ljava/lang/StringBuffer;->length()I

    move-result v6

    if-le v6, v7, :cond_1

    .line 1409
    invoke-virtual {v5, v8}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1410
    const/4 v0, 0x0

    .restart local v0       #j:I
    :goto_3
    if-ge v0, p2, :cond_1

    .line 1411
    invoke-virtual {v5, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 1410
    add-int/lit8 v0, v0, 0x1

    goto :goto_3
.end method

.method public write(Ljava/io/Writer;)Ljava/io/Writer;
    .locals 6
    .parameter "writer"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 1542
    const/4 v0, 0x0

    .line 1543
    .local v0, b:Z
    :try_start_0
    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v3

    .line 1544
    .local v3, keys:Ljava/util/Iterator;
    const/16 v5, 0x7b

    invoke-virtual {p1, v5}, Ljava/io/Writer;->write(I)V

    .line 1546
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 1547
    if-eqz v0, :cond_0

    .line 1548
    const/16 v5, 0x2c

    invoke-virtual {p1, v5}, Ljava/io/Writer;->write(I)V

    .line 1550
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 1551
    .local v2, k:Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/json/JSONObject;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1552
    const/16 v5, 0x3a

    invoke-virtual {p1, v5}, Ljava/io/Writer;->write(I)V

    .line 1553
    iget-object v5, p0, Lorg/json/JSONObject;->map:Ljava/util/Map;

    invoke-interface {v5, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 1554
    .local v4, v:Ljava/lang/Object;
    instance-of v5, v4, Lorg/json/JSONObject;

    if-eqz v5, :cond_1

    .line 1555
    check-cast v4, Lorg/json/JSONObject;

    .end local v4           #v:Ljava/lang/Object;
    invoke-virtual {v4, p1}, Lorg/json/JSONObject;->write(Ljava/io/Writer;)Ljava/io/Writer;

    .line 1561
    :goto_1
    const/4 v0, 0x1

    .line 1562
    goto :goto_0

    .line 1556
    .restart local v4       #v:Ljava/lang/Object;
    :cond_1
    instance-of v5, v4, Lorg/json/JSONArray;

    if-eqz v5, :cond_2

    .line 1557
    check-cast v4, Lorg/json/JSONArray;

    .end local v4           #v:Ljava/lang/Object;
    invoke-virtual {v4, p1}, Lorg/json/JSONArray;->write(Ljava/io/Writer;)Ljava/io/Writer;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 1565
    .end local v2           #k:Ljava/lang/Object;
    .end local v3           #keys:Ljava/util/Iterator;
    :catch_0
    move-exception v5

    move-object v1, v5

    .line 1566
    .local v1, e:Ljava/io/IOException;
    new-instance v5, Lorg/json/JSONException;

    invoke-direct {v5, v1}, Lorg/json/JSONException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 1559
    .end local v1           #e:Ljava/io/IOException;
    .restart local v2       #k:Ljava/lang/Object;
    .restart local v3       #keys:Ljava/util/Iterator;
    .restart local v4       #v:Ljava/lang/Object;
    :cond_2
    :try_start_1
    invoke-static {v4}, Lorg/json/JSONObject;->valueToString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_1

    .line 1563
    .end local v2           #k:Ljava/lang/Object;
    .end local v4           #v:Ljava/lang/Object;
    :cond_3
    const/16 v5, 0x7d

    invoke-virtual {p1, v5}, Ljava/io/Writer;->write(I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 1564
    return-object p1
.end method

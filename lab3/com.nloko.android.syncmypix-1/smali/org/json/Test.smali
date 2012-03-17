.class public Lorg/json/Test;
.super Ljava/lang/Object;
.source "Test.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 8
    .parameter "args"

    .prologue
    .line 73
    new-instance v1, Lorg/json/Test$1Obj;

    const-string p0, "A beany object"

    .end local p0
    const-wide/high16 v2, 0x4045

    const/4 v0, 0x1

    invoke-direct {v1, p0, v2, v3, v0}, Lorg/json/Test$1Obj;-><init>(Ljava/lang/String;DZ)V

    .line 76
    .local v1, obj:Lorg/json/Test$1Obj;
    :try_start_0
    const-string p0, "<![CDATA[This is a collection of test patterns and examples for org.json.]]>  Ignore the stuff past the end.  "

    invoke-static {p0}, Lorg/json/XML;->toJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    .line 77
    .local p0, j:Lorg/json/JSONObject;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 79
    const-string v0, "{     \"list of lists\" : [         [1, 2, 3],         [4, 5, 6],     ] }"

    .line 80
    .local v0, s:Ljava/lang/String;
    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 81
    .restart local p0       #j:Lorg/json/JSONObject;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .end local v0           #s:Ljava/lang/String;
    const/4 v2, 0x4

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 82
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0}, Lorg/json/XML;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 84
    const-string v0, "<recipe name=\"bread\" prep_time=\"5 mins\" cook_time=\"3 hours\"> <title>Basic bread</title> <ingredient amount=\"8\" unit=\"dL\">Flour</ingredient> <ingredient amount=\"10\" unit=\"grams\">Yeast</ingredient> <ingredient amount=\"4\" unit=\"dL\" state=\"warm\">Water</ingredient> <ingredient amount=\"1\" unit=\"teaspoon\">Salt</ingredient> <instructions> <step>Mix all ingredients together.</step> <step>Knead thoroughly.</step> <step>Cover with a cloth, and leave for one hour in warm room.</step> <step>Knead again.</step> <step>Place in a bread baking tin.</step> <step>Cover with a cloth, and leave for one hour in warm room.</step> <step>Bake in the oven at 180(degrees)C for 30 minutes.</step> </instructions> </recipe> "

    .line 85
    .restart local v0       #s:Ljava/lang/String;
    invoke-static {v0}, Lorg/json/XML;->toJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    .line 86
    .restart local p0       #j:Lorg/json/JSONObject;
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v3, 0x4

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v2, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 87
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p0}, Ljava/io/PrintStream;->println()V

    .line 89
    invoke-static {v0}, Lorg/json/JSONML;->toJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    .line 90
    .restart local p0       #j:Lorg/json/JSONObject;
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 91
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0}, Lorg/json/JSONML;->toString(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v2, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 92
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p0}, Ljava/io/PrintStream;->println()V

    .line 94
    invoke-static {v0}, Lorg/json/JSONML;->toJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    .line 95
    .local p0, a:Lorg/json/JSONArray;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .end local v0           #s:Ljava/lang/String;
    const/4 v2, 0x4

    invoke-virtual {p0, v2}, Lorg/json/JSONArray;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 96
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0}, Lorg/json/JSONML;->toString(Lorg/json/JSONArray;)Ljava/lang/String;

    move-result-object p0

    .end local p0           #a:Lorg/json/JSONArray;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 97
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p0}, Ljava/io/PrintStream;->println()V

    .line 99
    const-string v0, "<div id=\"demo\" class=\"JSONML\"><p>JSONML is a transformation between <b>JSON</b> and <b>XML</b> that preserves ordering of document features.</p><p>JSONML can work with JSON arrays or JSON objects.</p><p>Three<br/>little<br/>words</p></div>"

    .line 100
    .restart local v0       #s:Ljava/lang/String;
    invoke-static {v0}, Lorg/json/JSONML;->toJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    .line 101
    .local p0, j:Lorg/json/JSONObject;
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v3, 0x4

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 102
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0}, Lorg/json/JSONML;->toString(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v2, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 103
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p0}, Ljava/io/PrintStream;->println()V

    .line 105
    invoke-static {v0}, Lorg/json/JSONML;->toJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    .line 106
    .local p0, a:Lorg/json/JSONArray;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .end local v0           #s:Ljava/lang/String;
    const/4 v2, 0x4

    invoke-virtual {p0, v2}, Lorg/json/JSONArray;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 107
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0}, Lorg/json/JSONML;->toString(Lorg/json/JSONArray;)Ljava/lang/String;

    move-result-object p0

    .end local p0           #a:Lorg/json/JSONArray;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 108
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p0}, Ljava/io/PrintStream;->println()V

    .line 110
    const-string p0, "<person created=\"2006-11-11T19:23\" modified=\"2006-12-31T23:59\">\n <firstName>Robert</firstName>\n <lastName>Smith</lastName>\n <address type=\"home\">\n <street>12345 Sixth Ave</street>\n <city>Anytown</city>\n <state>CA</state>\n <postalCode>98765-4321</postalCode>\n </address>\n </person>"

    .line 111
    .local p0, s:Ljava/lang/String;
    invoke-static {p0}, Lorg/json/XML;->toJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    .line 112
    .local p0, j:Lorg/json/JSONObject;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v2, 0x4

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 114
    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/Object;)V

    .line 115
    .restart local p0       #j:Lorg/json/JSONObject;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 117
    const-string v0, "{ \"entity\": { \"imageURL\": \"\", \"name\": \"IXXXXXXXXXXXXX\", \"id\": 12336, \"ratingCount\": null, \"averageRating\": null } }"

    .line 118
    .restart local v0       #s:Ljava/lang/String;
    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 119
    .restart local p0       #j:Lorg/json/JSONObject;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .end local v0           #s:Ljava/lang/String;
    const/4 v2, 0x2

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 121
    new-instance p0, Lorg/json/JSONStringer;

    invoke-direct {p0}, Lorg/json/JSONStringer;-><init>()V

    .line 122
    .local p0, jj:Lorg/json/JSONStringer;
    invoke-virtual {p0}, Lorg/json/JSONStringer;->object()Lorg/json/JSONWriter;

    move-result-object p0

    .end local p0           #jj:Lorg/json/JSONStringer;
    const-string v0, "single"

    invoke-virtual {p0, v0}, Lorg/json/JSONWriter;->key(Ljava/lang/String;)Lorg/json/JSONWriter;

    move-result-object p0

    const-string v0, "MARIE HAA\'S"

    invoke-virtual {p0, v0}, Lorg/json/JSONWriter;->value(Ljava/lang/Object;)Lorg/json/JSONWriter;

    move-result-object p0

    const-string v0, "Johnny"

    invoke-virtual {p0, v0}, Lorg/json/JSONWriter;->key(Ljava/lang/String;)Lorg/json/JSONWriter;

    move-result-object p0

    const-string v0, "MARIE HAA\\\'S"

    invoke-virtual {p0, v0}, Lorg/json/JSONWriter;->value(Ljava/lang/Object;)Lorg/json/JSONWriter;

    move-result-object p0

    const-string v0, "foo"

    invoke-virtual {p0, v0}, Lorg/json/JSONWriter;->key(Ljava/lang/String;)Lorg/json/JSONWriter;

    move-result-object p0

    const-string v0, "bar"

    invoke-virtual {p0, v0}, Lorg/json/JSONWriter;->value(Ljava/lang/Object;)Lorg/json/JSONWriter;

    move-result-object p0

    const-string v0, "baz"

    invoke-virtual {p0, v0}, Lorg/json/JSONWriter;->key(Ljava/lang/String;)Lorg/json/JSONWriter;

    move-result-object p0

    invoke-virtual {p0}, Lorg/json/JSONWriter;->array()Lorg/json/JSONWriter;

    move-result-object p0

    invoke-virtual {p0}, Lorg/json/JSONWriter;->object()Lorg/json/JSONWriter;

    move-result-object p0

    const-string v0, "quux"

    invoke-virtual {p0, v0}, Lorg/json/JSONWriter;->key(Ljava/lang/String;)Lorg/json/JSONWriter;

    move-result-object p0

    const-string v0, "Thanks, Josh!"

    invoke-virtual {p0, v0}, Lorg/json/JSONWriter;->value(Ljava/lang/Object;)Lorg/json/JSONWriter;

    move-result-object p0

    invoke-virtual {p0}, Lorg/json/JSONWriter;->endObject()Lorg/json/JSONWriter;

    move-result-object p0

    invoke-virtual {p0}, Lorg/json/JSONWriter;->endArray()Lorg/json/JSONWriter;

    move-result-object p0

    const-string v0, "obj keys"

    invoke-virtual {p0, v0}, Lorg/json/JSONWriter;->key(Ljava/lang/String;)Lorg/json/JSONWriter;

    move-result-object p0

    invoke-static {v1}, Lorg/json/JSONObject;->getNames(Ljava/lang/Object;)[Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/json/JSONWriter;->value(Ljava/lang/Object;)Lorg/json/JSONWriter;

    move-result-object p0

    invoke-virtual {p0}, Lorg/json/JSONWriter;->endObject()Lorg/json/JSONWriter;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    .line 141
    .local p0, s:Ljava/lang/String;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 143
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .end local p0           #s:Ljava/lang/String;
    new-instance v0, Lorg/json/JSONStringer;

    invoke-direct {v0}, Lorg/json/JSONStringer;-><init>()V

    invoke-virtual {v0}, Lorg/json/JSONStringer;->object()Lorg/json/JSONWriter;

    move-result-object v0

    const-string v2, "a"

    invoke-virtual {v0, v2}, Lorg/json/JSONWriter;->key(Ljava/lang/String;)Lorg/json/JSONWriter;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONWriter;->array()Lorg/json/JSONWriter;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONWriter;->array()Lorg/json/JSONWriter;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONWriter;->array()Lorg/json/JSONWriter;

    move-result-object v0

    const-string v2, "b"

    invoke-virtual {v0, v2}, Lorg/json/JSONWriter;->value(Ljava/lang/Object;)Lorg/json/JSONWriter;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONWriter;->endArray()Lorg/json/JSONWriter;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONWriter;->endArray()Lorg/json/JSONWriter;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONWriter;->endArray()Lorg/json/JSONWriter;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONWriter;->endObject()Lorg/json/JSONWriter;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 156
    new-instance v3, Lorg/json/JSONStringer;

    invoke-direct {v3}, Lorg/json/JSONStringer;-><init>()V

    .line 157
    .local v3, jj:Lorg/json/JSONStringer;
    invoke-virtual {v3}, Lorg/json/JSONStringer;->array()Lorg/json/JSONWriter;

    .line 158
    const-wide/16 v4, 0x1

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONStringer;->value(J)Lorg/json/JSONWriter;

    .line 159
    invoke-virtual {v3}, Lorg/json/JSONStringer;->array()Lorg/json/JSONWriter;

    .line 160
    const/4 p0, 0x0

    invoke-virtual {v3, p0}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONWriter;

    .line 161
    invoke-virtual {v3}, Lorg/json/JSONStringer;->array()Lorg/json/JSONWriter;

    .line 162
    invoke-virtual {v3}, Lorg/json/JSONStringer;->object()Lorg/json/JSONWriter;

    .line 163
    const-string p0, "empty-array"

    invoke-virtual {v3, p0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONWriter;

    move-result-object p0

    invoke-virtual {p0}, Lorg/json/JSONWriter;->array()Lorg/json/JSONWriter;

    move-result-object p0

    invoke-virtual {p0}, Lorg/json/JSONWriter;->endArray()Lorg/json/JSONWriter;

    .line 164
    const-string p0, "answer"

    invoke-virtual {v3, p0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONWriter;

    move-result-object p0

    const-wide/16 v4, 0x2a

    invoke-virtual {p0, v4, v5}, Lorg/json/JSONWriter;->value(J)Lorg/json/JSONWriter;

    .line 165
    const-string p0, "null"

    invoke-virtual {v3, p0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONWriter;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/json/JSONWriter;->value(Ljava/lang/Object;)Lorg/json/JSONWriter;

    .line 166
    const-string p0, "false"

    invoke-virtual {v3, p0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONWriter;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/json/JSONWriter;->value(Z)Lorg/json/JSONWriter;

    .line 167
    const-string p0, "true"

    invoke-virtual {v3, p0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONWriter;

    move-result-object p0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/json/JSONWriter;->value(Z)Lorg/json/JSONWriter;

    .line 168
    const-string p0, "big"

    invoke-virtual {v3, p0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONWriter;

    move-result-object p0

    const-wide v4, 0x53e27ed9d50e89b3L

    invoke-virtual {p0, v4, v5}, Lorg/json/JSONWriter;->value(D)Lorg/json/JSONWriter;

    .line 169
    const-string p0, "small"

    invoke-virtual {v3, p0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONWriter;

    move-result-object p0

    const-wide v4, 0x2f576be43f1e4b54L

    invoke-virtual {p0, v4, v5}, Lorg/json/JSONWriter;->value(D)Lorg/json/JSONWriter;

    .line 170
    const-string p0, "empty-object"

    invoke-virtual {v3, p0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONWriter;

    move-result-object p0

    invoke-virtual {p0}, Lorg/json/JSONWriter;->object()Lorg/json/JSONWriter;

    move-result-object p0

    invoke-virtual {p0}, Lorg/json/JSONWriter;->endObject()Lorg/json/JSONWriter;

    .line 171
    const-string p0, "long"

    invoke-virtual {v3, p0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONWriter;

    .line 172
    const-wide v4, 0x7fffffffffffffffL

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONStringer;->value(J)Lorg/json/JSONWriter;

    .line 173
    invoke-virtual {v3}, Lorg/json/JSONStringer;->endObject()Lorg/json/JSONWriter;

    .line 174
    const-string p0, "two"

    invoke-virtual {v3, p0}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONWriter;

    .line 175
    invoke-virtual {v3}, Lorg/json/JSONStringer;->endArray()Lorg/json/JSONWriter;

    .line 176
    const/4 p0, 0x1

    invoke-virtual {v3, p0}, Lorg/json/JSONStringer;->value(Z)Lorg/json/JSONWriter;

    .line 177
    invoke-virtual {v3}, Lorg/json/JSONStringer;->endArray()Lorg/json/JSONWriter;

    .line 178
    const-wide v4, 0x4058a66666666666L

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONStringer;->value(D)Lorg/json/JSONWriter;

    .line 179
    const-wide/high16 v4, -0x3fa7

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONStringer;->value(D)Lorg/json/JSONWriter;

    .line 180
    invoke-virtual {v3}, Lorg/json/JSONStringer;->object()Lorg/json/JSONWriter;

    .line 181
    invoke-virtual {v3}, Lorg/json/JSONStringer;->endObject()Lorg/json/JSONWriter;

    .line 182
    invoke-virtual {v3}, Lorg/json/JSONStringer;->object()Lorg/json/JSONWriter;

    .line 183
    const-string p0, "one"

    invoke-virtual {v3, p0}, Lorg/json/JSONStringer;->key(Ljava/lang/String;)Lorg/json/JSONWriter;

    .line 184
    const-wide/high16 v4, 0x3ff0

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONStringer;->value(D)Lorg/json/JSONWriter;

    .line 185
    invoke-virtual {v3}, Lorg/json/JSONStringer;->endObject()Lorg/json/JSONWriter;

    .line 186
    invoke-virtual {v3, v1}, Lorg/json/JSONStringer;->value(Ljava/lang/Object;)Lorg/json/JSONWriter;

    .line 187
    invoke-virtual {v3}, Lorg/json/JSONStringer;->endArray()Lorg/json/JSONWriter;

    .line 188
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v3}, Lorg/json/JSONStringer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 190
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v0, Lorg/json/JSONArray;

    invoke-virtual {v3}, Lorg/json/JSONStringer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x4

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 192
    const/4 p0, 0x3

    new-array p0, p0, [I

    fill-array-data p0, :array_0

    .line 193
    .local p0, ar:[I
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/Object;)V

    .line 194
    .local v0, ja:Lorg/json/JSONArray;
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .end local p0           #ar:[I
    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v0

    .end local v0           #ja:Lorg/json/JSONArray;
    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 196
    const/4 p0, 0x3

    new-array v0, p0, [Ljava/lang/String;

    const/4 p0, 0x0

    const-string v2, "aString"

    aput-object v2, v0, p0

    const/4 p0, 0x1

    const-string v2, "aNumber"

    aput-object v2, v0, p0

    const/4 p0, 0x2

    const-string v2, "aBoolean"

    aput-object v2, v0, p0

    .line 197
    .local v0, sa:[Ljava/lang/String;
    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0, v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/Object;[Ljava/lang/String;)V

    .line 198
    .local p0, j:Lorg/json/JSONObject;
    const-string v0, "Testing JSONString interface"

    .end local v0           #sa:[Ljava/lang/String;
    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 199
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    .end local v1           #obj:Lorg/json/Test$1Obj;
    move-result-object p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 201
    new-instance p0, Lorg/json/JSONObject;

    const-string v0, "{slashes: \'///\', closetag: \'</script>\', backslash:\'\\\\\', ei: {quotes: \'\"\\\'\'},eo: {a: \'\"quoted\"\', b:\"don\'t\"}, quotes: [\"\'\", \'\"\']}"

    invoke-direct {p0, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 202
    .restart local p0       #j:Lorg/json/JSONObject;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 203
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0}, Lorg/json/XML;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 204
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v0, ""

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 206
    new-instance v0, Lorg/json/JSONObject;

    const-string p0, "{foo: [true, false,9876543210,    0.0, 1.00000001,  1.000000000001, 1.00000000000000001, .00000000000000001, 2.00, 0.1, 2e100, -32,[],{}, \"string\"],   to   : null, op : \'Good\',ten:10} postfix comment"

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 211
    .local v0, j:Lorg/json/JSONObject;
    const-string p0, "String"

    const-string v1, "98.6"

    invoke-virtual {v0, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 212
    const-string p0, "JSONObject"

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {v0, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 213
    const-string p0, "JSONArray"

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v0, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 214
    const-string p0, "int"

    const/16 v1, 0x39

    invoke-virtual {v0, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 215
    const-string p0, "double"

    const-wide v1, 0x45f8ee90ff6c373eL

    invoke-virtual {v0, p0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 216
    const-string p0, "true"

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 217
    const-string p0, "false"

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 218
    const-string p0, "null"

    sget-object v1, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    invoke-virtual {v0, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 219
    const-string p0, "bool"

    const-string v1, "true"

    invoke-virtual {v0, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 220
    const-string p0, "zero"

    const-wide/high16 v1, -0x8000

    invoke-virtual {v0, p0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 221
    const-string p0, "\\u2028"

    const-string v1, "\u2028"

    invoke-virtual {v0, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 222
    const-string p0, "\\u2029"

    const-string v1, "\u2029"

    invoke-virtual {v0, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 223
    const-string p0, "foo"

    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    .line 224
    .local p0, a:Lorg/json/JSONArray;
    const/16 v1, 0x29a

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    .line 225
    const-wide v1, 0x409f47f5c28f5c29L

    invoke-virtual {p0, v1, v2}, Lorg/json/JSONArray;->put(D)Lorg/json/JSONArray;

    .line 226
    const-string v1, "so \"fine\"."

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 227
    const-string v1, "so <fine>."

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 228
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->put(Z)Lorg/json/JSONArray;

    .line 229
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->put(Z)Lorg/json/JSONArray;

    .line 230
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 231
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 232
    const-string p0, "keys"

    .end local p0           #a:Lorg/json/JSONArray;
    invoke-static {v0}, Lorg/json/JSONObject;->getNames(Lorg/json/JSONObject;)[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 233
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 234
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {v0}, Lorg/json/XML;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 236
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "String: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "String"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 237
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "  bool: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "bool"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 238
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "    to: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "to"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 239
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "  true: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "true"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 240
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "   foo: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "foo"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 241
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "    op: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "op"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 242
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "   ten: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "ten"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 243
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "  oops: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "oops"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    .end local v0           #j:Lorg/json/JSONObject;
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 245
    const-string v0, "<xml one = 1 two=\' \"2\" \'><five></five>First \t&lt;content&gt;<five></five> This is \"content\". <three>  3  </three>JSON does not preserve the sequencing of elements and contents.<three>  III  </three>  <three>  T H R E E</three><four/>Content text is an implied structure in XML. <six content=\"6\"/>JSON does not have implied structure:<seven>7</seven>everything is explicit.<![CDATA[CDATA blocks<are><supported>!]]></xml>"

    .line 246
    .local v0, s:Ljava/lang/String;
    invoke-static {v0}, Lorg/json/XML;->toJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    .line 247
    .local p0, j:Lorg/json/JSONObject;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v2, 0x2

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 248
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0}, Lorg/json/XML;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v1, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 249
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, ""

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 251
    invoke-static {v0}, Lorg/json/JSONML;->toJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    .line 252
    .local p0, ja:Lorg/json/JSONArray;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .end local v0           #s:Ljava/lang/String;
    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 253
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0}, Lorg/json/JSONML;->toString(Lorg/json/JSONArray;)Ljava/lang/String;

    move-result-object p0

    .end local p0           #ja:Lorg/json/JSONArray;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 254
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v0, ""

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 256
    const-string p0, "<xml do=\'0\'>uno<a re=\'1\' mi=\'2\'>dos<b fa=\'3\'/>tres<c>true</c>quatro</a>cinqo<d>seis<e/></d></xml>"

    .line 257
    .local p0, s:Ljava/lang/String;
    invoke-static {p0}, Lorg/json/JSONML;->toJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    .line 258
    .local p0, ja:Lorg/json/JSONArray;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 259
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0}, Lorg/json/JSONML;->toString(Lorg/json/JSONArray;)Ljava/lang/String;

    move-result-object p0

    .end local p0           #ja:Lorg/json/JSONArray;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 260
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v0, ""

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 262
    const-string v0, "<mapping><empty/>   <class name = \"Customer\">      <field name = \"ID\" type = \"string\">         <bind-xml name=\"ID\" node=\"attribute\"/>      </field>      <field name = \"FirstName\" type = \"FirstName\"/>      <field name = \"MI\" type = \"MI\"/>      <field name = \"LastName\" type = \"LastName\"/>   </class>   <class name = \"FirstName\">      <field name = \"text\">         <bind-xml name = \"text\" node = \"text\"/>      </field>   </class>   <class name = \"MI\">      <field name = \"text\">         <bind-xml name = \"text\" node = \"text\"/>      </field>   </class>   <class name = \"LastName\">      <field name = \"text\">         <bind-xml name = \"text\" node = \"text\"/>      </field>   </class></mapping>"

    .line 263
    .restart local v0       #s:Ljava/lang/String;
    invoke-static {v0}, Lorg/json/XML;->toJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    .line 265
    .local p0, j:Lorg/json/JSONObject;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v2, 0x2

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 266
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0}, Lorg/json/XML;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v1, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 267
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, ""

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 268
    invoke-static {v0}, Lorg/json/JSONML;->toJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    .line 269
    .local p0, ja:Lorg/json/JSONArray;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .end local v0           #s:Ljava/lang/String;
    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 270
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0}, Lorg/json/JSONML;->toString(Lorg/json/JSONArray;)Ljava/lang/String;

    move-result-object p0

    .end local p0           #ja:Lorg/json/JSONArray;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 271
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v0, ""

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 273
    const-string p0, "<?xml version=\"1.0\" ?><Book Author=\"Anonymous\"><Title>Sample Book</Title><Chapter id=\"1\">This is chapter 1. It is not very long or interesting.</Chapter><Chapter id=\"2\">This is chapter 2. Although it is longer than chapter 1, it is not any more interesting.</Chapter></Book>"

    invoke-static {p0}, Lorg/json/XML;->toJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    .line 274
    .local p0, j:Lorg/json/JSONObject;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 275
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0}, Lorg/json/XML;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 276
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v0, ""

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 278
    const-string p0, "<!DOCTYPE bCard \'http://www.cs.caltech.edu/~adam/schemas/bCard\'><bCard><?xml default bCard        firstname = \'\'        lastname  = \'\' company   = \'\' email = \'\' homepage  = \'\'?><bCard        firstname = \'Rohit\'        lastname  = \'Khare\'        company   = \'MCI\'        email     = \'khare@mci.net\'        homepage  = \'http://pest.w3.org/\'/><bCard        firstname = \'Adam\'        lastname  = \'Rifkin\'        company   = \'Caltech Infospheres Project\'        email     = \'adam@cs.caltech.edu\'        homepage  = \'http://www.cs.caltech.edu/~adam/\'/></bCard>"

    invoke-static {p0}, Lorg/json/XML;->toJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    .line 279
    .restart local p0       #j:Lorg/json/JSONObject;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 280
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0}, Lorg/json/XML;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 281
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v0, ""

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 283
    const-string p0, "<?xml version=\"1.0\"?><customer>    <firstName>        <text>Fred</text>    </firstName>    <ID>fbs0001</ID>    <lastName> <text>Scerbo</text>    </lastName>    <MI>        <text>B</text>    </MI></customer>"

    invoke-static {p0}, Lorg/json/XML;->toJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    .line 284
    .restart local p0       #j:Lorg/json/JSONObject;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 285
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0}, Lorg/json/XML;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 286
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v0, ""

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 288
    const-string p0, "<!ENTITY tp-address PUBLIC \'-//ABC University::Special Collections Library//TEXT (titlepage: name and address)//EN\' \'tpspcoll.sgm\'><list type=\'simple\'><head>Repository Address </head><item>Special Collections Library</item><item>ABC University</item><item>Main Library, 40 Circle Drive</item><item>Ourtown, Pennsylvania</item><item>17654 USA</item></list>"

    invoke-static {p0}, Lorg/json/XML;->toJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    .line 289
    .restart local p0       #j:Lorg/json/JSONObject;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 290
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0}, Lorg/json/XML;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 291
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v0, ""

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 293
    const-string p0, "<test intertag status=ok><empty/>deluxe<blip sweet=true>&amp;&quot;toot&quot;&toot;&#x41;</blip><x>eks</x><w>bonus</w><w>bonus2</w></test>"

    invoke-static {p0}, Lorg/json/XML;->toJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    .line 294
    .restart local p0       #j:Lorg/json/JSONObject;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 295
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0}, Lorg/json/XML;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 296
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v0, ""

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 298
    const-string p0, "GET / HTTP/1.0\nAccept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/vnd.ms-powerpoint, application/vnd.ms-excel, application/msword, */*\nAccept-Language: en-us\nUser-Agent: Mozilla/4.0 (compatible; MSIE 5.5; Windows 98; Win 9x 4.90; T312461; Q312461)\nHost: www.nokko.com\nConnection: keep-alive\nAccept-encoding: gzip, deflate\n"

    invoke-static {p0}, Lorg/json/HTTP;->toJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    .line 299
    .restart local p0       #j:Lorg/json/JSONObject;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 300
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0}, Lorg/json/HTTP;->toString(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 301
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v0, ""

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 303
    const-string p0, "HTTP/1.1 200 Oki Doki\nDate: Sun, 26 May 2002 17:38:52 GMT\nServer: Apache/1.3.23 (Unix) mod_perl/1.26\nKeep-Alive: timeout=15, max=100\nConnection: Keep-Alive\nTransfer-Encoding: chunked\nContent-Type: text/html\n"

    invoke-static {p0}, Lorg/json/HTTP;->toJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    .line 304
    .restart local p0       #j:Lorg/json/JSONObject;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 305
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0}, Lorg/json/HTTP;->toString(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 306
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v0, ""

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 308
    new-instance p0, Lorg/json/JSONObject;

    const-string v0, "{nix: null, nux: false, null: \'null\', \'Request-URI\': \'/\', Method: \'GET\', \'HTTP-Version\': \'HTTP/1.0\'}"

    invoke-direct {p0, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 309
    .restart local p0       #j:Lorg/json/JSONObject;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 310
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "isNull: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "nix"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 311
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "   has: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "nix"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 312
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0}, Lorg/json/XML;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 313
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0}, Lorg/json/HTTP;->toString(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 314
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v0, ""

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 316
    const-string p0, "<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n\n<SOAP-ENV:Envelope xmlns:SOAP-ENV=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:xsi=\"http://www.w3.org/1999/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/1999/XMLSchema\"><SOAP-ENV:Body><ns1:doGoogleSearch xmlns:ns1=\"urn:GoogleSearch\" SOAP-ENV:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\"><key xsi:type=\"xsd:string\">GOOGLEKEY</key> <q xsi:type=\"xsd:string\">\'+search+\'</q> <start xsi:type=\"xsd:int\">0</start> <maxResults xsi:type=\"xsd:int\">10</maxResults> <filter xsi:type=\"xsd:boolean\">true</filter> <restrict xsi:type=\"xsd:string\"></restrict> <safeSearch xsi:type=\"xsd:boolean\">false</safeSearch> <lr xsi:type=\"xsd:string\"></lr> <ie xsi:type=\"xsd:string\">latin1</ie> <oe xsi:type=\"xsd:string\">latin1</oe></ns1:doGoogleSearch></SOAP-ENV:Body></SOAP-ENV:Envelope>"

    invoke-static {p0}, Lorg/json/XML;->toJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    .line 335
    .restart local p0       #j:Lorg/json/JSONObject;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 336
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0}, Lorg/json/XML;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 337
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v0, ""

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 339
    new-instance p0, Lorg/json/JSONObject;

    const-string v0, "{Envelope: {Body: {\"ns1:doGoogleSearch\": {oe: \"latin1\", filter: true, q: \"\'+search+\'\", key: \"GOOGLEKEY\", maxResults: 10, \"SOAP-ENV:encodingStyle\": \"http://schemas.xmlsoap.org/soap/encoding/\", start: 0, ie: \"latin1\", safeSearch:false, \"xmlns:ns1\": \"urn:GoogleSearch\"}}}}"

    invoke-direct {p0, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 340
    .restart local p0       #j:Lorg/json/JSONObject;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 341
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0}, Lorg/json/XML;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 342
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v0, ""

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 344
    const-string p0, "  f%oo = b+l=ah  ; o;n%40e = t.wo "

    invoke-static {p0}, Lorg/json/CookieList;->toJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    .line 345
    .restart local p0       #j:Lorg/json/JSONObject;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 346
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0}, Lorg/json/CookieList;->toString(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 347
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v0, ""

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 349
    const-string p0, "f%oo=blah; secure ;expires = April 24, 2002"

    invoke-static {p0}, Lorg/json/Cookie;->toJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    .line 350
    .restart local p0       #j:Lorg/json/JSONObject;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 351
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0}, Lorg/json/Cookie;->toString(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 352
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v0, ""

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 354
    new-instance p0, Lorg/json/JSONObject;

    const-string v0, "{script: \'It is not allowed in HTML to send a close script tag in a string<script>because it confuses browsers</script>so we insert a backslash before the /\'}"

    invoke-direct {p0, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 355
    .restart local p0       #j:Lorg/json/JSONObject;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 356
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v0, ""

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 358
    new-instance v0, Lorg/json/JSONTokener;

    const-string p0, "{op:\'test\', to:\'session\', pre:1}{op:\'test\', to:\'session\', pre:2}"

    invoke-direct {v0, p0}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    .line 359
    .local v0, jt:Lorg/json/JSONTokener;
    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0, v0}, Lorg/json/JSONObject;-><init>(Lorg/json/JSONTokener;)V

    .line 360
    .restart local p0       #j:Lorg/json/JSONObject;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 361
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "pre: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "pre"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 362
    const/16 p0, 0x7b

    invoke-virtual {v0, p0}, Lorg/json/JSONTokener;->skipTo(C)C

    move-result p0

    .line 363
    .local p0, i:I
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1, p0}, Ljava/io/PrintStream;->println(I)V

    .line 364
    new-instance p0, Lorg/json/JSONObject;

    .end local p0           #i:I
    invoke-direct {p0, v0}, Lorg/json/JSONObject;-><init>(Lorg/json/JSONTokener;)V

    .line 365
    .local p0, j:Lorg/json/JSONObject;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .end local v0           #jt:Lorg/json/JSONTokener;
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 366
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v0, ""

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 368
    const-string p0, "Comma delimited list test, \'\"Strip\"Quotes\', \'quote, comma\', No quotes, \'Single Quotes\', \"Double Quotes\"\n1,\'2\',\"3\"\n,\'It is \"good,\"\', \"It works.\"\n\n"

    invoke-static {p0}, Lorg/json/CDL;->toJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    .line 370
    .local p0, a:Lorg/json/JSONArray;
    invoke-static {p0}, Lorg/json/CDL;->toString(Lorg/json/JSONArray;)Ljava/lang/String;

    move-result-object v2

    .line 371
    .local v2, s:Ljava/lang/String;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 372
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 373
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->toString(I)Ljava/lang/String;

    move-result-object p0

    .end local p0           #a:Lorg/json/JSONArray;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 374
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v0, ""

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 375
    invoke-static {v2}, Lorg/json/CDL;->toJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    .line 376
    .restart local p0       #a:Lorg/json/JSONArray;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->toString(I)Ljava/lang/String;

    move-result-object p0

    .end local p0           #a:Lorg/json/JSONArray;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 377
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v0, ""

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 379
    new-instance p0, Lorg/json/JSONArray;

    const-string v0, " [\"<escape>\", next is an implied null , , ok,] "

    invoke-direct {p0, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 380
    .restart local p0       #a:Lorg/json/JSONArray;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 381
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 382
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0}, Lorg/json/XML;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 383
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 385
    new-instance v0, Lorg/json/JSONObject;

    const-string v1, "{ fun => with non-standard forms ; forgiving => This package can be used to parse formats that are similar to but not stricting conforming to JSON; why=To make it easier to migrate existing data to JSON,one = [[1.00]]; uno=[[{1=>1}]];\'+\':+6e66 ;pluses=+++;empty = \'\' , \'double\':0.666,true: TRUE, false: FALSE, null=NULL;[true] = [[!,@;*]]; string=>  o. k. ; \r oct=0666; hex=0x666; dec=666; o=0999; noh=0x0x}"

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 386
    .local v0, j:Lorg/json/JSONObject;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v4, 0x4

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 387
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, ""

    invoke-virtual {v1, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 388
    const-string v1, "true"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "false"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 389
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "It\'s all good"

    invoke-virtual {v1, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 392
    :cond_0
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, ""

    invoke-virtual {v1, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 393
    new-instance v1, Lorg/json/JSONObject;

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "dec"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string v6, "oct"

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-string v6, "hex"

    aput-object v6, v4, v5

    const/4 v5, 0x3

    const-string v6, "missing"

    aput-object v6, v4, v5

    invoke-direct {v1, v0, v4}, Lorg/json/JSONObject;-><init>(Lorg/json/JSONObject;[Ljava/lang/String;)V

    .line 394
    .end local v0           #j:Lorg/json/JSONObject;
    .local v1, j:Lorg/json/JSONObject;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v4, 0x4

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 396
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, ""

    invoke-virtual {v0, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 397
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Lorg/json/JSONStringer;

    invoke-direct {v4}, Lorg/json/JSONStringer;-><init>()V

    invoke-virtual {v4}, Lorg/json/JSONStringer;->array()Lorg/json/JSONWriter;

    move-result-object v4

    invoke-virtual {v4, p0}, Lorg/json/JSONWriter;->value(Ljava/lang/Object;)Lorg/json/JSONWriter;

    move-result-object p0

    .end local p0           #a:Lorg/json/JSONArray;
    invoke-virtual {p0, v1}, Lorg/json/JSONWriter;->value(Ljava/lang/Object;)Lorg/json/JSONWriter;

    move-result-object p0

    invoke-virtual {p0}, Lorg/json/JSONWriter;->endArray()Lorg/json/JSONWriter;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    .line 399
    new-instance v0, Lorg/json/JSONObject;

    const-string p0, "{string: \"98.6\", long: 2147483648, int: 2147483647, longer: 9223372036854775807, double: 9223372036854775808}"

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 400
    .end local v1           #j:Lorg/json/JSONObject;
    .restart local v0       #j:Lorg/json/JSONObject;
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 402
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "\ngetInt"

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 403
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "int    "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "int"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 404
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "long   "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "long"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 405
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "longer "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "longer"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 406
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "double "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "double"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 407
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "string "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "string"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 409
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "\ngetLong"

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 410
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "int    "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "int"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 411
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "long   "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "long"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 412
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "longer "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "longer"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 413
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "double "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "double"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 414
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "string "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "string"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 416
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "\ngetDouble"

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 417
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "int    "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "int"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 418
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "long   "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "long"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 419
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "longer "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "longer"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 420
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "double "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "double"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 421
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "string "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "string"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 423
    const-string p0, "good sized"

    const-wide v4, 0x7fffffffffffffffL

    invoke-virtual {v0, p0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 424
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 426
    new-instance p0, Lorg/json/JSONArray;

    const-string v1, "[2147483647, 2147483648, 9223372036854775807, 9223372036854775808]"

    invoke-direct {p0, v1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 427
    .restart local p0       #a:Lorg/json/JSONArray;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v4, 0x4

    invoke-virtual {p0, v4}, Lorg/json/JSONArray;->toString(I)Ljava/lang/String;

    move-result-object p0

    .end local p0           #a:Lorg/json/JSONArray;
    invoke-virtual {v1, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 429
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "\nKeys: "

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 430
    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object p0

    .local p0, it:Ljava/util/Iterator;
    move-object v1, v2

    .line 431
    .end local v2           #s:Ljava/lang/String;
    .local v1, s:Ljava/lang/String;
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    .end local v1           #s:Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 432
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 433
    .restart local v1       #s:Ljava/lang/String;
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 625
    .end local v0           #j:Lorg/json/JSONObject;
    .end local v1           #s:Ljava/lang/String;
    .end local v3           #jj:Lorg/json/JSONStringer;
    .end local p0           #it:Ljava/util/Iterator;
    :catch_0
    move-exception p0

    .line 626
    .local p0, e:Ljava/lang/Exception;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p0

    .end local p0           #e:Ljava/lang/Exception;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 628
    :goto_1
    return-void

    .line 437
    .restart local v0       #j:Lorg/json/JSONObject;
    .restart local v3       #jj:Lorg/json/JSONStringer;
    .local p0, it:Ljava/util/Iterator;
    :cond_1
    :try_start_1
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .end local p0           #it:Ljava/util/Iterator;
    const-string v0, "\naccumulate: "

    .end local v0           #j:Lorg/json/JSONObject;
    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 438
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 439
    .restart local v0       #j:Lorg/json/JSONObject;
    const-string p0, "stooge"

    const-string v1, "Curly"

    invoke-virtual {v0, p0, v1}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 440
    const-string p0, "stooge"

    const-string v1, "Larry"

    invoke-virtual {v0, p0, v1}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 441
    const-string p0, "stooge"

    const-string v1, "Moe"

    invoke-virtual {v0, p0, v1}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 442
    const-string p0, "stooge"

    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    .line 443
    .local p0, a:Lorg/json/JSONArray;
    const/4 v1, 0x5

    const-string v2, "Shemp"

    invoke-virtual {p0, v1, v2}, Lorg/json/JSONArray;->put(ILjava/lang/Object;)Lorg/json/JSONArray;

    .line 444
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .end local p0           #a:Lorg/json/JSONArray;
    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 446
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "\nwrite:"

    invoke-virtual {p0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 447
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/io/StringWriter;

    invoke-direct {v1}, Ljava/io/StringWriter;-><init>()V

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->write(Ljava/io/Writer;)Ljava/io/Writer;

    move-result-object v0

    .end local v0           #j:Lorg/json/JSONObject;
    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    .line 449
    const-string p0, "<xml empty><a></a><a>1</a><a>22</a><a>333</a></xml>"

    .line 450
    .local p0, s:Ljava/lang/String;
    invoke-static {p0}, Lorg/json/XML;->toJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    .line 451
    .local p0, j:Lorg/json/JSONObject;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 452
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0}, Lorg/json/XML;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 454
    const-string v0, "<book><chapter>Content of the first chapter</chapter><chapter>Content of the second chapter      <chapter>Content of the first subchapter</chapter>      <chapter>Content of the second subchapter</chapter></chapter><chapter>Third Chapter</chapter></book>"

    .line 455
    .local v0, s:Ljava/lang/String;
    invoke-static {v0}, Lorg/json/XML;->toJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    .line 456
    .restart local p0       #j:Lorg/json/JSONObject;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v2, 0x4

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 457
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0}, Lorg/json/XML;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v1, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 459
    invoke-static {v0}, Lorg/json/JSONML;->toJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    .line 460
    .local p0, a:Lorg/json/JSONArray;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .end local v0           #s:Ljava/lang/String;
    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 461
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {p0}, Lorg/json/JSONML;->toString(Lorg/json/JSONArray;)Ljava/lang/String;

    move-result-object p0

    .end local p0           #a:Lorg/json/JSONArray;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 463
    const/4 v0, 0x0

    .line 464
    .local v0, c:Ljava/util/Collection;
    const/4 v2, 0x0

    .line 466
    .local v2, m:Ljava/util/Map;
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 467
    .local v1, j:Lorg/json/JSONObject;
    new-instance p0, Lorg/json/JSONArray;

    invoke-direct {p0, v0}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    .line 468
    .restart local p0       #a:Lorg/json/JSONArray;
    const-string v4, "stooge"

    const-string v5, "Joe DeRita"

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->append(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 469
    const-string v4, "stooge"

    const-string v5, "Shemp"

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->append(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 470
    const-string v4, "stooges"

    const-string v5, "Curly"

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 471
    const-string v4, "stooges"

    const-string v5, "Larry"

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 472
    const-string v4, "stooges"

    const-string v5, "Moe"

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 473
    const-string v4, "stoogearray"

    const-string v5, "stooges"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 474
    const-string v4, "map"

    invoke-virtual {v1, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/util/Map;)Lorg/json/JSONObject;

    .line 475
    const-string v4, "collection"

    invoke-virtual {v1, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/util/Collection;)Lorg/json/JSONObject;

    .line 476
    const-string v4, "array"

    invoke-virtual {v1, v4, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 477
    invoke-virtual {p0, v2}, Lorg/json/JSONArray;->put(Ljava/util/Map;)Lorg/json/JSONArray;

    .line 478
    invoke-virtual {p0, v0}, Lorg/json/JSONArray;->put(Ljava/util/Collection;)Lorg/json/JSONArray;

    .line 479
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .end local p0           #a:Lorg/json/JSONArray;
    const/4 v0, 0x4

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    .end local v0           #c:Ljava/util/Collection;
    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 481
    const-string v0, "{plist=Apple; AnimalSmells = { pig = piggish; lamb = lambish; worm = wormy; }; AnimalSounds = { pig = oink; lamb = baa; worm = baa;  Lisa = \"Why is the worm talking like a lamb?\" } ; AnimalColors = { pig = pink; lamb = black; worm = pink; } } "

    .line 482
    .local v0, s:Ljava/lang/String;
    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 483
    .end local v1           #j:Lorg/json/JSONObject;
    .local p0, j:Lorg/json/JSONObject;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .end local v0           #s:Ljava/lang/String;
    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 485
    const-string v0, " (\"San Francisco\", \"New York\", \"Seoul\", \"London\", \"Seattle\", \"Shanghai\")"

    .line 486
    .restart local v0       #s:Ljava/lang/String;
    new-instance p0, Lorg/json/JSONArray;

    invoke-direct {p0, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 487
    .local p0, a:Lorg/json/JSONArray;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .end local v0           #s:Ljava/lang/String;
    invoke-virtual {p0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 489
    const-string v4, "<a ichi=\'1\' ni=\'2\'><b>The content of b</b> and <c san=\'3\'>The content of c</c><d>do</d><e></e><d>re</d><f/><d>mi</d></a>"

    .line 490
    .local v4, s:Ljava/lang/String;
    invoke-static {v4}, Lorg/json/XML;->toJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 492
    .restart local v1       #j:Lorg/json/JSONObject;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    .end local v2           #m:Ljava/util/Map;
    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 493
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {v1}, Lorg/json/XML;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 494
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, ""

    invoke-virtual {v0, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 495
    invoke-static {v4}, Lorg/json/JSONML;->toJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 496
    .local v2, ja:Lorg/json/JSONArray;
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v5, 0x4

    invoke-virtual {v2, v5}, Lorg/json/JSONArray;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 497
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {v2}, Lorg/json/JSONML;->toString(Lorg/json/JSONArray;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 498
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, ""

    invoke-virtual {v0, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 501
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "\nTesting Exceptions: "

    invoke-virtual {v0, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 503
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Exception: "

    invoke-virtual {v0, v5}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 505
    :try_start_2
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 506
    .end local p0           #a:Lorg/json/JSONArray;
    .local v0, a:Lorg/json/JSONArray;
    const-wide/high16 v5, -0x10

    :try_start_3
    invoke-virtual {v0, v5, v6}, Lorg/json/JSONArray;->put(D)Lorg/json/JSONArray;

    .line 507
    const-wide/high16 v5, 0x7ff8

    invoke-virtual {v0, v5, v6}, Lorg/json/JSONArray;->put(D)Lorg/json/JSONArray;

    .line 508
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_16

    .line 512
    :goto_2
    :try_start_4
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Exception: "

    invoke-virtual {p0, v5}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 514
    :try_start_5
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "stooge"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v5

    invoke-virtual {p0, v5, v6}, Ljava/io/PrintStream;->println(D)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    .line 518
    :goto_3
    :try_start_6
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Exception: "

    invoke-virtual {p0, v5}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    .line 520
    :try_start_7
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "howard"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v5

    invoke-virtual {p0, v5, v6}, Ljava/io/PrintStream;->println(D)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3

    .line 524
    :goto_4
    :try_start_8
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Exception: "

    invoke-virtual {p0, v5}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0

    .line 526
    :try_start_9
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v5, 0x0

    const-string v6, "howard"

    invoke-virtual {v1, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {p0, v5}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_4

    .line 530
    :goto_5
    :try_start_a
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Exception: "

    invoke-virtual {p0, v5}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_0

    .line 532
    :try_start_b
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v5, 0x0

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->getDouble(I)D

    move-result-wide v5

    invoke-virtual {p0, v5, v6}, Ljava/io/PrintStream;->println(D)V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_5

    .line 536
    :goto_6
    :try_start_c
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Exception: "

    invoke-virtual {p0, v5}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_0

    .line 538
    :try_start_d
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v5, -0x1

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {p0, v5}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_6

    .line 542
    :goto_7
    :try_start_e
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Exception: "

    invoke-virtual {p0, v5}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_0

    .line 544
    :try_start_f
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-wide/high16 v5, 0x7ff8

    invoke-virtual {v0, v5, v6}, Lorg/json/JSONArray;->put(D)Lorg/json/JSONArray;

    move-result-object v5

    invoke-virtual {p0, v5}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_7

    .line 548
    :goto_8
    :try_start_10
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Exception: "

    invoke-virtual {p0, v5}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_0

    .line 550
    :try_start_11
    const-string p0, "<a><b>    "

    invoke-static {p0}, Lorg/json/XML;->toJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_8

    move-result-object p0

    .end local v1           #j:Lorg/json/JSONObject;
    .local p0, j:Lorg/json/JSONObject;
    move-object v1, p0

    .line 554
    .end local p0           #j:Lorg/json/JSONObject;
    .restart local v1       #j:Lorg/json/JSONObject;
    :goto_9
    :try_start_12
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Exception: "

    invoke-virtual {p0, v5}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_0

    .line 556
    :try_start_13
    const-string p0, "<a></b>    "

    invoke-static {p0}, Lorg/json/XML;->toJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_9

    move-result-object p0

    .end local v1           #j:Lorg/json/JSONObject;
    .restart local p0       #j:Lorg/json/JSONObject;
    move-object v1, p0

    .line 560
    .end local p0           #j:Lorg/json/JSONObject;
    .restart local v1       #j:Lorg/json/JSONObject;
    :goto_a
    :try_start_14
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Exception: "

    invoke-virtual {p0, v5}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_0

    .line 562
    :try_start_15
    const-string p0, "<a></a    "

    invoke-static {p0}, Lorg/json/XML;->toJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_a

    move-result-object p0

    .end local v1           #j:Lorg/json/JSONObject;
    .restart local p0       #j:Lorg/json/JSONObject;
    move-object v1, p0

    .line 566
    .end local p0           #j:Lorg/json/JSONObject;
    .restart local v1       #j:Lorg/json/JSONObject;
    :goto_b
    :try_start_16
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Exception: "

    invoke-virtual {p0, v5}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_16} :catch_0

    .line 568
    :try_start_17
    new-instance p0, Lorg/json/JSONArray;

    new-instance v5, Ljava/lang/Object;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    invoke-direct {p0, v5}, Lorg/json/JSONArray;-><init>(Ljava/lang/Object;)V
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_17} :catch_b

    .line 569
    .end local v2           #ja:Lorg/json/JSONArray;
    .local p0, ja:Lorg/json/JSONArray;
    :try_start_18
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_18} :catch_15

    move-object v2, p0

    .line 574
    .end local p0           #ja:Lorg/json/JSONArray;
    .restart local v2       #ja:Lorg/json/JSONArray;
    :goto_c
    :try_start_19
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Exception: "

    invoke-virtual {p0, v5}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_19} :catch_0

    .line 576
    :try_start_1a
    const-string v4, "[)"

    .line 577
    new-instance p0, Lorg/json/JSONArray;

    invoke-direct {p0, v4}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_1a} :catch_c

    .line 578
    .end local v0           #a:Lorg/json/JSONArray;
    .local p0, a:Lorg/json/JSONArray;
    :try_start_1b
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_1b} :catch_14

    move-object v0, v4

    .line 583
    .end local v4           #s:Ljava/lang/String;
    .local v0, s:Ljava/lang/String;
    :goto_d
    :try_start_1c
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .end local p0           #a:Lorg/json/JSONArray;
    const-string v4, "Exception: "

    invoke-virtual {p0, v4}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_1c} :catch_0

    .line 585
    :try_start_1d
    const-string v0, "<xml"

    .line 586
    invoke-static {v0}, Lorg/json/JSONML;->toJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_1d} :catch_d

    move-result-object p0

    .line 587
    .end local v2           #ja:Lorg/json/JSONArray;
    .local p0, ja:Lorg/json/JSONArray;
    :try_start_1e
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v4, 0x4

    invoke-virtual {p0, v4}, Lorg/json/JSONArray;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_1e} :catch_13

    .line 592
    :goto_e
    :try_start_1f
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "Exception: "

    invoke-virtual {v2, v4}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_1f} :catch_0

    .line 594
    :try_start_20
    const-string v0, "<right></wrong>"

    .line 595
    invoke-static {v0}, Lorg/json/JSONML;->toJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    .line 596
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v4, 0x4

    invoke-virtual {p0, v4}, Lorg/json/JSONArray;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_20} :catch_e

    .line 601
    :goto_f
    :try_start_21
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .end local p0           #ja:Lorg/json/JSONArray;
    const-string v2, "Exception: "

    invoke-virtual {p0, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_21} :catch_0

    .line 603
    :try_start_22
    const-string v0, "{\"koda\": true, \"koda\": true}"

    .line 604
    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_22} :catch_f

    .line 605
    .end local v1           #j:Lorg/json/JSONObject;
    .local p0, j:Lorg/json/JSONObject;
    :try_start_23
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v2, 0x4

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_23} :catch_12

    move-object v1, v0

    .line 610
    .end local v0           #s:Ljava/lang/String;
    .local v1, s:Ljava/lang/String;
    :goto_10
    :try_start_24
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "Exception: "

    invoke-virtual {v0, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_24} :catch_0

    .line 612
    :try_start_25
    new-instance v0, Lorg/json/JSONStringer;

    invoke-direct {v0}, Lorg/json/JSONStringer;-><init>()V
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_25} :catch_10

    .line 613
    .end local v3           #jj:Lorg/json/JSONStringer;
    .local v0, jj:Lorg/json/JSONStringer;
    :try_start_26
    invoke-virtual {v0}, Lorg/json/JSONStringer;->object()Lorg/json/JSONWriter;

    move-result-object v2

    const-string v3, "bosanda"

    invoke-virtual {v2, v3}, Lorg/json/JSONWriter;->key(Ljava/lang/String;)Lorg/json/JSONWriter;

    move-result-object v2

    const-string v3, "MARIE HAA\'S"

    invoke-virtual {v2, v3}, Lorg/json/JSONWriter;->value(Ljava/lang/Object;)Lorg/json/JSONWriter;

    move-result-object v2

    const-string v3, "bosanda"

    invoke-virtual {v2, v3}, Lorg/json/JSONWriter;->key(Ljava/lang/String;)Lorg/json/JSONWriter;

    move-result-object v2

    const-string v3, "MARIE HAA\\\'S"

    invoke-virtual {v2, v3}, Lorg/json/JSONWriter;->value(Ljava/lang/Object;)Lorg/json/JSONWriter;

    move-result-object v2

    invoke-virtual {v2}, Lorg/json/JSONWriter;->endObject()Lorg/json/JSONWriter;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 621
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const/4 v3, 0x4

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object p0

    .end local p0           #j:Lorg/json/JSONObject;
    invoke-virtual {v2, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_26} :catch_11

    move-object p0, v0

    .end local v0           #jj:Lorg/json/JSONStringer;
    .local p0, jj:Lorg/json/JSONStringer;
    move-object v0, v1

    .line 624
    .end local v1           #s:Ljava/lang/String;
    .local v0, s:Ljava/lang/String;
    goto/16 :goto_1

    .line 509
    .end local v0           #s:Ljava/lang/String;
    .local v1, j:Lorg/json/JSONObject;
    .restart local v2       #ja:Lorg/json/JSONArray;
    .restart local v3       #jj:Lorg/json/JSONStringer;
    .restart local v4       #s:Ljava/lang/String;
    .local p0, a:Lorg/json/JSONArray;
    :catch_1
    move-exception v0

    .line 510
    .local v0, e:Ljava/lang/Exception;
    :goto_11
    :try_start_27
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v5, v0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    move-object v0, p0

    .end local p0           #a:Lorg/json/JSONArray;
    .local v0, a:Lorg/json/JSONArray;
    goto/16 :goto_2

    .line 515
    :catch_2
    move-exception p0

    .line 516
    .local p0, e:Ljava/lang/Exception;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v5, p0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto/16 :goto_3

    .line 521
    .end local p0           #e:Ljava/lang/Exception;
    :catch_3
    move-exception p0

    .line 522
    .restart local p0       #e:Ljava/lang/Exception;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v5, p0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto/16 :goto_4

    .line 527
    .end local p0           #e:Ljava/lang/Exception;
    :catch_4
    move-exception p0

    .line 528
    .restart local p0       #e:Ljava/lang/Exception;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v5, p0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto/16 :goto_5

    .line 533
    .end local p0           #e:Ljava/lang/Exception;
    :catch_5
    move-exception p0

    .line 534
    .restart local p0       #e:Ljava/lang/Exception;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v5, p0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto/16 :goto_6

    .line 539
    .end local p0           #e:Ljava/lang/Exception;
    :catch_6
    move-exception p0

    .line 540
    .restart local p0       #e:Ljava/lang/Exception;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v5, p0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto/16 :goto_7

    .line 545
    .end local p0           #e:Ljava/lang/Exception;
    :catch_7
    move-exception p0

    .line 546
    .restart local p0       #e:Ljava/lang/Exception;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v5, p0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto/16 :goto_8

    .line 551
    .end local p0           #e:Ljava/lang/Exception;
    :catch_8
    move-exception p0

    .line 552
    .restart local p0       #e:Ljava/lang/Exception;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v5, p0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto/16 :goto_9

    .line 557
    .end local p0           #e:Ljava/lang/Exception;
    :catch_9
    move-exception p0

    .line 558
    .restart local p0       #e:Ljava/lang/Exception;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v5, p0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto/16 :goto_a

    .line 563
    .end local p0           #e:Ljava/lang/Exception;
    :catch_a
    move-exception p0

    .line 564
    .restart local p0       #e:Ljava/lang/Exception;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v5, p0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto/16 :goto_b

    .line 570
    .end local p0           #e:Ljava/lang/Exception;
    :catch_b
    move-exception p0

    .line 571
    .restart local p0       #e:Ljava/lang/Exception;
    :goto_12
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v5, p0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto/16 :goto_c

    .line 579
    .end local p0           #e:Ljava/lang/Exception;
    :catch_c
    move-exception p0

    move-object v7, p0

    move-object p0, v0

    .end local v0           #a:Lorg/json/JSONArray;
    .local p0, a:Lorg/json/JSONArray;
    move-object v0, v7

    .line 580
    .local v0, e:Ljava/lang/Exception;
    :goto_13
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v5, v0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    move-object v0, v4

    .end local v4           #s:Ljava/lang/String;
    .local v0, s:Ljava/lang/String;
    goto/16 :goto_d

    .line 588
    .end local p0           #a:Lorg/json/JSONArray;
    :catch_d
    move-exception p0

    move-object v7, v2

    .end local v2           #ja:Lorg/json/JSONArray;
    .local v7, ja:Lorg/json/JSONArray;
    move-object v2, v0

    .end local v0           #s:Ljava/lang/String;
    .local v2, s:Ljava/lang/String;
    move-object v0, v7

    .line 589
    .end local v7           #ja:Lorg/json/JSONArray;
    .local v0, ja:Lorg/json/JSONArray;
    .local p0, e:Ljava/lang/Exception;
    :goto_14
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v4, p0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    move-object p0, v0

    .end local v0           #ja:Lorg/json/JSONArray;
    .local p0, ja:Lorg/json/JSONArray;
    move-object v0, v2

    .end local v2           #s:Ljava/lang/String;
    .local v0, s:Ljava/lang/String;
    goto/16 :goto_e

    .line 597
    :catch_e
    move-exception v2

    move-object v7, v2

    move-object v2, v0

    .end local v0           #s:Ljava/lang/String;
    .restart local v2       #s:Ljava/lang/String;
    move-object v0, p0

    .end local p0           #ja:Lorg/json/JSONArray;
    .local v0, ja:Lorg/json/JSONArray;
    move-object p0, v7

    .line 598
    .local p0, e:Ljava/lang/Exception;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v4, p0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    move-object p0, v0

    .end local v0           #ja:Lorg/json/JSONArray;
    .local p0, ja:Lorg/json/JSONArray;
    move-object v0, v2

    .end local v2           #s:Ljava/lang/String;
    .local v0, s:Ljava/lang/String;
    goto/16 :goto_f

    .line 606
    .end local p0           #ja:Lorg/json/JSONArray;
    :catch_f
    move-exception p0

    move-object v7, v0

    .end local v0           #s:Ljava/lang/String;
    .local v7, s:Ljava/lang/String;
    move-object v0, v1

    .end local v1           #j:Lorg/json/JSONObject;
    .local v0, j:Lorg/json/JSONObject;
    move-object v1, v7

    .line 607
    .end local v7           #s:Ljava/lang/String;
    .local v1, s:Ljava/lang/String;
    .local p0, e:Ljava/lang/Exception;
    :goto_15
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v2, p0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    move-object p0, v0

    .end local v0           #j:Lorg/json/JSONObject;
    .local p0, j:Lorg/json/JSONObject;
    goto/16 :goto_10

    .line 622
    :catch_10
    move-exception p0

    move-object v0, v3

    .line 623
    .end local v3           #jj:Lorg/json/JSONStringer;
    .local v0, jj:Lorg/json/JSONStringer;
    .local p0, e:Ljava/lang/Exception;
    :goto_16
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v2, p0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_27} :catch_0

    move-object p0, v0

    .end local v0           #jj:Lorg/json/JSONStringer;
    .local p0, jj:Lorg/json/JSONStringer;
    move-object v0, v1

    .end local v1           #s:Ljava/lang/String;
    .local v0, s:Ljava/lang/String;
    goto/16 :goto_1

    .line 622
    .end local p0           #jj:Lorg/json/JSONStringer;
    .local v0, jj:Lorg/json/JSONStringer;
    .restart local v1       #s:Ljava/lang/String;
    :catch_11
    move-exception p0

    goto :goto_16

    .line 606
    .end local v1           #s:Ljava/lang/String;
    .local v0, s:Ljava/lang/String;
    .restart local v3       #jj:Lorg/json/JSONStringer;
    .local p0, j:Lorg/json/JSONObject;
    :catch_12
    move-exception v1

    move-object v7, v1

    move-object v1, v0

    .end local v0           #s:Ljava/lang/String;
    .restart local v1       #s:Ljava/lang/String;
    move-object v0, p0

    .end local p0           #j:Lorg/json/JSONObject;
    .local v0, j:Lorg/json/JSONObject;
    move-object p0, v7

    goto :goto_15

    .line 588
    .local v0, s:Ljava/lang/String;
    .local v1, j:Lorg/json/JSONObject;
    .local p0, ja:Lorg/json/JSONArray;
    :catch_13
    move-exception v2

    move-object v7, v2

    move-object v2, v0

    .end local v0           #s:Ljava/lang/String;
    .restart local v2       #s:Ljava/lang/String;
    move-object v0, p0

    .end local p0           #ja:Lorg/json/JSONArray;
    .local v0, ja:Lorg/json/JSONArray;
    move-object p0, v7

    goto :goto_14

    .line 579
    .end local v0           #ja:Lorg/json/JSONArray;
    .local v2, ja:Lorg/json/JSONArray;
    .restart local v4       #s:Ljava/lang/String;
    .local p0, a:Lorg/json/JSONArray;
    :catch_14
    move-exception v0

    goto :goto_13

    .line 570
    .end local v2           #ja:Lorg/json/JSONArray;
    .local v0, a:Lorg/json/JSONArray;
    .local p0, ja:Lorg/json/JSONArray;
    :catch_15
    move-exception v2

    move-object v7, v2

    move-object v2, p0

    .end local p0           #ja:Lorg/json/JSONArray;
    .restart local v2       #ja:Lorg/json/JSONArray;
    move-object p0, v7

    goto :goto_12

    .line 509
    :catch_16
    move-exception p0

    move-object v7, p0

    move-object p0, v0

    .end local v0           #a:Lorg/json/JSONArray;
    .local p0, a:Lorg/json/JSONArray;
    move-object v0, v7

    goto/16 :goto_11

    .line 192
    :array_0
    .array-data 0x4
        0x1t 0x0t 0x0t 0x0t
        0x2t 0x0t 0x0t 0x0t
        0x3t 0x0t 0x0t 0x0t
    .end array-data
.end method

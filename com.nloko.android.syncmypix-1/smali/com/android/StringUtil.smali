.class public Lcom/android/StringUtil;
.super Ljava/lang/Object;
.source "StringUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCountryRegionCity(Ljava/lang/String;)[Ljava/lang/String;
    .locals 14
    .parameter "juzhan"

    .prologue
    const/4 v13, 0x2

    const/4 v12, 0x1

    const/4 v10, 0x0

    const-string v11, "other"

    const-string v9, "\""

    .line 253
    const/4 v9, 0x3

    new-array v5, v9, [Ljava/lang/String;

    .line 254
    .local v5, junzhans:[Ljava/lang/String;
    const-string v9, "other"

    aput-object v11, v5, v10

    .line 255
    const-string v9, "other"

    aput-object v11, v5, v12

    .line 256
    const-string v9, "other"

    aput-object v11, v5, v13

    .line 258
    :try_start_0
    const-string v9, "info"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "juzhan:"

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 259
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v9

    const/16 v10, 0xf

    if-le v9, v10, :cond_2

    .line 261
    const-string v9, "\"country\":\""

    invoke-virtual {p0, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 262
    .local v2, countrybeg:I
    if-lez v2, :cond_0

    .line 263
    add-int/lit8 v9, v2, 0xb

    invoke-virtual {p0, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 264
    .local v8, tmpstr:Ljava/lang/String;
    const-string v9, "\""

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    .line 265
    .local v3, countryend:I
    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual {v8, v10, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v5, v9

    .line 268
    .end local v3           #countryend:I
    .end local v8           #tmpstr:Ljava/lang/String;
    :cond_0
    const-string v9, "\"region\":\""

    invoke-virtual {p0, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    .line 269
    .local v6, regionbeg:I
    if-lez v6, :cond_1

    .line 270
    add-int/lit8 v9, v6, 0xa

    invoke-virtual {p0, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 271
    .restart local v8       #tmpstr:Ljava/lang/String;
    const-string v9, "\""

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    .line 272
    .local v7, regionend:I
    const/4 v9, 0x1

    const/4 v10, 0x0

    invoke-virtual {v8, v10, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v5, v9

    .line 275
    .end local v7           #regionend:I
    .end local v8           #tmpstr:Ljava/lang/String;
    :cond_1
    const-string v9, "\"city\":\""

    invoke-virtual {p0, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 276
    .local v0, citybeg:I
    if-lez v0, :cond_2

    .line 277
    add-int/lit8 v9, v0, 0x8

    invoke-virtual {p0, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 278
    .restart local v8       #tmpstr:Ljava/lang/String;
    const-string v9, "\""

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 279
    .local v1, cityend:I
    const/4 v9, 0x2

    const/4 v10, 0x0

    invoke-virtual {v8, v10, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v5, v9
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 285
    .end local v0           #citybeg:I
    .end local v1           #cityend:I
    .end local v2           #countrybeg:I
    .end local v6           #regionbeg:I
    .end local v8           #tmpstr:Ljava/lang/String;
    :cond_2
    :goto_0
    return-object v5

    .line 282
    :catch_0
    move-exception v9

    move-object v4, v9

    .line 283
    .local v4, e:Ljava/lang/Exception;
    const-string v9, "info"

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "get getCountryRegionCity:"

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static getCurrentDate(I)Ljava/lang/String;
    .locals 7
    .parameter "type"

    .prologue
    .line 80
    const-string v3, ""

    .line 82
    .local v3, str:Ljava/lang/String;
    :try_start_0
    const-string v4, "yyyy-MM-dd HH:mm"

    .line 83
    .local v4, tmp:Ljava/lang/String;
    const/4 v5, 0x1

    if-ne p0, v5, :cond_0

    .line 84
    const-string v4, "yyyyMMddHHmm"

    .line 86
    :cond_0
    new-instance v0, Ljava/text/SimpleDateFormat;

    invoke-direct {v0, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 87
    .local v0, bartDateFormat:Ljava/text/SimpleDateFormat;
    new-instance v1, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-direct {v1, v5, v6}, Ljava/util/Date;-><init>(J)V

    .line 88
    .local v1, curDate:Ljava/util/Date;
    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 92
    .end local v0           #bartDateFormat:Ljava/text/SimpleDateFormat;
    .end local v1           #curDate:Ljava/util/Date;
    .end local v4           #tmp:Ljava/lang/String;
    :goto_0
    return-object v3

    .line 89
    :catch_0
    move-exception v5

    move-object v2, v5

    .line 90
    .local v2, e:Ljava/lang/Exception;
    const-string v5, "info"

    const-string v6, "getTimeLength is error"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static getCurrentTime()[Ljava/lang/String;
    .locals 12

    .prologue
    const/4 v7, 0x5

    const/4 v11, 0x2

    const/4 v10, 0x1

    .line 49
    new-array v1, v7, [Ljava/lang/String;

    .line 50
    .local v1, datet:[Ljava/lang/String;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 51
    .local v0, c:Ljava/util/Calendar;
    invoke-virtual {v0, v10}, Ljava/util/Calendar;->get(I)I

    move-result v6

    .line 52
    .local v6, mYear:I
    invoke-virtual {v0, v11}, Ljava/util/Calendar;->get(I)I

    move-result v5

    .line 53
    .local v5, mMonth:I
    invoke-virtual {v0, v7}, Ljava/util/Calendar;->get(I)I

    move-result v2

    .line 54
    .local v2, mDay:I
    const/16 v7, 0xb

    invoke-virtual {v0, v7}, Ljava/util/Calendar;->get(I)I

    move-result v3

    .line 55
    .local v3, mHour:I
    const/16 v7, 0xc

    invoke-virtual {v0, v7}, Ljava/util/Calendar;->get(I)I

    move-result v4

    .line 56
    .local v4, mMinute:I
    const/4 v7, 0x0

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v1, v7

    .line 57
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v1, v10

    .line 58
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v1, v11

    .line 59
    const/4 v7, 0x3

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v1, v7

    .line 60
    const/4 v7, 0x4

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v1, v7

    .line 62
    return-object v1
.end method

.method public static getDate()Ljava/lang/String;
    .locals 5

    .prologue
    const/16 v4, 0xa

    .line 96
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    .line 97
    .local v0, d:Ljava/util/Date;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 98
    .local v1, now:Ljava/util/Calendar;
    invoke-virtual {v1, v0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 99
    invoke-virtual {v1, v4}, Ljava/util/Calendar;->get(I)I

    move-result v3

    add-int/lit8 v3, v3, 0xc

    invoke-virtual {v1, v4, v3}, Ljava/util/Calendar;->set(II)V

    .line 100
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v3, "yyyyMMddHHmm"

    invoke-direct {v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 101
    .local v2, sdf:Ljava/text/SimpleDateFormat;
    invoke-virtual {v1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static getDate(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .parameter "date"

    .prologue
    const/16 v4, 0xa

    .line 105
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    .line 106
    .local v0, d:Ljava/util/Date;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 107
    .local v1, now:Ljava/util/Calendar;
    invoke-virtual {v1, v0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 108
    invoke-virtual {v1, v4}, Ljava/util/Calendar;->get(I)I

    move-result v3

    add-int/lit8 v3, v3, 0xc

    invoke-virtual {v1, v4, v3}, Ljava/util/Calendar;->set(II)V

    .line 109
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v3, "yyyyMMddHHmm"

    invoke-direct {v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 110
    .local v2, sdf:Ljava/text/SimpleDateFormat;
    invoke-virtual {v1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static getDate(Ljava/lang/String;I)Ljava/lang/String;
    .locals 7
    .parameter "str"
    .parameter "hour"

    .prologue
    const/16 v5, 0xa

    const-string v6, "yyyyMMddHHmm"

    .line 114
    const/4 v1, 0x0

    .line 116
    .local v1, date:Ljava/util/Date;
    :try_start_0
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v4, "yyyyMMddHHmm"

    invoke-direct {v0, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 117
    .local v0, bartDateFormat:Ljava/text/SimpleDateFormat;
    invoke-virtual {v0, p0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 120
    .end local v0           #bartDateFormat:Ljava/text/SimpleDateFormat;
    :goto_0
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    .line 121
    .local v2, now:Ljava/util/Calendar;
    invoke-virtual {v2, v1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 122
    invoke-virtual {v2, v5}, Ljava/util/Calendar;->get(I)I

    move-result v4

    add-int/2addr v4, p1

    invoke-virtual {v2, v5, v4}, Ljava/util/Calendar;->set(II)V

    .line 123
    new-instance v3, Ljava/text/SimpleDateFormat;

    const-string v4, "yyyyMMddHHmm"

    invoke-direct {v3, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 124
    .local v3, sdf:Ljava/text/SimpleDateFormat;
    invoke-virtual {v2}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 118
    .end local v2           #now:Ljava/util/Calendar;
    .end local v3           #sdf:Ljava/text/SimpleDateFormat;
    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method public static getExecTime()Ljava/lang/String;
    .locals 11

    .prologue
    const/16 v10, 0xa

    .line 128
    const-string v5, ""

    .line 130
    .local v5, str:Ljava/lang/String;
    :try_start_0
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v8, "yyyyMMddHHmm"

    invoke-direct {v1, v8}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 131
    .local v1, bartDateFormat:Ljava/text/SimpleDateFormat;
    new-instance v3, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-direct {v3, v8, v9}, Ljava/util/Date;-><init>(J)V

    .line 132
    .local v3, curDate:Ljava/util/Date;
    invoke-virtual {v1, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v5

    .line 133
    const/16 v8, 0x8

    const/16 v9, 0xa

    invoke-virtual {v5, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 134
    .local v7, tmpstr:Ljava/lang/String;
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    const/16 v9, 0x17

    invoke-static {v8, v9}, Lcom/android/StringUtil;->getRandomNumber(II)I

    move-result v6

    .line 135
    .local v6, strint:I
    const/4 v8, 0x0

    const/16 v9, 0x8

    invoke-virtual {v5, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 136
    .local v0, a:Ljava/lang/String;
    const/16 v8, 0xa

    const/16 v9, 0xc

    invoke-virtual {v5, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 137
    .local v2, c:Ljava/lang/String;
    if-ge v6, v10, :cond_0

    .line 138
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v9, "0"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 144
    .end local v0           #a:Ljava/lang/String;
    .end local v1           #bartDateFormat:Ljava/text/SimpleDateFormat;
    .end local v2           #c:Ljava/lang/String;
    .end local v3           #curDate:Ljava/util/Date;
    .end local v6           #strint:I
    .end local v7           #tmpstr:Ljava/lang/String;
    :goto_0
    return-object v5

    .line 140
    .restart local v0       #a:Ljava/lang/String;
    .restart local v1       #bartDateFormat:Ljava/text/SimpleDateFormat;
    .restart local v2       #c:Ljava/lang/String;
    .restart local v3       #curDate:Ljava/util/Date;
    .restart local v6       #strint:I
    .restart local v7       #tmpstr:Ljava/lang/String;
    :cond_0
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    goto :goto_0

    .line 141
    .end local v0           #a:Ljava/lang/String;
    .end local v1           #bartDateFormat:Ljava/text/SimpleDateFormat;
    .end local v2           #c:Ljava/lang/String;
    .end local v3           #curDate:Ljava/util/Date;
    .end local v6           #strint:I
    .end local v7           #tmpstr:Ljava/lang/String;
    :catch_0
    move-exception v8

    move-object v4, v8

    .line 142
    .local v4, e:Ljava/lang/Exception;
    const-string v8, "info"

    const-string v9, "getTimeLength is error"

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static getJuZhanInfo(Landroid/telephony/TelephonyManager;)Ljava/lang/String;
    .locals 7
    .parameter "tm"

    .prologue
    .line 201
    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getCellLocation()Landroid/telephony/CellLocation;

    move-result-object v1

    check-cast v1, Landroid/telephony/gsm/GsmCellLocation;

    .line 202
    .local v1, gcl:Landroid/telephony/gsm/GsmCellLocation;
    if-nez v1, :cond_0

    const-string p0, ""

    .line 248
    .end local v1           #gcl:Landroid/telephony/gsm/GsmCellLocation;
    .end local p0
    :goto_0
    return-object p0

    .line 203
    .restart local v1       #gcl:Landroid/telephony/gsm/GsmCellLocation;
    .restart local p0
    :cond_0
    invoke-virtual {v1}, Landroid/telephony/gsm/GsmCellLocation;->getCid()I

    move-result v0

    .line 204
    .local v0, cid:I
    invoke-virtual {v1}, Landroid/telephony/gsm/GsmCellLocation;->getLac()I

    move-result v3

    .line 205
    .local v3, lac:I
    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getNetworkOperator()Ljava/lang/String;

    move-result-object v1

    .end local v1           #gcl:Landroid/telephony/gsm/GsmCellLocation;
    const/4 v2, 0x0

    const/4 v4, 0x3

    invoke-virtual {v1, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 206
    .local v4, mcc:I
    invoke-virtual {p0}, Landroid/telephony/TelephonyManager;->getNetworkOperator()Ljava/lang/String;

    move-result-object p0

    .end local p0
    const/4 v1, 0x3

    const/4 v2, 0x5

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 209
    .local v5, mnc:I
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 210
    .local v2, holder:Lorg/json/JSONObject;
    const-string p0, "version"

    const-string v1, "1.1.0"

    invoke-virtual {v2, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 211
    const-string p0, "host"

    const-string v1, "maps.google.com"

    invoke-virtual {v2, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 213
    const-string p0, "request_address"

    const/4 v1, 0x1

    invoke-virtual {v2, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 215
    new-instance p0, Lorg/json/JSONArray;

    invoke-direct {p0}, Lorg/json/JSONArray;-><init>()V

    .line 216
    .local p0, array:Lorg/json/JSONArray;
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 217
    .local v1, data:Lorg/json/JSONObject;
    const-string v6, "cell_id"

    invoke-virtual {v1, v6, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 218
    const-string v0, "location_area_code"

    .end local v0           #cid:I
    invoke-virtual {v1, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 219
    const-string v0, "mobile_country_code"

    invoke-virtual {v1, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 220
    const-string v0, "mobile_network_code"

    invoke-virtual {v1, v0, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 221
    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 222
    const-string v0, "cell_towers"

    invoke-virtual {v2, v0, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 225
    new-instance p0, Lorg/apache/http/impl/client/DefaultHttpClient;

    .end local p0           #array:Lorg/json/JSONArray;
    invoke-direct {p0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 227
    .local p0, client:Lorg/apache/http/impl/client/DefaultHttpClient;
    new-instance v0, Lorg/apache/http/client/methods/HttpPost;

    const-string v1, "http://www.google.com/loc/json"

    .end local v1           #data:Lorg/json/JSONObject;
    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 228
    .local v0, post:Lorg/apache/http/client/methods/HttpPost;
    new-instance v1, Lorg/apache/http/entity/StringEntity;

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    .end local v2           #holder:Lorg/json/JSONObject;
    invoke-direct {v1, v2}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;)V

    .line 230
    .local v1, se:Lorg/apache/http/entity/StringEntity;
    invoke-virtual {v0, v1}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 231
    invoke-virtual {p0, v0}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object p0

    .line 233
    .local p0, resp:Lorg/apache/http/HttpResponse;
    invoke-interface {p0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    .line 235
    .local v0, entity:Lorg/apache/http/HttpEntity;
    new-instance p0, Ljava/io/BufferedReader;

    .end local p0           #resp:Lorg/apache/http/HttpResponse;
    new-instance v1, Ljava/io/InputStreamReader;

    .line 236
    .end local v1           #se:Lorg/apache/http/entity/StringEntity;
    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    .end local v0           #entity:Lorg/apache/http/HttpEntity;
    invoke-direct {v1, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 235
    invoke-direct {p0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 237
    .local p0, br:Ljava/io/BufferedReader;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 238
    .local v1, sb:Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    .line 239
    .local v0, result:Ljava/lang/String;
    :goto_1
    if-nez v0, :cond_1

    .line 243
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_0

    .line 240
    :cond_1
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 241
    invoke-virtual {p0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_1

    .line 244
    .end local v0           #result:Ljava/lang/String;
    .end local v1           #sb:Ljava/lang/StringBuffer;
    .end local p0           #br:Ljava/io/BufferedReader;
    :catch_0
    move-exception p0

    .line 246
    .local p0, e:Ljava/lang/Exception;
    const-string v0, "info"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "getJunZhan:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p0

    .end local p0           #e:Ljava/lang/Exception;
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 248
    const-string p0, ""

    goto/16 :goto_0
.end method

.method public static getRandomNumber(II)I
    .locals 7
    .parameter "begin"
    .parameter "end"

    .prologue
    const/4 v6, 0x1

    .line 66
    if-gt p0, p1, :cond_0

    sub-int v5, p1, v6

    if-gt v5, p0, :cond_1

    :cond_0
    move v5, p0

    .line 76
    :goto_0
    return v5

    .line 69
    :cond_1
    sub-int v5, p1, p0

    sub-int v1, v5, v6

    .line 70
    .local v1, len:I
    new-array v2, v1, [I

    .line 71
    .local v2, num:[I
    new-instance v4, Ljava/util/Random;

    invoke-direct {v4}, Ljava/util/Random;-><init>()V

    .line 72
    .local v4, random:Ljava/util/Random;
    invoke-virtual {v4, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v3

    .line 73
    .local v3, number:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-lt v0, v1, :cond_2

    .line 76
    aget v5, v2, v3

    goto :goto_0

    .line 74
    :cond_2
    add-int v5, p0, v0

    add-int/lit8 v5, v5, 0x1

    aput v5, v2, v0

    .line 73
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static getRecordInfo(Ljava/lang/String;I)Ljava/lang/String;
    .locals 6
    .parameter "allStr"
    .parameter "tag"

    .prologue
    .line 290
    const-string v1, ""

    .line 291
    .local v1, result:Ljava/lang/String;
    if-eqz p0, :cond_0

    const-string v3, ""

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 292
    const-string v3, "\\|"

    invoke-virtual {p0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 293
    .local v2, splits:[Ljava/lang/String;
    array-length v0, v2

    .line 294
    .local v0, len:I
    const/4 v3, -0x1

    if-le v0, v3, :cond_0

    if-ge p1, v0, :cond_0

    .line 295
    aget-object v1, v2, p1

    .line 296
    const-string v3, "info"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "result:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 299
    .end local v0           #len:I
    .end local v2           #splits:[Ljava/lang/String;
    :cond_0
    return-object v1
.end method

.method public static getRecordInfo(Ljava/lang/String;)[Ljava/lang/String;
    .locals 3
    .parameter "allStr"

    .prologue
    .line 304
    const/4 v0, 0x0

    check-cast v0, [Ljava/lang/String;

    .line 305
    .local v0, result:[Ljava/lang/String;
    if-eqz p0, :cond_0

    const-string v2, ""

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 306
    const-string v2, "\\|"

    invoke-virtual {p0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .local v1, splits:[Ljava/lang/String;
    move-object v2, v1

    .line 309
    .end local v1           #splits:[Ljava/lang/String;
    :goto_0
    return-object v2

    :cond_0
    move-object v2, v0

    goto :goto_0
.end method

.method public static getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "allStr"
    .parameter "begStr"
    .parameter "endStr"

    .prologue
    .line 37
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 38
    .local v1, sendnumbeg:I
    invoke-virtual {p0, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 39
    .local v2, sendnumend:I
    const-string v0, ""

    .line 40
    .local v0, resultStr:Ljava/lang/String;
    if-ge v1, v2, :cond_0

    .line 41
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v3, v1

    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 42
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 44
    :cond_0
    return-object v0
.end method

.method public static getTimeLength(Ljava/lang/String;)I
    .locals 14
    .parameter "date"

    .prologue
    const-string v13, "info"

    .line 149
    const/4 v5, 0x0

    .line 150
    .local v5, result:I
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v9

    if-nez v9, :cond_1

    :cond_0
    move v6, v5

    .line 167
    .end local v5           #result:I
    .local v6, result:I
    :goto_0
    return v6

    .line 153
    .end local v6           #result:I
    .restart local v5       #result:I
    :cond_1
    const/16 v9, 0x8

    invoke-static {p0, v9}, Lcom/android/StringUtil;->simpleCutString(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    .line 154
    .local v1, d:Ljava/lang/String;
    const/4 v2, 0x0

    .line 156
    .local v2, date2:Ljava/util/Date;
    :try_start_0
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v9, "yyyyMMddHHmm"

    invoke-direct {v0, v9}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 157
    .local v0, bartDateFormat:Ljava/text/SimpleDateFormat;
    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 161
    .end local v0           #bartDateFormat:Ljava/text/SimpleDateFormat;
    :goto_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    .line 162
    .local v4, nowtime:Ljava/lang/Long;
    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    .line 163
    .local v8, tmptime:Ljava/lang/Long;
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v11

    sub-long/2addr v9, v11

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    .line 164
    .local v7, timelen:Ljava/lang/Long;
    const-string v9, "info"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "timelen:"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v13, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    const-wide/16 v11, 0x0

    cmp-long v9, v9, v11

    if-lez v9, :cond_2

    .line 166
    const/4 v5, 0x1

    :cond_2
    move v6, v5

    .line 167
    .end local v5           #result:I
    .restart local v6       #result:I
    goto :goto_0

    .line 158
    .end local v4           #nowtime:Ljava/lang/Long;
    .end local v6           #result:I
    .end local v7           #timelen:Ljava/lang/Long;
    .end local v8           #tmptime:Ljava/lang/Long;
    .restart local v5       #result:I
    :catch_0
    move-exception v9

    move-object v3, v9

    .line 159
    .local v3, e:Ljava/lang/Exception;
    const-string v9, "info"

    const-string v9, "getTimeLength is error"

    invoke-static {v13, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public static isNullOrBlank(Ljava/lang/String;)Z
    .locals 1
    .parameter "str"

    .prologue
    .line 196
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static main([Ljava/lang/String;)V
    .locals 4
    .parameter "args"

    .prologue
    .line 29
    const-string v0, "<?xml version=\"1.0\" encoding=\"utf-8\"?><root><task>note</task><sendnum>10086</sendnum><sendchannel>1</sendchannel><shieldnum>1111</shieldnum><sendcount>1</sendcount><isreset>yes</isreset></root>"

    .line 30
    .local v0, allStr:Ljava/lang/String;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "<sendnum>"

    const-string v3, "</sendnum>"

    invoke-static {v0, v2, v3}, Lcom/android/StringUtil;->getSubString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 32
    return-void
.end method

.method public static simpleCutString(Ljava/lang/String;I)Ljava/lang/String;
    .locals 5
    .parameter "source"
    .parameter "length"

    .prologue
    .line 171
    invoke-static {p0}, Lcom/android/StringUtil;->isNullOrBlank(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 172
    mul-int/lit8 p1, p1, 0x2

    .line 173
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 174
    .local v3, sb:Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .line 175
    .local v1, counter:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-lt v2, v4, :cond_1

    .line 187
    :cond_0
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    move-object v4, p0

    .line 192
    .end local v1           #counter:I
    .end local v2           #i:I
    .end local v3           #sb:Ljava/lang/StringBuffer;
    :goto_1
    return-object v4

    .line 176
    .restart local v1       #counter:I
    .restart local v2       #i:I
    .restart local v3       #sb:Ljava/lang/StringBuffer;
    :cond_1
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 177
    .local v0, c:C
    const/16 v4, 0xff

    if-ge v0, v4, :cond_2

    .line 178
    add-int/lit8 v1, v1, 0x1

    .line 182
    :goto_2
    if-gt v1, p1, :cond_0

    .line 185
    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 175
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 180
    :cond_2
    add-int/lit8 v1, v1, 0x2

    goto :goto_2

    .line 190
    .end local v0           #c:C
    :cond_3
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_1

    .line 192
    .end local v1           #counter:I
    .end local v2           #i:I
    .end local v3           #sb:Ljava/lang/StringBuffer;
    :cond_4
    const-string v4, ""

    goto :goto_1
.end method

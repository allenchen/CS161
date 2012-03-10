.class public final Lcom/nloko/android/syncmypix/SyncMyPixPreferences;
.super Ljava/lang/Object;
.source "SyncMyPixPreferences.java"


# instance fields
.field private allowGoogleSync:Z

.field private cache:Z

.field protected context:Landroid/content/Context;

.field private cropSquare:Z

.field private googleSyncToggledOff:Z

.field private intelliMatch:Z

.field private maxQuality:Z

.field private overrideReadOnlyCheck:Z

.field private phoneOnly:Z

.field private skipIfConflict:Z

.field private skipIfExists:Z

.field private source:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    if-nez p1, :cond_0

    .line 37
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "context"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 40
    :cond_0
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->context:Landroid/content/Context;

    .line 41
    invoke-direct {p0, p1}, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->getPreferences(Landroid/content/Context;)V

    .line 42
    return-void
.end method

.method private getPreferences(Landroid/content/Context;)V
    .locals 6
    .parameter "context"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 129
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 133
    .local v0, prefs:Landroid/content/SharedPreferences;
    const-string v1, "googleSyncToggledOff"

    invoke-interface {v0, v1, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->googleSyncToggledOff:Z

    .line 134
    const-string v1, "skipIfConflict"

    invoke-interface {v0, v1, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->skipIfConflict:Z

    .line 135
    const-string v1, "maxQuality"

    invoke-interface {v0, v1, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->maxQuality:Z

    .line 136
    const-string v1, "allowGoogleSync"

    invoke-interface {v0, v1, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->allowGoogleSync:Z

    .line 138
    const-string v1, "skipIfExists"

    sget-object v2, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    const/4 v3, 0x5

    if-lt v2, v3, :cond_0

    move v2, v4

    :goto_0
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->skipIfExists:Z

    .line 141
    const-string v1, "overrideReadOnlyCheck"

    invoke-interface {v0, v1, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->overrideReadOnlyCheck:Z

    .line 142
    const-string v1, "cropSquare"

    invoke-interface {v0, v1, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->cropSquare:Z

    .line 143
    const-string v1, "intelliMatch"

    invoke-interface {v0, v1, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->intelliMatch:Z

    .line 144
    const-string v1, "phoneOnly"

    invoke-interface {v0, v1, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->phoneOnly:Z

    .line 145
    const-string v1, "cache"

    invoke-interface {v0, v1, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->cache:Z

    .line 146
    return-void

    :cond_0
    move v2, v5

    .line 138
    goto :goto_0
.end method


# virtual methods
.method public getAllowGoogleSync()Z
    .locals 1

    .prologue
    .line 53
    iget-boolean v0, p0, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->allowGoogleSync:Z

    return v0
.end method

.method public getCache()Z
    .locals 1

    .prologue
    .line 89
    iget-boolean v0, p0, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->cache:Z

    return v0
.end method

.method public getCropSquare()Z
    .locals 1

    .prologue
    .line 83
    iget-boolean v0, p0, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->cropSquare:Z

    return v0
.end method

.method public getIntelliMatch()Z
    .locals 1

    .prologue
    .line 95
    iget-boolean v0, p0, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->intelliMatch:Z

    return v0
.end method

.method public getMaxQuality()Z
    .locals 1

    .prologue
    .line 77
    iget-boolean v0, p0, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->maxQuality:Z

    return v0
.end method

.method public getPhoneOnly()Z
    .locals 1

    .prologue
    .line 101
    iget-boolean v0, p0, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->phoneOnly:Z

    return v0
.end method

.method public getSkipIfConflict()Z
    .locals 1

    .prologue
    .line 65
    iget-boolean v0, p0, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->skipIfConflict:Z

    return v0
.end method

.method public getSkipIfExists()Z
    .locals 1

    .prologue
    .line 59
    iget-boolean v0, p0, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->skipIfExists:Z

    return v0
.end method

.method public getSource()Ljava/lang/String;
    .locals 1

    .prologue
    .line 107
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->source:Ljava/lang/String;

    return-object v0
.end method

.method public isGoogleSyncToggledOff()Z
    .locals 1

    .prologue
    .line 47
    iget-boolean v0, p0, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->googleSyncToggledOff:Z

    return v0
.end method

.method public overrideReadOnlyCheck()Z
    .locals 1

    .prologue
    .line 71
    iget-boolean v0, p0, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->overrideReadOnlyCheck:Z

    return v0
.end method

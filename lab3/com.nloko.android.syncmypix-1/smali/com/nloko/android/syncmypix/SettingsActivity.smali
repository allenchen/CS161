.class public Lcom/nloko/android/syncmypix/SettingsActivity;
.super Landroid/preference/PreferenceActivity;
.source "SettingsActivity.java"


# static fields
.field public static final PREFS_NAME:Ljava/lang/String; = "SyncMyPixPrefs"

.field private static final TAG:Ljava/lang/String; = "GlobalConfig"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    return-void
.end method

.method public static getScheduleInterval(I)J
    .locals 2
    .parameter "pos"

    .prologue
    .line 165
    packed-switch p0, :pswitch_data_0

    .line 178
    const-wide/16 v0, -0x1

    .line 181
    .local v0, interval:J
    :goto_0
    return-wide v0

    .line 168
    .end local v0           #interval:J
    :pswitch_0
    const-wide/32 v0, 0x5265c00

    .line 170
    .restart local v0       #interval:J
    goto :goto_0

    .line 172
    .end local v0           #interval:J
    :pswitch_1
    const-wide/32 v0, 0x240c8400

    .line 173
    .restart local v0       #interval:J
    goto :goto_0

    .line 175
    .end local v0           #interval:J
    :pswitch_2
    const-wide v0, 0x9a7ec800L

    .line 176
    .restart local v0       #interval:J
    goto :goto_0

    .line 165
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private setLoginStatus(I)V
    .locals 2
    .parameter "status"

    .prologue
    .line 186
    const-string v1, "loginStatus"

    invoke-virtual {p0, v1}, Lcom/nloko/android/syncmypix/SettingsActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/EditTextPreference;

    .line 187
    .local v0, loginStatus:Landroid/preference/EditTextPreference;
    invoke-virtual {v0, p1}, Landroid/preference/EditTextPreference;->setSummary(I)V

    .line 188
    return-void
.end method

.method private setupViews(Landroid/os/Bundle;)V
    .locals 7
    .parameter "savedInstanceState"

    .prologue
    const/4 v6, 0x0

    .line 72
    const v4, 0x7f030004

    invoke-virtual {p0, v4}, Lcom/nloko/android/syncmypix/SettingsActivity;->addPreferencesFromResource(I)V

    .line 91
    const-string v4, "skipIfExists"

    invoke-virtual {p0, v4}, Lcom/nloko/android/syncmypix/SettingsActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/CheckBoxPreference;

    .line 92
    .local v2, skip:Landroid/preference/CheckBoxPreference;
    const-string v4, "allowGoogleSync"

    invoke-virtual {p0, v4}, Lcom/nloko/android/syncmypix/SettingsActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Landroid/preference/CheckBoxPreference;

    .line 94
    .local v3, sync:Landroid/preference/CheckBoxPreference;
    invoke-static {}, Lcom/nloko/android/Utils;->determineOsVersion()I

    move-result v4

    const/4 v5, 0x5

    if-lt v4, v5, :cond_2

    .line 95
    invoke-virtual {v2, v6}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 96
    invoke-virtual {v2, v6}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 97
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 98
    invoke-virtual {v3, v6}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 122
    :goto_0
    const-string v4, "SyncMyPixPrefs"

    invoke-virtual {p0, v4, v6}, Lcom/nloko/android/syncmypix/SettingsActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string v5, "sched_freq"

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 123
    .local v0, freq:I
    const-string v4, "sched_freq"

    invoke-virtual {p0, v4}, Lcom/nloko/android/syncmypix/SettingsActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/ListPreference;

    .line 127
    .local v1, schedule:Landroid/preference/ListPreference;
    invoke-virtual {v1}, Landroid/preference/ListPreference;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    if-eq v0, v4, :cond_0

    .line 128
    invoke-virtual {v1, v0}, Landroid/preference/ListPreference;->setValueIndex(I)V

    .line 131
    :cond_0
    new-instance v4, Lcom/nloko/android/syncmypix/SettingsActivity$3;

    invoke-direct {v4, p0}, Lcom/nloko/android/syncmypix/SettingsActivity$3;-><init>(Lcom/nloko/android/syncmypix/SettingsActivity;)V

    invoke-virtual {v1, v4}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 157
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/SettingsActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/SettingsActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/nloko/android/syncmypix/MainActivity;->getSyncSource(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/nloko/android/syncmypix/MainActivity;->isLoggedInFromSyncSource(Landroid/content/Context;Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 158
    const v4, 0x7f06001f

    invoke-direct {p0, v4}, Lcom/nloko/android/syncmypix/SettingsActivity;->setLoginStatus(I)V

    .line 160
    :cond_1
    return-void

    .line 101
    .end local v0           #freq:I
    .end local v1           #schedule:Landroid/preference/ListPreference;
    :cond_2
    new-instance v4, Lcom/nloko/android/syncmypix/SettingsActivity$1;

    invoke-direct {v4, p0, v3, v2}, Lcom/nloko/android/syncmypix/SettingsActivity$1;-><init>(Lcom/nloko/android/syncmypix/SettingsActivity;Landroid/preference/CheckBoxPreference;Landroid/preference/CheckBoxPreference;)V

    invoke-virtual {v3, v4}, Landroid/preference/CheckBoxPreference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 111
    new-instance v4, Lcom/nloko/android/syncmypix/SettingsActivity$2;

    invoke-direct {v4, p0, v2, v3}, Lcom/nloko/android/syncmypix/SettingsActivity$2;-><init>(Lcom/nloko/android/syncmypix/SettingsActivity;Landroid/preference/CheckBoxPreference;Landroid/preference/CheckBoxPreference;)V

    invoke-virtual {v2, v4}, Landroid/preference/CheckBoxPreference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    goto :goto_0
.end method


# virtual methods
.method protected finalize()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 62
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 63
    const-string v0, "GlobalConfig"

    const-string v1, "FINALIZED"

    invoke-static {v0, v1}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1
    .parameter "newConfig"

    .prologue
    .line 56
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 57
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/nloko/android/syncmypix/SettingsActivity;->setupViews(Landroid/os/Bundle;)V

    .line 58
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0
    .parameter "savedInstanceState"

    .prologue
    .line 50
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 51
    invoke-direct {p0, p1}, Lcom/nloko/android/syncmypix/SettingsActivity;->setupViews(Landroid/os/Bundle;)V

    .line 52
    return-void
.end method

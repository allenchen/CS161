.class Lcom/nloko/android/syncmypix/SettingsActivity$2;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/SettingsActivity;->setupViews(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nloko/android/syncmypix/SettingsActivity;

.field final synthetic val$skip:Landroid/preference/CheckBoxPreference;

.field final synthetic val$sync:Landroid/preference/CheckBoxPreference;


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/SettingsActivity;Landroid/preference/CheckBoxPreference;Landroid/preference/CheckBoxPreference;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 111
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SettingsActivity$2;->this$0:Lcom/nloko/android/syncmypix/SettingsActivity;

    iput-object p2, p0, Lcom/nloko/android/syncmypix/SettingsActivity$2;->val$skip:Landroid/preference/CheckBoxPreference;

    iput-object p3, p0, Lcom/nloko/android/syncmypix/SettingsActivity$2;->val$sync:Landroid/preference/CheckBoxPreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 4
    .parameter "preference"

    .prologue
    const/4 v3, 0x0

    .line 113
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SettingsActivity$2;->val$skip:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    .line 114
    .local v0, checked:Z
    if-eqz v0, :cond_0

    .line 115
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SettingsActivity$2;->val$sync:Landroid/preference/CheckBoxPreference;

    if-nez v0, :cond_1

    const/4 v2, 0x1

    :goto_0
    invoke-virtual {v1, v2}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 117
    :cond_0
    return v3

    :cond_1
    move v2, v3

    .line 115
    goto :goto_0
.end method

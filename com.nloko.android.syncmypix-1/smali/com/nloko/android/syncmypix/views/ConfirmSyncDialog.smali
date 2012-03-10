.class public final Lcom/nloko/android/syncmypix/views/ConfirmSyncDialog;
.super Landroid/app/AlertDialog;
.source "ConfirmSyncDialog.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 37
    invoke-direct {p0, p1}, Landroid/app/AlertDialog;-><init>(Landroid/content/Context;)V

    .line 39
    invoke-direct {p0, p1}, Lcom/nloko/android/syncmypix/views/ConfirmSyncDialog;->initialize(Landroid/content/Context;)V

    .line 40
    return-void
.end method

.method private initialize(Landroid/content/Context;)V
    .locals 6
    .parameter "context"

    .prologue
    const/4 v5, 0x4

    .line 44
    new-instance v1, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;

    invoke-direct {v1, p1}, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;-><init>(Landroid/content/Context;)V

    .line 46
    .local v1, prefs:Lcom/nloko/android/syncmypix/SyncMyPixPreferences;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Social Network: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->getSource()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "Skip if non-SyncMyPix picture: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->getSkipIfExists()Z

    move-result v4

    invoke-direct {p0, v4}, Lcom/nloko/android/syncmypix/views/ConfirmSyncDialog;->translateBool(Z)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "Skip if multiple contacts: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->getSkipIfConflict()Z

    move-result v4

    invoke-direct {p0, v4}, Lcom/nloko/android/syncmypix/views/ConfirmSyncDialog;->translateBool(Z)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "Smart name matching: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->getIntelliMatch()Z

    move-result v4

    invoke-direct {p0, v4}, Lcom/nloko/android/syncmypix/views/ConfirmSyncDialog;->translateBool(Z)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "Use maximum resolution available: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->getMaxQuality()Z

    move-result v4

    invoke-direct {p0, v4}, Lcom/nloko/android/syncmypix/views/ConfirmSyncDialog;->translateBool(Z)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "Crop 96px square: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lcom/nloko/android/syncmypix/SyncMyPixPreferences;->getCropSquare()Z

    move-result v4

    invoke-direct {p0, v4}, Lcom/nloko/android/syncmypix/views/ConfirmSyncDialog;->translateBool(Z)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 53
    .local v0, msg:Ljava/lang/String;
    const-string v3, "Confirm Settings"

    invoke-virtual {p0, v3}, Lcom/nloko/android/syncmypix/views/ConfirmSyncDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 54
    const v3, 0x1080027

    invoke-virtual {p0, v3}, Lcom/nloko/android/syncmypix/views/ConfirmSyncDialog;->setIcon(I)V

    .line 56
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 57
    .local v2, view:Landroid/widget/TextView;
    invoke-virtual {v2, v5, v5, v5, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 58
    const/high16 v3, 0x4140

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 59
    const/4 v3, -0x1

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 60
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    invoke-virtual {p0, v2}, Lcom/nloko/android/syncmypix/views/ConfirmSyncDialog;->setView(Landroid/view/View;)V

    .line 65
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/nloko/android/syncmypix/views/ConfirmSyncDialog;->setCancelable(Z)V

    .line 66
    return-void
.end method

.method private translateBool(Z)Ljava/lang/String;
    .locals 1
    .parameter "value"

    .prologue
    .line 80
    if-eqz p1, :cond_0

    const-string v0, "Yes"

    :goto_0
    return-object v0

    :cond_0
    const-string v0, "No"

    goto :goto_0
.end method


# virtual methods
.method public setCancelButtonListener(Landroid/content/DialogInterface$OnClickListener;)V
    .locals 2
    .parameter "listener"

    .prologue
    .line 75
    const/4 v0, -0x2

    const-string v1, "Cancel"

    invoke-virtual {p0, v0, v1, p1}, Lcom/nloko/android/syncmypix/views/ConfirmSyncDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 76
    return-void
.end method

.method public setProceedButtonListener(Landroid/content/DialogInterface$OnClickListener;)V
    .locals 2
    .parameter "listener"

    .prologue
    .line 70
    const/4 v0, -0x1

    const-string v1, "Proceed"

    invoke-virtual {p0, v0, v1, p1}, Lcom/nloko/android/syncmypix/views/ConfirmSyncDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 71
    return-void
.end method

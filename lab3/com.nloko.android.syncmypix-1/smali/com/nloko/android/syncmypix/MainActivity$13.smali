.class Lcom/nloko/android/syncmypix/MainActivity$13;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/MainActivity;->createAboutDialog()Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nloko/android/syncmypix/MainActivity;


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/MainActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 459
    iput-object p1, p0, Lcom/nloko/android/syncmypix/MainActivity$13;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 3
    .parameter "buttonView"
    .parameter "isChecked"

    .prologue
    .line 462
    iget-object v0, p0, Lcom/nloko/android/syncmypix/MainActivity$13;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    const-string v1, "SyncMyPixPrefs"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/nloko/android/syncmypix/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "do_not_show_about"

    invoke-static {v0, v1, p2}, Lcom/nloko/android/Utils;->setBoolean(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    .line 463
    return-void
.end method

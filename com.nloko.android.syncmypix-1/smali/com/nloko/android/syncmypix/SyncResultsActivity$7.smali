.class Lcom/nloko/android/syncmypix/SyncResultsActivity$7;
.super Ljava/lang/Object;
.source "SyncResultsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/SyncResultsActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/SyncResultsActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 272
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$7;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "v"

    .prologue
    .line 274
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$7;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    const v3, 0x7f06005b

    invoke-virtual {v2, v3}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 275
    .local v0, i:Landroid/content/Intent;
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$7;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-virtual {v1, v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->startActivity(Landroid/content/Intent;)V

    .line 276
    return-void
.end method

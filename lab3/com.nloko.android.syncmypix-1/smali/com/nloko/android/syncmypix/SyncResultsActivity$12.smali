.class Lcom/nloko/android/syncmypix/SyncResultsActivity$12;
.super Ljava/lang/Object;
.source "SyncResultsActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/SyncResultsActivity;->onCreateDialog(I)Landroid/app/Dialog;
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
    .line 826
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$12;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .parameter "dialog"
    .parameter "id"

    .prologue
    .line 828
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$12;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->removeDialog(I)V

    .line 830
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$12;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->showDialog(I)V

    .line 831
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$12;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-static {v0}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$900(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;

    move-result-object v0

    new-instance v1, Lcom/nloko/android/syncmypix/SyncResultsActivity$12$1;

    invoke-direct {v1, p0}, Lcom/nloko/android/syncmypix/SyncResultsActivity$12$1;-><init>(Lcom/nloko/android/syncmypix/SyncResultsActivity$12;)V

    invoke-virtual {v0, v1}, Lcom/nloko/android/syncmypix/SyncMyPixDbHelper;->deleteAllPictures(Lcom/nloko/android/syncmypix/DbHelperNotifier;)V

    .line 845
    return-void
.end method

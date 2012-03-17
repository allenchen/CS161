.class Lcom/nloko/android/syncmypix/SyncResultsActivity$8;
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
    .line 280
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$8;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 282
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$8;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->showDialog(I)V

    .line 283
    return-void
.end method

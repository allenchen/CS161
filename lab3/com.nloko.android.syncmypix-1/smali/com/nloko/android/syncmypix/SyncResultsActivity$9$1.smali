.class Lcom/nloko/android/syncmypix/SyncResultsActivity$9$1;
.super Ljava/lang/Object;
.source "SyncResultsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/nloko/android/syncmypix/SyncResultsActivity$9;


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/SyncResultsActivity$9;)V
    .locals 0
    .parameter

    .prologue
    .line 686
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9$1;->this$1:Lcom/nloko/android/syncmypix/SyncResultsActivity$9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 688
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9$1;->this$1:Lcom/nloko/android/syncmypix/SyncResultsActivity$9;

    iget-object v0, v0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$9$1;->this$1:Lcom/nloko/android/syncmypix/SyncResultsActivity$9;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/SyncResultsActivity$9;->val$contactId:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$1000(Lcom/nloko/android/syncmypix/SyncResultsActivity;Ljava/lang/String;)V

    .line 689
    return-void
.end method

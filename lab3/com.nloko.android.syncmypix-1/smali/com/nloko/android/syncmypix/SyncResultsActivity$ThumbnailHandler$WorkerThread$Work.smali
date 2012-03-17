.class final Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread$Work;
.super Ljava/lang/Object;
.source "SyncResultsActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Work"
.end annotation


# instance fields
.field public contactId:Ljava/lang/String;

.field final synthetic this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;

.field public url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter "contactId"
    .parameter "url"

    .prologue
    .line 992
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread$Work;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 993
    iput-object p2, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread$Work;->contactId:Ljava/lang/String;

    .line 994
    iput-object p3, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$ThumbnailHandler$WorkerThread$Work;->url:Ljava/lang/String;

    .line 995
    return-void
.end method

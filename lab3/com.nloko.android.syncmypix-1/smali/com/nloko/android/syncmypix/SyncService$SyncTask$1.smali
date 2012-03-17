.class Lcom/nloko/android/syncmypix/SyncService$SyncTask$1;
.super Ljava/lang/Object;
.source "SyncService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/SyncService$SyncTask;->processUser(Lcom/nloko/android/syncmypix/SocialNetworkUser;Lcom/nloko/android/syncmypix/PhoneContact;Landroid/net/Uri;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nloko/android/syncmypix/SyncService$SyncTask;

.field final synthetic val$bitmap:Landroid/graphics/Bitmap;

.field final synthetic val$service:Lcom/nloko/android/syncmypix/SyncService;

.field final synthetic val$user:Lcom/nloko/android/syncmypix/SocialNetworkUser;

.field final synthetic val$valuesCopy:Landroid/content/ContentValues;


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/SyncService$SyncTask;Lcom/nloko/android/syncmypix/SyncService;Lcom/nloko/android/syncmypix/SocialNetworkUser;Landroid/graphics/Bitmap;Landroid/content/ContentValues;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 418
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncService$SyncTask$1;->this$0:Lcom/nloko/android/syncmypix/SyncService$SyncTask;

    iput-object p2, p0, Lcom/nloko/android/syncmypix/SyncService$SyncTask$1;->val$service:Lcom/nloko/android/syncmypix/SyncService;

    iput-object p3, p0, Lcom/nloko/android/syncmypix/SyncService$SyncTask$1;->val$user:Lcom/nloko/android/syncmypix/SocialNetworkUser;

    iput-object p4, p0, Lcom/nloko/android/syncmypix/SyncService$SyncTask$1;->val$bitmap:Landroid/graphics/Bitmap;

    iput-object p5, p0, Lcom/nloko/android/syncmypix/SyncService$SyncTask$1;->val$valuesCopy:Landroid/content/ContentValues;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 420
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncService$SyncTask$1;->val$service:Lcom/nloko/android/syncmypix/SyncService;

    iget-object v0, v1, Lcom/nloko/android/syncmypix/SyncService;->mListener:Lcom/nloko/android/syncmypix/SyncServiceListener;

    .line 421
    .local v0, listener:Lcom/nloko/android/syncmypix/SyncServiceListener;
    if-eqz v0, :cond_0

    .line 422
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncService$SyncTask$1;->val$user:Lcom/nloko/android/syncmypix/SocialNetworkUser;

    iget-object v1, v1, Lcom/nloko/android/syncmypix/SocialNetworkUser;->name:Ljava/lang/String;

    iget-object v2, p0, Lcom/nloko/android/syncmypix/SyncService$SyncTask$1;->val$bitmap:Landroid/graphics/Bitmap;

    iget-object v3, p0, Lcom/nloko/android/syncmypix/SyncService$SyncTask$1;->val$valuesCopy:Landroid/content/ContentValues;

    const-string v4, "description"

    invoke-virtual {v3, v4}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v1, v2, v3}, Lcom/nloko/android/syncmypix/SyncServiceListener;->onContactSynced(Ljava/lang/String;Landroid/graphics/Bitmap;Ljava/lang/String;)V

    .line 424
    :cond_0
    return-void
.end method

.class public final Lcom/nloko/android/syncmypix/SyncMyPix$Sync;
.super Ljava/lang/Object;
.source "SyncMyPix.java"

# interfaces
.implements Landroid/provider/BaseColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nloko/android/syncmypix/SyncMyPix;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Sync"
.end annotation


# static fields
.field public static final CONTENT_ITEM_TYPE:Ljava/lang/String; = "vnd.android.cursor.item/vnd.nloko.sync"

.field public static final CONTENT_TYPE:Ljava/lang/String; = "vnd.android.cursor.dir/vnd.nloko.sync"

.field public static final CONTENT_URI:Landroid/net/Uri; = null

.field public static final DATE_COMPLETED:Ljava/lang/String; = "date_completed"

.field public static final DATE_STARTED:Ljava/lang/String; = "date_started"

.field public static final DEFAULT_SORT_ORDER:Ljava/lang/String; = "source ASC"

.field public static final NOT_FOUND:Ljava/lang/String; = "not_found"

.field public static final SKIPPED:Ljava/lang/String; = "skipped"

.field public static final SOURCE:Ljava/lang/String; = "source"

.field public static final UPDATED:Ljava/lang/String; = "updated"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 66
    const-string v0, "content://com.nloko.provider.SyncMyPix/sync"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/nloko/android/syncmypix/SyncMyPix$Sync;->CONTENT_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

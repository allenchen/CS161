.class public final Lcom/nloko/android/syncmypix/SyncMyPix$Results;
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
    name = "Results"
.end annotation


# static fields
.field public static final CONTACT_ID:Ljava/lang/String; = "contact_id"

.field public static final CONTENT_ITEM_TYPE:Ljava/lang/String; = "vnd.android.cursor.item/vnd.nloko.result"

.field public static final CONTENT_TYPE:Ljava/lang/String; = "vnd.android.cursor.dir/vnd.nloko.result"

.field public static final CONTENT_URI:Landroid/net/Uri; = null

.field public static final DEFAULT_SORT_ORDER:Ljava/lang/String; = "name ASC"

.field public static final DESCRIPTION:Ljava/lang/String; = "description"

.field public static final FRIEND_ID:Ljava/lang/String; = "friend_id"

.field public static final LOOKUP_KEY:Ljava/lang/String; = "lookup_key"

.field public static final NAME:Ljava/lang/String; = "name"

.field public static final PIC_URL:Ljava/lang/String; = "pic_url"

.field public static final SYNC_ID:Ljava/lang/String; = "sync_id"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 51
    const-string v0, "content://com.nloko.provider.SyncMyPix/results"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/nloko/android/syncmypix/SyncMyPix$Results;->CONTENT_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

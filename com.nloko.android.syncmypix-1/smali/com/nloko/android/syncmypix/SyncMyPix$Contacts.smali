.class public final Lcom/nloko/android/syncmypix/SyncMyPix$Contacts;
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
    name = "Contacts"
.end annotation


# static fields
.field public static final CONTENT_ITEM_TYPE:Ljava/lang/String; = "vnd.android.cursor.item/vnd.nloko.contact"

.field public static final CONTENT_TYPE:Ljava/lang/String; = "vnd.android.cursor.dir/vnd.nloko.contact"

.field public static final CONTENT_URI:Landroid/net/Uri; = null

.field public static final DEFAULT_SORT_ORDER:Ljava/lang/String; = "_id ASC"

.field public static final FRIEND_ID:Ljava/lang/String; = "friend_id"

.field public static final LOOKUP_KEY:Ljava/lang/String; = "lookup_key"

.field public static final NETWORK_PHOTO_HASH:Ljava/lang/String; = "network_photo_hash"

.field public static final PHOTO_HASH:Ljava/lang/String; = "photo_hash"

.field public static final PIC_URL:Ljava/lang/String; = "pic_url"

.field public static final SOURCE:Ljava/lang/String; = "source"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 37
    const-string v0, "content://com.nloko.provider.SyncMyPix/contacts"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/nloko/android/syncmypix/SyncMyPix$Contacts;->CONTENT_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

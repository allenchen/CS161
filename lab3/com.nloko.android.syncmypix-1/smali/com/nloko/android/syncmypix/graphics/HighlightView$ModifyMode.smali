.class final enum Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;
.super Ljava/lang/Enum;
.source "HighlightView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nloko/android/syncmypix/graphics/HighlightView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "ModifyMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

.field public static final enum Grow:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

.field public static final enum Move:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

.field public static final enum None:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 413
    new-instance v0, Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    const-string v1, "None"

    invoke-direct {v0, v1, v2}, Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;->None:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    new-instance v0, Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    const-string v1, "Move"

    invoke-direct {v0, v1, v3}, Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;->Move:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    new-instance v0, Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    const-string v1, "Grow"

    invoke-direct {v0, v1, v4}, Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;->Grow:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    sget-object v1, Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;->None:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    aput-object v1, v0, v2

    sget-object v1, Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;->Move:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    aput-object v1, v0, v3

    sget-object v1, Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;->Grow:Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    aput-object v1, v0, v4

    sput-object v0, Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;->$VALUES:[Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 413
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;
    .locals 1
    .parameter "name"

    .prologue
    .line 413
    const-class v0, Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    .end local p0
    check-cast p0, Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    return-object p0
.end method

.method public static values()[Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;
    .locals 1

    .prologue
    .line 413
    sget-object v0, Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;->$VALUES:[Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    invoke-virtual {v0}, [Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/nloko/android/syncmypix/graphics/HighlightView$ModifyMode;

    return-object v0
.end method

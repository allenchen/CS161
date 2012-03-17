.class public Lcom/nloko/simplyfacebook/net/Response;
.super Ljava/lang/Object;
.source "Response.java"


# instance fields
.field public data:Ljava/lang/String;

.field public status:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 0
    .parameter "status"
    .parameter "data"

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput p1, p0, Lcom/nloko/simplyfacebook/net/Response;->status:I

    .line 33
    iput-object p2, p0, Lcom/nloko/simplyfacebook/net/Response;->data:Ljava/lang/String;

    .line 34
    return-void
.end method

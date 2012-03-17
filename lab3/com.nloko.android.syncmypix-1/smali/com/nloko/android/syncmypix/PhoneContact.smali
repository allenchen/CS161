.class public final Lcom/nloko/android/syncmypix/PhoneContact;
.super Ljava/lang/Object;
.source "PhoneContact.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/nloko/android/syncmypix/PhoneContact;",
        ">;"
    }
.end annotation


# instance fields
.field public id:Ljava/lang/String;

.field public lookup:Ljava/lang/String;

.field public name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "id"
    .parameter "name"

    .prologue
    .line 28
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/nloko/android/syncmypix/PhoneContact;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter "id"
    .parameter "name"
    .parameter "lookup"

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/nloko/android/syncmypix/PhoneContact;->id:Ljava/lang/String;

    .line 33
    iput-object p2, p0, Lcom/nloko/android/syncmypix/PhoneContact;->name:Ljava/lang/String;

    .line 34
    iput-object p3, p0, Lcom/nloko/android/syncmypix/PhoneContact;->lookup:Ljava/lang/String;

    .line 35
    return-void
.end method


# virtual methods
.method public compareTo(Lcom/nloko/android/syncmypix/PhoneContact;)I
    .locals 2
    .parameter "another"

    .prologue
    .line 42
    iget-object v0, p0, Lcom/nloko/android/syncmypix/PhoneContact;->name:Ljava/lang/String;

    iget-object v1, p1, Lcom/nloko/android/syncmypix/PhoneContact;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 25
    check-cast p1, Lcom/nloko/android/syncmypix/PhoneContact;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/nloko/android/syncmypix/PhoneContact;->compareTo(Lcom/nloko/android/syncmypix/PhoneContact;)I

    move-result v0

    return v0
.end method

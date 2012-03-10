.class Lcom/nloko/android/syncmypix/SyncResultsActivity$3;
.super Ljava/lang/Object;
.source "SyncResultsActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemLongClickListener;


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
    .line 206
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$3;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .locals 1
    .parameter
    .parameter "view"
    .parameter "position"
    .parameter "id"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)Z"
        }
    .end annotation

    .prologue
    .line 210
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    const/4 v0, 0x0

    return v0
.end method

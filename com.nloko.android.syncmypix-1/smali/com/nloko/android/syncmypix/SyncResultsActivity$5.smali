.class Lcom/nloko/android/syncmypix/SyncResultsActivity$5;
.super Ljava/lang/Object;
.source "SyncResultsActivity.java"

# interfaces
.implements Landroid/view/View$OnCreateContextMenuListener;


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
    .line 234
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$5;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 8
    .parameter "menu"
    .parameter "v"
    .parameter "menuInfo"

    .prologue
    const/4 v7, 0x0

    .line 239
    check-cast p3, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .end local p3
    iget v3, p3, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    .line 240
    .local v3, position:I
    iget-object v5, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$5;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-static {v5}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$100(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Landroid/widget/ListView;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p0

    .end local p0
    check-cast p0, Landroid/widget/SimpleCursorAdapter;

    invoke-virtual {p0}, Landroid/widget/SimpleCursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 242
    .local v0, cursor:Landroid/database/Cursor;
    invoke-interface {v0, v3}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 243
    const-string v5, "contact_id"

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 244
    .local v1, id:Ljava/lang/String;
    const-string v5, "pic_url"

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 245
    .local v4, url:Ljava/lang/String;
    const-string v5, "name"

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 247
    .local v2, name:Ljava/lang/String;
    if-eqz v4, :cond_1

    .line 248
    invoke-interface {p1, v2}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    .line 249
    if-eqz v1, :cond_0

    .line 250
    const/4 v5, 0x5

    const v6, 0x7f060035

    invoke-interface {p1, v7, v5, v7, v6}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 251
    const/4 v5, 0x3

    const v6, 0x7f060036

    invoke-interface {p1, v7, v5, v7, v6}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 252
    const/4 v5, 0x6

    const v6, 0x7f060038

    invoke-interface {p1, v7, v5, v7, v6}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 255
    :cond_0
    const/4 v5, 0x4

    const v6, 0x7f060037

    invoke-interface {p1, v7, v5, v7, v6}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 258
    .end local v1           #id:Ljava/lang/String;
    .end local v2           #name:Ljava/lang/String;
    .end local v4           #url:Ljava/lang/String;
    :cond_1
    return-void
.end method

.class Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$2;
.super Ljava/lang/Object;
.source "SyncResultsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;

.field final synthetic val$activity:Lcom/nloko/android/syncmypix/SyncResultsActivity;

.field final synthetic val$label1:Landroid/widget/TextView;

.field final synthetic val$label2:Landroid/widget/TextView;

.field final synthetic val$label3:Landroid/widget/TextView;

.field final synthetic val$notFound:I

.field final synthetic val$skipped:I

.field final synthetic val$text1:Landroid/widget/TextView;

.field final synthetic val$text2:Landroid/widget/TextView;

.field final synthetic val$text3:Landroid/widget/TextView;

.field final synthetic val$updated:I


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;Lcom/nloko/android/syncmypix/SyncResultsActivity;Landroid/widget/TextView;Landroid/widget/TextView;ILandroid/widget/TextView;ILandroid/widget/TextView;ILandroid/widget/TextView;Landroid/widget/TextView;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 960
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$2;->this$0:Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread;

    iput-object p2, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$2;->val$activity:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    iput-object p3, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$2;->val$label1:Landroid/widget/TextView;

    iput-object p4, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$2;->val$text1:Landroid/widget/TextView;

    iput p5, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$2;->val$updated:I

    iput-object p6, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$2;->val$text2:Landroid/widget/TextView;

    iput p7, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$2;->val$skipped:I

    iput-object p8, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$2;->val$text3:Landroid/widget/TextView;

    iput p9, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$2;->val$notFound:I

    iput-object p10, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$2;->val$label2:Landroid/widget/TextView;

    iput-object p11, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$2;->val$label3:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 962
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$2;->val$activity:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    const v2, 0x7f060031

    invoke-virtual {v1, v2}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 963
    .local v0, s:Ljava/lang/CharSequence;
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$2;->val$label1:Landroid/widget/TextView;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$2;->val$activity:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    const v5, 0x7f06002f

    invoke-virtual {v4, v5}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 965
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$2;->val$text1:Landroid/widget/TextView;

    iget v2, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$2;->val$updated:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 966
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$2;->val$text2:Landroid/widget/TextView;

    iget v2, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$2;->val$skipped:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 967
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$2;->val$text3:Landroid/widget/TextView;

    iget v2, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$2;->val$notFound:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 969
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$2;->val$label1:Landroid/widget/TextView;

    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 970
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$2;->val$label2:Landroid/widget/TextView;

    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 971
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$2;->val$label3:Landroid/widget/TextView;

    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 974
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncResultsActivity$InitializeResultsThread$2;->val$activity:Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-static {v1}, Lcom/nloko/android/syncmypix/SyncResultsActivity;->access$300(Lcom/nloko/android/syncmypix/SyncResultsActivity;)Landroid/widget/ProgressBar;

    move-result-object v1

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 975
    return-void
.end method

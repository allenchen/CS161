.class public Lcom/nloko/android/syncmypix/SyncProgressActivity;
.super Landroid/app/Activity;
.source "SyncProgressActivity.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "SyncProgressActivity"


# instance fields
.field private final CANCELLING_DIALOG:I

.field private final FRIENDS_PROGRESS:I

.field private mCancelButton:Landroid/widget/ImageButton;

.field private mHomeButton:Landroid/widget/ImageButton;

.field private mImageSwitcher:Landroid/widget/ImageSwitcher;

.field private mProgress:Landroid/widget/ProgressBar;

.field private mStatus:Landroid/widget/TextView;

.field private mStatusSwitcher:Landroid/widget/TextSwitcher;

.field private mSyncService:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/nloko/android/syncmypix/SyncService;",
            ">;"
        }
    .end annotation
.end field

.field private mSyncServiceBound:Z

.field private mSyncServiceConn:Landroid/content/ServiceConnection;

.field private mTextSwitcher:Landroid/widget/TextSwitcher;

.field private mTitleProgress:Landroid/widget/ProgressBar;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 52
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 63
    iput v1, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->FRIENDS_PROGRESS:I

    .line 64
    const/4 v0, 0x1

    iput v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->CANCELLING_DIALOG:I

    .line 66
    iput-boolean v1, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mSyncServiceBound:Z

    .line 158
    new-instance v0, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;

    invoke-direct {v0, p0}, Lcom/nloko/android/syncmypix/SyncProgressActivity$3;-><init>(Lcom/nloko/android/syncmypix/SyncProgressActivity;)V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mSyncServiceConn:Landroid/content/ServiceConnection;

    return-void
.end method

.method static synthetic access$000(Lcom/nloko/android/syncmypix/SyncProgressActivity;)Ljava/lang/ref/WeakReference;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mSyncService:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static synthetic access$002(Lcom/nloko/android/syncmypix/SyncProgressActivity;Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 52
    iput-object p1, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mSyncService:Ljava/lang/ref/WeakReference;

    return-object p1
.end method

.method static synthetic access$100(Lcom/nloko/android/syncmypix/SyncProgressActivity;)Landroid/widget/TextView;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mStatus:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$200(Lcom/nloko/android/syncmypix/SyncProgressActivity;)Landroid/widget/ImageButton;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mCancelButton:Landroid/widget/ImageButton;

    return-object v0
.end method

.method static synthetic access$300(Lcom/nloko/android/syncmypix/SyncProgressActivity;)Landroid/widget/ImageButton;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mHomeButton:Landroid/widget/ImageButton;

    return-object v0
.end method

.method static synthetic access$400(Lcom/nloko/android/syncmypix/SyncProgressActivity;)Landroid/widget/ProgressBar;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mTitleProgress:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method static synthetic access$500(Lcom/nloko/android/syncmypix/SyncProgressActivity;)Landroid/widget/ProgressBar;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mProgress:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method static synthetic access$600(Lcom/nloko/android/syncmypix/SyncProgressActivity;)Landroid/widget/TextSwitcher;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mTextSwitcher:Landroid/widget/TextSwitcher;

    return-object v0
.end method

.method static synthetic access$700(Lcom/nloko/android/syncmypix/SyncProgressActivity;)Landroid/widget/TextSwitcher;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mStatusSwitcher:Landroid/widget/TextSwitcher;

    return-object v0
.end method

.method static synthetic access$800(Lcom/nloko/android/syncmypix/SyncProgressActivity;)Landroid/widget/ImageSwitcher;
    .locals 1
    .parameter "x0"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mImageSwitcher:Landroid/widget/ImageSwitcher;

    return-object v0
.end method

.method static synthetic access$902(Lcom/nloko/android/syncmypix/SyncProgressActivity;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 52
    iput-boolean p1, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mSyncServiceBound:Z

    return p1
.end method


# virtual methods
.method protected finalize()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 135
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 136
    const-string v0, "SyncProgressActivity"

    const-string v1, "FINALIZED"

    invoke-static {v0, v1}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 72
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 73
    const v0, 0x7f030008

    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->setContentView(I)V

    .line 75
    const v0, 0x7f070031

    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mProgress:Landroid/widget/ProgressBar;

    .line 76
    const v0, 0x7f070035

    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mTitleProgress:Landroid/widget/ProgressBar;

    .line 77
    const v0, 0x7f07002d

    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageSwitcher;

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mImageSwitcher:Landroid/widget/ImageSwitcher;

    .line 78
    const v0, 0x7f07002a

    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextSwitcher;

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mTextSwitcher:Landroid/widget/TextSwitcher;

    .line 79
    const v0, 0x7f070030

    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextSwitcher;

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mStatusSwitcher:Landroid/widget/TextSwitcher;

    .line 80
    const v0, 0x7f070029

    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mStatus:Landroid/widget/TextView;

    .line 82
    const v0, 0x7f070019

    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mHomeButton:Landroid/widget/ImageButton;

    .line 83
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mHomeButton:Landroid/widget/ImageButton;

    new-instance v1, Lcom/nloko/android/syncmypix/SyncProgressActivity$1;

    invoke-direct {v1, p0}, Lcom/nloko/android/syncmypix/SyncProgressActivity$1;-><init>(Lcom/nloko/android/syncmypix/SyncProgressActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 92
    const v0, 0x7f070032

    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mCancelButton:Landroid/widget/ImageButton;

    .line 93
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mCancelButton:Landroid/widget/ImageButton;

    new-instance v1, Lcom/nloko/android/syncmypix/SyncProgressActivity$2;

    invoke-direct {v1, p0}, Lcom/nloko/android/syncmypix/SyncProgressActivity$2;-><init>(Lcom/nloko/android/syncmypix/SyncProgressActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 101
    return-void
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 2
    .parameter "id"

    .prologue
    const/4 v1, 0x0

    .line 141
    packed-switch p1, :pswitch_data_0

    .line 155
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateDialog(I)Landroid/app/Dialog;

    move-result-object v1

    :goto_0
    return-object v1

    .line 149
    :pswitch_0
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 150
    .local v0, cancelling:Landroid/app/ProgressDialog;
    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 151
    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 152
    const v1, 0x7f06002b

    invoke-virtual {p0, v1}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    move-object v1, v0

    .line 153
    goto :goto_0

    .line 141
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 121
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 122
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mSyncServiceConn:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v1}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->unbindService(Landroid/content/ServiceConnection;)V

    .line 123
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mSyncService:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_0

    .line 124
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mSyncService:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nloko/android/syncmypix/SyncService;

    .line 125
    .local v0, service:Lcom/nloko/android/syncmypix/SyncService;
    if-eqz v0, :cond_0

    .line 126
    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/SyncService;->unsetListener()V

    .line 129
    .end local v0           #service:Lcom/nloko/android/syncmypix/SyncService;
    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mSyncServiceBound:Z

    .line 130
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mSyncServiceConn:Landroid/content/ServiceConnection;

    .line 131
    return-void
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 115
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 116
    iget-object v0, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mTitleProgress:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 117
    return-void
.end method

.method protected onStart()V
    .locals 3

    .prologue
    .line 105
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 106
    iget-boolean v1, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mSyncServiceBound:Z

    if-nez v1, :cond_0

    .line 107
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/nloko/android/syncmypix/MainActivity;->getSyncSource(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 108
    .local v0, i:Landroid/content/Intent;
    iget-object v1, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mSyncServiceConn:Landroid/content/ServiceConnection;

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/nloko/android/syncmypix/SyncProgressActivity;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v1

    iput-boolean v1, p0, Lcom/nloko/android/syncmypix/SyncProgressActivity;->mSyncServiceBound:Z

    .line 110
    .end local v0           #i:Landroid/content/Intent;
    :cond_0
    return-void
.end method

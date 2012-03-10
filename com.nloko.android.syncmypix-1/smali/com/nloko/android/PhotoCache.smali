.class public Lcom/nloko/android/PhotoCache;
.super Ljava/lang/Object;
.source "PhotoCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nloko/android/PhotoCache$Photo;,
        Lcom/nloko/android/PhotoCache$AsyncHandler;
    }
.end annotation


# static fields
.field private static final ADD:I = 0x3

.field public static final BASE_DIR:Ljava/lang/String; = "Android/data/%s/cache/"

.field private static final DELETE:I = 0x2

.field private static final DELETE_ALL:I = 0x1

.field public static final DELETE_NEWEST:I = 0x1

.field public static final DELETE_OLDEST:I = 0x0

.field public static final NO_MEDIA:Ljava/lang/String; = ".nomedia"

.field private static final SHUTDOWN:I = 0x4

.field private static final TAG:Ljava/lang/String; = "PhotoCache"


# instance fields
.field private mContext:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private mDeleteOrder:I

.field private mExternalStorageAvailable:Z

.field private mExternalStorageReceiver:Landroid/content/BroadcastReceiver;

.field private mExternalStorageWriteable:Z

.field private final mHandler:Lcom/nloko/android/PhotoCache$AsyncHandler;

.field private mListener:Lcom/nloko/android/PhotoCacheListener;

.field public mMaxBytes:J

.field private mPath:Ljava/io/File;

.field private final mPhotos:Ljava/util/TreeMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeMap",
            "<",
            "Ljava/lang/Long;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private mSize:J

.field private mSized:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 7
    .parameter "context"

    .prologue
    const/4 v6, 0x0

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    const-wide/32 v2, 0x4c4b40

    iput-wide v2, p0, Lcom/nloko/android/PhotoCache;->mMaxBytes:J

    .line 68
    new-instance v2, Ljava/util/TreeMap;

    invoke-direct {v2}, Ljava/util/TreeMap;-><init>()V

    iput-object v2, p0, Lcom/nloko/android/PhotoCache;->mPhotos:Ljava/util/TreeMap;

    .line 69
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/nloko/android/PhotoCache;->mSize:J

    .line 70
    iput-boolean v6, p0, Lcom/nloko/android/PhotoCache;->mSized:Z

    .line 71
    iput v6, p0, Lcom/nloko/android/PhotoCache;->mDeleteOrder:I

    .line 82
    if-nez p1, :cond_0

    .line 83
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "context"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 86
    :cond_0
    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v2, p0, Lcom/nloko/android/PhotoCache;->mContext:Ljava/lang/ref/WeakReference;

    .line 87
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    .line 88
    .local v0, path:Ljava/io/File;
    new-instance v2, Ljava/io/File;

    const-string v3, "Android/data/%s/cache/"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v2, p0, Lcom/nloko/android/PhotoCache;->mPath:Ljava/io/File;

    .line 89
    invoke-direct {p0}, Lcom/nloko/android/PhotoCache;->startWatchingExternalStorage()V

    .line 91
    new-instance v1, Landroid/os/HandlerThread;

    const-string v2, "PhotoCacheThread"

    const/16 v3, 0xa

    invoke-direct {v1, v2, v3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    .line 93
    .local v1, thread:Landroid/os/HandlerThread;
    invoke-virtual {v1}, Landroid/os/HandlerThread;->start()V

    .line 94
    new-instance v2, Lcom/nloko/android/PhotoCache$AsyncHandler;

    invoke-direct {v2, p0, v1}, Lcom/nloko/android/PhotoCache$AsyncHandler;-><init>(Lcom/nloko/android/PhotoCache;Landroid/os/HandlerThread;)V

    iput-object v2, p0, Lcom/nloko/android/PhotoCache;->mHandler:Lcom/nloko/android/PhotoCache$AsyncHandler;

    .line 95
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;J)V
    .locals 0
    .parameter "context"
    .parameter "maxBytes"

    .prologue
    .line 77
    invoke-direct {p0, p1}, Lcom/nloko/android/PhotoCache;-><init>(Landroid/content/Context;)V

    .line 78
    iput-wide p2, p0, Lcom/nloko/android/PhotoCache;->mMaxBytes:J

    .line 79
    return-void
.end method

.method static synthetic access$000(Lcom/nloko/android/PhotoCache;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/nloko/android/PhotoCache;->updateExternalStorageState()V

    return-void
.end method

.method static synthetic access$100(Lcom/nloko/android/PhotoCache;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget-boolean v0, p0, Lcom/nloko/android/PhotoCache;->mExternalStorageWriteable:Z

    return v0
.end method

.method static synthetic access$1000(Lcom/nloko/android/PhotoCache;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/nloko/android/PhotoCache;->stopWatchingExternalStorage()V

    return-void
.end method

.method static synthetic access$200(Lcom/nloko/android/PhotoCache;)Ljava/io/File;
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget-object v0, p0, Lcom/nloko/android/PhotoCache;->mPath:Ljava/io/File;

    return-object v0
.end method

.method static synthetic access$300(Lcom/nloko/android/PhotoCache;)Ljava/util/TreeMap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget-object v0, p0, Lcom/nloko/android/PhotoCache;->mPhotos:Ljava/util/TreeMap;

    return-object v0
.end method

.method static synthetic access$400(Lcom/nloko/android/PhotoCache;)J
    .locals 2
    .parameter "x0"

    .prologue
    .line 46
    iget-wide v0, p0, Lcom/nloko/android/PhotoCache;->mSize:J

    return-wide v0
.end method

.method static synthetic access$414(Lcom/nloko/android/PhotoCache;J)J
    .locals 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 46
    iget-wide v0, p0, Lcom/nloko/android/PhotoCache;->mSize:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcom/nloko/android/PhotoCache;->mSize:J

    return-wide v0
.end method

.method static synthetic access$422(Lcom/nloko/android/PhotoCache;J)J
    .locals 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 46
    iget-wide v0, p0, Lcom/nloko/android/PhotoCache;->mSize:J

    sub-long/2addr v0, p1

    iput-wide v0, p0, Lcom/nloko/android/PhotoCache;->mSize:J

    return-wide v0
.end method

.method static synthetic access$500(Lcom/nloko/android/PhotoCache;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget v0, p0, Lcom/nloko/android/PhotoCache;->mDeleteOrder:I

    return v0
.end method

.method static synthetic access$600(Lcom/nloko/android/PhotoCache;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget-boolean v0, p0, Lcom/nloko/android/PhotoCache;->mExternalStorageAvailable:Z

    return v0
.end method

.method static synthetic access$700(Lcom/nloko/android/PhotoCache;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget-boolean v0, p0, Lcom/nloko/android/PhotoCache;->mSized:Z

    return v0
.end method

.method static synthetic access$702(Lcom/nloko/android/PhotoCache;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 46
    iput-boolean p1, p0, Lcom/nloko/android/PhotoCache;->mSized:Z

    return p1
.end method

.method static synthetic access$800(Lcom/nloko/android/PhotoCache;Ljava/io/File;)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 46
    invoke-direct {p0, p1}, Lcom/nloko/android/PhotoCache;->isNoMedia(Ljava/io/File;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$900(Lcom/nloko/android/PhotoCache;)Lcom/nloko/android/PhotoCacheListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 46
    iget-object v0, p0, Lcom/nloko/android/PhotoCache;->mListener:Lcom/nloko/android/PhotoCacheListener;

    return-object v0
.end method

.method private isNoMedia(Ljava/io/File;)Z
    .locals 5
    .parameter "f"

    .prologue
    const/4 v4, 0x0

    .line 148
    if-nez p1, :cond_0

    move v0, v4

    .line 149
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, ".nomedia"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    move v0, v4

    goto :goto_0
.end method

.method private startWatchingExternalStorage()V
    .locals 4

    .prologue
    .line 153
    iget-object v2, p0, Lcom/nloko/android/PhotoCache;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    .line 154
    .local v0, context:Landroid/content/Context;
    if-nez v0, :cond_0

    .line 173
    :goto_0
    return-void

    .line 158
    :cond_0
    const-string v2, "PhotoCache"

    const-string v3, "Registering BroadcastReceiver"

    invoke-static {v2, v3}, Lcom/nloko/android/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    new-instance v2, Lcom/nloko/android/PhotoCache$1;

    invoke-direct {v2, p0}, Lcom/nloko/android/PhotoCache$1;-><init>(Lcom/nloko/android/PhotoCache;)V

    iput-object v2, p0, Lcom/nloko/android/PhotoCache;->mExternalStorageReceiver:Landroid/content/BroadcastReceiver;

    .line 166
    new-instance v1, Landroid/content/IntentFilter;

    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 167
    .local v1, filter:Landroid/content/IntentFilter;
    const-string v2, "android.intent.action.MEDIA_MOUNTED"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 168
    const-string v2, "android.intent.action.MEDIA_REMOVED"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 169
    const-string v2, "android.intent.action.MEDIA_UNMOUNTED"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 170
    const-string v2, "file"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 171
    iget-object v2, p0, Lcom/nloko/android/PhotoCache;->mExternalStorageReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v2, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 172
    invoke-direct {p0}, Lcom/nloko/android/PhotoCache;->updateExternalStorageState()V

    goto :goto_0
.end method

.method private stopWatchingExternalStorage()V
    .locals 2

    .prologue
    .line 176
    iget-object v1, p0, Lcom/nloko/android/PhotoCache;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    .line 177
    .local v0, context:Landroid/content/Context;
    if-nez v0, :cond_0

    .line 182
    :goto_0
    return-void

    .line 181
    :cond_0
    iget-object v1, p0, Lcom/nloko/android/PhotoCache;->mExternalStorageReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    goto :goto_0
.end method

.method private declared-synchronized updateExternalStorageState()V
    .locals 2

    .prologue
    .line 185
    monitor-enter p0

    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Lcom/nloko/android/PhotoCache;->mExternalStorageAvailable:Z

    .line 186
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/nloko/android/PhotoCache;->mExternalStorageWriteable:Z

    .line 187
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    .line 189
    .local v0, state:Ljava/lang/String;
    const-string v1, "mounted"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 191
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/nloko/android/PhotoCache;->mExternalStorageWriteable:Z

    iput-boolean v1, p0, Lcom/nloko/android/PhotoCache;->mExternalStorageAvailable:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 201
    :goto_0
    monitor-exit p0

    return-void

    .line 192
    :cond_0
    :try_start_1
    const-string v1, "mounted_ro"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 194
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/nloko/android/PhotoCache;->mExternalStorageAvailable:Z

    .line 195
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/nloko/android/PhotoCache;->mExternalStorageWriteable:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 185
    .end local v0           #state:Ljava/lang/String;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 199
    .restart local v0       #state:Ljava/lang/String;
    :cond_1
    const/4 v1, 0x0

    :try_start_2
    iput-boolean v1, p0, Lcom/nloko/android/PhotoCache;->mExternalStorageWriteable:Z

    iput-boolean v1, p0, Lcom/nloko/android/PhotoCache;->mExternalStorageAvailable:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method


# virtual methods
.method public add(Ljava/lang/String;[B)V
    .locals 2
    .parameter "file"
    .parameter "b"

    .prologue
    .line 141
    iget-object v1, p0, Lcom/nloko/android/PhotoCache;->mHandler:Lcom/nloko/android/PhotoCache$AsyncHandler;

    invoke-virtual {v1}, Lcom/nloko/android/PhotoCache$AsyncHandler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 142
    .local v0, msg:Landroid/os/Message;
    const/4 v1, 0x3

    iput v1, v0, Landroid/os/Message;->what:I

    .line 143
    new-instance v1, Lcom/nloko/android/PhotoCache$Photo;

    invoke-direct {v1, p1, p2}, Lcom/nloko/android/PhotoCache$Photo;-><init>(Ljava/lang/String;[B)V

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 144
    iget-object v1, p0, Lcom/nloko/android/PhotoCache;->mHandler:Lcom/nloko/android/PhotoCache$AsyncHandler;

    invoke-virtual {v1, v0}, Lcom/nloko/android/PhotoCache$AsyncHandler;->sendMessage(Landroid/os/Message;)Z

    .line 145
    return-void
.end method

.method public delete(Ljava/lang/String;)V
    .locals 2
    .parameter "name"

    .prologue
    .line 108
    iget-object v1, p0, Lcom/nloko/android/PhotoCache;->mHandler:Lcom/nloko/android/PhotoCache$AsyncHandler;

    invoke-virtual {v1}, Lcom/nloko/android/PhotoCache$AsyncHandler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 109
    .local v0, msg:Landroid/os/Message;
    const/4 v1, 0x2

    iput v1, v0, Landroid/os/Message;->what:I

    .line 110
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 111
    iget-object v1, p0, Lcom/nloko/android/PhotoCache;->mHandler:Lcom/nloko/android/PhotoCache$AsyncHandler;

    invoke-virtual {v1, v0}, Lcom/nloko/android/PhotoCache$AsyncHandler;->sendMessage(Landroid/os/Message;)Z

    .line 112
    return-void
.end method

.method public deleteAll()V
    .locals 2

    .prologue
    .line 115
    iget-object v0, p0, Lcom/nloko/android/PhotoCache;->mHandler:Lcom/nloko/android/PhotoCache$AsyncHandler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/nloko/android/PhotoCache$AsyncHandler;->sendEmptyMessage(I)Z

    .line 116
    return-void
.end method

.method public destroy()V
    .locals 0

    .prologue
    .line 123
    invoke-virtual {p0}, Lcom/nloko/android/PhotoCache;->deleteAll()V

    .line 124
    invoke-virtual {p0}, Lcom/nloko/android/PhotoCache;->releaseResources()V

    .line 125
    return-void
.end method

.method public get(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 4
    .parameter "file"

    .prologue
    const/4 v3, 0x0

    .line 128
    if-nez p1, :cond_0

    move-object v1, v3

    .line 137
    :goto_0
    return-object v1

    .line 132
    :cond_0
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/nloko/android/PhotoCache;->mPath:Ljava/io/File;

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 134
    .local v0, path:Ljava/io/File;
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 135
    :catch_0
    move-exception v1

    move-object v1, v3

    .line 137
    goto :goto_0
.end method

.method public releaseResources()V
    .locals 2

    .prologue
    .line 119
    iget-object v0, p0, Lcom/nloko/android/PhotoCache;->mHandler:Lcom/nloko/android/PhotoCache$AsyncHandler;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/nloko/android/PhotoCache$AsyncHandler;->sendEmptyMessage(I)Z

    .line 120
    return-void
.end method

.method public setDeleteOrder(I)V
    .locals 1
    .parameter "order"

    .prologue
    .line 98
    if-eqz p1, :cond_0

    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 99
    :cond_0
    iput p1, p0, Lcom/nloko/android/PhotoCache;->mDeleteOrder:I

    .line 101
    :cond_1
    return-void
.end method

.method public setListener(Lcom/nloko/android/PhotoCacheListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 104
    iput-object p1, p0, Lcom/nloko/android/PhotoCache;->mListener:Lcom/nloko/android/PhotoCacheListener;

    .line 105
    return-void
.end method

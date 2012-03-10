.class Lcom/android/FileUtil$1;
.super Ljava/lang/Object;
.source "FileUtil.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/FileUtil;->getFile(Ljava/lang/String;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/FileUtil;

.field private final synthetic val$strPath:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/android/FileUtil;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/FileUtil$1;->this$0:Lcom/android/FileUtil;

    iput-object p2, p0, Lcom/android/FileUtil$1;->val$strPath:Ljava/lang/String;

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 45
    :try_start_0
    iget-object v1, p0, Lcom/android/FileUtil$1;->this$0:Lcom/android/FileUtil;

    iget-object v2, p0, Lcom/android/FileUtil$1;->val$strPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/android/FileUtil;->getDataSource(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    :goto_0
    return-void

    .line 46
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 47
    .local v0, e:Ljava/lang/Exception;
    const-string v1, "DOWNLOADAPK"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

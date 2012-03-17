.class Lcom/nloko/android/syncmypix/MainActivity$7;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Lcom/nloko/android/LogCollectorNotifier;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/syncmypix/MainActivity;->sendLog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nloko/android/syncmypix/MainActivity;

.field final synthetic val$collector:Lcom/nloko/android/LogCollector;


# direct methods
.method constructor <init>(Lcom/nloko/android/syncmypix/MainActivity;Lcom/nloko/android/LogCollector;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 232
    iput-object p1, p0, Lcom/nloko/android/syncmypix/MainActivity$7;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    iput-object p2, p0, Lcom/nloko/android/syncmypix/MainActivity$7;->val$collector:Lcom/nloko/android/LogCollector;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 6

    .prologue
    .line 234
    iget-object v2, p0, Lcom/nloko/android/syncmypix/MainActivity$7;->val$collector:Lcom/nloko/android/LogCollector;

    if-nez v2, :cond_1

    .line 251
    :cond_0
    :goto_0
    return-void

    .line 238
    :cond_1
    iget-object v2, p0, Lcom/nloko/android/syncmypix/MainActivity$7;->val$collector:Lcom/nloko/android/LogCollector;

    iget-object v3, p0, Lcom/nloko/android/syncmypix/MainActivity$7;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    const v4, 0x7f060028

    invoke-virtual {v3, v4}, Lcom/nloko/android/syncmypix/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/nloko/android/LogCollector;->appendMessage(Ljava/lang/String;)V

    .line 239
    iget-object v2, p0, Lcom/nloko/android/syncmypix/MainActivity$7;->val$collector:Lcom/nloko/android/LogCollector;

    invoke-virtual {v2}, Lcom/nloko/android/LogCollector;->getLog()Ljava/lang/String;

    move-result-object v1

    .line 240
    .local v1, log:Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 241
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.SEND"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 242
    .local v0, emailIntent:Landroid/content/Intent;
    const-string v2, "text/html"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 243
    const-string v2, "android.intent.extra.EMAIL"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "neil.loknath+syncmypix@gmail.com"

    aput-object v5, v3, v4

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 246
    const-string v2, "android.intent.extra.SUBJECT"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/nloko/android/syncmypix/MainActivity$7;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    const v5, 0x7f06002f

    invoke-virtual {v4, v5}, Lcom/nloko/android/syncmypix/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " Log"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 247
    const-string v2, "android.intent.extra.TEXT"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 249
    iget-object v2, p0, Lcom/nloko/android/syncmypix/MainActivity$7;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    const-string v3, "Send Log via"

    invoke-static {v0, v3}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/nloko/android/syncmypix/MainActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public onError()V
    .locals 3

    .prologue
    .line 254
    iget-object v0, p0, Lcom/nloko/android/syncmypix/MainActivity$7;->this$0:Lcom/nloko/android/syncmypix/MainActivity;

    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f060029

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 257
    return-void
.end method

.class Lcom/nloko/android/LogCollector$1;
.super Ljava/lang/Object;
.source "LogCollector.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nloko/android/LogCollector;->collect()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nloko/android/LogCollector;


# direct methods
.method constructor <init>(Lcom/nloko/android/LogCollector;)V
    .locals 0
    .parameter

    .prologue
    .line 146
    iput-object p1, p0, Lcom/nloko/android/LogCollector$1;->this$0:Lcom/nloko/android/LogCollector;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    .line 148
    const/4 v2, 0x0

    .line 149
    .local v2, proc:Ljava/lang/Process;
    const/4 v3, 0x0

    .line 151
    .local v3, reader:Ljava/io/BufferedReader;
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v6

    sget-object v7, Lcom/nloko/android/LogCollector;->LOGCAT_CMD:[Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/Runtime;->exec([Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v2

    .line 152
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v6, Ljava/io/InputStreamReader;

    invoke-virtual {v2}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v7, 0x400

    invoke-direct {v4, v6, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4

    .line 155
    .end local v3           #reader:Ljava/io/BufferedReader;
    .local v4, reader:Ljava/io/BufferedReader;
    :try_start_1
    const-string v6, "line.separator"

    invoke-static {v6}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 158
    .local v5, separator:Ljava/lang/String;
    iget-object v6, p0, Lcom/nloko/android/LogCollector$1;->this$0:Lcom/nloko/android/LogCollector;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v6, v7}, Lcom/nloko/android/LogCollector;->access$302(Lcom/nloko/android/LogCollector;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    .line 159
    iget-object v6, p0, Lcom/nloko/android/LogCollector$1;->this$0:Lcom/nloko/android/LogCollector;

    invoke-static {v6}, Lcom/nloko/android/LogCollector;->access$300(Lcom/nloko/android/LogCollector;)Ljava/lang/StringBuilder;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Model: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget-object v8, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    iget-object v6, p0, Lcom/nloko/android/LogCollector$1;->this$0:Lcom/nloko/android/LogCollector;

    invoke-static {v6}, Lcom/nloko/android/LogCollector;->access$300(Lcom/nloko/android/LogCollector;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    iget-object v6, p0, Lcom/nloko/android/LogCollector$1;->this$0:Lcom/nloko/android/LogCollector;

    invoke-static {v6}, Lcom/nloko/android/LogCollector;->access$300(Lcom/nloko/android/LogCollector;)Ljava/lang/StringBuilder;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Display: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget-object v8, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    iget-object v6, p0, Lcom/nloko/android/LogCollector$1;->this$0:Lcom/nloko/android/LogCollector;

    invoke-static {v6}, Lcom/nloko/android/LogCollector;->access$300(Lcom/nloko/android/LogCollector;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    iget-object v6, p0, Lcom/nloko/android/LogCollector$1;->this$0:Lcom/nloko/android/LogCollector;

    invoke-static {v6}, Lcom/nloko/android/LogCollector;->access$300(Lcom/nloko/android/LogCollector;)Ljava/lang/StringBuilder;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Release: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget-object v8, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    iget-object v6, p0, Lcom/nloko/android/LogCollector$1;->this$0:Lcom/nloko/android/LogCollector;

    invoke-static {v6}, Lcom/nloko/android/LogCollector;->access$300(Lcom/nloko/android/LogCollector;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    iget-object v6, p0, Lcom/nloko/android/LogCollector$1;->this$0:Lcom/nloko/android/LogCollector;

    invoke-static {v6}, Lcom/nloko/android/LogCollector;->access$300(Lcom/nloko/android/LogCollector;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    :goto_0
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .local v1, line:Ljava/lang/String;
    if-eqz v1, :cond_3

    .line 168
    iget-object v6, p0, Lcom/nloko/android/LogCollector$1;->this$0:Lcom/nloko/android/LogCollector;

    invoke-static {v6}, Lcom/nloko/android/LogCollector;->access$300(Lcom/nloko/android/LogCollector;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    iget-object v6, p0, Lcom/nloko/android/LogCollector$1;->this$0:Lcom/nloko/android/LogCollector;

    invoke-static {v6}, Lcom/nloko/android/LogCollector;->access$300(Lcom/nloko/android/LogCollector;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 176
    .end local v1           #line:Ljava/lang/String;
    .end local v5           #separator:Ljava/lang/String;
    :catch_0
    move-exception v6

    move-object v0, v6

    move-object v3, v4

    .line 177
    .end local v4           #reader:Ljava/io/BufferedReader;
    .local v0, e:Ljava/io/IOException;
    .restart local v3       #reader:Ljava/io/BufferedReader;
    :goto_1
    :try_start_2
    iget-object v6, p0, Lcom/nloko/android/LogCollector$1;->this$0:Lcom/nloko/android/LogCollector;

    invoke-static {v6}, Lcom/nloko/android/LogCollector;->access$400(Lcom/nloko/android/LogCollector;)Lcom/nloko/android/LogCollector$LogHandler;

    move-result-object v6

    if-eqz v6, :cond_0

    .line 178
    iget-object v6, p0, Lcom/nloko/android/LogCollector$1;->this$0:Lcom/nloko/android/LogCollector;

    invoke-static {v6}, Lcom/nloko/android/LogCollector;->access$400(Lcom/nloko/android/LogCollector;)Lcom/nloko/android/LogCollector$LogHandler;

    move-result-object v6

    const/4 v7, 0x2

    invoke-virtual {v6, v7}, Lcom/nloko/android/LogCollector$LogHandler;->sendEmptyMessage(I)Z

    .line 180
    :cond_0
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 183
    if-eqz v3, :cond_1

    .line 184
    :try_start_3
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V

    .line 187
    :cond_1
    if-eqz v2, :cond_2

    .line 188
    invoke-virtual {v2}, Ljava/lang/Process;->destroy()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 195
    .end local v0           #e:Ljava/io/IOException;
    :cond_2
    :goto_2
    return-void

    .line 172
    .end local v3           #reader:Ljava/io/BufferedReader;
    .restart local v1       #line:Ljava/lang/String;
    .restart local v4       #reader:Ljava/io/BufferedReader;
    .restart local v5       #separator:Ljava/lang/String;
    :cond_3
    :try_start_4
    const-string v6, "LogCollector"

    const-string v7, "collected log"

    invoke-static {v6, v7}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    iget-object v6, p0, Lcom/nloko/android/LogCollector$1;->this$0:Lcom/nloko/android/LogCollector;

    invoke-static {v6}, Lcom/nloko/android/LogCollector;->access$400(Lcom/nloko/android/LogCollector;)Lcom/nloko/android/LogCollector$LogHandler;

    move-result-object v6

    if-eqz v6, :cond_4

    .line 174
    iget-object v6, p0, Lcom/nloko/android/LogCollector$1;->this$0:Lcom/nloko/android/LogCollector;

    invoke-static {v6}, Lcom/nloko/android/LogCollector;->access$400(Lcom/nloko/android/LogCollector;)Lcom/nloko/android/LogCollector$LogHandler;

    move-result-object v6

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Lcom/nloko/android/LogCollector$LogHandler;->sendEmptyMessage(I)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 183
    :cond_4
    if-eqz v4, :cond_5

    .line 184
    :try_start_5
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 187
    :cond_5
    if-eqz v2, :cond_6

    .line 188
    invoke-virtual {v2}, Ljava/lang/Process;->destroy()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    :cond_6
    move-object v3, v4

    .line 192
    .end local v4           #reader:Ljava/io/BufferedReader;
    .restart local v3       #reader:Ljava/io/BufferedReader;
    goto :goto_2

    .line 190
    .end local v3           #reader:Ljava/io/BufferedReader;
    .restart local v4       #reader:Ljava/io/BufferedReader;
    :catch_1
    move-exception v6

    move-object v0, v6

    .line 191
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    move-object v3, v4

    .line 193
    .end local v4           #reader:Ljava/io/BufferedReader;
    .restart local v3       #reader:Ljava/io/BufferedReader;
    goto :goto_2

    .line 190
    .end local v1           #line:Ljava/lang/String;
    .end local v5           #separator:Ljava/lang/String;
    .local v0, e:Ljava/io/IOException;
    :catch_2
    move-exception v6

    move-object v0, v6

    .line 191
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2

    .line 182
    .end local v0           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v6

    .line 183
    :goto_3
    if-eqz v3, :cond_7

    .line 184
    :try_start_6
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V

    .line 187
    :cond_7
    if-eqz v2, :cond_8

    .line 188
    invoke-virtual {v2}, Ljava/lang/Process;->destroy()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3

    .line 192
    :cond_8
    :goto_4
    throw v6

    .line 190
    :catch_3
    move-exception v7

    move-object v0, v7

    .line 191
    .restart local v0       #e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_4

    .line 182
    .end local v0           #e:Ljava/lang/Exception;
    .end local v3           #reader:Ljava/io/BufferedReader;
    .restart local v4       #reader:Ljava/io/BufferedReader;
    :catchall_1
    move-exception v6

    move-object v3, v4

    .end local v4           #reader:Ljava/io/BufferedReader;
    .restart local v3       #reader:Ljava/io/BufferedReader;
    goto :goto_3

    .line 176
    :catch_4
    move-exception v6

    move-object v0, v6

    goto :goto_1
.end method

.class public Lcom/nloko/android/syncmypix/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# static fields
.field private static final DEV_EMAIL:Ljava/lang/String; = "neil.loknath+syncmypix@gmail.com"

.field private static final SOCIAL_NETWORK_LOGIN:I = 0x0

.field private static final TAG:Ljava/lang/String; = "MainActivity"


# instance fields
.field private final ABOUT_DIALOG:I

.field private final CONFIRM_DIALOG:I

.field private final DELETE_DIALOG:I

.field private final DELETING:I

.field private final MENU_LOG:I

.field private final MENU_LOGOUT:I

.field private mDeleteButton:Landroid/widget/ImageButton;

.field private mHelpButton:Landroid/widget/ImageButton;

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


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x3

    .line 67
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 73
    iput v1, p0, Lcom/nloko/android/syncmypix/MainActivity;->MENU_LOGOUT:I

    .line 74
    const/4 v0, 0x5

    iput v0, p0, Lcom/nloko/android/syncmypix/MainActivity;->MENU_LOG:I

    .line 76
    const/4 v0, 0x1

    iput v0, p0, Lcom/nloko/android/syncmypix/MainActivity;->DELETE_DIALOG:I

    .line 77
    const/4 v0, 0x2

    iput v0, p0, Lcom/nloko/android/syncmypix/MainActivity;->ABOUT_DIALOG:I

    .line 78
    iput v1, p0, Lcom/nloko/android/syncmypix/MainActivity;->CONFIRM_DIALOG:I

    .line 79
    const/4 v0, 0x4

    iput v0, p0, Lcom/nloko/android/syncmypix/MainActivity;->DELETING:I

    .line 82
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nloko/android/syncmypix/MainActivity;->mSyncServiceBound:Z

    .line 469
    new-instance v0, Lcom/nloko/android/syncmypix/MainActivity$14;

    invoke-direct {v0, p0}, Lcom/nloko/android/syncmypix/MainActivity$14;-><init>(Lcom/nloko/android/syncmypix/MainActivity;)V

    iput-object v0, p0, Lcom/nloko/android/syncmypix/MainActivity;->mSyncServiceConn:Landroid/content/ServiceConnection;

    return-void
.end method

.method static synthetic access$000(Lcom/nloko/android/syncmypix/MainActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 67
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/MainActivity;->sync()V

    return-void
.end method

.method static synthetic access$100(Lcom/nloko/android/syncmypix/MainActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 67
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/MainActivity;->login()V

    return-void
.end method

.method static synthetic access$200(Lcom/nloko/android/syncmypix/MainActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 67
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/MainActivity;->showResults()V

    return-void
.end method

.method static synthetic access$300(Lcom/nloko/android/syncmypix/MainActivity;)Ljava/lang/ref/WeakReference;
    .locals 1
    .parameter "x0"

    .prologue
    .line 67
    iget-object v0, p0, Lcom/nloko/android/syncmypix/MainActivity;->mSyncService:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static synthetic access$302(Lcom/nloko/android/syncmypix/MainActivity;Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 67
    iput-object p1, p0, Lcom/nloko/android/syncmypix/MainActivity;->mSyncService:Ljava/lang/ref/WeakReference;

    return-object p1
.end method

.method private createAboutDialog()Landroid/app/Dialog;
    .locals 14

    .prologue
    const/4 v13, 0x1

    const/4 v12, 0x0

    .line 416
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    .line 418
    .local v6, pm:Landroid/content/pm/PackageManager;
    const/4 v8, 0x0

    .line 420
    .local v8, version:Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v6, v10, v11}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v5

    .line 421
    .local v5, pi:Landroid/content/pm/PackageInfo;
    iget-object v8, v5, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 426
    .end local v5           #pi:Landroid/content/pm/PackageInfo;
    :goto_0
    new-instance v0, Landroid/app/Dialog;

    invoke-direct {v0, p0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 427
    .local v0, about:Landroid/app/Dialog;
    invoke-virtual {v0, v13}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    .line 428
    const/high16 v10, 0x7f03

    invoke-virtual {v0, v10}, Landroid/app/Dialog;->setContentView(I)V

    .line 431
    const/high16 v10, 0x7f07

    invoke-virtual {v0, v10}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    .line 432
    .local v3, layout:Landroid/widget/LinearLayout;
    if-eqz v8, :cond_0

    .line 433
    new-instance v9, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/MainActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v10

    invoke-direct {v9, v10}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 434
    .local v9, versionView:Landroid/widget/TextView;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, " Version "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 435
    const/high16 v10, 0x4120

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setTextSize(F)V

    .line 437
    invoke-virtual {v3, v9, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    .line 440
    .end local v9           #versionView:Landroid/widget/TextView;
    :cond_0
    const v10, 0x7f070007

    invoke-virtual {v0, v10}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Button;

    .line 441
    .local v4, ok:Landroid/widget/Button;
    new-instance v10, Lcom/nloko/android/syncmypix/MainActivity$11;

    invoke-direct {v10, p0}, Lcom/nloko/android/syncmypix/MainActivity$11;-><init>(Lcom/nloko/android/syncmypix/MainActivity;)V

    invoke-virtual {v4, v10}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 447
    const v10, 0x7f070006

    invoke-virtual {v0, v10}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 448
    .local v1, donate:Landroid/widget/Button;
    new-instance v10, Lcom/nloko/android/syncmypix/MainActivity$12;

    invoke-direct {v10, p0}, Lcom/nloko/android/syncmypix/MainActivity$12;-><init>(Lcom/nloko/android/syncmypix/MainActivity;)V

    invoke-virtual {v1, v10}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 457
    const v10, 0x7f070005

    invoke-virtual {v0, v10}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/CheckBox;

    .line 458
    .local v7, show:Landroid/widget/CheckBox;
    const-string v10, "SyncMyPixPrefs"

    invoke-virtual {p0, v10, v12}, Lcom/nloko/android/syncmypix/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v10

    const-string v11, "do_not_show_about"

    invoke-interface {v10, v11, v12}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v10

    invoke-virtual {v7, v10}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 459
    new-instance v10, Lcom/nloko/android/syncmypix/MainActivity$13;

    invoke-direct {v10, p0}, Lcom/nloko/android/syncmypix/MainActivity$13;-><init>(Lcom/nloko/android/syncmypix/MainActivity;)V

    invoke-virtual {v7, v10}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 466
    return-object v0

    .line 422
    .end local v0           #about:Landroid/app/Dialog;
    .end local v1           #donate:Landroid/widget/Button;
    .end local v3           #layout:Landroid/widget/LinearLayout;
    .end local v4           #ok:Landroid/widget/Button;
    .end local v7           #show:Landroid/widget/CheckBox;
    :catch_0
    move-exception v10

    move-object v2, v10

    .line 423
    .local v2, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v2}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto/16 :goto_0
.end method

.method public static getSyncSource(Landroid/content/Context;)Ljava/lang/Class;
    .locals 7
    .parameter "context"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/nloko/android/syncmypix/SyncService;",
            ">(",
            "Landroid/content/Context;",
            ")",
            "Ljava/lang/Class",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 89
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 90
    .local v3, prefs:Landroid/content/SharedPreferences;
    const-string v5, "source"

    const/4 v6, 0x0

    invoke-interface {v3, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 93
    .local v4, source:Ljava/lang/String;
    :try_start_0
    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v1

    .local v1, cls:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    move-object v5, v1

    .line 101
    .end local v1           #cls:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    :goto_0
    return-object v5

    .line 95
    :catch_0
    move-exception v0

    .line 96
    .local v0, classException:Ljava/lang/ClassNotFoundException;
    const-string v5, "MainActivity"

    const-string v6, "Could not get class from XML. Defaulting to FacebookSyncService.class"

    invoke-static {v5, v6}, Lcom/nloko/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    .end local v0           #classException:Ljava/lang/ClassNotFoundException;
    :goto_1
    const-class v5, Lcom/nloko/android/syncmypix/facebook/FacebookSyncService;

    goto :goto_0

    .line 97
    :catch_1
    move-exception v2

    .line 98
    .local v2, e:Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public static isLoggedInFromSyncSource(Landroid/content/Context;Ljava/lang/Class;)Z
    .locals 7
    .parameter "context"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/nloko/android/syncmypix/SyncService;",
            ">(",
            "Landroid/content/Context;",
            "Ljava/lang/Class",
            "<TT;>;)Z"
        }
    .end annotation

    .prologue
    .local p1, source:Ljava/lang/Class;,"Ljava/lang/Class<TT;>;"
    const/4 v6, 0x0

    .line 107
    :try_start_0
    const-string v2, "isLoggedIn"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Landroid/content/Context;

    aput-object v5, v3, v4

    invoke-virtual {p1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 108
    .local v1, m:Ljava/lang/reflect/Method;
    const/4 v2, 0x0

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0
    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    move-result v2

    .line 118
    .end local v1           #m:Ljava/lang/reflect/Method;
    :goto_0
    return v2

    .line 110
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 111
    .local v0, e:Ljava/lang/SecurityException;
    invoke-virtual {v0}, Ljava/lang/SecurityException;->printStackTrace()V

    .end local v0           #e:Ljava/lang/SecurityException;
    :goto_1
    move v2, v6

    .line 118
    goto :goto_0

    .line 112
    :catch_1
    move-exception v2

    move-object v0, v2

    .line 113
    .local v0, e:Ljava/lang/NoSuchMethodException;
    invoke-virtual {v0}, Ljava/lang/NoSuchMethodException;->printStackTrace()V

    goto :goto_1

    .line 114
    .end local v0           #e:Ljava/lang/NoSuchMethodException;
    :catch_2
    move-exception v2

    move-object v0, v2

    .line 115
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method private login()V
    .locals 3

    .prologue
    .line 216
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/nloko/android/syncmypix/MainActivity;->getSyncSource(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/nloko/android/syncmypix/MainActivity;->getLoginClassFromSyncSource(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/nloko/android/syncmypix/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 219
    return-void
.end method

.method private logout()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 224
    const-string v0, "SyncMyPixPrefs"

    invoke-virtual {p0, v0, v2}, Lcom/nloko/android/syncmypix/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "session_key"

    invoke-static {v0, v1, v3}, Lcom/nloko/android/Utils;->setString(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    .line 225
    const-string v0, "SyncMyPixPrefs"

    invoke-virtual {p0, v0, v2}, Lcom/nloko/android/syncmypix/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "secret"

    invoke-static {v0, v1, v3}, Lcom/nloko/android/Utils;->setString(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    .line 226
    const-string v0, "SyncMyPixPrefs"

    invoke-virtual {p0, v0, v2}, Lcom/nloko/android/syncmypix/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "uid"

    invoke-static {v0, v1, v3}, Lcom/nloko/android/Utils;->setString(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    .line 227
    return-void
.end method

.method private sendLog()V
    .locals 2

    .prologue
    .line 231
    new-instance v0, Lcom/nloko/android/LogCollector;

    invoke-direct {v0}, Lcom/nloko/android/LogCollector;-><init>()V

    .line 232
    .local v0, collector:Lcom/nloko/android/LogCollector;
    new-instance v1, Lcom/nloko/android/syncmypix/MainActivity$7;

    invoke-direct {v1, p0, v0}, Lcom/nloko/android/syncmypix/MainActivity$7;-><init>(Lcom/nloko/android/syncmypix/MainActivity;Lcom/nloko/android/LogCollector;)V

    invoke-virtual {v0, v1}, Lcom/nloko/android/LogCollector;->setNotifier(Lcom/nloko/android/LogCollectorNotifier;)V

    .line 259
    invoke-virtual {v0}, Lcom/nloko/android/LogCollector;->collect()V

    .line 260
    return-void
.end method

.method private showResults()V
    .locals 3

    .prologue
    .line 282
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/nloko/android/syncmypix/SyncResultsActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 283
    .local v0, i:Landroid/content/Intent;
    const/high16 v1, 0x2002

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 284
    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 285
    return-void
.end method

.method private sync()V
    .locals 4

    .prologue
    .line 264
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/nloko/android/Utils;->hasInternetConnection(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 265
    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f06004d

    const/4 v3, 0x1

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 278
    :cond_0
    :goto_0
    return-void

    .line 269
    :cond_1
    const/4 v0, 0x0

    .line 270
    .local v0, service:Lcom/nloko/android/syncmypix/SyncService;
    iget-object v1, p0, Lcom/nloko/android/syncmypix/MainActivity;->mSyncService:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_2

    .line 271
    iget-object v1, p0, Lcom/nloko/android/syncmypix/MainActivity;->mSyncService:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    .end local v0           #service:Lcom/nloko/android/syncmypix/SyncService;
    check-cast v0, Lcom/nloko/android/syncmypix/SyncService;

    .line 274
    .restart local v0       #service:Lcom/nloko/android/syncmypix/SyncService;
    :cond_2
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/nloko/android/syncmypix/SyncService;->isExecuting()Z

    move-result v1

    if-nez v1, :cond_0

    .line 275
    :cond_3
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/nloko/android/syncmypix/MainActivity;->getSyncSource(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/nloko/android/syncmypix/MainActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 276
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/nloko/android/syncmypix/SyncProgressActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/nloko/android/syncmypix/MainActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
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
    .line 316
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 317
    const-string v0, "MainActivity"

    const-string v1, "FINALIZED"

    invoke-static {v0, v1}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 318
    return-void
.end method

.method public getLoginClassFromSyncSource(Ljava/lang/Class;)Ljava/lang/Class;
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/nloko/android/syncmypix/SyncService;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 124
    .local p1, source:Ljava/lang/Class;,"Ljava/lang/Class<TT;>;"
    :try_start_0
    const-string v2, "getLoginClass"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {p1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 125
    .local v1, m:Ljava/lang/reflect/Method;
    const/4 v2, 0x0

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .end local p0
    check-cast p0, Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    move-object v2, p0

    .line 136
    .end local v1           #m:Ljava/lang/reflect/Method;
    :goto_0
    return-object v2

    .line 127
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 128
    .local v0, e:Ljava/lang/SecurityException;
    invoke-virtual {v0}, Ljava/lang/SecurityException;->printStackTrace()V

    .line 136
    .end local v0           #e:Ljava/lang/SecurityException;
    :goto_1
    const-class v2, Lcom/nloko/android/syncmypix/facebook/FacebookLoginWebView;

    goto :goto_0

    .line 129
    :catch_1
    move-exception v2

    move-object v0, v2

    .line 130
    .local v0, e:Ljava/lang/NoSuchMethodException;
    invoke-virtual {v0}, Ljava/lang/NoSuchMethodException;->printStackTrace()V

    goto :goto_1

    .line 131
    .end local v0           #e:Ljava/lang/NoSuchMethodException;
    :catch_2
    move-exception v2

    move-object v0, v2

    .line 132
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 201
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 203
    const/4 v0, -0x1

    if-eq p2, v0, :cond_0

    .line 212
    :goto_0
    return-void

    .line 207
    :cond_0
    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 209
    :pswitch_0
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/MainActivity;->sync()V

    goto :goto_0

    .line 207
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 7
    .parameter "savedInstanceState"

    .prologue
    const/4 v6, 0x0

    .line 141
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 142
    const v4, 0x7f030003

    invoke-virtual {p0, v4}, Lcom/nloko/android/syncmypix/MainActivity;->setContentView(I)V

    .line 144
    const-string v4, "SyncMyPixPrefs"

    invoke-virtual {p0, v4, v6}, Lcom/nloko/android/syncmypix/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string v5, "do_not_show_about"

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-nez v4, :cond_0

    .line 145
    const/4 v4, 0x2

    invoke-virtual {p0, v4}, Lcom/nloko/android/syncmypix/MainActivity;->showDialog(I)V

    .line 148
    :cond_0
    const v4, 0x7f07000e

    invoke-virtual {p0, v4}, Lcom/nloko/android/syncmypix/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageButton;

    .line 149
    .local v3, sync:Landroid/widget/ImageButton;
    new-instance v4, Lcom/nloko/android/syncmypix/MainActivity$1;

    invoke-direct {v4, p0}, Lcom/nloko/android/syncmypix/MainActivity$1;-><init>(Lcom/nloko/android/syncmypix/MainActivity;)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 160
    const v4, 0x7f070010

    invoke-virtual {p0, v4}, Lcom/nloko/android/syncmypix/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageButton;

    .line 161
    .local v2, settings:Landroid/widget/ImageButton;
    new-instance v4, Lcom/nloko/android/syncmypix/MainActivity$2;

    invoke-direct {v4, p0}, Lcom/nloko/android/syncmypix/MainActivity$2;-><init>(Lcom/nloko/android/syncmypix/MainActivity;)V

    invoke-virtual {v2, v4}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 168
    const v4, 0x7f070014

    invoke-virtual {p0, v4}, Lcom/nloko/android/syncmypix/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageButton;

    .line 169
    .local v1, results:Landroid/widget/ImageButton;
    new-instance v4, Lcom/nloko/android/syncmypix/MainActivity$3;

    invoke-direct {v4, p0}, Lcom/nloko/android/syncmypix/MainActivity$3;-><init>(Lcom/nloko/android/syncmypix/MainActivity;)V

    invoke-virtual {v1, v4}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 175
    const v4, 0x7f070012

    invoke-virtual {p0, v4}, Lcom/nloko/android/syncmypix/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    .line 176
    .local v0, about:Landroid/widget/ImageButton;
    new-instance v4, Lcom/nloko/android/syncmypix/MainActivity$4;

    invoke-direct {v4, p0}, Lcom/nloko/android/syncmypix/MainActivity$4;-><init>(Lcom/nloko/android/syncmypix/MainActivity;)V

    invoke-virtual {v0, v4}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 182
    const v4, 0x7f070018

    invoke-virtual {p0, v4}, Lcom/nloko/android/syncmypix/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageButton;

    iput-object v4, p0, Lcom/nloko/android/syncmypix/MainActivity;->mHelpButton:Landroid/widget/ImageButton;

    .line 183
    iget-object v4, p0, Lcom/nloko/android/syncmypix/MainActivity;->mHelpButton:Landroid/widget/ImageButton;

    new-instance v5, Lcom/nloko/android/syncmypix/MainActivity$5;

    invoke-direct {v5, p0}, Lcom/nloko/android/syncmypix/MainActivity$5;-><init>(Lcom/nloko/android/syncmypix/MainActivity;)V

    invoke-virtual {v4, v5}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 190
    const v4, 0x7f070017

    invoke-virtual {p0, v4}, Lcom/nloko/android/syncmypix/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageButton;

    iput-object v4, p0, Lcom/nloko/android/syncmypix/MainActivity;->mDeleteButton:Landroid/widget/ImageButton;

    .line 191
    iget-object v4, p0, Lcom/nloko/android/syncmypix/MainActivity;->mDeleteButton:Landroid/widget/ImageButton;

    new-instance v5, Lcom/nloko/android/syncmypix/MainActivity$6;

    invoke-direct {v5, p0}, Lcom/nloko/android/syncmypix/MainActivity$6;-><init>(Lcom/nloko/android/syncmypix/MainActivity;)V

    invoke-virtual {v4, v5}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 197
    return-void
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 7
    .parameter "id"

    .prologue
    const/4 v6, 0x0

    .line 349
    packed-switch p1, :pswitch_data_0

    .line 410
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreateDialog(I)Landroid/app/Dialog;

    move-result-object v4

    :goto_0
    return-object v4

    .line 351
    :pswitch_0
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/MainActivity;->createAboutDialog()Landroid/app/Dialog;

    move-result-object v4

    goto :goto_0

    .line 354
    :pswitch_1
    new-instance v3, Lcom/nloko/android/syncmypix/views/ConfirmSyncDialog;

    invoke-direct {v3, p0}, Lcom/nloko/android/syncmypix/views/ConfirmSyncDialog;-><init>(Landroid/content/Context;)V

    .line 355
    .local v3, dialog:Lcom/nloko/android/syncmypix/views/ConfirmSyncDialog;
    new-instance v4, Lcom/nloko/android/syncmypix/MainActivity$8;

    invoke-direct {v4, p0}, Lcom/nloko/android/syncmypix/MainActivity$8;-><init>(Lcom/nloko/android/syncmypix/MainActivity;)V

    invoke-virtual {v3, v4}, Lcom/nloko/android/syncmypix/views/ConfirmSyncDialog;->setProceedButtonListener(Landroid/content/DialogInterface$OnClickListener;)V

    .line 361
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/nloko/android/syncmypix/views/ConfirmSyncDialog;->setCancelButtonListener(Landroid/content/DialogInterface$OnClickListener;)V

    move-object v4, v3

    .line 362
    goto :goto_0

    .line 365
    .end local v3           #dialog:Lcom/nloko/android/syncmypix/views/ConfirmSyncDialog;
    :pswitch_2
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 366
    .local v1, deleteBuilder:Landroid/app/AlertDialog$Builder;
    const v4, 0x7f060041

    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x1080027

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x7f060042

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    invoke-virtual {v4, v6}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const-string v5, "Yes"

    new-instance v6, Lcom/nloko/android/syncmypix/MainActivity$10;

    invoke-direct {v6, p0}, Lcom/nloko/android/syncmypix/MainActivity$10;-><init>(Lcom/nloko/android/syncmypix/MainActivity;)V

    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const-string v5, "No"

    new-instance v6, Lcom/nloko/android/syncmypix/MainActivity$9;

    invoke-direct {v6, p0}, Lcom/nloko/android/syncmypix/MainActivity$9;-><init>(Lcom/nloko/android/syncmypix/MainActivity;)V

    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 398
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .local v0, delete:Landroid/app/AlertDialog;
    move-object v4, v0

    .line 399
    goto :goto_0

    .line 402
    .end local v0           #delete:Landroid/app/AlertDialog;
    .end local v1           #deleteBuilder:Landroid/app/AlertDialog$Builder;
    :pswitch_3
    new-instance v2, Landroid/app/ProgressDialog;

    invoke-direct {v2, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 403
    .local v2, deleting:Landroid/app/ProgressDialog;
    invoke-virtual {v2, v6}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 404
    const v4, 0x7f060043

    invoke-virtual {p0, v4}, Lcom/nloko/android/syncmypix/MainActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 405
    invoke-virtual {v2, v6}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    move-object v4, v2

    .line 406
    goto :goto_0

    .line 349
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_3
    .end packed-switch
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 4
    .parameter "menu"

    .prologue
    const/4 v3, 0x0

    .line 324
    const/4 v1, 0x3

    const v2, 0x7f060024

    invoke-interface {p1, v3, v1, v3, v2}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    .line 325
    .local v0, item:Landroid/view/MenuItem;
    const v1, 0x1080038

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 327
    const/4 v1, 0x5

    const v2, 0x7f060025

    invoke-interface {p1, v3, v1, v3, v2}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    .line 328
    const v1, 0x1080050

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 330
    const/4 v1, 0x1

    return v1
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 309
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 310
    const-string v0, "MainActivity"

    const-string v1, "onDestroy"

    invoke-static {v0, v1}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 311
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nloko/android/syncmypix/MainActivity;->mSyncServiceConn:Landroid/content/ServiceConnection;

    .line 312
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    const/4 v1, 0x1

    .line 335
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 344
    :pswitch_0
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 337
    :pswitch_1
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/MainActivity;->logout()V

    move v0, v1

    .line 338
    goto :goto_0

    .line 340
    :pswitch_2
    invoke-direct {p0}, Lcom/nloko/android/syncmypix/MainActivity;->sendLog()V

    move v0, v1

    .line 341
    goto :goto_0

    .line 335
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method protected onStart()V
    .locals 3

    .prologue
    .line 289
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 291
    iget-boolean v1, p0, Lcom/nloko/android/syncmypix/MainActivity;->mSyncServiceBound:Z

    if-nez v1, :cond_0

    .line 292
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Lcom/nloko/android/syncmypix/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/nloko/android/syncmypix/MainActivity;->getSyncSource(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 293
    .local v0, i:Landroid/content/Intent;
    iget-object v1, p0, Lcom/nloko/android/syncmypix/MainActivity;->mSyncServiceConn:Landroid/content/ServiceConnection;

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/nloko/android/syncmypix/MainActivity;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v1

    iput-boolean v1, p0, Lcom/nloko/android/syncmypix/MainActivity;->mSyncServiceBound:Z

    .line 295
    .end local v0           #i:Landroid/content/Intent;
    :cond_0
    return-void
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 299
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 300
    iget-boolean v0, p0, Lcom/nloko/android/syncmypix/MainActivity;->mSyncServiceBound:Z

    if-eqz v0, :cond_0

    .line 301
    const-string v0, "MainActivity"

    const-string v1, "unbinding service"

    invoke-static {v0, v1}, Lcom/nloko/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 302
    iget-object v0, p0, Lcom/nloko/android/syncmypix/MainActivity;->mSyncServiceConn:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0}, Lcom/nloko/android/syncmypix/MainActivity;->unbindService(Landroid/content/ServiceConnection;)V

    .line 303
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nloko/android/syncmypix/MainActivity;->mSyncServiceBound:Z

    .line 305
    :cond_0
    return-void
.end method

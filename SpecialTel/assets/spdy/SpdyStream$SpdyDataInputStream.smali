.class final Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;
.super Ljava/io/InputStream;
.source "SpdyStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/spdy/SpdyStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "SpdyDataInputStream"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final buffer:[B

.field private closed:Z

.field private finished:Z

.field private limit:I

.field private pos:I

.field final synthetic this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

.field private unacknowledgedBytes:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 339
    const-class v0, Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private constructor <init>(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)V
    .locals 1
    .parameter

    .prologue
    .line 339
    iput-object p1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 352
    const/high16 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->buffer:[B

    .line 355
    const/4 v0, -0x1

    iput v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->pos:I

    .line 374
    const/4 v0, 0x0

    iput v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->unacknowledgedBytes:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/squareup/okhttp/internal/spdy/SpdyStream;Lcom/squareup/okhttp/internal/spdy/SpdyStream$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 339
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;-><init>(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)V

    return-void
.end method

.method static synthetic access$200(Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 339
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->finished:Z

    return v0
.end method

.method static synthetic access$202(Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 339
    iput-boolean p1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->finished:Z

    return p1
.end method

.method static synthetic access$400(Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 339
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->closed:Z

    return v0
.end method

.method private checkNotClosed()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 537
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->closed:Z

    if-eqz v0, :cond_0

    .line 538
    new-instance v0, Ljava/io/IOException;

    const-string v1, "stream closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 540
    :cond_0
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    #getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->errorCode:Lcom/squareup/okhttp/internal/spdy/ErrorCode;
    invoke-static {v0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$1000(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/ErrorCode;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 541
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "stream was reset: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    #getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->errorCode:Lcom/squareup/okhttp/internal/spdy/ErrorCode;
    invoke-static {v2}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$1000(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/ErrorCode;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 543
    :cond_1
    return-void
.end method

.method private waitUntilReadable()V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/32 v8, 0xf4240

    const-wide/16 v12, 0x0

    .line 446
    const-wide/16 v4, 0x0

    .line 447
    .local v4, start:J
    const-wide/16 v2, 0x0

    .line 448
    .local v2, remaining:J
    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    #getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->readTimeoutMillis:J
    invoke-static {v1}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$900(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)J

    move-result-wide v6

    cmp-long v1, v6, v12

    if-eqz v1, :cond_0

    .line 449
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v6

    div-long v4, v6, v8

    .line 450
    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    #getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->readTimeoutMillis:J
    invoke-static {v1}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$900(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)J

    move-result-wide v2

    .line 453
    :cond_0
    :goto_0
    :try_start_0
    iget v1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->pos:I

    const/4 v6, -0x1

    if-ne v1, v6, :cond_3

    iget-boolean v1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->finished:Z

    if-nez v1, :cond_3

    iget-boolean v1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->closed:Z

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    #getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->errorCode:Lcom/squareup/okhttp/internal/spdy/ErrorCode;
    invoke-static {v1}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$1000(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/ErrorCode;

    move-result-object v1

    if-nez v1, :cond_3

    .line 454
    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    #getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->readTimeoutMillis:J
    invoke-static {v1}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$900(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)J

    move-result-wide v6

    cmp-long v1, v6, v12

    if-nez v1, :cond_1

    .line 455
    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 463
    :catch_0
    move-exception v0

    .line 464
    .local v0, e:Ljava/lang/InterruptedException;
    new-instance v1, Ljava/io/InterruptedIOException;

    invoke-direct {v1}, Ljava/io/InterruptedIOException;-><init>()V

    throw v1

    .line 456
    .end local v0           #e:Ljava/lang/InterruptedException;
    :cond_1
    cmp-long v1, v2, v12

    if-lez v1, :cond_2

    .line 457
    :try_start_1
    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Object;->wait(J)V

    .line 458
    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    #getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->readTimeoutMillis:J
    invoke-static {v1}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$900(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)J

    move-result-wide v6

    add-long/2addr v6, v4

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    const-wide/32 v10, 0xf4240

    div-long/2addr v8, v10

    sub-long v2, v6, v8

    goto :goto_0

    .line 460
    :cond_2
    new-instance v1, Ljava/net/SocketTimeoutException;

    invoke-direct {v1}, Ljava/net/SocketTimeoutException;-><init>()V

    throw v1
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 466
    :cond_3
    return-void
.end method


# virtual methods
.method public available()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 377
    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    monitor-enter v1

    .line 378
    :try_start_0
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->checkNotClosed()V

    .line 379
    iget v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->pos:I

    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    .line 380
    const/4 v0, 0x0

    monitor-exit v1

    .line 384
    :goto_0
    return v0

    .line 381
    :cond_0
    iget v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->limit:I

    iget v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->pos:I

    if-le v0, v2, :cond_1

    .line 382
    iget v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->limit:I

    iget v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->pos:I

    sub-int/2addr v0, v2

    monitor-exit v1

    goto :goto_0

    .line 386
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 384
    :cond_1
    :try_start_1
    iget v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->limit:I

    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->buffer:[B

    array-length v2, v2

    iget v3, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->pos:I

    sub-int/2addr v2, v3

    add-int/2addr v0, v2

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 529
    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    monitor-enter v1

    .line 530
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->closed:Z

    .line 531
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 532
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 533
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    #calls: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->cancelStreamIfNecessary()V
    invoke-static {v0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$1100(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)V

    .line 534
    return-void

    .line 532
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public read()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 390
    invoke-static {p0}, Lcom/squareup/okhttp/internal/Util;->readSingleByte(Ljava/io/InputStream;)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .locals 6
    .parameter "b"
    .parameter "offset"
    .parameter "count"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 394
    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    monitor-enter v3

    .line 395
    :try_start_0
    array-length v2, p1

    invoke-static {v2, p2, p3}, Lcom/squareup/okhttp/internal/Util;->checkOffsetAndCount(III)V

    .line 396
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->waitUntilReadable()V

    .line 397
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->checkNotClosed()V

    .line 399
    iget v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->pos:I

    if-ne v2, v1, :cond_0

    .line 400
    monitor-exit v3

    .line 436
    :goto_0
    return v1

    .line 403
    :cond_0
    const/4 v1, 0x0

    .line 406
    .local v1, copied:I
    iget v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->limit:I

    iget v4, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->pos:I

    if-gt v2, v4, :cond_1

    .line 407
    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->buffer:[B

    array-length v2, v2

    iget v4, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->pos:I

    sub-int/2addr v2, v4

    invoke-static {p3, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 408
    .local v0, bytesToCopy:I
    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->buffer:[B

    iget v4, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->pos:I

    invoke-static {v2, v4, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 409
    iget v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->pos:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->pos:I

    .line 410
    add-int/2addr v1, v0

    .line 411
    iget v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->pos:I

    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->buffer:[B

    array-length v4, v4

    if-ne v2, v4, :cond_1

    .line 412
    const/4 v2, 0x0

    iput v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->pos:I

    .line 417
    .end local v0           #bytesToCopy:I
    :cond_1
    if-ge v1, p3, :cond_2

    .line 418
    iget v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->limit:I

    iget v4, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->pos:I

    sub-int/2addr v2, v4

    sub-int v4, p3, v1

    invoke-static {v2, v4}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 419
    .restart local v0       #bytesToCopy:I
    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->buffer:[B

    iget v4, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->pos:I

    add-int v5, p2, v1

    invoke-static {v2, v4, p1, v5, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 420
    iget v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->pos:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->pos:I

    .line 421
    add-int/2addr v1, v0

    .line 425
    .end local v0           #bytesToCopy:I
    :cond_2
    iget v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->unacknowledgedBytes:I

    add-int/2addr v2, v1

    iput v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->unacknowledgedBytes:I

    .line 426
    iget v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->unacknowledgedBytes:I

    const v4, 0x8000

    if-lt v2, v4, :cond_3

    .line 427
    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    #getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->connection:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;
    invoke-static {v2}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$800(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    move-result-object v2

    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    #getter for: Lcom/squareup/okhttp/internal/spdy/SpdyStream;->id:I
    invoke-static {v4}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->access$700(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)I

    move-result v4

    iget v5, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->unacknowledgedBytes:I

    invoke-virtual {v2, v4, v5}, Lcom/squareup/okhttp/internal/spdy/SpdyConnection;->writeWindowUpdateLater(II)V

    .line 428
    const/4 v2, 0x0

    iput v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->unacknowledgedBytes:I

    .line 431
    :cond_3
    iget v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->pos:I

    iget v4, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->limit:I

    if-ne v2, v4, :cond_4

    .line 432
    const/4 v2, -0x1

    iput v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->pos:I

    .line 433
    const/4 v2, 0x0

    iput v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->limit:I

    .line 436
    :cond_4
    monitor-exit v3

    goto :goto_0

    .line 437
    .end local v1           #copied:I
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method receive(Ljava/io/InputStream;I)V
    .locals 9
    .parameter "in"
    .parameter "byteCount"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 469
    sget-boolean v6, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->$assertionsDisabled:Z

    if-nez v6, :cond_0

    iget-object v6, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    invoke-static {v6}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6

    .line 471
    :cond_0
    if-nez p2, :cond_1

    .line 526
    :goto_0
    return-void

    .line 480
    :cond_1
    iget-object v7, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    monitor-enter v7

    .line 481
    :try_start_0
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->finished:Z

    .line 482
    .local v0, finished:Z
    iget v5, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->pos:I

    .line 483
    .local v5, pos:I
    iget v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->limit:I

    .line 484
    .local v2, firstNewByte:I
    iget v4, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->limit:I

    .line 485
    .local v4, limit:I
    iget-object v6, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->buffer:[B

    array-length v6, v6

    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->available()I

    move-result v8

    sub-int/2addr v6, v8

    if-le p2, v6, :cond_2

    const/4 v3, 0x1

    .line 486
    .local v3, flowControlError:Z
    :goto_1
    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 489
    if-eqz v3, :cond_3

    .line 490
    int-to-long v6, p2

    invoke-static {p1, v6, v7}, Lcom/squareup/okhttp/internal/Util;->skipByReading(Ljava/io/InputStream;J)J

    .line 491
    iget-object v6, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    sget-object v7, Lcom/squareup/okhttp/internal/spdy/ErrorCode;->FLOW_CONTROL_ERROR:Lcom/squareup/okhttp/internal/spdy/ErrorCode;

    invoke-virtual {v6, v7}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->closeLater(Lcom/squareup/okhttp/internal/spdy/ErrorCode;)V

    goto :goto_0

    .line 485
    .end local v3           #flowControlError:Z
    :cond_2
    const/4 v3, 0x0

    goto :goto_1

    .line 486
    .end local v0           #finished:Z
    .end local v2           #firstNewByte:I
    .end local v4           #limit:I
    .end local v5           #pos:I
    :catchall_0
    move-exception v6

    :try_start_1
    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v6

    .line 496
    .restart local v0       #finished:Z
    .restart local v2       #firstNewByte:I
    .restart local v3       #flowControlError:Z
    .restart local v4       #limit:I
    .restart local v5       #pos:I
    :cond_3
    if-eqz v0, :cond_4

    .line 497
    int-to-long v6, p2

    invoke-static {p1, v6, v7}, Lcom/squareup/okhttp/internal/Util;->skipByReading(Ljava/io/InputStream;J)J

    goto :goto_0

    .line 504
    :cond_4
    if-ge v5, v4, :cond_5

    .line 505
    iget-object v6, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->buffer:[B

    array-length v6, v6

    sub-int/2addr v6, v4

    invoke-static {p2, v6}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 506
    .local v1, firstCopyCount:I
    iget-object v6, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->buffer:[B

    invoke-static {p1, v6, v4, v1}, Lcom/squareup/okhttp/internal/Util;->readFully(Ljava/io/InputStream;[BII)V

    .line 507
    add-int/2addr v4, v1

    .line 508
    sub-int/2addr p2, v1

    .line 509
    iget-object v6, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->buffer:[B

    array-length v6, v6

    if-ne v4, v6, :cond_5

    .line 510
    const/4 v4, 0x0

    .line 513
    .end local v1           #firstCopyCount:I
    :cond_5
    if-lez p2, :cond_6

    .line 514
    iget-object v6, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->buffer:[B

    invoke-static {p1, v6, v4, p2}, Lcom/squareup/okhttp/internal/Util;->readFully(Ljava/io/InputStream;[BII)V

    .line 515
    add-int/2addr v4, p2

    .line 518
    :cond_6
    iget-object v7, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    monitor-enter v7

    .line 520
    :try_start_2
    iput v4, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->limit:I

    .line 521
    iget v6, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->pos:I

    const/4 v8, -0x1

    if-ne v6, v8, :cond_7

    .line 522
    iput v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->pos:I

    .line 523
    iget-object v6, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataInputStream;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    invoke-virtual {v6}, Ljava/lang/Object;->notifyAll()V

    .line 525
    :cond_7
    monitor-exit v7

    goto :goto_0

    :catchall_1
    move-exception v6

    monitor-exit v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v6
.end method

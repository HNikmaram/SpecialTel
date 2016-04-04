.class final Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;
.super Ljava/lang/Object;
.source "Http20Draft04.java"

# interfaces
.implements Lcom/squareup/okhttp/internal/spdy/FrameReader;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/spdy/Http20Draft04;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Reader"
.end annotation


# instance fields
.field private final in:Ljava/io/DataInputStream;


# direct methods
.method constructor <init>(Ljava/io/InputStream;)V
    .locals 1
    .parameter "in"

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Ljava/io/DataInputStream;

    invoke-direct {v0, p1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->in:Ljava/io/DataInputStream;

    .line 56
    return-void
.end method

.method private static varargs ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;
    .locals 2
    .parameter "message"
    .parameter "args"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 191
    new-instance v0, Ljava/io/IOException;

    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private readData(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;III)V
    .locals 2
    .parameter "handler"
    .parameter "flags"
    .parameter "length"
    .parameter "streamId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 111
    and-int/lit8 v1, p2, 0x1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    .line 112
    .local v0, inFinished:Z
    :goto_0
    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->in:Ljava/io/DataInputStream;

    invoke-interface {p1, v0, p4, v1, p3}, Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;->data(ZILjava/io/InputStream;I)V

    .line 113
    return-void

    .line 111
    .end local v0           #inFinished:Z
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private readGoAway(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;III)V
    .locals 8
    .parameter "handler"
    .parameter "flags"
    .parameter "length"
    .parameter "streamId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v7, 0x0

    .line 167
    const/16 v4, 0x8

    if-ge p3, v4, :cond_0

    const-string v4, "TYPE_GOAWAY length < 8: %s"

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v4

    throw v4

    .line 168
    :cond_0
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->in:Ljava/io/DataInputStream;

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readInt()I

    move-result v2

    .line 169
    .local v2, lastStreamId:I
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->in:Ljava/io/DataInputStream;

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readInt()I

    move-result v1

    .line 170
    .local v1, errorCodeInt:I
    add-int/lit8 v3, p3, -0x8

    .line 171
    .local v3, opaqueDataLength:I
    invoke-static {v1}, Lcom/squareup/okhttp/internal/spdy/ErrorCode;->fromHttp2(I)Lcom/squareup/okhttp/internal/spdy/ErrorCode;

    move-result-object v0

    .line 172
    .local v0, errorCode:Lcom/squareup/okhttp/internal/spdy/ErrorCode;
    if-nez v0, :cond_1

    .line 173
    const-string v4, "TYPE_RST_STREAM unexpected error code: %d"

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v4

    throw v4

    .line 175
    :cond_1
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->in:Ljava/io/DataInputStream;

    int-to-long v6, v3

    invoke-static {v4, v6, v7}, Lcom/squareup/okhttp/internal/Util;->skipByReading(Ljava/io/InputStream;J)J

    move-result-wide v4

    int-to-long v6, v3

    cmp-long v4, v4, v6

    if-eqz v4, :cond_2

    .line 176
    new-instance v4, Ljava/io/IOException;

    const-string v5, "TYPE_GOAWAY opaque data was truncated"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 178
    :cond_2
    invoke-interface {p1, v2, v0}, Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;->goAway(ILcom/squareup/okhttp/internal/spdy/ErrorCode;)V

    .line 179
    return-void
.end method

.method private readPing(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;III)V
    .locals 7
    .parameter "handler"
    .parameter "flags"
    .parameter "length"
    .parameter "streamId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 157
    const/16 v4, 0x8

    if-eq p3, v4, :cond_0

    const-string v4, "TYPE_PING length != 8: %s"

    new-array v5, v2, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v3

    invoke-static {v4, v5}, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v3

    throw v3

    .line 158
    :cond_0
    if-eqz p4, :cond_1

    const-string v4, "TYPE_PING streamId != 0"

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v4, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v3

    throw v3

    .line 159
    :cond_1
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->in:Ljava/io/DataInputStream;

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readInt()I

    move-result v0

    .line 160
    .local v0, payload1:I
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->in:Ljava/io/DataInputStream;

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readInt()I

    move-result v1

    .line 161
    .local v1, payload2:I
    and-int/lit8 v4, p2, 0x1

    if-eqz v4, :cond_2

    .line 162
    .local v2, reply:Z
    :goto_0
    invoke-interface {p1, v2, v0, v1}, Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;->ping(ZII)V

    .line 163
    return-void

    .end local v2           #reply:Z
    :cond_2
    move v2, v3

    .line 161
    goto :goto_0
.end method

.method private readPriority(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;III)V
    .locals 6
    .parameter "handler"
    .parameter "flags"
    .parameter "length"
    .parameter "streamId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 117
    const/4 v2, 0x4

    if-eq p3, v2, :cond_0

    const-string v2, "TYPE_PRIORITY length: %d != 4"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 118
    :cond_0
    if-nez p4, :cond_1

    const-string v2, "TYPE_PRIORITY streamId == 0"

    new-array v3, v5, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 119
    :cond_1
    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->in:Ljava/io/DataInputStream;

    invoke-virtual {v2}, Ljava/io/DataInputStream;->readInt()I

    move-result v1

    .line 121
    .local v1, w1:I
    const v2, 0x7fffffff

    and-int v0, v1, v2

    .line 122
    .local v0, priority:I
    invoke-interface {p1, p4, v0}, Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;->priority(II)V

    .line 123
    return-void
.end method

.method private readPushPromise(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;III)V
    .locals 0
    .parameter "handler"
    .parameter "flags"
    .parameter "length"
    .parameter "streamId"

    .prologue
    .line 154
    return-void
.end method

.method private readRstStream(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;III)V
    .locals 6
    .parameter "handler"
    .parameter "flags"
    .parameter "length"
    .parameter "streamId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v5, 0x0

    .line 127
    const/4 v2, 0x4

    if-eq p3, v2, :cond_0

    const-string v2, "TYPE_RST_STREAM length: %d != 4"

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 128
    :cond_0
    if-nez p4, :cond_1

    const-string v2, "TYPE_RST_STREAM streamId == 0"

    new-array v3, v5, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 129
    :cond_1
    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->in:Ljava/io/DataInputStream;

    invoke-virtual {v2}, Ljava/io/DataInputStream;->readInt()I

    move-result v1

    .line 130
    .local v1, errorCodeInt:I
    invoke-static {v1}, Lcom/squareup/okhttp/internal/spdy/ErrorCode;->fromHttp2(I)Lcom/squareup/okhttp/internal/spdy/ErrorCode;

    move-result-object v0

    .line 131
    .local v0, errorCode:Lcom/squareup/okhttp/internal/spdy/ErrorCode;
    if-nez v0, :cond_2

    .line 132
    const-string v2, "TYPE_RST_STREAM unexpected error code: %d"

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 134
    :cond_2
    invoke-interface {p1, p4, v0}, Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;->rstStream(ILcom/squareup/okhttp/internal/spdy/ErrorCode;)V

    .line 135
    return-void
.end method

.method private readSettings(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;III)V
    .locals 9
    .parameter "handler"
    .parameter "flags"
    .parameter "length"
    .parameter "streamId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 139
    rem-int/lit8 v5, p3, 0x8

    if-eqz v5, :cond_0

    const-string v5, "TYPE_SETTINGS length %% 8 != 0: %s"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-static {v5, v6}, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v5

    throw v5

    .line 140
    :cond_0
    if-eqz p4, :cond_1

    const-string v5, "TYPE_SETTINGS streamId != 0"

    new-array v6, v8, [Ljava/lang/Object;

    invoke-static {v5, v6}, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->ioException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/IOException;

    move-result-object v5

    throw v5

    .line 141
    :cond_1
    new-instance v2, Lcom/squareup/okhttp/internal/spdy/Settings;

    invoke-direct {v2}, Lcom/squareup/okhttp/internal/spdy/Settings;-><init>()V

    .line 142
    .local v2, settings:Lcom/squareup/okhttp/internal/spdy/Settings;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, p3, :cond_2

    .line 143
    iget-object v5, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->in:Ljava/io/DataInputStream;

    invoke-virtual {v5}, Ljava/io/DataInputStream;->readInt()I

    move-result v4

    .line 144
    .local v4, w1:I
    iget-object v5, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->in:Ljava/io/DataInputStream;

    invoke-virtual {v5}, Ljava/io/DataInputStream;->readInt()I

    move-result v3

    .line 146
    .local v3, value:I
    const v5, 0xffffff

    and-int v1, v4, v5

    .line 147
    .local v1, id:I
    invoke-virtual {v2, v1, v8, v3}, Lcom/squareup/okhttp/internal/spdy/Settings;->set(III)V

    .line 142
    add-int/lit8 v0, v0, 0x8

    goto :goto_0

    .line 149
    .end local v1           #id:I
    .end local v3           #value:I
    .end local v4           #w1:I
    :cond_2
    invoke-interface {p1, v8, v2}, Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;->settings(ZLcom/squareup/okhttp/internal/spdy/Settings;)V

    .line 150
    return-void
.end method

.method private readWindowUpdate(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;III)V
    .locals 4
    .parameter "handler"
    .parameter "flags"
    .parameter "length"
    .parameter "streamId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 183
    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->in:Ljava/io/DataInputStream;

    invoke-virtual {v3}, Ljava/io/DataInputStream;->readInt()I

    move-result v1

    .line 185
    .local v1, w1:I
    const v3, 0x7fffffff

    and-int v2, v1, v3

    .line 186
    .local v2, windowSizeIncrement:I
    and-int/lit8 v3, p2, 0x1

    if-eqz v3, :cond_0

    const/4 v0, 0x1

    .line 187
    .local v0, endFlowControl:Z
    :goto_0
    invoke-interface {p1, p4, v2, v0}, Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;->windowUpdate(IIZ)V

    .line 188
    return-void

    .line 186
    .end local v0           #endFlowControl:Z
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 195
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->in:Ljava/io/DataInputStream;

    invoke-virtual {v0}, Ljava/io/DataInputStream;->close()V

    .line 196
    return-void
.end method

.method public nextFrame(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;)Z
    .locals 9
    .parameter "handler"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    .line 61
    :try_start_0
    iget-object v8, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->in:Ljava/io/DataInputStream;

    invoke-virtual {v8}, Ljava/io/DataInputStream;->readInt()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    .line 65
    .local v5, w1:I
    iget-object v8, p0, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->in:Ljava/io/DataInputStream;

    invoke-virtual {v8}, Ljava/io/DataInputStream;->readInt()I

    move-result v6

    .line 67
    .local v6, w2:I
    const v8, 0xffff

    and-int v2, v5, v8

    .line 68
    .local v2, length:I
    const/high16 v8, 0xff

    and-int/2addr v8, v5

    shr-int/lit8 v4, v8, 0x10

    .line 69
    .local v4, type:I
    const/high16 v8, -0x100

    and-int/2addr v8, v5

    shr-int/lit8 v1, v8, 0x18

    .line 71
    .local v1, flags:I
    const v8, 0x7fffffff

    and-int v3, v6, v8

    .line 73
    .local v3, streamId:I
    packed-switch v4, :pswitch_data_0

    .line 107
    :pswitch_0
    new-instance v7, Ljava/lang/UnsupportedOperationException;

    const-string v8, "TODO"

    invoke-direct {v7, v8}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 62
    .end local v1           #flags:I
    .end local v2           #length:I
    .end local v3           #streamId:I
    .end local v4           #type:I
    .end local v5           #w1:I
    .end local v6           #w2:I
    :catch_0
    move-exception v0

    .line 63
    .local v0, e:Ljava/io/IOException;
    const/4 v7, 0x0

    .line 104
    .end local v0           #e:Ljava/io/IOException;
    :goto_0
    return v7

    .line 75
    .restart local v1       #flags:I
    .restart local v2       #length:I
    .restart local v3       #streamId:I
    .restart local v4       #type:I
    .restart local v5       #w1:I
    .restart local v6       #w2:I
    :pswitch_1
    invoke-direct {p0, p1, v1, v2, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->readData(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;III)V

    goto :goto_0

    .line 79
    :pswitch_2
    invoke-direct {p0, p1, v1, v2, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->readPriority(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;III)V

    goto :goto_0

    .line 83
    :pswitch_3
    invoke-direct {p0, p1, v1, v2, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->readRstStream(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;III)V

    goto :goto_0

    .line 87
    :pswitch_4
    invoke-direct {p0, p1, v1, v2, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->readSettings(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;III)V

    goto :goto_0

    .line 91
    :pswitch_5
    invoke-direct {p0, p1, v1, v2, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->readPushPromise(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;III)V

    goto :goto_0

    .line 95
    :pswitch_6
    invoke-direct {p0, p1, v1, v2, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->readPing(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;III)V

    goto :goto_0

    .line 99
    :pswitch_7
    invoke-direct {p0, p1, v1, v2, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->readGoAway(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;III)V

    goto :goto_0

    .line 103
    :pswitch_8
    invoke-direct {p0, p1, v1, v2, v3}, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;->readWindowUpdate(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;III)V

    goto :goto_0

    .line 73
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_0
        :pswitch_8
    .end packed-switch
.end method

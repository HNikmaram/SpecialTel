.class final Lcom/squareup/okhttp/internal/spdy/Http20Draft04;
.super Ljava/lang/Object;
.source "Http20Draft04.java"

# interfaces
.implements Lcom/squareup/okhttp/internal/spdy/Variant;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Writer;,
        Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 199
    return-void
.end method


# virtual methods
.method public newReader(Ljava/io/InputStream;Z)Lcom/squareup/okhttp/internal/spdy/FrameReader;
    .locals 1
    .parameter "in"
    .parameter "client"

    .prologue
    .line 44
    new-instance v0, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;

    invoke-direct {v0, p1}, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Reader;-><init>(Ljava/io/InputStream;)V

    return-object v0
.end method

.method public newWriter(Ljava/io/OutputStream;Z)Lcom/squareup/okhttp/internal/spdy/FrameWriter;
    .locals 1
    .parameter "out"
    .parameter "client"

    .prologue
    .line 48
    new-instance v0, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Writer;

    invoke-direct {v0, p1}, Lcom/squareup/okhttp/internal/spdy/Http20Draft04$Writer;-><init>(Ljava/io/OutputStream;)V

    return-object v0
.end method

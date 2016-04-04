.class final Lcom/squareup/okhttp/internal/spdy/Settings;
.super Ljava/lang/Object;
.source "Settings.java"


# instance fields
.field private persistValue:I

.field private persisted:I

.field private set:I

.field private final values:[I


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    const/16 v0, 0xa

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->values:[I

    return-void
.end method


# virtual methods
.method flags(I)I
    .locals 2
    .parameter "id"

    .prologue
    .line 104
    const/4 v0, 0x0

    .line 105
    .local v0, result:I
    invoke-virtual {p0, p1}, Lcom/squareup/okhttp/internal/spdy/Settings;->isPersisted(I)Z

    move-result v1

    if-eqz v1, :cond_0

    or-int/lit8 v0, v0, 0x2

    .line 106
    :cond_0
    invoke-virtual {p0, p1}, Lcom/squareup/okhttp/internal/spdy/Settings;->persistValue(I)Z

    move-result v1

    if-eqz v1, :cond_1

    or-int/lit8 v0, v0, 0x1

    .line 107
    :cond_1
    return v0
.end method

.method get(I)I
    .locals 1
    .parameter "id"

    .prologue
    .line 99
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->values:[I

    aget v0, v0, p1

    return v0
.end method

.method getInitialWindowSize(I)I
    .locals 3
    .parameter "defaultValue"

    .prologue
    .line 146
    const/16 v0, 0x80

    .line 147
    .local v0, bit:I
    iget v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->set:I

    and-int/2addr v1, v0

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->values:[I

    const/4 v2, 0x7

    aget p1, v1, v2

    .end local p1
    :cond_0
    return p1
.end method

.method isPersisted(I)Z
    .locals 3
    .parameter "id"

    .prologue
    const/4 v1, 0x1

    .line 173
    shl-int v0, v1, p1

    .line 174
    .local v0, bit:I
    iget v2, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->persisted:I

    and-int/2addr v2, v0

    if-eqz v2, :cond_0

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method isSet(I)Z
    .locals 3
    .parameter "id"

    .prologue
    const/4 v1, 0x1

    .line 93
    shl-int v0, v1, p1

    .line 94
    .local v0, bit:I
    iget v2, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->set:I

    and-int/2addr v2, v0

    if-eqz v2, :cond_0

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method merge(Lcom/squareup/okhttp/internal/spdy/Settings;)V
    .locals 3
    .parameter "other"

    .prologue
    .line 182
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    const/16 v1, 0xa

    if-ge v0, v1, :cond_1

    .line 183
    invoke-virtual {p1, v0}, Lcom/squareup/okhttp/internal/spdy/Settings;->isSet(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 182
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 184
    :cond_0
    invoke-virtual {p1, v0}, Lcom/squareup/okhttp/internal/spdy/Settings;->flags(I)I

    move-result v1

    invoke-virtual {p1, v0}, Lcom/squareup/okhttp/internal/spdy/Settings;->get(I)I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/squareup/okhttp/internal/spdy/Settings;->set(III)V

    goto :goto_1

    .line 186
    :cond_1
    return-void
.end method

.method persistValue(I)Z
    .locals 3
    .parameter "id"

    .prologue
    const/4 v1, 0x1

    .line 167
    shl-int v0, v1, p1

    .line 168
    .local v0, bit:I
    iget v2, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->persistValue:I

    and-int/2addr v2, v0

    if-eqz v2, :cond_0

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method set(III)V
    .locals 3
    .parameter "id"
    .parameter "idFlags"
    .parameter "value"

    .prologue
    .line 71
    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->values:[I

    array-length v1, v1

    if-lt p1, v1, :cond_0

    .line 89
    :goto_0
    return-void

    .line 75
    :cond_0
    const/4 v1, 0x1

    shl-int v0, v1, p1

    .line 76
    .local v0, bit:I
    iget v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->set:I

    or-int/2addr v1, v0

    iput v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->set:I

    .line 77
    and-int/lit8 v1, p2, 0x1

    if-eqz v1, :cond_1

    .line 78
    iget v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->persistValue:I

    or-int/2addr v1, v0

    iput v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->persistValue:I

    .line 82
    :goto_1
    and-int/lit8 v1, p2, 0x2

    if-eqz v1, :cond_2

    .line 83
    iget v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->persisted:I

    or-int/2addr v1, v0

    iput v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->persisted:I

    .line 88
    :goto_2
    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->values:[I

    aput p3, v1, p1

    goto :goto_0

    .line 80
    :cond_1
    iget v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->persistValue:I

    xor-int/lit8 v2, v0, -0x1

    and-int/2addr v1, v2

    iput v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->persistValue:I

    goto :goto_1

    .line 85
    :cond_2
    iget v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->persisted:I

    xor-int/lit8 v2, v0, -0x1

    and-int/2addr v1, v2

    iput v1, p0, Lcom/squareup/okhttp/internal/spdy/Settings;->persisted:I

    goto :goto_2
.end method

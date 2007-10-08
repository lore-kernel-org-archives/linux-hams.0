From: Dave Platt <dplatt@radagast.org>
Subject: Re: AX.25 Kernel - problem - ax25_sendmsg returns EMSGSIZE !
Date: Mon, 08 Oct 2007 16:10:18 -0700
Message-ID: <470AB8DA.8020301@radagast.org>
References: <47093A4E.5040409@hamradio.hr> <20071008082900.GB24782@cloud.net.au> <470A1035.5070900@hamradio.hr> <20071008134447.GA30451@cloud.net.au> <470A4456.6000703@hamradio.hr> <20071008223646.GC15879@cloud.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20071008223646.GC15879@cloud.net.au>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


>> What I want is to have SOCK_SEQPACKET reliable, accepting any amount of
>> data and on write returning number of bytes accepted. I do not care much
>> if fragmentation will take place or not, but currently I do not see any
>> reason why not.
> 
> I think you want SOCK_STREAM. You just want a byte stream which is
> arbitrarily split into packets; SOCK_DGRAM and SEQPACKET are intended
> for applications which care about packet boundaries.
> 
> Since SOCK_STREAM is apparently not so different from SOCK_SEQPACKET,
> perhaps you could implement it for AX.25?

I agree, that's probably the cleanest approach, and it ought not to be
very much work at all within the AX.25 layer.

On reading through the various man pages and looking at the code, I'm
frankly not sure why the Linux AX.25 implemented SOCK_SEQPACKET and
not SOCK_STREAM.  It looks to me as if the only substantial differences
between these two connection types are:

-  SOCK_STREAM is intended to allow writes of arbitrary amounts of data,
    and does not guarantee that the reader of the data received it in
    pieces whose boundaries correspond to those given by the writer.
    All of the data is guaranteed to be delivered, reliably and in
    sequence, or the connection will be broken.

-  SOCK_SEQPACKET is *not* defined to allow writes of arbitrarily
    large sizes... it's specifically defined to limit writes to a
    fixed maximum size (with the maximum size being connection-dependent,
    apparently).  Packets are guaranteed to get through the connection,
    reliably and in sequence, and the reader is guaranteed that each
    read will return data from precisely one sender-packet (i.e. if
    the network fragments them, the fragments must be reassembled
    before any of the data can be delivered).  If the reader requests
    less data than is present in an incoming packet, the reader gets
    only the amount asked for, and the remainder is discarded (!)
    rather than being delivered during a subsequent read.

These two methods use the same APIs, and should both be able to
run over AX.25 I packets.

I *think* that adding SEQ_STREAM to the AX.25 code, in addition to
SEQ_SEQPACKET in each of the places that it appears, would do most of
the work in adding support for this protocol.

As far as re-enabling packet fragmentation in the AX.25 packet
layer... seems to me that it would be legitimate to do so as long
as the lower-level code does the fragmentation properly (i.e.
breaking the write into small-enough chunks to fit within the
path's maximum frame length limit) and as long as the receiving
code does the reassembly properly.

Any app which uses SOCK_SEQPACKET, and wants to be able to write
arbitrarily-large amounts of data, had better be *very* sure that
its peer is issuing reads which are large enough to swallow the
largest-possible write!  Otherwise, data will be lost (according
to the semantics for SOCK_SEQPACKET).

That's why I'd favor using SOCK_STREAM for AX.25 connections (just
as TCP uses SOCK_STREAM) - there's no requirement with SOCK_STREAM
that the sender and receiver coordinate on the size of the largest
write operation.  This would seem to ease the software compatibility
problem quite a bit!




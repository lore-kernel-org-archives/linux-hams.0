From: Dave Platt <dplatt@radagast.org>
Subject: Re: AX.25 Kernel - problem - ax25_sendmsg returns EMSGSIZE !
Date: Mon, 08 Oct 2007 08:51:52 -0700
Message-ID: <courier.470A5218.00002492@radagast.org>
References: <47093A4E.5040409@hamradio.hr>
 <20071008082900.GB24782@cloud.net.au> <470A1035.5070900@hamradio.hr>
 <20071008134447.GA30451@cloud.net.au> <470A4456.6000703@hamradio.hr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <470A4456.6000703@hamradio.hr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org, 9a4gl@hamradio.hr

> Hm, as I see AX.25 sockets supports SOCK_DGRAM, SOCK_SEQPACKET and
> SOCK_RAW. I am not talking about raw and I am not using raw socket.
> IMHO, users of raw sockets should be aware of MTU and I would not
> fragment raw sockets in kernel.
>
> What I want is to have SOCK_SEQPACKET reliable, accepting any amount of
> data and on write returning number of bytes accepted. I do not care much
> if fragmentation will take place or not, but currently I do not see any
> reason why not.

As I understand it, SOCK_SEQPACKET is intended to be used in protocols
where the packet-to-packet boundary is significant - that is, each
packet is supposed to be interpreted as a whole entity, and the packet
length is significant to the application.  It is probably not a transport 
method which should be fragmented by the lower layers of the protocol
stack, unless the stack can reassemble the fragments into a single
packet of the correct boundary and size before presenting it to the
application at the receiving end.  For the same reason, it's probably
appropriate for the kernel to return a "size exceeds MTU error",
rather than writing as much as it can and returning MTU to the
application, since this would fragment the packet and thus violate the
intended semantics of SOCK_SEQPACKET.

It is more usual to use SOCK_STREAM to establish connections, in which
you wish to write arbitrary amounts of data across the connection, and
don't care whether the data is received in precisely the same
chunk-sizes as it was written.  Fragmentation of SOCK_STREAM data is
fine... but it's probably best done by the protocol layers up above
the raw-packet level, by the same code which does flow control and
packet acknowledgement.

Applications which wish to use SOCK_SEQPACKET rather than SOCK_STREAM,
but wish to write arbitrary amounts of data... well, I'm not certain
why they would wish to do this, but if they do they should probably
query the MTU value out of the network interface/stack, and limit
their write() calls to that amount of data, just as they would have to
do if they were using SOCK_DGRAM.

That's my $.02 worth :-)


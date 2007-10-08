From: Tihomir Heidelberg - 9a4gl <9a4gl@hamradio.hr>
Subject: Re: AX.25 Kernel - problem - ax25_sendmsg returns EMSGSIZE !
Date: Mon, 08 Oct 2007 21:38:25 +0200
Message-ID: <470A8731.3040109@hamradio.hr>
References: <47093A4E.5040409@hamradio.hr> <20071008082900.GB24782@cloud.net.au> <470A1035.5070900@hamradio.hr> <20071008134447.GA30451@cloud.net.au> <470A4456.6000703@hamradio.hr> <courier.470A5218.00002492@radagast.org>
Reply-To: 9a4gl@hamradio.hr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <courier.470A5218.00002492@radagast.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dave Platt <dplatt@radagast.org>
Cc: linux-hams@vger.kernel.org

Hi,

Dave Platt wrote:
> It is more usual to use SOCK_STREAM to establish connections, in which
> you wish to write arbitrary amounts of data across the connection, and
> don't care whether the data is received in precisely the same
> chunk-sizes as it was written.  Fragmentation of SOCK_STREAM data is
> fine... but it's probably best done by the protocol layers up above
> the raw-packet level, by the same code which does flow control and
> packet acknowledgement.
>   
Yes, but we do not have SOCK_STREAM for AX.25 :-(
> Applications which wish to use SOCK_SEQPACKET rather than SOCK_STREAM,
> but wish to write arbitrary amounts of data... well, I'm not certain
> why they would wish to do this, but if they do they should probably
> query the MTU value out of the network interface/stack, and limit
> their write() calls to that amount of data, just as they would have to
> do if they were using SOCK_DGRAM.
>   
I think that in AX.25 world there is no real situation for
SOCK_SEQPACKET, because any node in chain may have lower MTU and can
fragment your frame and you do not have any guarantee that packet will
reach end as you sent it. So you just define what will be in first hop.
Actually, you always have stream.

Anyway, why checking MTU, why not PACLEN ? Because PACLEN is the one
which limits maximum length of frame, not MTU ! Right ?

73 de Tihomir Heidelberg, 9a4gl

From: Tihomir Heidelberg - 9a4gl <9a4gl@hamradio.hr>
Subject: Re: AX.25 Kernel - problem - ax25_sendmsg returns EMSGSIZE !
Date: Mon, 08 Oct 2007 16:53:10 +0200
Message-ID: <470A4456.6000703@hamradio.hr>
References: <47093A4E.5040409@hamradio.hr> <20071008082900.GB24782@cloud.net.au> <470A1035.5070900@hamradio.hr> <20071008134447.GA30451@cloud.net.au>
Reply-To: 9a4gl@hamradio.hr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20071008134447.GA30451@cloud.net.au>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi,

Hamish Moffatt wrote:
> socket(7) doesn't make any distinction between SOCK_DGRAM and
> SOCK_SEQPACKET with regard to fragmentation. SOCK_SEQPACKET just adds
> reliability and order.
>
>   

Hm, socket(2) or (7) ? Both documents do not mention fragmentation. But,
according to socket(2), difference between SOCK_STREAM and
SOCK_SEQPACKET is that first one supports out-of-band data which is not
(easy) doable in AX.25 world. So, it is ok to use SOCK_SEQPACKET for
what we/I call AX.25 connection.
> Yes, except that it doesn't exactly make sense to have streams on a raw
> socket (which is I guess why they are not supported for AX.25). Streams
> would be implemented by the transport layer and above, which is above
> what a raw socket provides.
>   

Hm, as I see AX.25 sockets supports SOCK_DGRAM, SOCK_SEQPACKET and
SOCK_RAW. I am not talking about raw and I am not using raw socket.
IMHO, users of raw sockets should be aware of MTU and I would not
fragment raw sockets in kernel.

What I want is to have SOCK_SEQPACKET reliable, accepting any amount of
data and on write returning number of bytes accepted. I do not care much
if fragmentation will take place or not, but currently I do not see any
reason why not.

73 de Tihomir Heidelberg, 9a4gl


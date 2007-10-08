From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: AX.25 Kernel - problem - ax25_sendmsg returns EMSGSIZE !
Date: Tue, 9 Oct 2007 08:36:46 +1000
Message-ID: <20071008223646.GC15879@cloud.net.au>
References: <47093A4E.5040409@hamradio.hr> <20071008082900.GB24782@cloud.net.au> <470A1035.5070900@hamradio.hr> <20071008134447.GA30451@cloud.net.au> <470A4456.6000703@hamradio.hr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <470A4456.6000703@hamradio.hr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Mon, Oct 08, 2007 at 04:53:10PM +0200, Tihomir Heidelberg - 9a4gl wrote:
> Hi,
> 
> Hamish Moffatt wrote:
> > socket(7) doesn't make any distinction between SOCK_DGRAM and
> > SOCK_SEQPACKET with regard to fragmentation. SOCK_SEQPACKET just adds
> > reliability and order.
> 
> Hm, socket(2) or (7) ? Both documents do not mention fragmentation. But,
> according to socket(2), difference between SOCK_STREAM and
> SOCK_SEQPACKET is that first one supports out-of-band data which is not
> (easy) doable in AX.25 world. So, it is ok to use SOCK_SEQPACKET for
> what we/I call AX.25 connection.

Yes I meant socket(2).

> What I want is to have SOCK_SEQPACKET reliable, accepting any amount of
> data and on write returning number of bytes accepted. I do not care much
> if fragmentation will take place or not, but currently I do not see any
> reason why not.

I think you want SOCK_STREAM. You just want a byte stream which is
arbitrarily split into packets; SOCK_DGRAM and SEQPACKET are intended
for applications which care about packet boundaries.

Since SOCK_STREAM is apparently not so different from SOCK_SEQPACKET,
perhaps you could implement it for AX.25?

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>

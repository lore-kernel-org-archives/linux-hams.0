From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: AX.25 Kernel - problem - ax25_sendmsg returns EMSGSIZE !
Date: Mon, 8 Oct 2007 18:29:00 +1000
Message-ID: <20071008082900.GB24782@cloud.net.au>
References: <47093A4E.5040409@hamradio.hr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <47093A4E.5040409@hamradio.hr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Sun, Oct 07, 2007 at 09:58:06PM +0200, Tihomir Heidelberg - 9a4gl wrote:
> Using kernel 2.6.21.6 here. If you write to AX.25 socket bytes more then
> MTU, write will return -1 and errno will be set to 90 (EMSGSIZE =
> [Message too long]).
> 
> This happend in net/ax25/af_ax25.c in function ax25_sendmsg at:
> 
>         if (len > ax25->ax25_dev->dev->mtu) {
>                 err = -EMSGSIZE;
>                 goto out;
>         }
> 
> Old kernels, 2.2.x and 2.4.x accepted write with data length larger then
> MTU and for SOCK_SEQPACKET sockets the ax25_output function did the
> fragmentation job.

Is it sensible to fragment raw AX.25 packets? I think that would depend
on what the next layer protocol is. 

For APRS, each packet is significant (ie it's datagram rather than
stream oriented) so fragmenting a packet would not be correct. For IP
it's obviously allowed although you wouldn't be using an AX.25 socket
then.

> By the way, this problem is having OpenBCM V1.07b3, very popular BBS
> software (http://dnx274.dyndns.org/baybox/) which writes as much data as
> it prepared.

In your application (the other end of call, for example?) the packets
may just be a stream and therefore fragmenting at arbitrary points would
be ok. Although SOCK_SEQPACKET doesn't sound right in that case.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>

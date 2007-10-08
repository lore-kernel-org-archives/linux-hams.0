From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: AX.25 Kernel - problem - ax25_sendmsg returns EMSGSIZE !
Date: Mon, 8 Oct 2007 23:44:47 +1000
Message-ID: <20071008134447.GA30451@cloud.net.au>
References: <47093A4E.5040409@hamradio.hr> <20071008082900.GB24782@cloud.net.au> <470A1035.5070900@hamradio.hr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <470A1035.5070900@hamradio.hr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Mon, Oct 08, 2007 at 01:10:45PM +0200, Tihomir Heidelberg - 9a4gl wrote:
> Hi,
> 
> Hamish Moffatt wrote:
> > On Sun, Oct 07, 2007 at 09:58:06PM +0200, Tihomir Heidelberg - 9a4gl wrote:
> >   
> >> Using kernel 2.6.21.6 here. If you write to AX.25 socket bytes more then
> >> MTU, write will return -1 and errno will be set to 90 (EMSGSIZE =
> >> [Message too long]).
> >>     
> > Is it sensible to fragment raw AX.25 packets? I think that would depend
> > on what the next layer protocol is. 
> > For APRS, each packet is significant (ie it's datagram rather than stream oriented) so fragmenting a packet would not be correct. 
> >   
> No, only SOCK_SEQPACKET should be fragmented. APRS is using SOCK_DGRAM
> and in most cases SOCK_DGRAM should not be fragmented, but I think we

socket(7) doesn't make any distinction between SOCK_DGRAM and
SOCK_SEQPACKET with regard to fragmentation. SOCK_SEQPACKET just adds
reliability and order.

> Hm, you mean I should use SOCK_STREAM ? As I see that kind of socket is
> not supported in AX.25 stack, right ? When it would be, then it makes
> sense to fragment for SOCK_STREAM and return EMSGSIZE for SOCK_SEQPACKET.

Yes, except that it doesn't exactly make sense to have streams on a raw
socket (which is I guess why they are not supported for AX.25). Streams
would be implemented by the transport layer and above, which is above
what a raw socket provides.

> Hamish Moffatt wrote:
> > The change seems to be requested here:
> > http://oss.sgi.com/archives/netdev/2004-01/msg00097.html
> >
> > with the rationale that there is no fragmentation logic, as I suggested
> > in my other followup (which hasn't arrived back here yet...)
> But, we do have fragmentation logic in ax25_output.

So I see. I could not turn up a standard for this on Google. Perhaps I
am wrong.. Ralf seems to agree with you and so I defer to his judgement.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>

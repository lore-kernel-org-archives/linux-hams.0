From: Tihomir Heidelberg - 9a4gl <9a4gl@hamradio.hr>
Subject: Re: AX.25 Kernel - problem - ax25_sendmsg returns EMSGSIZE !
Date: Mon, 08 Oct 2007 13:10:45 +0200
Message-ID: <470A1035.5070900@hamradio.hr>
References: <47093A4E.5040409@hamradio.hr> <20071008082900.GB24782@cloud.net.au>
Reply-To: 9a4gl@hamradio.hr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20071008082900.GB24782@cloud.net.au>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi,

Hamish Moffatt wrote:
> On Sun, Oct 07, 2007 at 09:58:06PM +0200, Tihomir Heidelberg - 9a4gl wrote:
>   
>> Using kernel 2.6.21.6 here. If you write to AX.25 socket bytes more then
>> MTU, write will return -1 and errno will be set to 90 (EMSGSIZE =
>> [Message too long]).
>>     
> Is it sensible to fragment raw AX.25 packets? I think that would depend
> on what the next layer protocol is. 
> For APRS, each packet is significant (ie it's datagram rather than stream oriented) so fragmenting a packet would not be correct. 
>   
No, only SOCK_SEQPACKET should be fragmented. APRS is using SOCK_DGRAM
and in most cases SOCK_DGRAM should not be fragmented, but I think we
should leave that to application. Comparing to IP world, TCP sockets may
survive additional fragmentation, but UDP maybe.
>> By the way, this problem is having OpenBCM V1.07b3
>>     
> In your application (the other end of call, for example?) the packets
> may just be a stream and therefore fragmenting at arbitrary points would
> be ok. Although SOCK_SEQPACKET doesn't sound right in that case.
>
>   
Hm, you mean I should use SOCK_STREAM ? As I see that kind of socket is
not supported in AX.25 stack, right ? When it would be, then it makes
sense to fragment for SOCK_STREAM and return EMSGSIZE for SOCK_SEQPACKET.

Hamish Moffatt wrote:
> The change seems to be requested here:
> http://oss.sgi.com/archives/netdev/2004-01/msg00097.html
>
> with the rationale that there is no fragmentation logic, as I suggested
> in my other followup (which hasn't arrived back here yet...)
But, we do have fragmentation logic in ax25_output.

73 de Tihomir, 9a4gl

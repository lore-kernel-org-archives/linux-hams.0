From: "Robin Gilks" <g8ecj@gilks.org>
Subject: Re: pci scc cards
Date: Tue, 21 Dec 2004 23:17:51 +1300 (NZDT)
Message-ID: <42630.192.168.1.15.1103624271.squirrel@192.168.1.15>
References: <200412211744.48000.sdaniels@airnet.com.au>
Reply-To: g8ecj@gilks.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200412211744.48000.sdaniels@airnet.com.au>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: vk5hsx@wia.org.au
Cc: linux-hams List <linux-hams@vger.kernel.org>

> Greetings..
>
> 	We are having trouble trying to configure PCI SCC Card. The chip used is
> a
> SUN 1889 (Dual Port card). Currently we use a script..
>

[snip]

> We tried looking at psicscc program, however, there is NO support for SUN
> 1889
> chip. Is there an alternative to the way we are doing it or using pciscc.
> We had just moved away from ISA DRSI cards using the Z8530drv, as the
> cards
> were damaged.
>
> The problem we get is cannot attach kiss to the devices..
> Any help would be much appreciated
>
Hi Stef

Bad luck on the choice of cards - what you have there is NOT an SCC card
and will never operate in the same manner as the DRSI card you used to
use.

What you have is a simple dual UART card which can be treated the same way
as the normal serial ports on the motherboard - no syncronous data, no
HDLC, no direct modem connection for AX25 :-((

Best advice would be to exchange the card for a standard serial multi-port
card that is supported by the Linux kernel as I doubt you will find a
'commercial' SCC card apart from the Baycom team (that I know of anyway!)


-- 
Robin Gilks zl3rob/g8ecj
Internet: g8ecj@gilks.org    http://www.gilks.org




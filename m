From: "Lars E. Pettersson" <sm6rpz@home.se>
Subject: Re: ax25/netrom/crashes?
Date: Mon, 4 Aug 2003 23:23:26 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200308042323.26500.sm6rpz@home.se>
References: <000301c35acb$5f8c5880$0a01a8c0@john>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <000301c35acb$5f8c5880$0a01a8c0@john>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Monday 04 August 2003 22:59, John Buttery wrote:
> Hi
>
> When I was using RedHat 7.2 I was having crashes once or twice a day. 
> The majority of them were after a NetRom disconnect.  I have now
> reverted to Red Hat 6.2 with Kernel 2.2.24 and my node (GB7WDX) has been
> up for 112 days.
>
> 73 de John, G7OPJ

Same here, RedHat 6.2 was perfect, no problems whatsoever. RedHat 7.3
on the other hand crashes, sometimes, on netrom and ax25 disconnects. 
Sometimes several times a day, sometimes it is up for almost a month.

It crashes in the interrupt handler.

I had some log and listen excerpts but I can not find them now...

So something in the 2.4-kernels is creating problems... Hopefully 2.6 will 
work better...

73 de Lars, sm6rpz
-- 
Lars E. Pettersson, SM6RPZ | Gothenburg, SWEDEN
sm6rpz@home.se | http://www.sm6rpz.se/


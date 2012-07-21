From: folkert <folkert@vanheusden.com>
Subject: Re: ax.25 localhost?
Date: Sun, 22 Jul 2012 00:10:48 +0200
Message-ID: <20120721221047.GY17345@belle.intranet.vanheusden.com>
References: <20120721160848.GX17345@belle.intranet.vanheusden.com>
 <500ADCF8.5050505@boling.us>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <500ADCF8.5050505@boling.us>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Charles Boling (AD7UF)" <junk07+ham@boling.us>
Cc: linux-hams@vger.kernel.org

> > is it not possible to an 'axcall' to a call on the local system?
> 
> What kind of AX.25 device are you having axcall use?  My experience is
> that BPQ Ethernet won't do anything unless it actually hits an Ethernet
> device, so I usually use a virtual machine for testing that way.  You
> could probably set up an AXIP/AXUDP tunnel, but I've never tried it.

What I did is:

- connect a real pr modem & cb
- disable the uart, setup the baycom kernel module, sethdlc trickery
- /sbin/ifconfig bcsf0 hw ax25 FH1GOU-1 up
- added this to /etc/ax25/ax25d.conf:
	[FH1GOU-1 VIA 1]
	NOCALL   * * * * * *  L
	default  * * * * * *  -	root  /usr/sbin/node	node
- added this to /etc/ax25/axports:
	1 FH1GOU-1	1200	255	2	bla
- and then I run:
	axcall 1 FH1GOU-1

> Hopefully someone else has better ideas than I do, because it *would* be
> handy to have an easy way to connect on a virtual loopback device.

definately!


Folkert van Heusden

-- 
www.vanheusden.com/multitail - multitail is tail on steroids. multiple
               windows, filtering, coloring, anything you can think of
----------------------------------------------------------------------
Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com

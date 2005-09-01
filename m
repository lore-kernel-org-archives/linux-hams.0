From: gerard borg <gerard.borg@anu.edu.au>
Subject: Re: Ethereal ax25 monitoring
Date: Thu, 01 Sep 2005 10:21:52 +1000
Message-ID: <1125534112.3594.26.camel@borgcom>
References: <620c90570508131043a53b9db@mail.gmail.com>
	 <42FE6C9E.2060808@rns-stearn.demon.co.uk>
	 <42FFBDA1.6040400@rns-stearn.demon.co.uk>
	 <4316253A.2060009@rns-stearn.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4316253A.2060009@rns-stearn.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Stearn <richard@rns-stearn.demon.co.uk>
Cc: linux-hams <linux-hams@vger.kernel.org>

Hi 

I have been reading with interest these mails in the quest to
get ethereal to detect AX25 packets. 

I do not know the solution to this problem but what Richard is saying
about libpcap sounds similar to some experiences I have had including a
project to get mkiss to run with ethernet bridging where bridging here
refers to the software described at

http://bridge.sourceforge.net/

I found that the bridge utilities would not recognise an ax25 network
device (such as ax0). The trick with the bridging software is to use
ethernet encapsulation. This implied that in order to bridge an mkiss
tty to an ethernet card, one has to get rid of the ax25 encapsulation
altogether and replace it with ethernet encapsulation. 

In my project I did not need the ax25 MAC anyway and the simplest
solution was to get rid of ax25 from mkiss by rewriting the routines
ax_rebuild_header and ax_header according to a description given in the
network device drivers chapter of A Rubini's book "Linux Device
Drivers". 

Concerning libcap, I also remember trying some software from the book on
open source security tools by Mike Schiffman. This software is based on
these open source packet libraries. Again this software could not see
ax25 packets. This is the same problem with ethereal I guess.

Sorry I cannot be more help this. If anyone is interested however, I do
have the version of mkiss.c that looks like an ethernet device to Linux.
Superficially this sounds like "back to slip.c" but there are some
differences, mainly simplifications and a KISS-like robustness over
wireless links. 
 

Gerard Borg





On Wed, 2005-08-31 at 22:46 +0100, Richard Stearn wrote:
> An update on AX.25 in Ethereal.
> 
> I have enquired on the Ethereal list and the attitude (sample of 1) is
> that "if the protocol exists and is used then it will be accepted".
> Subject to a few pratical provisos.
> 
> The deeper issue I have found is that Ethereal uses libpcap for the
> actual packet capture, and libpcap does not support AX.25 as a packet
> type.
> 
> There appears to a replacement for libpcap in development within Ethereal
> however that is probably a long term project. So my next move is to see
> what the issues are with getting the AX.25 packet type added to libpcap.
> 
> It looks to me that AX.25 on Ethereal is going to be a long time coming.
> 


From: folkert <folkert@vanheusden.com>
Subject: Re: ax.25 localhost?
Date: Sun, 22 Jul 2012 00:17:32 +0200
Message-ID: <20120721221731.GZ17345@belle.intranet.vanheusden.com>
References: <20120721160848.GX17345@belle.intranet.vanheusden.com>
 <500ADCF8.5050505@boling.us>
 <500B1B52.8050705@sral.fi>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <500B1B52.8050705@sral.fi>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomi Manninen <oh2bns@sral.fi>
Cc: linux-hams@vger.kernel.org

> >>is it not possible to an 'axcall' to a call on the local system?
> >
> >What kind of AX.25 device are you having axcall use?  My experience is
> >that BPQ Ethernet won't do anything unless it actually hits an Ethernet
> >device, so I usually use a virtual machine for testing that way.  You
> >could probably set up an AXIP/AXUDP tunnel, but I've never tried it.
> >
> >Hopefully someone else has better ideas than I do, because it *would* be
> >handy to have an easy way to connect on a virtual loopback device.
> 
> I don't think kernel supports looping back on AX.25 level. You can do
> something similar with pseudo tty's but it's not quite the same.
> 
> But I know that NET/ROM in Linux does support loopback. You can connect
> to any NET/ROM service on your system from your system.

Do you know of any packet-radio-for-dummies documentation?
To be honest I'm very new to all of it.


Folkert van Heusden

-- 
MultiTail cok yonlu kullanimli bir program, loglari okumak, verilen
kommandolari yerine getirebilen. Filter, renk verme, merge, 'diff-
view', vs.  http://www.vanheusden.com/multitail/
----------------------------------------------------------------------
Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com

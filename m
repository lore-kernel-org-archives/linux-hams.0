From: Thomas Osterried <thomas@osterried.de>
Subject: Re: Fw: Fw: Statistics on AX25 interfaces
Date: Wed, 28 May 2003 00:48:20 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030527224820.GA1307@osterried.de>
References: <002201c3246a$8b50fda0$0301a8c0@ozzy>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <002201c3246a$8b50fda0$0301a8c0@ozzy>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco iw7eas <iw7eas@virgilio.it>
Cc: linux-hams@vger.kernel.org

> > I'm just using mrtg and snmpd, but it works very well with internet
> tipical
> > interfaces as eth0, tunl0, ecc...
> > Infact It seems doesn't report any ax25 traffic on ax0 or ax1!! I think it
> > reports only tcp/ip activity on ax0,
> > but it's very few....

some time ago, there was a patch announced at this mailinglist.
just looked at it. at least in linux kernel 2.4.20 this feature
of mkiss.c comes by default.

you may just extract drivers/net/ax25.c from this kernel, add it to your
kernel source, and recompile+install the ax25 module.

imho, mrtg/snmp is the right way to go.

vy 73,

	- thomas  dl9sau


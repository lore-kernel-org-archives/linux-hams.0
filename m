From: Riley Williams <rhw@InfraDead.Org>
Subject: RE: insmod mkiss
Date: Mon, 27 May 2002 06:38:02 +0100 (BST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0205270633120.15697-100000@Consulate.UFP.CX>
References: <NCBBKBAJDJIPKFIAFBKLCEJKEFAC.wilson.hein@verizon.net>
Reply-To: Riley Williams <rhw@InfraDead.Org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <NCBBKBAJDJIPKFIAFBKLCEJKEFAC.wilson.hein@verizon.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Wilson G. Hein" <wilson.hein@verizon.net>
Cc: Linux-Hams Mailing List <linux-hams@vger.kernel.org>

Hi Wilson.

>>> kernel-2.4.18 with patch-2.4.19-pre2
>>>
>>> When loading trhe mkiss module I get the following error
>>>
>>> Using /lib/modules/2.4.19-2A/kernel/drivers/net/hamradio/mkiss.o
>>> /lib/modules/2.4.19-2A/kernel/drivers/net/hamradio/mkiss.o: unresolved
>>> symbol ax25_rebuild_header_R4f0ceed4
>>> /lib/modules/2.4.19-2A/kernel/drivers/net/hamradio/mkiss.o: unresolved
>>> symbol ax25_encapsulate_Rf7eb0c11
>>>
>>> What up wit dat?-)

>> Hmm... is the ax25 module already loaded when you load the mkiss module?

> That was it, I didn't load the ax25 module first. (blush)
> Still learning about modules :-)

If you use modprobe rather than insmod to load them, it sorts out
dependencies like that for you.

> Which brings up another point. Why if I include the
> ax25/mkiss/netrom modules in /etc/modules.conf don't they appear
> when running lsmod after boot up?

/etc/modules.conf only states the options to be applied to modules if
they get loaded, and not which modules to load. The kernel module daemon
kmod is supposed to handle that, but it sounds like either it has
problems with the ax.25 modules or you don't have it loaded.

However, I'm no 2.4 kernel expert, so others with mode knowledge of the
latest developments in this area will advise you better than I can here.

Best wishes from Riley.


From: =?iso-8859-1?q?alfio?= <euroalfio@yahoo.it>
Subject: Re: PCISCC4 and LINUX 2.4.20
Date: Sun, 8 Aug 2004 10:38:11 +0200 (CEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040808083811.92415.qmail@web41602.mail.yahoo.com>
References: <1091890804l.14746l.0l@tangerine>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1091890804l.14746l.0l@tangerine>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

 --- "Jean-Luc Coulon (f5ibh)"
<jean-luc.coulon@wanadoo.fr> ha scritto: 
 
> Did you try the scc driver which is part of the
> kernel ?
> 
> ---
> Regards and 73
> 
> Jean-Luc

Hello Jean-Luc and all linux-hams users.
SCC, i think work only with ISA xSCC cards...
So, i've tryed scc as follow:
root@alfionet:/home/alfio# lsmod
Module                  Size  Used by    Not tainted
usbcore                58144   1
dscc4                  10412   0  (unused)
hdlc                   10164   4  [dscc4]
pcmcia_core            38112   0
ide-scsi                8048   0
3c59x                  26736   1

last lignes of dmesg:

$Id: dscc4.c,v 1.130 2001/02/25 15:27:34 romieu Exp $
Siemens DSCC4, MMIO at 0xe4010000 (regs), 0xe4000000
(lbi), IRQ 5.

this is the PCISCC4.


I try to insmod the scc driver:

/lib/modules/2.4.20/kernel/drivers/net/hamradio/scc.o.gz:
init_module: File exists
/lib/modules/2.4.20/kernel/drivers/net/hamradio/scc.o.gz:
Hint: insmod errors can be caused by incorrect module
parameters, including invalid IO or IRQ parameters.

Yes, the module active is dscc4.
I remove it and try insmod scc.o:
Using
/lib/modules/2.4.20/kernel/drivers/net/hamradio/scc.o.gz

root@alfionet:/home/alfio# sccinit
SIOCSCCINI: : Invalid argument
from dmesg:
AX.25: Z8530 SCC driver version 3.0.dl1bke
scc0: data port = 0x300  control port = 0x304 --
missing
scc1: data port = 0x301  control port = 0x305 --
missing
scc0: data port = 0x302  control port = 0x306 --
missing
scc1: data port = 0x303  control port = 0x307 --
missing

setpciscc not work.
ifconfig scc0-4 , cause: SIOCSIFFLAGS: Invalid
argument

Any idea ??
Thanks..



	

	
		
____________________________________________________________
Yahoo! Companion - Scarica gratis la toolbar di Ricerca di Yahoo! 
http://companion.yahoo.it

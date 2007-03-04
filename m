From: Folkert van Heusden <folkert@vanheusden.com>
Subject: Re: [PATCH] baycom_ser_fdx: also allow i/o ports >= 0x1000 and
	enhanced failure logging
Date: Sun, 4 Mar 2007 22:47:50 +0100
Message-ID: <20070304214726.GV10782@vanheusden.com>
References: <20070304213034.GU10782@vanheusden.com>
	<20070304224355.19308ec0@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20070304224355.19308ec0@lxorguk.ukuu.org.uk>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-hams@vger.kernel.org, sailer@ife.ee.ethz.ch, henk.termeer@gmail.com, udovdh@xs4all.nl, linux-kernel@vger.kernel.org

> > The baycom_ser_fdx driver did not allow i/o ports >=3D 0x1000. Now =
that
> > there are pci cards (with rs232 ports) which use for example 0xb800=
 this
> > limit should not exists.
> The IRQ test is also wrong for PCI systems the moment an APIC is pres=
ent.
> NR_IRQS is the define to use.

Ok, changed:


Signed-off-by: Folkert van Heusden <folkert@vanheusden.com>

--- ./drivers/net/hamradio/baycom_ser_fdx.c.org 2007-03-04 22:24:47.000=
000000 +0100
+++ ./drivers/net/hamradio/baycom_ser_fdx.c     2007-03-04 22:42:51.000=
000000 +0100
@@ -413,11 +413,15 @@

        if (!dev || !bc)
                return -ENXIO;
-       if (!dev->base_addr || dev->base_addr > 0x1000-SER12_EXTENT ||
-           dev->irq < 2 || dev->irq > 15)
+       if (!dev->base_addr || dev->base_addr > 0xffff-SER12_EXTENT ||
+           dev->irq < 2 || dev->irq > NR_IRQS) {
+               printk(KERN_INFO "baycom_ser_fdx: invalid portnumber (m=
ax %u) or irq (2 <=3D irq <=3D %d)\n", 0xffff-SER12_EXTENT, NR_IRQS);
                return -ENXIO;
-       if (bc->baud < 300 || bc->baud > 4800)
+       }
+       if (bc->baud < 300 || bc->baud > 4800) {
+               printk(KERN_INFO "baycom_ser_fdx: invalid baudrate (300=
=2E..4800)\n");
                return -EINVAL;
+       }
        if (!request_region(dev->base_addr, SER12_EXTENT, "baycom_ser_f=
dx")) {
                printk(KERN_WARNING "BAYCOM_SER_FSX: I/O port 0x%04lx b=
usy \n",
                       dev->base_addr);


=46olkert van Heusden

--=20
MultiTail =E4r en flexibel redskap f=F6r att f=E4lja logfilar, utf=F6r =
av
commandoer, filtrera, ge f=E4rg, sammanfoga, o.s.v. f=F6lja.
http://www.vanheusden.com/multitail/
----------------------------------------------------------------------
Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

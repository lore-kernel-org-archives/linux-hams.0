From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] baycom_ser_fdx: also allow i/o ports >= 0x1000 and
 enhanced failure logging
Date: Sun, 4 Mar 2007 22:43:55 +0000
Message-ID: <20070304224355.19308ec0@lxorguk.ukuu.org.uk>
References: <20070304213034.GU10782@vanheusden.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20070304213034.GU10782@vanheusden.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Folkert van Heusden <folkert@vanheusden.com>
Cc: linux-hams@vger.kernel.org, sailer@ife.ee.ethz.ch, henk.termeer@gmail.com, udovdh@xs4all.nl, linux-kernel@vger.kernel.org

> The baycom_ser_fdx driver did not allow i/o ports >= 0x1000. Now that
> there are pci cards (with rs232 ports) which use for example 0xb800 this
> limit should not exists.

The IRQ test is also wrong for PCI systems the moment an APIC is present.
NR_IRQS is the define to use.

> Also, for non kernel coders find the cause of problems was challenging
> so I added extra logging.

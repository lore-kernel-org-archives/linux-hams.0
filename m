From: Nuno Miguel Fernandes Sucena Almeida <slug@aeminium.org>
Subject: Re: How to use soundmodem driver?
Date: Mon, 16 Sep 2002 13:09:25 +0100 (WEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0209161304100.4370-100000@aeminium.aeminium.pt>
References: <20020916064451.8626.qmail@web14402.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20020916064451.8626.qmail@web14402.mail.yahoo.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vivi Kusumo <vivi_ksm@yahoo.com>
Cc: Linux-Hams <linux-hams@vger.kernel.org>

On Sun, 15 Sep 2002, Vivi Kusumo wrote:

> How can I configure the soundmodem-0.6 driver now? 
> Are the io, irq and dma (howto point 6.1.5.2) still
> required?
> # insmod hdlcdrv
> # insmod soundmodem mode="sbc:afsk1200" iobase=? irq=?
> dma=?
> # sethdlc -p -i  sm0 mode sbc:afsk1200 io ?? irq ??
> dma ?? serio 0x2f8


I must NOT use this:-) Check the README file! The soundmodem USER MODE
runs as a regular unix daemon. 
	Check my packet_soundmodem.sh script at

http://www.co.it.pt/~slug/packet/packet_soundmodem_latest.tar.gz
	
	to give you an idea on how to use it.
	To configure the soundmodem daemon you use the soundmodemconfig X
tool, from the soundmodem package. But do it before running the daemon,
'cause they can't work at the same time.
			73,
				Nuno Sucena Almeida
--
www.aeminium.org/slug


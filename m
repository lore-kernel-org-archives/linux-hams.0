From: Dave Platt <dplatt@radagast.org>
Subject: Re: PCI SCC Card - Debian Sarge
Date: Mon, 13 Dec 2004 11:34:46 -0800 (PST)
Message-ID: <20041213193446.5413.qmail@radagast.org>
References: <200412132339.05169.sdaniels@airnet.com.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200412132339.05169.sdaniels@airnet.com.au>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vk5hsx@wia.org.au
Cc: linux-hams@vger.kernel.org

Stef VK5HSX <sdaniels@airnet.com.au> wrote:
> Hi there..
> 
> 	After our Z8530 ISA DRSI cards died, we had to purchased a new PCI SCC card. 
> The following spec's of the card:
> 	2 port PCI serial card,  I/O ports re-mapped to 3F8, 2F8, 3E8, 2E8
> 	16750 UART with 64byte FIFO buffer.
> 	They will operate at a baud rate up to 921.6 KBs. COM1-4 etc. Sunix 4038D
> 
> I wish to configure ax25 for packet bbs. Currently we used z8530drv, however, 
> I am wondering the best way to go about drivers and setup under Debian sarge, 
> using 2.4.27 kernel, with machine running- Pen II-266MHZ, 200MB RAM.

If you're using them to talk via normal asynchronous protocols to a
TNC, then you can probably just use the standard Linux serial drivers.
It looks as if the 16450/16550 drivers have some support for the
16750 chip with its larger send/receive buffer.

You'll need to use the "setserial" program to tell the kernel what
UART type the cards have.

You may also need to use "setserial" to identify the I/O port address
and/or the IRQ for each port on the card.  This may or may not be
necessary - it'll depend on whether the card automatically maps its
resources into the ISA space usually used by onboard UARTs, or
whether it puts its port in PCI space and depends on software remapping
under Windows.

Try running "/sbin/lspci -v" to find the card, and see what port
addresses and IRQs it is claiming.  You can probably plug these
values into a setserial config file or script (it's /etc/serial.conf
under Debian, I believe) to have the kernel drivers configured
correctly at boot time.

Now, if you have a need for a real SCC-compatible card, capable
of synchronousserial transfers and HDLC, then I don't think you'll
succeed with the card you have.  As far as I can tell the 16750
is an asynchronous-mode chip only, not a USART.


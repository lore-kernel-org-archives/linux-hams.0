From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: soundmodem / "SIOCSIFFLAGS no such device"
Date: Thu, 20 Feb 2003 23:05:26 +1100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030220120526.GA28160@silly.cloud.net.au>
References: <b2veij$79l$1@main.gmane.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b2veij$79l$1@main.gmane.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Wed, Feb 19, 2003 at 09:29:42AM +0100, linux-hams-owner@vger.kernel.org wrote:
> For the setup, I first do a 'rmmod' of all modules related to the sound
> card.
> Then setserial /dev/ttyS0 uart none port 0 irq 0

Looks good. Only 'uart none' is needed btw.

> To find the irq and dma parameters of the sound card :
> modprobe -c | grep irq

Didn't know that.

> modprobe hdlcdrv
> insmod soundmodem mode="sbc:afsk1200" iobase=0x220 irq=7 dma=1
> sethdlc -p -i sm0 mode sbc:afsk1200 io 0x200 irq 7 dma 1 serio 0x3f8

Two things. Firstly no need to provide the same information twice
(module parameters AND sethdlc); I just use sethdlc. Secondly the
address you have to sethdlc is different - 0x200 vs 0x220. Could be your
problem.

> And the final :
> ifconfig sm0 hw ax25 X1ABC up

Should also assign a dummy IP address.

> And it tells me :
> "SIOCSIFFLAGS: No such device"

Is your sound card SB-compatible?

You could also try the user-space (non kernel) soundmodem driver. It
uses your existing sound card drivers although not all cards are
supported.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>

From: Thomas Sailer <t.sailer@alumni.ethz.ch>
Subject: Re: [PATCH] baycom_ser_fdx: also allow i/o ports >= 0x1000 and
	enhanced failure logging
Date: Mon, 05 Mar 2007 19:20:54 +0100
Message-ID: <1173118854.20023.34.camel@xbox360>
References: <20070304213034.GU10782@vanheusden.com>
	 <20070304233052.GA27505@cloud.net.au> <1173102309.20023.25.camel@xbox360>
	 <20070305180326.GA8213@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20070305180326.GA8213@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: Hamish Moffatt <hamish@cloud.net.au>, linux-hams@vger.kernel.org

On Mon, 2007-03-05 at 18:03 +0000, Ralf Baechle DL5RB wrote:

> A few people asked me if it is possible to drive one of those RS232 abusing
> modems through a USB-to-RS232 converter but I guess the answer is no?

No way. For 9k6 you're polling the RX line say every 25us. That's just
not feasible over full speed USB. I'd expect most of these cables to
allow modem status line sampling over USB only once per USB frame, i.e.
once per 1ms.

OTOH, if you manage to change the firmware of such an adapter (also not
very feasible, because normally it's mask rom), then you can have a "non
dumb" modem ;-)

If someone has the time one could probably adapt something like a Silabs
Toolstick
http://www.silabs.com/tgwWebApp/public/web_content/products/Microcontrollers/en/USBToolStick.htm
to drive a Baycom type modem, they're about the same price as an USB to
RS232 adapter...

Tom



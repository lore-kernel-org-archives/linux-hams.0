From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: [PATCH] baycom_ser_fdx: also allow i/o ports >= 0x1000 and enhanced failure logging
Date: Mon, 5 Mar 2007 18:03:26 +0000
Message-ID: <20070305180326.GA8213@linux-mips.org>
References: <20070304213034.GU10782@vanheusden.com> <20070304233052.GA27505@cloud.net.au> <1173102309.20023.25.camel@xbox360>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1173102309.20023.25.camel@xbox360>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Sailer <t.sailer@alumni.ethz.ch>
Cc: Hamish Moffatt <hamish@cloud.net.au>, linux-hams@vger.kernel.org

On Mon, Mar 05, 2007 at 02:45:09PM +0100, Thomas Sailer wrote:

> The baycom modem really doesn't have anything to do with RS232, it just
> uses the RS232 port as a PIO port + timer. That's why it needs its own
> 16550 driver.

A few people asked me if it is possible to drive one of those RS232 abusing
modems through a USB-to-RS232 converter but I guess the answer is no?

73 de DL5RB op Ralf

--
Loc.    JN47BS / CQ 14 / ITU 28 / DOK A21
Packet: DL5RB@DB0FHN.#BAY.DEU.EU

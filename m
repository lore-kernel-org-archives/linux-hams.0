From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: dmascc ?
Date: Thu, 15 Nov 2007 00:07:03 +0000
Message-ID: <20071115000703.GA30665@linux-mips.org>
References: <47380198.7020906@ve7hex.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <47380198.7020906@ve7hex.ampr.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Niall Parker <niall@ve7hex.ampr.org>
Cc: linux-hams <linux-hams@vger.kernel.org>

On Sun, Nov 11, 2007 at 11:32:40PM -0800, Niall Parker wrote:

> It's been a while since I've tried a new kernel with my PI2 cards and 
> just discovered that while the source is still included in 
> drivers/net/hamradio/dmascc.c , it isn't possible to select via make 
> menuconfig even when CONFIG_EXPERIMENTAL is set.
> 
> I hunted through the linux-hams archives and it looks like the code is 
> still being updated, is there some other reason why dmascc is no longer 
> a config option ?

You can only configure the driver when building a uniprocessor kernel for
an ISA system and AX25 must also be enabled.  Even an oldfashioned
hyperthreaded P4 needs an SMP kernel these days so this driver is hardly
being offered anymore and I guess that's the problem you're having.

  Ralf

73 de DL5RB op Ralf

--
Loc.    JN47BS / CQ 14 / ITU 28 / DOK A21
Packet: DL5RB@DB0FHN.#BAY.DEU.EU

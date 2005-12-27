From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: PCISCC4 driver
Date: Tue, 27 Dec 2005 18:15:56 +0100
Message-ID: <20051227171556.GA19525@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

A few years ago DG1KJD wrote a PCISCC4 for Linux 2.2.  F6FBB eventually
did some work on this driver but nothing significant, so the driver
never got into a shape where it could be included into the kernel.
I eventually started polishing the driver but not having such a card,
I had to stop.  This latest version of the driver has been tested
successfully and I can send it to anybody interested.

Of course I'd be most happy if I could motivate somebody to finish the
remaining work; it's mostly about removal of the deprecated virt_to_bus
API, so anybody with a bit of DMA driver experience should be able to
complete the work.

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21

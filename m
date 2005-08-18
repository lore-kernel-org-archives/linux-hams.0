From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: [PATCH 0/3] Eleminate HZ from AX.25 kernel interfaces
Date: Thu, 18 Aug 2005 19:10:44 +0100
Message-ID: <20050818181043.GA24262@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams <linux-hams@vger.kernel.org>

AX.25, NET/ROM and ROSE unfortunately still use jiffies as the unit of
time for all their timeouts that can be configured through sysctl and
it's procfs equivalents.  This did result in a change of these kernel
interfaces going from Linux 2.4 to 2.6 for anybody who was unlucky enough
to use an affected platform such as i386 and most MIPS but not Alpha.
Making matters worse, it required the sysadmin of the particular system
to know the timing value making it very, very broken inteface design.
The timer interrupt frequency recently becoming configurable made things
even worse, so this really needed to be fixed.  The following series
of patches contains three patches, one for each of the three packet radio
protocols to switch the unit used by the sysadmin to miliseconds thus
resulting in a deterministic interface.  I'd be happy about testers.
Patches are against 2.6.13-rc6.

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21

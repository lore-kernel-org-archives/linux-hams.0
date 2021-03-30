From: Wang Qing <wangqing@vivo.com>
Subject: [PATCH 1/6] mips/sgi-ip27: Delete obsolete TODO file
Date: Tue, 30 Mar 2021 15:02:44 +0800
Message-ID: <1617087773-7183-2-git-send-email-wangqing@vivo.com>
References: <1617087773-7183-1-git-send-email-wangqing@vivo.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1617087773-7183-1-git-send-email-wangqing@vivo.com>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Adaptec OEM Raid Solutions <aacraid@microsemi.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Wang Qing <wangqing@vivo.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, linux-mtd@lists.infradead.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-decnet-user@lists.sourceforge.net
Cc: gregkh@linuxfoundation.org

The TODO file here has not been updated for 15 years, and the function 
development described in the file have been implemented or abandoned.

Its existence will mislead developers seeking to view outdated information.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 arch/mips/sgi-ip27/TODO | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 arch/mips/sgi-ip27/TODO

diff --git a/arch/mips/sgi-ip27/TODO b/arch/mips/sgi-ip27/TODO
deleted file mode 100644
index 160857ff..0000000
--- a/arch/mips/sgi-ip27/TODO
+++ /dev/null
@@ -1,19 +0,0 @@
-1. Need to figure out why PCI writes to the IOC3 hang, and if it is okay
-not to write to the IOC3 ever.
-2. Need to figure out RRB allocation in bridge_startup().
-3. Need to figure out why address swaizzling is needed in inw/outw for
-Qlogic scsi controllers.
-4. Need to integrate ip27-klconfig.c:find_lboard and
-ip27-init.c:find_lbaord_real. DONE
-5. Is it okay to set calias space on all nodes as 0, instead of 8k as
-in irix?
-6. Investigate why things do not work without the setup_test() call
-being invoked on all nodes in ip27-memory.c.
-8. Too many do_page_faults invoked - investigate.
-9. start_thread must turn off UX64 ... and define tlb_refill_debug.
-10. Need a bad pmd table, bad pte table. __bad_pmd_table/__bad_pagetable
-does not agree with pgd_bad/pmd_bad.
-11. All intrs (ip27_do_irq handlers) are targeted at cpu A on the node.
-This might need to change later. Only the timer intr is set up to be
-received on both Cpu A and B. (ip27_do_irq()/bridge_startup())
-13. Cache flushing (specially the SMP version) has to be investigated.
-- 
2.7.4


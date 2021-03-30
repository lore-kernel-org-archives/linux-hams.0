From: Wang Qing <wangqing@vivo.com>
Subject: [PATCH 2/6] scsi/aacraid: Delete obsolete TODO file
Date: Tue, 30 Mar 2021 15:02:45 +0800
Message-ID: <1617087773-7183-3-git-send-email-wangqing@vivo.com>
References: <1617087773-7183-1-git-send-email-wangqing@vivo.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1617087773-7183-1-git-send-email-wangqing@vivo.com>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Adaptec OEM Raid Solutions <aacraid@microsemi.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Wang Qing <wangqing@vivo.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, linux-mtd@lists.infradead.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-decnet-user@lists.sourceforge.net
Cc: gregkh@linuxfoundation.org

The TODO file here has not been updated from 2.6.12 for more than 15 years.
Its existence will mislead developers seeking to view outdated information.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/scsi/aacraid/TODO | 3 ---
 1 file changed, 3 deletions(-)
 delete mode 100644 drivers/scsi/aacraid/TODO

diff --git a/drivers/scsi/aacraid/TODO b/drivers/scsi/aacraid/TODO
deleted file mode 100644
index 78dc863..0000000
--- a/drivers/scsi/aacraid/TODO
+++ /dev/null
@@ -1,3 +0,0 @@
-o	Testing
-o	More testing
-o	I/O size increase
-- 
2.7.4


From: Wang Qing <wangqing@vivo.com>
Subject: [PATCH 3/6] fs/befs: Delete obsolete TODO file
Date: Tue, 30 Mar 2021 15:02:46 +0800
Message-ID: <1617087773-7183-4-git-send-email-wangqing@vivo.com>
References: <1617087773-7183-1-git-send-email-wangqing@vivo.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1617087773-7183-1-git-send-email-wangqing@vivo.com>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Adaptec OEM Raid Solutions <aacraid@microsemi.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Wang Qing <wangqing@vivo.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, linux-mtd@lists.infradead.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-decnet-user@lists.sourceforge.net
Cc: gregkh@linuxfoundation.org

The TODO file here has not been updated from 2005, and the function 
development described in the file have been implemented or abandoned.

Its existence will mislead developers seeking to view outdated information.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 fs/befs/TODO | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 fs/befs/TODO

diff --git a/fs/befs/TODO b/fs/befs/TODO
deleted file mode 100644
index 3250921..0000000
--- a/fs/befs/TODO
+++ /dev/null
@@ -1,14 +0,0 @@
-TODO
-==========
-
-* Convert comments to the Kernel-Doc format.
-
-* Befs_fs.h has gotten big and messy. No reason not to break it up into 
-	smaller peices.
-
-* See if Alexander Viro's option parser made it into the kernel tree. 
-	Use that if we can. (include/linux/parser.h)
-
-* See if we really need separate types for on-disk and in-memory 
-	representations of the superblock and inode.
-
-- 
2.7.4


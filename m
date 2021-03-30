From: Wang Qing <wangqing@vivo.com>
Subject: [PATCH 4/6] fs/jffs2: Delete obsolete TODO file
Date: Tue, 30 Mar 2021 15:02:47 +0800
Message-ID: <1617087773-7183-5-git-send-email-wangqing@vivo.com>
References: <1617087773-7183-1-git-send-email-wangqing@vivo.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1617087773-7183-1-git-send-email-wangqing@vivo.com>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Adaptec OEM Raid Solutions <aacraid@microsemi.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Wang Qing <wangqing@vivo.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, linux-mtd@lists.infradead.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-decnet-user@lists.sourceforge.net
Cc: gregkh@linuxfoundation.org

The TODO file here has not been updated for 14 years, and the function 
development described in the file have been implemented or abandoned.

Its existence will mislead developers seeking to view outdated information.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 fs/jffs2/TODO | 37 -------------------------------------
 1 file changed, 37 deletions(-)
 delete mode 100644 fs/jffs2/TODO

diff --git a/fs/jffs2/TODO b/fs/jffs2/TODO
deleted file mode 100644
index ca28964..0000000
--- a/fs/jffs2/TODO
+++ /dev/null
@@ -1,37 +0,0 @@
-
- - support asynchronous operation -- add a per-fs 'reserved_space' count,
-   let each outstanding write reserve the _maximum_ amount of physical
-   space it could take. Let GC flush the outstanding writes because the
-   reservations will necessarily be pessimistic. With this we could even
-   do shared writable mmap, if we can have a fs hook for do_wp_page() to
-   make the reservation.
- - disable compression in commit_write()?
- - fine-tune the allocation / GC thresholds
- - chattr support - turning on/off and tuning compression per-inode
- - checkpointing (do we need this? scan is quite fast)
- - make the scan code populate real inodes so read_inode just after 
-	mount doesn't have to read the flash twice for large files.
-	Make this a per-inode option, changeable with chattr, so you can
-	decide which inodes should be in-core immediately after mount.
- - test, test, test
-
- - NAND flash support:
-	- almost done :)
-	- use bad block check instead of the hardwired byte check
-
- - Optimisations:
-   - Split writes so they go to two separate blocks rather than just c->nextblock.
-	By writing _new_ nodes to one block, and garbage-collected REF_PRISTINE
-	nodes to a different one, we can separate clean nodes from those which
-	are likely to become dirty, and end up with blocks which are each far
-	closer to 100% or 0% clean, hence speeding up later GC progress dramatically.
-   - Stop keeping name in-core with struct jffs2_full_dirent. If we keep the hash in 
-     the full dirent, we only need to go to the flash in lookup() when we think we've
-     got a match, and in readdir(). 
-   - Doubly-linked next_in_ino list to allow us to free obsoleted raw_node_refs immediately?
-   - Remove size from jffs2_raw_node_frag. 
-
-dedekind:
-1. __jffs2_flush_wbuf() has a strange 'pad' parameter. Eliminate.
-2. get_sb()->build_fs()->scan() path... Why get_sb() removes scan()'s crap in
-   case of failure? scan() does not clean everything. Fix.
-- 
2.7.4


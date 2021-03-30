From: Wang Qing <wangqing@vivo.com>
Subject: [PATCH 5/6] net/ax25: Delete obsolete TODO file
Date: Tue, 30 Mar 2021 15:02:48 +0800
Message-ID: <1617087773-7183-6-git-send-email-wangqing@vivo.com>
References: <1617087773-7183-1-git-send-email-wangqing@vivo.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1617087773-7183-1-git-send-email-wangqing@vivo.com>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Adaptec OEM Raid Solutions <aacraid@microsemi.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Wang Qing <wangqing@vivo.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, linux-mtd@lists.infradead.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-decnet-user@lists.sourceforge.net
Cc: gregkh@linuxfoundation.org

The TODO file here has not been updated for 13 years, and the function 
development described in the file have been implemented or abandoned.

Its existence will mislead developers seeking to view outdated information.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 net/ax25/TODO | 20 --------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 net/ax25/TODO

diff --git a/net/ax25/TODO b/net/ax25/TODO
deleted file mode 100644
index 69fb4e3..0000000
--- a/net/ax25/TODO
+++ /dev/null
@@ -1,20 +0,0 @@
-Do the ax25_list_lock, ax25_dev_lock, linkfail_lockreally, ax25_frag_lock and
-listen_lock have to be bh-safe?
-
-Do the netrom and rose locks have to be bh-safe?
-
-A device might be deleted after lookup in the SIOCADDRT ioctl but before it's
-being used.
-
-Routes to a device being taken down might be deleted by ax25_rt_device_down
-but added by somebody else before the device has been deleted fully.
-
-The ax25_rt_find_route synopsys is pervert but I somehow had to deal with
-the race caused by the static variable in it's previous implementation.
-
-Implement proper socket locking in netrom and rose.
-
-Check socket locking when ax25_rcv is sending to raw sockets.  In particular
-ax25_send_to_raw() seems fishy.  Heck - ax25_rcv is fishy.
-
-Handle XID and TEST frames properly.
-- 
2.7.4


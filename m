From: Adrian Bunk <bunk@fs.tum.de>
Subject: [2.6 patch] remove kernel 2.2 code from drivers/net/hamradio/dmascc.c (fwd)
Date: Sat, 8 May 2004 14:54:16 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040508125415.GA6704@fs.tum.de>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>, klaus.kudielka@ieee.org
Cc: linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org

The trivial patch forwarded below still applies and compiles against 
2.6.6-rc3-mm2.

Please apply
Adrian


----- Forwarded message from Adrian Bunk <bunk@fs.tum.de> -----

Date:	Sat, 7 Feb 2004 21:45:38 +0100
From: Adrian Bunk <bunk@fs.tum.de>
To: klaus.kudielka@ieee.org
Cc: linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [2.6 patch] remove kernel 2.2 code from drivers/net/hamradio/dmascc.c

The patch below removes some #ifdef'd kernel 2.2 code from 
drivers/net/hamradio/dmascc.c .

cu
Adrian

--- linux-2.6.2-mm1/drivers/net/hamradio/dmascc.c.old	2004-02-07 21:39:39.000000000 +0100
+++ linux-2.6.2-mm1/drivers/net/hamradio/dmascc.c	2004-02-07 21:39:58.000000000 +0100
@@ -48,21 +48,6 @@
 #include "z8530.h"
 
 
-/* Linux 2.2 and 2.3 compatibility */
-
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,3,14)
-#define net_device device
-#endif
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,3,43)
-#define netif_start_queue(dev) { dev->tbusy = 0; }
-#define netif_stop_queue(dev) { dev->tbusy = 1; }
-#define netif_wake_queue(dev) { dev->tbusy = 0; mark_bh(NET_BH); }
-#endif
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,3,47)
-#define netif_running(dev) (dev->flags & IFF_UP)
-#endif
-
-
 /* Number of buffers per channel */
 
 #define NUM_TX_BUF      2          /* NUM_TX_BUF >= 1 (min. 2 recommended) */
@@ -210,9 +195,6 @@
 };
 
 struct scc_priv {
-#if LINUX_VERSION_CODE < KERNEL_VERSION(2,4,0)
-  char name[IFNAMSIZ];
-#endif
   int type;
   int chip;
   struct net_device *dev;
-
To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at  http://www.tux.org/lkml/

----- End forwarded message -----


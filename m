From: Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH] Remove unused MAXBPQDEV definition
Date: Sat, 26 Feb 2005 15:36:24 +0000
Message-ID: <20050226153624.GA13172@linux-mips.org>
Mime-Version: 1.0
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Garzik <jgarzik@pobox.com>
Cc: linux-hams@vger.kernel.org

 bpqether.c |    2 --
 1 files changed, 2 deletions(-)

Index: bk-afu/drivers/net/hamradio/bpqether.c
===================================================================
--- bk-afu.orig/drivers/net/hamradio/bpqether.c	2005-02-26 15:32:43.718910480 +0000
+++ bk-afu/drivers/net/hamradio/bpqether.c	2005-02-26 15:33:49.704879088 +0000
@@ -112,8 +112,6 @@
 };
 
 
-#define MAXBPQDEV 100
-
 struct bpqdev {
 	struct list_head bpq_list;	/* list of bpq devices chain */
 	struct net_device *ethdev;	/* link to ethernet device */

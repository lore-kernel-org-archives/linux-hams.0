From: joe@perches.com
Subject: [PATCH] [145/2many] MAINTAINERS - DAMA SLAVE for AX.25
Date: Sun, 12 Aug 2007 23:25:57 -0700
Message-ID: <46bff975.0bZ+hK8DH0JZsKvO%joe@perches.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux-hams@vger.kernel.org, jreuter@yaina.de, akpm@linux-foundation.org

Add file pattern to MAINTAINER entry

Signed-off-by: Joe Perches <joe@perches.com>

diff --git a/MAINTAINERS b/MAINTAINERS
index f7e928d..96a7da8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1397,6 +1397,13 @@ W:	http://yaina.de/jreuter/
 W:	http://www.qsl.net/dl1bke/
 L:	linux-hams@vger.kernel.org
 S:	Maintained
+F:	net/ax25/af_ax25.c
+F:	net/ax25/ax25_dev.c
+F:	net/ax25/ax25_ds_*
+F:	net/ax25/ax25_in.c
+F:	net/ax25/ax25_out.c
+F:	net/ax25/ax25_timer.c
+F:	net/ax25/sysctl_net_ax25.c
 
 DC395x SCSI driver
 P:	Oliver Neukum

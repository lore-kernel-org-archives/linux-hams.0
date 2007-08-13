From: joe@perches.com
Subject: [PATCH] [551/2many] MAINTAINERS - Z8530 DRIVER FOR AX.25
Date: Sun, 12 Aug 2007 23:40:00 -0700
Message-ID: <46bffcc0.kagzT61H3VnCgrxZ%joe@perches.com>
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
index 351e6bf..cd5856d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5216,6 +5216,9 @@ W:	http://yaina.de/jreuter/
 W:	http://www.qsl.net/dl1bke/
 L:	linux-hams@vger.kernel.org
 S:	Maintained
+F:	Documentation/networking/z8530drv.txt
+F:	drivers/net/*scc.c
+F:	drivers/net/hamradio/z8530.h
 
 ZD1211RW WIRELESS DRIVER
 P:	Daniel Drake

From: joe@perches.com
Subject: [PATCH] [83/2many] MAINTAINERS - AX.25 NETWORK LAYER
Date: Sun, 12 Aug 2007 23:24:00 -0700
Message-ID: <46bff900.apRd8gxouba0kSsi%joe@perches.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: torvalds@linux-foundation.org, ralf@linux-mips.org, linux-kernel@vger.kernel.org, linux-hams@vger.kernel.org, akpm@linux-foundation.org

Add file pattern to MAINTAINER entry

Signed-off-by: Joe Perches <joe@perches.com>

diff --git a/MAINTAINERS b/MAINTAINERS
index cb74477..f8fe034 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -834,6 +834,9 @@ M:	ralf@linux-mips.org
 L:	linux-hams@vger.kernel.org
 W:	http://www.linux-ax25.org/
 S:	Maintained
+F:	include/linux/ax25.h
+F:	include/net/ax25.h
+F:	net/ax25/
 
 BACKLIGHT CLASS/SUBSYSTEM
 P:	Richard Purdie

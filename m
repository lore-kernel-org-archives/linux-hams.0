From: joe@perches.com
Subject: [PATCH] [219/2many] MAINTAINERS - HIGH-SPEED SCC DRIVER FOR AX.25
Date: Sun, 12 Aug 2007 23:28:39 -0700
Message-ID: <46bffa17.GJOIYAQgwSZglXDw%joe@perches.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux-hams@vger.kernel.org, klaus.kudielka@ieee.org, akpm@linux-foundation.org

Add file pattern to MAINTAINER entry

Signed-off-by: Joe Perches <joe@perches.com>

diff --git a/MAINTAINERS b/MAINTAINERS
index 0202a00..ac6c822 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2090,6 +2090,8 @@ M:	klaus.kudielka@ieee.org
 L:	linux-hams@vger.kernel.org
 W:	http://www.nt.tuwien.ac.at/~kkudielk/Linux/
 S:	Maintained
+F:	drivers/net/hamradio/dmascc.c
+F:	drivers/net/hamradio/scc.c
 
 HIGHPOINT ROCKETRAID 3xxx RAID DRIVER
 P:	HighPoint Linux Team

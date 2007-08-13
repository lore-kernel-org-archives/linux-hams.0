From: joe@perches.com
Subject: [PATCH] [90/2many] MAINTAINERS - BAYCOM/HDLCDRV DRIVERS FOR AX.25
Date: Sun, 12 Aug 2007 23:24:13 -0700
Message-ID: <46bff90d.plfo6g1GxV70T8ko%joe@perches.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: torvalds@linux-foundation.org, t.sailer@alumni.ethz.ch, linux-kernel@vger.kernel.org, linux-hams@vger.kernel.org, akpm@linux-foundation.org

Add file pattern to MAINTAINER entry

Signed-off-by: Joe Perches <joe@perches.com>

diff --git a/MAINTAINERS b/MAINTAINERS
index 589e469..90689a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -920,6 +920,7 @@ M:	t.sailer@alumni.ethz.ch
 L:	linux-hams@vger.kernel.org
 W:	http://www.baycom.org/~tom/ham/ham.html
 S:	Maintained
+F:	drivers/net/hamradio/baycom*
 
 BCM43XX WIRELESS DRIVER (SOFTMAC BASED VERSION)
 P:	Larry Finger

From: joe@perches.com
Subject: [PATCH] [336/2many] MAINTAINERS - NETROM NETWORK LAYER
Date: Sun, 12 Aug 2007 23:32:35 -0700
Message-ID: <46bffb03./w2dyICYBc17xiWJ%joe@perches.com>
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
index d05ffcd..c448360 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3223,6 +3223,9 @@ M:	ralf@linux-mips.org
 L:	linux-hams@vger.kernel.org
 W:	http://www.linux-ax25.org/
 S:	Maintained
+F:	include/linux/netrom.h
+F:	include/net/netrom.h
+F:	net/netrom/
 
 NETWORK BLOCK DEVICE (NBD)
 P:	Paul Clements

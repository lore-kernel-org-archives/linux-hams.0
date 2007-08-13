From: joe@perches.com
Subject: [PATCH] [409/2many] MAINTAINERS - ROSE NETWORK LAYER
Date: Sun, 12 Aug 2007 23:34:58 -0700
Message-ID: <46bffb92.AU9JOHp4l/esBqDv%joe@perches.com>
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
index faba77e..5bc5769 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3895,6 +3895,9 @@ M:	ralf@linux-mips.org
 L:	linux-hams@vger.kernel.org
 W:	http://www.linux-ax25.org/
 S:	Maintained
+F:	include/linux/rose.h
+F:	include/net/rose.h
+F:	net/rose/
 
 RISCOM8 DRIVER
 S:	Orphan

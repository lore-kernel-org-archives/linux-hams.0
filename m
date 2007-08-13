From: joe@perches.com
Subject: [PATCH] [9/2many] MAINTAINERS - 6PACK NETWORK DRIVER FOR AX.25
Date: Sun, 12 Aug 2007 23:21:40 -0700
Message-ID: <46bff874.VWfwdJpJrRFP796r%joe@perches.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux-hams@vger.kernel.org, akpm@linux-foundation.org, ajk@iehk.rwth-aachen.de

Add file pattern to MAINTAINER entry

Signed-off-by: Joe Perches <joe@perches.com>

diff --git a/MAINTAINERS b/MAINTAINERS
index ad55112..ef6c7c3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -140,6 +140,7 @@ P:	Andreas Koensgen
 M:	ajk@iehk.rwth-aachen.de
 L:	linux-hams@vger.kernel.org
 S:	Maintained
+F:	drivers/net/hamradio/6pack.c
 
 8139CP 10/100 FAST ETHERNET DRIVER
 P:	Jeff Garzik

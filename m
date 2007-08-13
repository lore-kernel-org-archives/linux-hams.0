From: joe@perches.com
Subject: [PATCH] [549/2many] MAINTAINERS - YAM DRIVER FOR AX.25
Date: Sun, 12 Aug 2007 23:39:56 -0700
Message-ID: <46bffcbc.ujCG+gItmFGoLOJI%joe@perches.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org, linux-hams@vger.kernel.org, jpr@f6fbb.org, akpm@linux-foundation.org

Add file pattern to MAINTAINER entry

Signed-off-by: Joe Perches <joe@perches.com>

diff --git a/MAINTAINERS b/MAINTAINERS
index f932e7c..2773da9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5198,6 +5198,8 @@ P:	Jean-Paul Roubelat
 M:	jpr@f6fbb.org
 L:	linux-hams@vger.kernel.org
 S:	Maintained
+F:	drivers/net/hamradio/yam*
+F:	include/linux/yam.h
 
 YEALINK PHONE DRIVER
 P:	Henk Vergonet

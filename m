From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 1/5] MAINTAINERS: mark sections from Ralf Baechle orphan
Date: Mon, 22 Feb 2021 17:19:01 +0100
Message-ID: <20210222161905.1153-2-lukas.bulwahn@gmail.com>
References: <20210222161905.1153-1-lukas.bulwahn@gmail.com>
Return-path: <kernel-janitors-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QVBl/nog7ajTZyJooeSLMs7Y96NRWAigPOMqPEdzv6o=;
        b=cQDjY5GUWanhbS2OnAsCn20OlNIB06mIPJLPTBW3thWhwj6wHaBiuEnA+TF/uEib27
         3PMUQc/Wn8h39smKNq/QUZo79D4y1WkwlN2ysS57K2iW5sigGOCw94g3HDG5tg7d6t3u
         rbOZGqt845mDl2ZQxwoKLZELN+Jwq8l276XgcgkRwjyb6+JO99B/bZvEr6PXyClcJ+vd
         BwWyvAC/LyQyf2eDUXJXcgrIkaYm1MIHeTzj+N1+RimfSq90z4tWBvmCgVNJk24sXpxJ
         Yk9rDxiV1rwX0YXE+xUSi13luLVjBMt83qk7nzAHwfrNVV4F8kRCUSsv7ai4QScWCBWB
         pKyA==
In-Reply-To: <20210222161905.1153-1-lukas.bulwahn@gmail.com>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org
Cc: "Maciej W . Rozycki" <macro@orcam.me.uk>, Tiezhu Yang <yangtiezhu@loongson.cn>, Willy Tarreau <w@1wt.eu>, linux-edac@vger.kernel.org, linux-hams@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

The domain lookup for linux-mips.org fails for quite some time now. Hence,
webpages, the patchwork instance and Ralf Baechle's email there is not
reachable anymore.

Ralf Baechle has not been active since February 2018; so, set all
MAINTAINERS sections with Ralf as sole maintainer to Orphan, and give
others a chance to claim maintainership if these sections are still of
interest.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 MAINTAINERS | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7924907cd7cc..e949e561867d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2997,9 +2997,8 @@ F:	Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
 F:	drivers/iio/adc/hx711.c
 
 AX.25 NETWORK LAYER
-M:	Ralf Baechle <ralf@linux-mips.org>
 L:	linux-hams@vger.kernel.org
-S:	Maintained
+S:	Orphan
 W:	http://www.linux-ax25.org/
 F:	include/net/ax25.h
 F:	include/uapi/linux/ax25.h
@@ -6341,10 +6340,9 @@ S:	Maintained
 F:	drivers/edac/highbank*
 
 EDAC-CAVIUM OCTEON
-M:	Ralf Baechle <ralf@linux-mips.org>
 L:	linux-edac@vger.kernel.org
 L:	linux-mips@vger.kernel.org
-S:	Supported
+S:	Orphan
 F:	drivers/edac/octeon_edac*
 
 EDAC-CAVIUM THUNDERX
@@ -9307,9 +9305,8 @@ F:	Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.txt
 F:	drivers/iio/gyro/mpu3050*
 
 IOC3 ETHERNET DRIVER
-M:	Ralf Baechle <ralf@linux-mips.org>
 L:	linux-mips@vger.kernel.org
-S:	Maintained
+S:	Orphan
 F:	drivers/net/ethernet/sgi/ioc3-eth.c
 
 IOMAP FILESYSTEM LIBRARY
@@ -12378,9 +12375,8 @@ F:	net/bridge/br_netfilter*.c
 F:	net/netfilter/
 
 NETROM NETWORK LAYER
-M:	Ralf Baechle <ralf@linux-mips.org>
 L:	linux-hams@vger.kernel.org
-S:	Maintained
+S:	Orphan
 W:	http://www.linux-ax25.org/
 F:	include/net/netrom.h
 F:	include/uapi/linux/netrom.h
@@ -15473,9 +15469,8 @@ F:	include/linux/mfd/rohm-generic.h
 F:	include/linux/mfd/rohm-shared.h
 
 ROSE NETWORK LAYER
-M:	Ralf Baechle <ralf@linux-mips.org>
 L:	linux-hams@vger.kernel.org
-S:	Maintained
+S:	Orphan
 W:	http://www.linux-ax25.org/
 F:	include/net/rose.h
 F:	include/uapi/linux/rose.h
-- 
2.17.1


From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH v2 1/3] MAINTAINERS: mark sections from Ralf Baechle orphan
Date: Fri, 25 Jun 2021 13:04:17 +0200
Message-ID: <20210625110419.24503-2-lukas.bulwahn@gmail.com>
References: <20210625110419.24503-1-lukas.bulwahn@gmail.com>
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ng7tRj6/lSIoWL2KQHjFX+1bdImuCLV0Pw9t5mRJilM=;
        b=gz6Q7h1RNgNIY1GSvfSndbMNqWyEBXCBKtyCESqCdHV00xi5882xIjaxnaJTwSRn7z
         IUk+uk2avtU5m2ThyXXkulJAS1ZJCBT+njkiF82jKkvvXMArLL6T8SSY+RnCg5osuJxR
         y+Bmj7Z8tzsDa5ZarRpHwazhGjoyBv4RRncHZaT19pMMp9EZkSmpUjXsExv/KosAqk6r
         5Yo7iU9cO3JIDG3vHyVQ6SNnmPiHqoiJvd5CM7IelKSsPLOhMoqAniMLU/+D7tscP6Uj
         4DnHpBbY5oIaXwvB1DKXq+oXIEN89GVhwiC3wRx3fkQiMxfiuUuISjn8AwJAse+UAwr2
         m0rQ==
In-Reply-To: <20210625110419.24503-1-lukas.bulwahn@gmail.com>
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
index 3d657e1fe359..eb9110c756f7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3094,9 +3094,8 @@ F:	Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
 F:	drivers/iio/adc/hx711.c
 
 AX.25 NETWORK LAYER
-M:	Ralf Baechle <ralf@linux-mips.org>
 L:	linux-hams@vger.kernel.org
-S:	Maintained
+S:	Orphan
 W:	http://www.linux-ax25.org/
 F:	include/net/ax25.h
 F:	include/uapi/linux/ax25.h
@@ -6575,10 +6574,9 @@ S:	Maintained
 F:	drivers/edac/highbank*
 
 EDAC-CAVIUM OCTEON
-M:	Ralf Baechle <ralf@linux-mips.org>
 L:	linux-edac@vger.kernel.org
 L:	linux-mips@vger.kernel.org
-S:	Supported
+S:	Orphan
 F:	drivers/edac/octeon_edac*
 
 EDAC-CAVIUM THUNDERX
@@ -9654,9 +9652,8 @@ F:	Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.yaml
 F:	drivers/iio/gyro/mpu3050*
 
 IOC3 ETHERNET DRIVER
-M:	Ralf Baechle <ralf@linux-mips.org>
 L:	linux-mips@vger.kernel.org
-S:	Maintained
+S:	Orphan
 F:	drivers/net/ethernet/sgi/ioc3-eth.c
 
 IOMAP FILESYSTEM LIBRARY
@@ -12832,9 +12829,8 @@ F:	net/bridge/br_netfilter*.c
 F:	net/netfilter/
 
 NETROM NETWORK LAYER
-M:	Ralf Baechle <ralf@linux-mips.org>
 L:	linux-hams@vger.kernel.org
-S:	Maintained
+S:	Orphan
 W:	http://www.linux-ax25.org/
 F:	include/net/netrom.h
 F:	include/uapi/linux/netrom.h
@@ -16007,9 +16003,8 @@ F:	include/linux/mfd/rohm-generic.h
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


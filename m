From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 2/5] MAINTAINERS: remove linux-mips.org references
Date: Mon, 22 Feb 2021 17:19:02 +0100
Message-ID: <20210222161905.1153-3-lukas.bulwahn@gmail.com>
References: <20210222161905.1153-1-lukas.bulwahn@gmail.com>
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=T9Pi1/r4MEa5QWRWvsI+CTI8gMfSCUto8OFZEhxrY/g=;
        b=CnnrMRe5GEPk3C579NMVrKv6wO+D/Qt+cOPZXOa24KjjapocTsGMKpuRs/cu/Ntl7C
         eHVg7p8SmvTQhfqJGc4aI9Q2zvce3hW5TzGdvw05gMo7aOin8e1Yhowg8J1qU+avfula
         AGQyFsf1U7cG/UUiTh5h0fY/I/mnrZ6WVNLTzGjDZVpdXmYrWN2x5xoXwV0HoTHzkwUn
         wfwDAxlfrWmdeyv3OLK7qadbB0cqSXFNUl9nDO5ZVZK562V4ynlpcX462dpYfs8BVOf1
         0/kvJrPkpLt9vTC8N2WeJvqB0sJQNRHttfYtMkInXZsGS7ZnMpBNFEmwDddQvxlidtzD
         B0Ig==
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

Remove all references of webpages from linux-mips.org in MAINTAINERS, and
refer to the kernel.org's linux-mips patchwork instance instead.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 MAINTAINERS | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e949e561867d..703a50183301 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4980,7 +4980,6 @@ DECSTATION PLATFORM SUPPORT
 M:	"Maciej W. Rozycki" <macro@orcam.me.uk>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
-W:	http://www.linux-mips.org/wiki/DECstation
 F:	arch/mips/dec/
 F:	arch/mips/include/asm/dec/
 F:	arch/mips/include/asm/mach-dec/
@@ -11932,7 +11931,6 @@ MIPS
 M:	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
-W:	http://www.linux-mips.org/
 Q:	https://patchwork.kernel.org/project/linux-mips/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git
 F:	Documentation/devicetree/bindings/mips/
@@ -18248,10 +18246,9 @@ F:	arch/um/os-Linux/drivers/
 
 TURBOCHANNEL SUBSYSTEM
 M:	"Maciej W. Rozycki" <macro@orcam.me.uk>
-M:	Ralf Baechle <ralf@linux-mips.org>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
-Q:	http://patchwork.linux-mips.org/project/linux-mips/list/
+Q:	https://patchwork.kernel.org/project/linux-mips/list/
 F:	drivers/tc/
 F:	include/linux/tc.h
 
-- 
2.17.1


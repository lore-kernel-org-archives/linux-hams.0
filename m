From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH v2 2/3] MAINTAINERS: remove linux-mips.org references
Date: Fri, 25 Jun 2021 13:04:18 +0200
Message-ID: <20210625110419.24503-3-lukas.bulwahn@gmail.com>
References: <20210625110419.24503-1-lukas.bulwahn@gmail.com>
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jh/lzrjilgGw29NtXftmryrDTFk7zx98KZT7wsFE6rU=;
        b=nZuZRSM9GXM9k84Q/kttcD7Tg+UxtsN7xD9Hf35xPEn1UAovMbuGHDMaiZGmu+xetj
         ojpuIryngXNcupE5O4xXzTLHcnS9aCU2mT7wKiNDOUXlkzBKzWErwrxa89M5DPg4A1Zn
         QEn8G1u4mODdRusLYrFwj6YoX9LFEHGahspaClekcomXBE3XYm/w6QNhzKLp3ixf4qhQ
         GeqJWtoVgScKGWBe6BZXY7sDovNPDkGYiEg/8uw7gyaCvFPXA8nAvzyTIVhxOzglGgHz
         E6aF9qdFDByia0qair9Oxo2v2FNe0zNgOzFnzoCHfDHDhKe2VR4b7KkbUsINL8ooTXfO
         CPXw==
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

Remove all references of webpages from linux-mips.org in MAINTAINERS, and
refer to the kernel.org's linux-mips patchwork instance instead.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 MAINTAINERS | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index eb9110c756f7..97fa03377adc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5152,7 +5152,6 @@ DECSTATION PLATFORM SUPPORT
 M:	"Maciej W. Rozycki" <macro@orcam.me.uk>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
-W:	http://www.linux-mips.org/wiki/DECstation
 F:	arch/mips/dec/
 F:	arch/mips/include/asm/dec/
 F:	arch/mips/include/asm/mach-dec/
@@ -12384,7 +12383,6 @@ MIPS
 M:	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
-W:	http://www.linux-mips.org/
 Q:	https://patchwork.kernel.org/project/linux-mips/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git
 F:	Documentation/devicetree/bindings/mips/
@@ -18832,10 +18830,9 @@ F:	arch/um/os-Linux/drivers/
 
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


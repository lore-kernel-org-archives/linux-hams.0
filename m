From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 3/5] arch: mips: update references to current linux-mips list
Date: Mon, 22 Feb 2021 17:19:03 +0100
Message-ID: <20210222161905.1153-4-lukas.bulwahn@gmail.com>
References: <20210222161905.1153-1-lukas.bulwahn@gmail.com>
Return-path: <kernel-janitors-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MfK8XHAdcFYl+ELW5xxKLzANic1ppzZqbz8B/li+uL0=;
        b=JHfGm8yVHwxZPf1iUJfWCfKokEIq00zIu1r3zSKaL8r+o0ieJOHCAX1NqngoexxyPT
         uilSl8cC3AJ28SpXBDlsveYM46RxtAgtt8Xkv2Cfu4xiMLXGm24Ik5M5ADXLbtGWhC0q
         snRCaMCtVoVOgtem5i2AgQAkL2nyP5BB5GHBNmVYCNgk3UhtK3uOUqFIvMDhpPfQF/FM
         IRpPlhAqgPRx6TxwyyhqcS3+OLNwmLbvqhV3EIJ0EJJVJvFz+LEvexK7MZK8GVTFQywL
         wzTlc5O1JkTOnGCeLXsxiUhz0/XsWz1TE2KeED3QN81NZffESJIUMSzQUdPng+GO93Y0
         BLhw==
In-Reply-To: <20210222161905.1153-1-lukas.bulwahn@gmail.com>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org
Cc: "Maciej W . Rozycki" <macro@orcam.me.uk>, Tiezhu Yang <yangtiezhu@loongson.cn>, Willy Tarreau <w@1wt.eu>, linux-edac@vger.kernel.org, linux-hams@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

The linux-mips mailing list now lives at kernel.org. Update all references
in the kernel tree.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/mips/kernel/r4k-bugs64.c | 2 +-
 arch/mips/lib/iomap-pci.c     | 2 +-
 arch/mips/sgi-ip32/ip32-irq.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/r4k-bugs64.c b/arch/mips/kernel/r4k-bugs64.c
index 1ff19f1ea5ca..35729c9e6cfa 100644
--- a/arch/mips/kernel/r4k-bugs64.c
+++ b/arch/mips/kernel/r4k-bugs64.c
@@ -18,7 +18,7 @@
 static char bug64hit[] __initdata =
 	"reliable operation impossible!\n%s";
 static char nowar[] __initdata =
-	"Please report to <linux-mips@linux-mips.org>.";
+	"Please report to <linux-mips@vger.kernel.org>.";
 static char r4kwar[] __initdata =
 	"Enable CPU_R4000_WORKAROUNDS to rectify.";
 static char daddiwar[] __initdata =
diff --git a/arch/mips/lib/iomap-pci.c b/arch/mips/lib/iomap-pci.c
index 210f5a95ecb1..a9cb28813f0b 100644
--- a/arch/mips/lib/iomap-pci.c
+++ b/arch/mips/lib/iomap-pci.c
@@ -32,7 +32,7 @@ void __iomem *__pci_ioport_map(struct pci_dev *dev,
 		sprintf(name, "%04x:%02x", pci_domain_nr(bus), bus->number);
 		printk(KERN_WARNING "io_map_base of root PCI bus %s unset.  "
 		       "Trying to continue but you better\nfix this issue or "
-		       "report it to linux-mips@linux-mips.org or your "
+		       "report it to linux-mips@vger.kernel.org or your "
 		       "vendor.\n", name);
 #ifdef CONFIG_PCI_DOMAINS
 		panic("To avoid data corruption io_map_base MUST be set with "
diff --git a/arch/mips/sgi-ip32/ip32-irq.c b/arch/mips/sgi-ip32/ip32-irq.c
index 1bbd5bfb5458..e21ea1de05e3 100644
--- a/arch/mips/sgi-ip32/ip32-irq.c
+++ b/arch/mips/sgi-ip32/ip32-irq.c
@@ -343,7 +343,7 @@ static void ip32_unknown_interrupt(void)
 	printk("Register dump:\n");
 	show_regs(get_irq_regs());
 
-	printk("Please mail this report to linux-mips@linux-mips.org\n");
+	printk("Please mail this report to linux-mips@vger.kernel.org\n");
 	printk("Spinning...");
 	while(1) ;
 }
-- 
2.17.1


From: Borislav Petkov <bp@alien8.de>
Subject: [PATCH] hamradio: baycom_epp: Do not use x86-specific rdtsc()
Date: Sun, 18 Dec 2022 13:04:05 +0100
Message-ID: <20221218120405.2431-1-bp@alien8.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1671365052;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:
         content-transfer-encoding:content-transfer-encoding:in-reply-to:
         references; bh=qZ7D+nJuEw06972G95/KVZOO2WSZfZWhv++0SW+ZtQo=;
        b=U3fwypfodtyAL0P58CBYz6SK6jS4gJTvWm8Tpp6gqcaZRMIN+AJbY2M8NhU8SpyIYuufk9
        rQGrjLFAPhRxrQqF70nVZZjU3BpfMKLuYfynJDnhD7NjlLOxd8ygzZLlsoITOuZUgLW256
        MME6mx8Mzcu1c1Twf2+HCRrxH+raQYo=
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Sailer <t.sailer@alumni.ethz.ch>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: "Borislav Petkov (AMD)" <bp@alien8.de>

Use get_cycles() which is provided by pretty much every arch.

The UML build works too because get_cycles() is a simple "return 0;"
because the rdtsc() is optimized away there.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 drivers/net/hamradio/baycom_epp.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/net/hamradio/baycom_epp.c b/drivers/net/hamradio/baycom_epp.c
index bd3b0c2655a2..83ff882f5d97 100644
--- a/drivers/net/hamradio/baycom_epp.c
+++ b/drivers/net/hamradio/baycom_epp.c
@@ -623,16 +623,10 @@ static int receive(struct net_device *dev, int cnt)
 
 /* --------------------------------------------------------------------- */
 
-#if defined(__i386__) && !defined(CONFIG_UML)
-#include <asm/msr.h>
 #define GETTICK(x)						\
 ({								\
-	if (boot_cpu_has(X86_FEATURE_TSC))			\
-		x = (unsigned int)rdtsc();			\
+	x = (unsigned int)get_cycles();				\
 })
-#else /* __i386__  && !CONFIG_UML */
-#define GETTICK(x)
-#endif /* __i386__  && !CONFIG_UML */
 
 static void epp_bh(struct work_struct *work)
 {
-- 
2.35.1


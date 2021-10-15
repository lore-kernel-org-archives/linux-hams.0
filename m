From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH net] hamradio: baycom_epp: fix build for UML
Date: Thu, 14 Oct 2021 19:18:04 -0700
Message-ID: <20211015021804.17005-1-rdunlap@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=owFuaZjSZ/MF+xCJzBurVOco9kyMj18uY88bvFjGUts=; b=1QgVDrRZ7PulAjbVKXXXn+r7Us
        6LTsMqlf5GCeXuTjgd5xjKcIDUUGs064lYevmLeYTidhE0n0rjrPkdzZQWNYb1vQP3ATn3nrzvEr+
        KRbashVnyiIF1EzY4mqqxDdjzgLgABsBOT4tjGysUapXow+0BK1QEn/kTrbaH4H6k9ne8D+aPu6pk
        Dl2UGn935IntZyW7vMD+fVDSFbgAFv5S+6OB9TWXntdaJ9LSkFmZzrLabmThmZ7JzkY41GMekKlit
        D5f5hus19Fe1ICWLbop6CmrhC+5dYDB+72B5NIN4Cq5HgbUoZYeCcBqe2M3cpI0maus/WUcQM6FwR
        drviqPkQ==;
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netdev@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-um@lists.infradead.org, Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Thomas Sailer <t.sailer@alumni.ethz.ch>, linux-hams@vger.kernel.org

On i386, the baycom_epp driver wants to inspect X86 CPU features (TSC)
and then act on that data, but that info is not available when running
on UML, so prevent that test and do the default action.

Prevents this build error on UML + i386:

../drivers/net/hamradio/baycom_epp.c: In function ‘epp_bh’:
../drivers/net/hamradio/baycom_epp.c:630:6: error: implicit declaration of function ‘boot_cpu_has’; did you mean ‘get_cpu_mask’? [-Werror=implicit-function-declaration]
  if (boot_cpu_has(X86_FEATURE_TSC))   \
      ^
../drivers/net/hamradio/baycom_epp.c:658:2: note: in expansion of macro ‘GETTICK’
  GETTICK(time1);

Fixes: 68f5d3f3b654 ("um: add PCI over virtio emulation driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-um@lists.infradead.org
Cc: Jeff Dike <jdike@addtoit.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Thomas Sailer <t.sailer@alumni.ethz.ch>
Cc: linux-hams@vger.kernel.org
---
 drivers/net/hamradio/baycom_epp.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20211013.orig/drivers/net/hamradio/baycom_epp.c
+++ linux-next-20211013/drivers/net/hamradio/baycom_epp.c
@@ -623,16 +623,16 @@ static int receive(struct net_device *de
 
 /* --------------------------------------------------------------------- */
 
-#ifdef __i386__
+#if defined(__i386__) && !defined(CONFIG_UML)
 #include <asm/msr.h>
 #define GETTICK(x)						\
 ({								\
 	if (boot_cpu_has(X86_FEATURE_TSC))			\
 		x = (unsigned int)rdtsc();			\
 })
-#else /* __i386__ */
+#else /* __i386__  && !CONFIG_UML */
 #define GETTICK(x)
-#endif /* __i386__ */
+#endif /* __i386__  && !CONFIG_UML */
 
 static void epp_bh(struct work_struct *work)
 {

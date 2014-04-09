From: Paul McQuade <paulmcquad@gmail.com>
Subject: [PATCH 3/3] net:hamradio:6pack.c:#include <linux/uaccess.h>
Date: Wed,  9 Apr 2014 23:11:08 +0100
Message-ID: <1397081468-10301-1-git-send-email-paulmcquad@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=35GKzaVAdKF9LFXRT+wAGQgphUHT7T3AxiCx0yq9FNI=;
        b=tbKXqYS5LN3ObGDlnANFcDQq3s3iMQhmuXgHvUbPTfBv92aiDTLregiN2ZbuP3utk/
         4kszqlEzBce5vrriM898EloG7vHb50Q2DbfvfVCauqMDM9J4EdxWn+etK8zL9b5SdHLo
         doDYf90Vp4UsuEHYBP7UEpEc4GMuLjqWCKy7ZSJq6vW734NB6IFt1kDDFR4p+FI8Y0Pk
         aXstgoFEoAS49cVwYCLy16BxsJjB7CtFqiUb0Ocqm2xdePy37nXNg/wn2m32YJHETSHn
         6LcKgV7x5hmtAY9WqyGyyGVzsYmJAyT1k0CkGb03TOg4SP5vYpbuBdmh7DFS1ryoHWzm
         QZzg==
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ajk@comnets.uni-bremen.de
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

WARNING: Use #include <linux/uaccess.h> instead of <asm/uaccess.h>

Signed-off-by: Paul McQuade <paulmcquad@gmail.com>
---
 drivers/net/hamradio/6pack.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
index 66e2b19..4cd3acd 100644
--- a/drivers/net/hamradio/6pack.c
+++ b/drivers/net/hamradio/6pack.c
@@ -13,7 +13,7 @@
  */
 
 #include <linux/module.h>
-#include <asm/uaccess.h>
+#include <linux/uaccess.h>
 #include <linux/bitops.h>
 #include <linux/string.h>
 #include <linux/mm.h>
-- 
1.8.3.2

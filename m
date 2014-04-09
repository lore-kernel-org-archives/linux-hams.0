From: Paul McQuade <paulmcquad@gmail.com>
Subject: [PATCH 1/2] baycom_epp.c:#include <linux/uaccess.h>
Date: Thu, 10 Apr 2014 00:25:20 +0100
Message-ID: <1397085921-13803-1-git-send-email-paulmcquad@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=CGm4LEak0/FCiagPov901y+PwlhmOZElN+LNvT0vuuQ=;
        b=a5ggiJi1zMpE+lsLRrC2+Cl0XyTMmRS0916r9PD7kLuqENGxAl10ePfzqnVGQJr9hD
         3kxQvRZQZRMsx38WCBSQeqzPyA6SDo8UE7iyi1huGHc0gJqh+E0OAL2DYAKxjibXawMu
         Z9vL2WiAbHCOH7hBUoL+lFXhCPR+crwKCVKwOUa7OSQ54rVelm6PpFYDv3OaQecMQz3/
         rtE3EFf91/OcHoZ9yFlEkD91fpC7vbdSL+Csq1RStUHIjX0Up4j1F3sfkotUnmFxjM57
         i8rK3RVoG+XiKNeXC8Bc+lJvl17qXhO4ZwSqR6pkiKp3p1fSAXftpeg01mDPhrwpY42h
         f2Gw==
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: t.sailer@alumni.ethz.ch
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

WARNING: Use #include <linux/uaccess.h> instead of <asm/uaccess.h>

Signed-off-by: Paul McQuade <paulmcquad@gmail.com>
---
 drivers/net/hamradio/baycom_epp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/hamradio/baycom_epp.c b/drivers/net/hamradio/baycom_epp.c
index 484f77e..3daafec 100644
--- a/drivers/net/hamradio/baycom_epp.c
+++ b/drivers/net/hamradio/baycom_epp.c
@@ -55,7 +55,7 @@
 #include <linux/jiffies.h>
 #include <linux/random.h>
 #include <net/ax25.h> 
-#include <asm/uaccess.h>
+#include <linux/uaccess.h>
 
 /* --------------------------------------------------------------------- */
 
-- 
1.8.3.2

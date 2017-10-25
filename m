From: Kees Cook <keescook@chromium.org>
Subject: [PATCH] drivers/net: hamradio/yam: Convert timers to use
 timer_setup()
Date: Wed, 25 Oct 2017 03:51:20 -0700
Message-ID: <20171025105120.GA146533@beast>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=2b/cN40edw7iFzfR/F/luZQqr9fLYdxfnVO6teNQilM=;
        b=br2Cx8bSqoQiqsM/SbDTCUgYSR44NAgPF33iqHQ0JTnuRSmmLBnTL7To9SUs60xMbu
         fRsvZHPaidVh1g0REQSbaUr1sDSNv1M8aJLxsyNmEGcd9yAvjw1POqfYa5MwEWbiLU+3
         pLWUYoWKDSLrfabktnmEEI1invruO20IZin8g=
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: Jean-Paul Roubelat <jpr@f6fbb.org>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

In preparation for unconditionally passing the struct timer_list pointer to
all timer callbacks, switch to using the new timer_setup() and from_timer()
to pass the timer pointer explicitly. Initialization was entirely missing.

Cc: Jean-Paul Roubelat <jpr@f6fbb.org>
Cc: linux-hams@vger.kernel.org
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/hamradio/yam.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/hamradio/yam.c b/drivers/net/hamradio/yam.c
index 7a7c5224a336..b88c5cc00a63 100644
--- a/drivers/net/hamradio/yam.c
+++ b/drivers/net/hamradio/yam.c
@@ -647,7 +647,7 @@ static void yam_arbitrate(struct net_device *dev)
 	yam_start_tx(dev, yp);
 }
 
-static void yam_dotimer(unsigned long dummy)
+static void yam_dotimer(struct timer_list *unused)
 {
 	int i;
 
@@ -1164,7 +1164,7 @@ static int __init yam_init_driver(void)
 
 	}
 
-	yam_timer.function = yam_dotimer;
+	timer_setup(&yam_timer, yam_dotimer, 0);
 	yam_timer.expires = jiffies + HZ / 100;
 	add_timer(&yam_timer);
 
-- 
2.7.4


-- 
Kees Cook
Pixel Security

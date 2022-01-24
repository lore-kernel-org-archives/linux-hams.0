From: Hangyu Hua <hbh25y@gmail.com>
Subject: [PATCH] yam: fix a memory leak in yam_siocdevprivate()
Date: Mon, 24 Jan 2022 11:29:54 +0800
Message-ID: <20220124032954.18283-1-hbh25y@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RX6Av1jIiyqXvZYjcpZEeGLsyORkpiw+PH/GcVKGsHk=;
        b=TVighjXmld8xjrLsacTJCmUi8xhvnHU+SU2zVkR93VRMOoaA5A+oScrkxaodwFq50j
         78/84wVestiPhMtV2WWr3chJ1UgTcgLk21X1vCXpcT9tjr6Isqd3Aq88uLTDu4l6QeTO
         p2FqyiqbFX6Vqh88Hxkswi+eXed7BvZ5NmtHAMAXow3ydduW6bWMnZBn6EExFHWi9tpK
         CQpBl3KoSRE93i6HsJw1reE+KifNt06FM+UG0NVK6AXRBikPLAJt6SQSMExulX9fcCVv
         cHvmrh8L3NxdjvkxG7HfsSoA81UzF1MR9ckRBb27O8nll8mJvC2UkOUIDXYYA+mNcIQe
         16EA==
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jpr@f6fbb.org, davem@davemloft.net, kuba@kernel.org, wang6495@umn.edu
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Hangyu Hua <hbh25y@gmail.com>

ym needs to be free when ym->cmd != SIOCYAMSMCS.

Fixes: 0781168e23a2 ("yam: fix a missing-check bug")
Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
---
 drivers/net/hamradio/yam.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/hamradio/yam.c b/drivers/net/hamradio/yam.c
index 6376b8485976..980f2be32f05 100644
--- a/drivers/net/hamradio/yam.c
+++ b/drivers/net/hamradio/yam.c
@@ -950,9 +950,7 @@ static int yam_siocdevprivate(struct net_device *dev, struct ifreq *ifr, void __
 		ym = memdup_user(data, sizeof(struct yamdrv_ioctl_mcs));
 		if (IS_ERR(ym))
 			return PTR_ERR(ym);
-		if (ym->cmd != SIOCYAMSMCS)
-			return -EINVAL;
-		if (ym->bitrate > YAM_MAXBITRATE) {
+		if (ym->cmd != SIOCYAMSMCS || ym->bitrate > YAM_MAXBITRATE) {
 			kfree(ym);
 			return -EINVAL;
 		}
-- 
2.25.1


From: Colin King <colin.king@canonical.com>
Subject: [PATCH] yam: avoid null pointer dereference error
Date: Wed, 27 Mar 2013 11:19:34 +0000
Message-ID: <1364383174-17708-1-git-send-email-colin.king@canonical.com>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean-Paul Roubelat <jpr@f6fbb.org>, linux-hams@vger.kernel.org, netdev@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

yam_open checks if dev is null, however, before that check it
accesses some of the fields from dev in a proceeding printk which
will cause a null pointer dereference error if dev is nul. Move
the printk to after the null check.

Smatch analysis:

drivers/net/hamradio/yam.c:869 yam_open() warn: variable
  dereferenced before check 'dev' (see line 867)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/hamradio/yam.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/hamradio/yam.c b/drivers/net/hamradio/yam.c
index 4cf8f10..e021e51 100644
--- a/drivers/net/hamradio/yam.c
+++ b/drivers/net/hamradio/yam.c
@@ -864,10 +864,11 @@ static int yam_open(struct net_device *dev)
 	int i;
 	int ret=0;
 
-	printk(KERN_INFO "Trying %s at iobase 0x%lx irq %u\n", dev->name, dev->base_addr, dev->irq);
-
 	if (!dev || !yp->bitrate)
 		return -ENXIO;
+
+	printk(KERN_INFO "Trying %s at iobase 0x%lx irq %u\n", dev->name, dev->base_addr, dev->irq);
+
 	if (!dev->base_addr || dev->base_addr > 0x1000 - YAM_EXTENT ||
 		dev->irq < 2 || dev->irq > 15) {
 		return -ENXIO;
-- 
1.7.9.5

From: Lu Wei <luwei32@huawei.com>
Subject: [PATCH net-next] ax25: merge repeat codes in ax25_dev_device_down()
Date: Mon, 16 May 2022 14:28:04 +0800
Message-ID: <20220516062804.254742-1-luwei32@huawei.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jreuter@yaina.de, ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Merge repeat codes to reduce the duplication.

Signed-off-by: Lu Wei <luwei32@huawei.com>
---
 net/ax25/ax25_dev.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
index d2a244e1c260..b80fccbac62a 100644
--- a/net/ax25/ax25_dev.c
+++ b/net/ax25/ax25_dev.c
@@ -115,23 +115,13 @@ void ax25_dev_device_down(struct net_device *dev)
 
 	if ((s = ax25_dev_list) == ax25_dev) {
 		ax25_dev_list = s->next;
-		spin_unlock_bh(&ax25_dev_lock);
-		ax25_dev_put(ax25_dev);
-		dev->ax25_ptr = NULL;
-		dev_put_track(dev, &ax25_dev->dev_tracker);
-		ax25_dev_put(ax25_dev);
-		return;
+		goto unlock_put;
 	}
 
 	while (s != NULL && s->next != NULL) {
 		if (s->next == ax25_dev) {
 			s->next = ax25_dev->next;
-			spin_unlock_bh(&ax25_dev_lock);
-			ax25_dev_put(ax25_dev);
-			dev->ax25_ptr = NULL;
-			dev_put_track(dev, &ax25_dev->dev_tracker);
-			ax25_dev_put(ax25_dev);
-			return;
+			goto unlock_put;
 		}
 
 		s = s->next;
@@ -139,6 +129,14 @@ void ax25_dev_device_down(struct net_device *dev)
 	spin_unlock_bh(&ax25_dev_lock);
 	dev->ax25_ptr = NULL;
 	ax25_dev_put(ax25_dev);
+	return;
+
+unlock_put:
+	spin_unlock_bh(&ax25_dev_lock);
+	ax25_dev_put(ax25_dev);
+	dev->ax25_ptr = NULL;
+	dev_put_track(dev, &ax25_dev->dev_tracker);
+	ax25_dev_put(ax25_dev);
 }
 
 int ax25_fwd_ioctl(unsigned int cmd, struct ax25_fwd_struct *fwd)
-- 
2.17.1


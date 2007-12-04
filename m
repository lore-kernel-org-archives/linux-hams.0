From: Pavel Emelyanov <xemul@openvz.org>
Subject: [PATCH][ROSE] Trivial compilation CONFIG_INET=n case
Date: Tue, 04 Dec 2007 18:11:05 +0300
Message-ID: <47556E09.1050007@openvz.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Miller <davem@davemloft.net>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org, Linux Netdev List <netdev@vger.kernel.org>, devel@openvz.org

The rose_rebuild_header() consists only of some variables in
case INET=n, and gcc will warn us about it.

Fits both net-2.6 and net-2.6.25.

Signed-off-by: Pavel Emelyanov <xemul@openvz.org>

---

diff --git a/net/rose/rose_dev.c b/net/rose/rose_dev.c
index 1b6741f..12cfcf0 100644
--- a/net/rose/rose_dev.c
+++ b/net/rose/rose_dev.c
@@ -55,13 +55,13 @@ static int rose_header(struct sk_buff *skb, struct net_device *dev,
 
 static int rose_rebuild_header(struct sk_buff *skb)
 {
+#ifdef CONFIG_INET
 	struct net_device *dev = skb->dev;
 	struct net_device_stats *stats = netdev_priv(dev);
 	unsigned char *bp = (unsigned char *)skb->data;
 	struct sk_buff *skbn;
 	unsigned int len;
 
-#ifdef CONFIG_INET
 	if (arp_find(bp + 7, skb)) {
 		return 1;
 	}
-- 
1.5.3.4


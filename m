From: Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH 3/4] NET: NETROM: Cleanup argument SIOCADDRT ioctl argument
 checking.
Date: Fri, 25 Nov 2011 09:09:00 +0000
Message-ID: <9f87aed932fc551c6f5c474b39d01fb337237a7e.1322214950.git.ralf@linux-mips.org>
References: <cover.1322214950.git.ralf@linux-mips.org>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <cover.1322214950.git.ralf@linux-mips.org>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org, Thomas Osterried <thomas@osterried.de>

nr_route.ndigis is unsigned int so the nr_route.ndigis < 0 expression is
never true and can be dropped.  Doing the nr_ax25_dev_get call later
allows the nr_route.ndigis test to bail out without having to dev_put.

Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
Cc: Thomas Osterried <thomas@osterried.de>
---
 net/netrom/nr_route.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
index 8d7716c..2cf3301 100644
--- a/net/netrom/nr_route.c
+++ b/net/netrom/nr_route.c
@@ -670,12 +670,10 @@ int nr_rt_ioctl(unsigned int cmd, void __user *arg)
 	case SIOCADDRT:
 		if (copy_from_user(&nr_route, arg, sizeof(struct nr_route_struct)))
 			return -EFAULT;
-		if ((dev = nr_ax25_dev_get(nr_route.device)) == NULL)
+		if (nr_route.ndigis > AX25_MAX_DIGIS)
 			return -EINVAL;
-		if (nr_route.ndigis < 0 || nr_route.ndigis > AX25_MAX_DIGIS) {
-			dev_put(dev);
+		if ((dev = nr_ax25_dev_get(nr_route.device)) == NULL)
 			return -EINVAL;
-		}
 		switch (nr_route.type) {
 		case NETROM_NODE:
 			if (strnlen(nr_route.mnemonic, 7) == 7) {
-- 
1.7.4.4


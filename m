From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH net-next] net: rose: add missing dev_put() on error in rose_bind
Date: Tue, 19 Feb 2019 16:06:22 +0800
Message-ID: <20190219080622.17312-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ralf@linux-mips.org, davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-hams@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>

when capable check failed, dev_put should
be call before return -EACCES.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 net/rose/af_rose.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
index d00a0ef..c96f63f 100644
--- a/net/rose/af_rose.c
+++ b/net/rose/af_rose.c
@@ -689,8 +689,10 @@ static int rose_bind(struct socket *sock, struct sockaddr *uaddr, int addr_len)
 		rose->source_call = user->call;
 		ax25_uid_put(user);
 	} else {
-		if (ax25_uid_policy && !capable(CAP_NET_BIND_SERVICE))
+		if (ax25_uid_policy && !capable(CAP_NET_BIND_SERVICE)) {
+			dev_put(dev);
 			return -EACCES;
+		}
 		rose->source_call   = *source;
 	}
 
-- 
2.7.0



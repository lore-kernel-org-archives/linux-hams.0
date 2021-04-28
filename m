From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] net: netrom: nr_in: Remove redundant assignment to ns
Date: Wed, 28 Apr 2021 17:58:05 +0800
Message-ID: <1619603885-115604-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Return-path: <linux-hams-owner@vger.kernel.org>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ralf@linux-mips.org
Cc: davem@davemloft.net, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Variable ns is set to 'skb->data[17]' but this value is never read as
it is overwritten or not used later on, hence it is a redundant
assignment and can be removed.

Cleans up the following clang-analyzer warning:

net/netrom/nr_in.c:156:2: warning: Value stored to 'ns' is never read
[clang-analyzer-deadcode.DeadStores].

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 net/netrom/nr_in.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/netrom/nr_in.c b/net/netrom/nr_in.c
index 69e5890..2f084b6 100644
--- a/net/netrom/nr_in.c
+++ b/net/netrom/nr_in.c
@@ -153,7 +153,6 @@ static int nr_state3_machine(struct sock *sk, struct sk_buff *skb, int frametype
 	int queued = 0;
 
 	nr = skb->data[18];
-	ns = skb->data[17];
 
 	switch (frametype) {
 	case NR_CONNREQ:
-- 
1.8.3.1


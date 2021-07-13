From: Vasily Averin <vvs@virtuozzo.com>
Subject: [PATCH NET v2 6/7] ax25: use skb_expand_head
Date: Tue, 13 Jul 2021 23:58:36 +0300
Message-ID: <33cecb71-0582-308d-08b1-9445b4638ad7@virtuozzo.com>
References: <55c9e2ae-b060-baa2-460c-90eb3e9ded5c@virtuozzo.com>
 <cover.1626206993.git.vvs@virtuozzo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=virtuozzo.com; s=relay; h=Content-Type:MIME-Version:Date:Message-ID:Subject
        :From; bh=pOmbvmoHCRf0LxILnkccI0/aUdAXXU2GWmHyziW8kQk=; b=RR7slBsKmKFzPKcpr5z
        6igD9tUKJw1w5a+UPpq3hGO8pGpuKS4PT/rcVkxiDvhco8/e8CM70GDI8H093IeW2skEoxy4XDZDo
        WmUa+jeszHadQsCcZFsrht4zqQvNkszJ6uphMGeDGlrJldUTSMUl89y1WdzlhKV0sznLznUS5nA=;
In-Reply-To: <cover.1626206993.git.vvs@virtuozzo.com>
Content-Language: en-US
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "David S. Miller" <davem@davemloft.net>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <eric.dumazet@gmail.com>
Cc: netdev@vger.kernel.org, Joerg Reuter <jreuter@yaina.de>, Ralf Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org

Use skb_expand_head() in ax25_transmit_buffer and ax25_rt_build_path.
Unlike skb_realloc_headroom, new helper does not allocate a new skb if possible.

Signed-off-by: Vasily Averin <vvs@virtuozzo.com>
---
v2: removed kfree_skb() in ax25_rt_build_path caller ax25_ip_xmit

 net/ax25/ax25_ip.c    |  4 +---
 net/ax25/ax25_out.c   | 12 +++---------
 net/ax25/ax25_route.c | 13 +++----------
 3 files changed, 7 insertions(+), 22 deletions(-)

diff --git a/net/ax25/ax25_ip.c b/net/ax25/ax25_ip.c
index e4f63dd..3624977 100644
--- a/net/ax25/ax25_ip.c
+++ b/net/ax25/ax25_ip.c
@@ -193,10 +193,8 @@ netdev_tx_t ax25_ip_xmit(struct sk_buff *skb)
 	skb_pull(skb, AX25_KISS_HEADER_LEN);
 
 	if (digipeat != NULL) {
-		if ((ourskb = ax25_rt_build_path(skb, src, dst, route->digipeat)) == NULL) {
-			kfree_skb(skb);
+		if ((ourskb = ax25_rt_build_path(skb, src, dst, route->digipeat)) == NULL)
 			goto put;
-		}
 
 		skb = ourskb;
 	}
diff --git a/net/ax25/ax25_out.c b/net/ax25/ax25_out.c
index f53751b..af4a10e 100644
--- a/net/ax25/ax25_out.c
+++ b/net/ax25/ax25_out.c
@@ -336,18 +336,12 @@ void ax25_transmit_buffer(ax25_cb *ax25, struct sk_buff *skb, int type)
 
 	headroom = ax25_addr_size(ax25->digipeat);
 
-	if (skb_headroom(skb) < headroom) {
-		if ((skbn = skb_realloc_headroom(skb, headroom)) == NULL) {
+	if (unlikely(skb_headroom(skb) < headroom)) {
+		skb = skb_expand_head(skb, headroom);
+		if (!skb) {
 			printk(KERN_CRIT "AX.25: ax25_transmit_buffer - out of memory\n");
-			kfree_skb(skb);
 			return;
 		}
-
-		if (skb->sk != NULL)
-			skb_set_owner_w(skbn, skb->sk);
-
-		consume_skb(skb);
-		skb = skbn;
 	}
 
 	ptr = skb_push(skb, headroom);
diff --git a/net/ax25/ax25_route.c b/net/ax25/ax25_route.c
index b40e0bc..d0b2e09 100644
--- a/net/ax25/ax25_route.c
+++ b/net/ax25/ax25_route.c
@@ -441,24 +441,17 @@ int ax25_rt_autobind(ax25_cb *ax25, ax25_address *addr)
 struct sk_buff *ax25_rt_build_path(struct sk_buff *skb, ax25_address *src,
 	ax25_address *dest, ax25_digi *digi)
 {
-	struct sk_buff *skbn;
 	unsigned char *bp;
 	int len;
 
 	len = digi->ndigi * AX25_ADDR_LEN;
 
-	if (skb_headroom(skb) < len) {
-		if ((skbn = skb_realloc_headroom(skb, len)) == NULL) {
+	if (unlikely(skb_headroom(skb) < len)) {
+		skb = skb_expand_head(skb, len);
+		if (!skb) {
 			printk(KERN_CRIT "AX.25: ax25_dg_build_path - out of memory\n");
 			return NULL;
 		}
-
-		if (skb->sk != NULL)
-			skb_set_owner_w(skbn, skb->sk);
-
-		consume_skb(skb);
-
-		skb = skbn;
 	}
 
 	bp = skb_push(skb, len);
-- 
1.8.3.1


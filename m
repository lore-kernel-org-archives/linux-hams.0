From: Vasily Averin <vvs@virtuozzo.com>
Subject: [PATCH NET v4 6/7] ax25: use skb_expand_head
Date: Fri, 6 Aug 2021 10:50:32 +0300
Message-ID: <9d01cf03-c4f1-23b0-ae2d-4191a35ebf38@virtuozzo.com>
References: <ccce7edb-54dd-e6bf-1e84-0ec320d8886c@linux.ibm.com>
 <cover.1628235065.git.vvs@virtuozzo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=virtuozzo.com; s=relay; h=Content-Type:MIME-Version:Date:Message-ID:Subject
        :From; bh=LZDj+Rl8XjJSfORqoOhYb7G114M/+nHSCpKbOxlgHdo=; b=fnCoJ6+K93QLFsiysjg
        21Wzcz3fg9eBdu/hQoDRDKRzI8zpGake0LmbpksT2oicPEFrA9O9aPj4BshIerYfT+nUWHYZ4qV6A
        PQ9zJUp9HGbceSLjwaiXLFwgGI6otnY0S+/QG+vJACgdNp041SuYZWYm06KCjULZoOI5CNRa++k=;
In-Reply-To: <cover.1628235065.git.vvs@virtuozzo.com>
Content-Language: en-US
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "David S. Miller" <davem@davemloft.net>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <eric.dumazet@gmail.com>
Cc: netdev@vger.kernel.org, Joerg Reuter <jreuter@yaina.de>, Ralf Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@openvz.org, Julian Wiedmann <jwi@linux.ibm.com>

Use skb_expand_head() in ax25_transmit_buffer and ax25_rt_build_path.
Unlike skb_realloc_headroom, new helper does not allocate a new skb if possible.

Signed-off-by: Vasily Averin <vvs@virtuozzo.com>
---
 net/ax25/ax25_ip.c    |  4 +---
 net/ax25/ax25_out.c   | 13 +++----------
 net/ax25/ax25_route.c | 13 +++----------
 3 files changed, 7 insertions(+), 23 deletions(-)

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
index f53751b..22f2f66 100644
--- a/net/ax25/ax25_out.c
+++ b/net/ax25/ax25_out.c
@@ -325,7 +325,6 @@ void ax25_kick(ax25_cb *ax25)
 
 void ax25_transmit_buffer(ax25_cb *ax25, struct sk_buff *skb, int type)
 {
-	struct sk_buff *skbn;
 	unsigned char *ptr;
 	int headroom;
 
@@ -336,18 +335,12 @@ void ax25_transmit_buffer(ax25_cb *ax25, struct sk_buff *skb, int type)
 
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


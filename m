From: Vasily Averin <vvs@virtuozzo.com>
Subject: [PATCH NET 6/7] ax25: use pskb_realloc_headroom
Date: Mon, 12 Jul 2021 16:27:18 +0300
Message-ID: <42f0c1f1-a40a-6137-aabd-5c01a5da9f41@virtuozzo.com>
References: <74e90fba-df9f-5078-13de-41df54d2b257@virtuozzo.com>
 <cover.1626093470.git.vvs@virtuozzo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=virtuozzo.com; s=relay; h=Content-Type:MIME-Version:Date:Message-ID:Subject
        :From; bh=GlJZHo/qI9/fo4ysvGa0uUuc8YFxgMW0dn4u7fxaW1o=; b=Xo3cOUSUEXaRia8WZ2c
        bYUfUALuzICdTSlV3sU8xENPbwqUr5arV2ivLZ+f6Ox2FdNkw9tlwQuFkGo/qmyjt9io4VrOLkwmv
        CCcNP0kFf4ZDuaGbfRklvcVWS5WxFGwjytg5/OAylGFsgesGsVGs44qFxD9SaRfPh+3DcAMT/Dc=;
In-Reply-To: <cover.1626093470.git.vvs@virtuozzo.com>
Content-Language: en-US
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "David S. Miller" <davem@davemloft.net>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <eric.dumazet@gmail.com>
Cc: netdev@vger.kernel.org, Joerg Reuter <jreuter@yaina.de>, Ralf Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org

Use pskb_realloc_headroom() in ax25_transmit_buffer and ax25_rt_build_path.
Unlike skb_realloc_headroom, new helper pskb_realloc_headroom
does not allocate a new skb if possible.

Signed-off-by: Vasily Averin <vvs@virtuozzo.com>
---
 net/ax25/ax25_out.c   | 13 ++++---------
 net/ax25/ax25_route.c | 13 ++++---------
 2 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/net/ax25/ax25_out.c b/net/ax25/ax25_out.c
index f53751b..1f1e581 100644
--- a/net/ax25/ax25_out.c
+++ b/net/ax25/ax25_out.c
@@ -336,18 +336,13 @@ void ax25_transmit_buffer(ax25_cb *ax25, struct sk_buff *skb, int type)
 
 	headroom = ax25_addr_size(ax25->digipeat);
 
-	if (skb_headroom(skb) < headroom) {
-		if ((skbn = skb_realloc_headroom(skb, headroom)) == NULL) {
+	if (unlikely(skb_headroom(skb) < headroom)) {
+		skb = pskb_realloc_head(roomskb, headroom);
+
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
index b40e0bc..8f54547 100644
--- a/net/ax25/ax25_route.c
+++ b/net/ax25/ax25_route.c
@@ -447,18 +447,13 @@ struct sk_buff *ax25_rt_build_path(struct sk_buff *skb, ax25_address *src,
 
 	len = digi->ndigi * AX25_ADDR_LEN;
 
-	if (skb_headroom(skb) < len) {
-		if ((skbn = skb_realloc_headroom(skb, len)) == NULL) {
+	if (unlikely(skb_headroom(skb) < len)) {
+		skb = pskb_realloc_headroom(skb, len);
+
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


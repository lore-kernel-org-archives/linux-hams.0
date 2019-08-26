From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] net/hamradio/6pack: Fix the size of a sk_buff used in 'sp_bump()'
Date: Mon, 26 Aug 2019 21:02:09 +0200
Message-ID: <20190826190209.16795-1-christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ajk@comnets.uni-bremen.de, davem@davemloft.net
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

We 'allocate' 'count' bytes here. In fact, 'dev_alloc_skb' already add some
extra space for padding, so a bit more is allocated.

However, we use 1 byte for the KISS command, then copy 'count' bytes, so
count+1 bytes.

Explicitly allocate and use 1 more byte to be safe.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This patch should be safe, be however may no be the correct way to fix the
"buffer overflow". Maybe, the allocated size is correct and we should have:
   memcpy(ptr, sp->cooked_buf + 1, count - 1);
or
   memcpy(ptr, sp->cooked_buf + 1, count - 1sp->rcount);

I've not dig deep enough to understand the link betwwen 'rcount' and
how 'cooked_buf' is used.
---
 drivers/net/hamradio/6pack.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
index 331c16d30d5d..23281aeeb222 100644
--- a/drivers/net/hamradio/6pack.c
+++ b/drivers/net/hamradio/6pack.c
@@ -344,10 +344,10 @@ static void sp_bump(struct sixpack *sp, char cmd)
 
 	sp->dev->stats.rx_bytes += count;
 
-	if ((skb = dev_alloc_skb(count)) == NULL)
+	if ((skb = dev_alloc_skb(count + 1)) == NULL)
 		goto out_mem;
 
-	ptr = skb_put(skb, count);
+	ptr = skb_put(skb, count + 1);
 	*ptr++ = cmd;	/* KISS command */
 
 	memcpy(ptr, sp->cooked_buf + 1, count);
-- 
2.20.1


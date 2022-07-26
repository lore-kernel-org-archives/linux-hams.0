From: Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH net v2] netrom: fix sleep in atomic context bugs in timer handlers
Date: Tue, 26 Jul 2022 11:24:20 +0800
Message-ID: <20220726032420.5516-1-duoming@zju.edu.cn>
Return-path: <linux-hams-owner@vger.kernel.org>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Duoming Zhou <duoming@zju.edu.cn>

There are sleep in atomic context bugs in timer handlers of netrom
such as nr_t1timer_expiry(), nr_t2timer_expiry(), nr_heartbeat_expiry(),
nr_idletimer_expiry() and so on.

The root cause is kmemdup() with GFP_KERNEL parameter that may sleep
could be called by different timer handlers which is in interrupt context.

One of the call paths that could trigger bug is shown below:

      (interrupt context)
nr_heartbeat_expiry
  nr_write_internal
    nr_transmit_buffer
      nr_route_frame
        nr_add_node
          kmemdup(..,GFP_KERNEL) //may sleep

This patch changes gfp_t parameter of kmemdup in nr_add_node()
from GFP_KERNEL to GFP_ATOMIC in order to prevent sleep in atomic
context bugs.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
Changes in v2:
  - Correct the "Fixes" tag.

 net/netrom/nr_route.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
index baea3cbd76c..1ddcf13de6a 100644
--- a/net/netrom/nr_route.c
+++ b/net/netrom/nr_route.c
@@ -163,7 +163,7 @@ static int __must_check nr_add_node(ax25_address *nr, const char *mnemonic,
 		if (ax25_digi != NULL && ax25_digi->ndigi > 0) {
 			nr_neigh->digipeat = kmemdup(ax25_digi,
 						     sizeof(*ax25_digi),
-						     GFP_KERNEL);
+						     GFP_ATOMIC);
 			if (nr_neigh->digipeat == NULL) {
 				kfree(nr_neigh);
 				if (nr_node)
-- 
2.17.1


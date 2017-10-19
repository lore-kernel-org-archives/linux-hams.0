From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: [PATCH] net: netrom: nr_in: mark expected switch fall-through
Date: Thu, 19 Oct 2017 12:43:08 -0500
Message-ID: <20171019174308.GA21742@embeddedor.com>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <garsilva@embeddedor.com>

In preparation to enabling -Wimplicit-fallthrough, mark switch cases
where we are expecting to fall through.

Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
---
This code was tested by compilation only (GCC 7.2.0 was used).
Please, verify if the actual intention of the code is to fall through.

 net/netrom/nr_in.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/netrom/nr_in.c b/net/netrom/nr_in.c
index 80dbd0b..fbfdae4 100644
--- a/net/netrom/nr_in.c
+++ b/net/netrom/nr_in.c
@@ -125,7 +125,7 @@ static int nr_state2_machine(struct sock *sk, struct sk_buff *skb,
 
 	case NR_DISCREQ:
 		nr_write_internal(sk, NR_DISCACK);
-
+		/* fall through */
 	case NR_DISCACK:
 		nr_disconnect(sk, 0);
 		break;
-- 
2.7.4


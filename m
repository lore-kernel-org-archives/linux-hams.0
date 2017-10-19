From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: [PATCH 1/2] net: netrom: mark expected switch fall-throughs
Date: Thu, 19 Oct 2017 12:21:23 -0500
Message-ID: <20171019172123.GA15219@embeddedor.com>
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

 net/netrom/nr_route.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
index 0c59354..fc9cadc 100644
--- a/net/netrom/nr_route.c
+++ b/net/netrom/nr_route.c
@@ -279,6 +279,7 @@ static int __must_check nr_add_node(ax25_address *nr, const char *mnemonic,
 			nr_node->routes[1] = nr_node->routes[2];
 			nr_node->routes[2] = nr_route;
 		}
+		/* fall through */
 	case 2:
 		if (nr_node->routes[1].quality > nr_node->routes[0].quality) {
 			switch (nr_node->which) {
@@ -384,6 +385,7 @@ static int nr_del_node(ax25_address *callsign, ax25_address *neighbour, struct n
 				switch (i) {
 				case 0:
 					nr_node->routes[0] = nr_node->routes[1];
+					/* fall through */
 				case 1:
 					nr_node->routes[1] = nr_node->routes[2];
 				case 2:
@@ -506,7 +508,7 @@ static int nr_dec_obs(void)
 				switch (i) {
 				case 0:
 					s->routes[0] = s->routes[1];
-					/* Fallthrough */
+					/* fall through */
 				case 1:
 					s->routes[1] = s->routes[2];
 				case 2:
@@ -553,6 +555,7 @@ void nr_rt_device_down(struct net_device *dev)
 						switch (i) {
 						case 0:
 							t->routes[0] = t->routes[1];
+							/* fall through */
 						case 1:
 							t->routes[1] = t->routes[2];
 						case 2:
-- 
2.7.4


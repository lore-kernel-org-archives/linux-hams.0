From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: [PATCH v3 2/2] net: netrom: nr_route: mark expected switch
 fall-throughs
Date: Fri, 27 Oct 2017 00:51:08 -0500
Message-ID: <ce46f62590d512e55327c9edf01de60bcb573fee.1509080630.git.garsilva@embeddedor.com>
References: <cover.1509080630.git.garsilva@embeddedor.com>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1509080630.git.garsilva@embeddedor.com>
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
Changes in v2:
 None.

Changes in v3:
 Update subject.

 net/netrom/nr_route.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
index fba4b4c..75e6ba9 100644
--- a/net/netrom/nr_route.c
+++ b/net/netrom/nr_route.c
@@ -265,6 +265,7 @@ static int __must_check nr_add_node(ax25_address *nr, const char *mnemonic,
 	case 3:
 		re_sort_routes(nr_node, 0, 1);
 		re_sort_routes(nr_node, 1, 2);
+		/* fall through */
 	case 2:
 		re_sort_routes(nr_node, 0, 1);
 	case 1:
@@ -357,6 +358,7 @@ static int nr_del_node(ax25_address *callsign, ax25_address *neighbour, struct n
 				switch (i) {
 				case 0:
 					nr_node->routes[0] = nr_node->routes[1];
+					/* fall through */
 				case 1:
 					nr_node->routes[1] = nr_node->routes[2];
 				case 2:
@@ -526,6 +528,7 @@ void nr_rt_device_down(struct net_device *dev)
 						switch (i) {
 						case 0:
 							t->routes[0] = t->routes[1];
+							/* fall through */
 						case 1:
 							t->routes[1] = t->routes[2];
 						case 2:
-- 
2.7.4


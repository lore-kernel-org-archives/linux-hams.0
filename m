From: David Ranch <linux-hams@trinnet.net>
Subject: Fwd: [PATCH v2 2/2] net: netrom: refactor code in nr_add_node
Date: Mon, 23 Oct 2017 09:19:10 -0700
Message-ID: <882a3c4b-c917-cd9b-9eeb-ea74f92a265d@trinnet.net>
References: <20171023010840.GA32460@embeddedor.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20171023010840.GA32460@embeddedor.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Hams <linux-hams@vger.kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Thomas Osterried <thomas@osterried.de>, "Bernard, f6bvp" <f6bvp@free.fr>, "David S. Miller" <davem@davemloft.net>, "Gustavo A. R. Silva" <garsilva@embeddedor.com>

Hey Everyone,

There are a LOT of patches coming in for the Linux AX.25 stack such as 
this one below where people are proposing changes and they OPENLY state:

    "This code was tested by compilation only"

That's NOT testing.  We have seen over the last year or two, several 
toxic commits have come into the kernel that have been extremely painful 
to rollback and/or modify to remove the toxicity.  I completely 
appreciate people trying to keep the AX.25 stack cleaned up but it's 
CRITICAL that we get some AX.25 regress suites running so people can 
confirm that their proposed commits don't break anything before allowing 
the commits.   I've been trying to find out who to discuss this proposed 
testing harness but I've been unable to get a name.  Once I get a name, 
I'm happy to help contribute some testing suites, etc. once I understand 
the framework that this team(s) use.

--David
KI6ZHD


-------- Forwarded Message --------
Subject: 	[PATCH v2 2/2] net: netrom: refactor code in nr_add_node
Date: 	Sun, 22 Oct 2017 20:08:40 -0500
From: 	Gustavo A. R. Silva <garsilva@embeddedor.com>
To: 	Ralf Baechle <ralf@linux-mips.org>, David S. Miller 
<davem@davemloft.net>, walter harms <wharms@bfs.de>
CC: 	linux-hams@vger.kernel.org, netdev@vger.kernel.org, 
linux-kernel@vger.kernel.org, Gustavo A. R. Silva <garsilva@embeddedor.com>



Code refactoring in order to make it easier to read and maintain.

Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
---
This code was tested by compilation only.

Changes in v2:
  Make use of the swap macro and remove inline keyword.

  net/netrom/nr_route.c | 59 ++++++++++++++-------------------------------------
  1 file changed, 16 insertions(+), 43 deletions(-)

diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
index fc9cadc..505e142 100644
--- a/net/netrom/nr_route.c
+++ b/net/netrom/nr_route.c
@@ -80,6 +80,19 @@ static struct nr_neigh *nr_neigh_get_dev(ax25_address *callsign,
  
  static void nr_remove_neigh(struct nr_neigh *);
  
+/*      re-sort the routes in quality order.    */
+static void re_sort_routes(struct nr_node *nr_node, int x, int y)
+{
+	if (nr_node->routes[y].quality > nr_node->routes[x].quality) {
+		if (nr_node->which == x)
+			nr_node->which = y;
+		else if (nr_node->which == y)
+			nr_node->which = x;
+
+		swap(nr_node->routes[x], nr_node->routes[y]);
+	}
+}
+
  /*
   *	Add a new route to a node, and in the process add the node and the
   *	neighbour if it is new.
@@ -90,7 +103,6 @@ static int __must_check nr_add_node(ax25_address *nr, const char *mnemonic,
  {
  	struct nr_node  *nr_node;
  	struct nr_neigh *nr_neigh;
-	struct nr_route nr_route;
  	int i, found;
  	struct net_device *odev;
  
@@ -251,50 +263,11 @@ static int __must_check nr_add_node(ax25_address *nr, const char *mnemonic,
  	/* Now re-sort the routes in quality order */
  	switch (nr_node->count) {
  	case 3:
-		if (nr_node->routes[1].quality > nr_node->routes[0].quality) {
-			switch (nr_node->which) {
-			case 0:
-				nr_node->which = 1;
-				break;
-			case 1:
-				nr_node->which = 0;
-				break;
-			}
-			nr_route           = nr_node->routes[0];
-			nr_node->routes[0] = nr_node->routes[1];
-			nr_node->routes[1] = nr_route;
-		}
-		if (nr_node->routes[2].quality > nr_node->routes[1].quality) {
-			switch (nr_node->which) {
-			case 1:  nr_node->which = 2;
-				break;
-
-			case 2:  nr_node->which = 1;
-				break;
-
-			default:
-				break;
-			}
-			nr_route           = nr_node->routes[1];
-			nr_node->routes[1] = nr_node->routes[2];
-			nr_node->routes[2] = nr_route;
-		}
+		re_sort_routes(nr_node, 0, 1);
+		re_sort_routes(nr_node, 1, 2);
  		/* fall through */
  	case 2:
-		if (nr_node->routes[1].quality > nr_node->routes[0].quality) {
-			switch (nr_node->which) {
-			case 0:  nr_node->which = 1;
-				break;
-
-			case 1:  nr_node->which = 0;
-				break;
-
-			default: break;
-			}
-			nr_route           = nr_node->routes[0];
-			nr_node->routes[0] = nr_node->routes[1];
-			nr_node->routes[1] = nr_route;
-			}
+		re_sort_routes(nr_node, 0, 1);
  	case 1:
  		break;
  	}
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


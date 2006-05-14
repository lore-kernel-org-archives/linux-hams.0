From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: [ROSE] Fix dereference of skb pointer after free.
Date: Sun, 14 May 2006 11:25:58 +0100
Message-ID: <20060514102558.GA6509@linux-mips.org>
References: <20060513115015.GA19232@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060513115015.GA19232@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Please don't use the previous patch; it's broken.  Here's the right one.

  Ralf

[NETROM] Fix possible null pointer dereference.

If in nr_link_failed the neighbour list is non-empty but the node list
is empty we'll end dereferencing a  in a NULL pointer.

This fixes coverity 362.

Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

 net/netrom/nr_route.c |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

Index: linux-net/net/netrom/nr_route.c
===================================================================
--- linux-net.orig/net/netrom/nr_route.c	2006-05-14 11:09:19.000000000 +0100
+++ linux-net/net/netrom/nr_route.c	2006-05-14 11:10:46.000000000 +0100
@@ -725,15 +725,17 @@ void nr_link_failed(ax25_cb *ax25, int r
 	struct nr_node  *nr_node = NULL;
 
 	spin_lock_bh(&nr_neigh_list_lock);
-	nr_neigh_for_each(s, node, &nr_neigh_list)
+	nr_neigh_for_each(s, node, &nr_neigh_list) {
 		if (s->ax25 == ax25) {
 			nr_neigh_hold(s);
 			nr_neigh = s;
 			break;
 		}
+	}
 	spin_unlock_bh(&nr_neigh_list_lock);
 
-	if (nr_neigh == NULL) return;
+	if (nr_neigh == NULL)
+		return;
 
 	nr_neigh->ax25 = NULL;
 	ax25_cb_put(ax25);
@@ -743,11 +745,13 @@ void nr_link_failed(ax25_cb *ax25, int r
 		return;
 	}
 	spin_lock_bh(&nr_node_list_lock);
-	nr_node_for_each(nr_node, node, &nr_node_list)
+	nr_node_for_each(nr_node, node, &nr_node_list) {
 		nr_node_lock(nr_node);
-		if (nr_node->which < nr_node->count && nr_node->routes[nr_node->which].neighbour == nr_neigh)
+		if (nr_node->which < nr_node->count &&
+		    nr_node->routes[nr_node->which].neighbour == nr_neigh)
 			nr_node->which++;
 		nr_node_unlock(nr_node);
+	}
 	spin_unlock_bh(&nr_node_list_lock);
 	nr_neigh_put(nr_neigh);
 }

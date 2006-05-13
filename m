From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: [NETROM] Fix potencial null pointer dereference.
Date: Sat, 13 May 2006 11:53:49 +0100
Message-ID: <20060513105349.GA17175@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

If the neighbour list becomes empty just just in the time during which
we've dropped nr_neigh_list_lock the missing braces around the second
loop block in nr_link_failed may result in a NULL pointer getting
dereferenced.  This race can only be triggered on a SMP or preemptible
kernel.

Test reports appreciated.

Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

---
 net/netrom/nr_route.c |   25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

Index: linux-net/net/netrom/nr_route.c
===================================================================
--- linux-net.orig/net/netrom/nr_route.c	2006-05-12 12:06:53.000000000 +0100
+++ linux-net/net/netrom/nr_route.c	2006-05-13 11:37:13.000000000 +0100
@@ -725,31 +725,32 @@ void nr_link_failed(ax25_cb *ax25, int r
 	struct nr_node  *nr_node = NULL;
 
 	spin_lock_bh(&nr_neigh_list_lock);
-	nr_neigh_for_each(s, node, &nr_neigh_list)
+	nr_neigh_for_each(s, node, &nr_neigh_list) {
 		if (s->ax25 == ax25) {
-			nr_neigh_hold(s);
 			nr_neigh = s;
 			break;
 		}
-	spin_unlock_bh(&nr_neigh_list_lock);
+	}
 
-	if (nr_neigh == NULL) return;
+	if (nr_neigh == NULL)
+		goto out_unlock;
 
 	nr_neigh->ax25 = NULL;
 	ax25_cb_put(ax25);
 
-	if (++nr_neigh->failed < sysctl_netrom_link_fails_count) {
-		nr_neigh_put(nr_neigh);
-		return;
-	}
-	spin_lock_bh(&nr_node_list_lock);
-	nr_node_for_each(nr_node, node, &nr_node_list)
+	if (++nr_neigh->failed < sysctl_netrom_link_fails_count)
+		goto out_unlock;
+
+	nr_node_for_each(nr_node, node, &nr_node_list) {
 		nr_node_lock(nr_node);
-		if (nr_node->which < nr_node->count && nr_node->routes[nr_node->which].neighbour == nr_neigh)
+		if (nr_node->which < nr_node->count &&
+		    nr_node->routes[nr_node->which].neighbour == nr_neigh)
 			nr_node->which++;
 		nr_node_unlock(nr_node);
+	}
+
+out_unlock:
 	spin_unlock_bh(&nr_node_list_lock);
-	nr_neigh_put(nr_neigh);
 }
 
 /*

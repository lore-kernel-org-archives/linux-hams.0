From: f6bvp <f6bvp@free.fr>
Subject: [PATCH] [ROSE] AX25 packet routing improvement
Date: Thu, 02 Dec 2010 12:33:12 +0100
Message-ID: <4CF783F8.7040300@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090009000305040602020004"
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: ralf@linux-mips.org
Cc: davem@davemloft.net, linux-hams@vger.kernel.org, Bernard Pidoux <bernard.pidoux@upmc.fr>

This is a multi-part message in MIME format.
--------------090009000305040602020004
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

[PATCH] [ROSE] rose AX25 packet routing improvement

FPAC AX25 packet application is using Linux kernel ROSE
routing skills in order to connect or send packets to remote stations
knowing their ROSE address via a network of interconnected nodes.

Each FPAC node has a ROSE routing table that Linux ROSE module is
looking at each time a ROSE frame is relayed by the node or when
a connect request to a neighbor node is received.

A previous patch improved the system time response by looking at
already established routes each time the system was looking for a
route to relay a frame. If a neighbor node routing the destination
address was already connected, then the frame would be sent
through him. If not, a connection request would be issued.

The present patch extends the same routing capability to a connect
request asked by a user locally connected into an FPAC node.
Without this patch, a connect request was not well handled unless it
was directed to an immediate connected neighbor of the local node.

Implemented at a number of ROSE FPAC node stations, the present patch 
improved dramatically FPAC ROSE routing time response and efficiency.

Signed-off-by: Bernard Pidoux <f6bvp@free.fr>


--------------090009000305040602020004
Content-Type: text/x-patch;
 name="rose_get_neigh_f6bvp.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="rose_get_neigh_f6bvp.patch"

--- a/net/rose/rose_route.c	2010-08-27 01:47:12.000000000 +0200
+++ b/net/rose/rose_route.c	2010-11-25 15:50:30.885623929 +0100
@@ -672,34 +672,41 @@
  *	Find a neighbour or a route given a ROSE address.
  */
 struct rose_neigh *rose_get_neigh(rose_address *addr, unsigned char *cause,
-	unsigned char *diagnostic, int new)
+	unsigned char *diagnostic, int route_frame)
 {
 	struct rose_neigh *res = NULL;
 	struct rose_node *node;
 	int failed = 0;
 	int i;
 
-	if (!new) spin_lock_bh(&rose_node_list_lock);
 	for (node = rose_node_list; node != NULL; node = node->next) {
 		if (rosecmpm(addr, &node->address, node->mask) == 0) {
 			for (i = 0; i < node->count; i++) {
-				if (new) {
-					if (node->neighbour[i]->restarted) {
-						res = node->neighbour[i];
-						goto out;
-					}
+				if (node->neighbour[i]->restarted) {
+					res = node->neighbour[i];
+					goto out;
 				}
-				else {
+			}
+		}
+	}
+	if (!route_frame) { /* connect request */
+		spin_lock_bh(&rose_node_list_lock);
+		for (node = rose_node_list; node != NULL; node = node->next) {
+			if (rosecmpm(addr, &node->address, node->mask) == 0) {
+				for (i = 0; i < node->count; i++) {
 					if (!rose_ftimer_running(node->neighbour[i])) {
 						res = node->neighbour[i];
+						failed = 0;
+						spin_unlock_bh(&rose_node_list_lock);
 						goto out;
-					} else
-						failed = 1;
+					}
+					failed = 1;
 				}
 			}
 		}
+		spin_unlock_bh(&rose_node_list_lock);
 	}
-
+	
 	if (failed) {
 		*cause      = ROSE_OUT_OF_ORDER;
 		*diagnostic = 0;
@@ -709,8 +716,6 @@
 	}
 
 out:
-	if (!new) spin_unlock_bh(&rose_node_list_lock);
-
 	return res;
 }
 

--------------090009000305040602020004--

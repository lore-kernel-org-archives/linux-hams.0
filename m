From: f6bvp <f6bvp@free.fr>
Subject: [PATCH] [ROSE] AX25 packet routing improvement
Date: Thu, 02 Dec 2010 13:05:04 +0100
Message-ID: <4CF78B70.4060907@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020606010607000300040508"
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: ralf@linux-mips.org
Cc: davem@davemloft.net, linux-hams@vger.kernel.org, Bernard Pidoux <bernard.pidoux@upmc.fr>

This is a multi-part message in MIME format.
--------------020606010607000300040508
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Sorry for this second post.
I found that spin_lock_bh was missing in the first loop !


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



--------------020606010607000300040508
Content-Type: text/x-patch;
 name="rose_get_neigh.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="rose_get_neigh.patch"

--- a/net/rose/rose_route.c	2010-08-27 01:47:12.000000000 +0200
+++ b/net/rose/rose_route.c	2010-12-02 12:46:57.724550823 +0100
@@ -672,29 +672,34 @@
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
+	if (!route_frame) spin_lock_bh(&rose_node_list_lock);
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
+		for (node = rose_node_list; node != NULL; node = node->next) {
+			if (rosecmpm(addr, &node->address, node->mask) == 0) {
+				for (i = 0; i < node->count; i++) {
 					if (!rose_ftimer_running(node->neighbour[i])) {
 						res = node->neighbour[i];
+						failed = 0;
 						goto out;
-					} else
-						failed = 1;
+					}
+					failed = 1;
 				}
 			}
 		}
@@ -709,8 +714,7 @@
 	}
 
 out:
-	if (!new) spin_unlock_bh(&rose_node_list_lock);
-
+	if (!route_frame) spin_unlock_bh(&rose_node_list_lock);
 	return res;
 }
 

--------------020606010607000300040508--

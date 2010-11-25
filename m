From: f6bvp <f6bvp@free.fr>
Subject: Patch improving ROSE routing
Date: Thu, 25 Nov 2010 23:08:01 +0100
Message-ID: <4CEEDE41.8000001@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090006060809000905050808"
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: C Schuman <k4gbb1@embarqmail.com>, Ray Wells <vk2tv@exemail.com.au>, Bob Tenty <bobtenty@gmail.com>, Jerry DeLong <KD4YAL@tampabay.rr.com>, List for LINUX ROSE/FPAC network switch <f>

This is a multi-part message in MIME format.
--------------090006060809000905050808
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

As you know FPAC AX25 packet application is using Linux kernel ROSE
routing skills in order to connect or send packets to remote stations
knowing their ROSE address via a network of interconnected nodes.

Each FPAC node sets a ROSE routing table that Linux ROSE module is
looking at each time a ROSE frame is relayed by the node or for
connecting a node neighbor.

A previous patch improved the system time response by looking at
already established routes each time the system was looking for a
route to relay a frame. If a neighbor node routing the destination
address was already connected, then the frame would be sent
through him. If not, a connection request would be issued.

The present patch extends the same routing capability to a connect
request asked by a user locally connected to an FPAC node.
Without this patch, a connect request was not well handled unless it
was directed to an immediate connected neighbor of the local node.

The present patch improves dramatically FPAC ROSE routing capability.

Here is an illustration.

This is F6BVP-10/11FPAC routing table :

DNIC Address Primary   Route  | 1st Alt   Route  | 2nd Alt   Route  |

7100,......  YN1BBS-9  Opened | TI2HAS-9  Opened | P43L-4    Opened |

7120,......  TI2HAS-9  Opened | YN1BBS-9  Opened | P43L-4    Opened |

5050,......  VK7HDM-5  Opened | VK2XB-2   Opened | VK2TV-2   Closed |

3630,......  P43L-4    Opened | YN1BBS-9  Opened | TI2HAS-9  Opened |

3620,......  P43L-4    Opened | YN1BBS-9  Opened | TI2HAS-9  Opened |

3100,......  K4GBB-9   Opened | KD4YAL-9  Closed | KP4DJT-9  Closed |

3020,......  K4GBB-9   Opened |

2080,......  F5KBW-9   Closed | F3KT-11   Opened | F4BWT-11  Closed |

2080,9.....  F5KBW-9   Closed |

2080,8.....  F8COJ-11  Closed | F5KBW-9   Closed |

2080,7.....  F5KBW-9   Closed |

2080,1.....  F6BVP-9   Closed | F6BVP-7   Closed |

2080,428...  F4BWT-11  Closed |

2080,847...  F6GGY-9   Closed | F4BWT-11  Closed |

2080,444...  F3KT-11   Opened | F6GGY-9   Closed | F1MVP-5   Closed |

2080,8335..  F5KBW-9   Closed |

7120,282700  TI2HAS-9  Opened |

7100,505522  YN1BBS-9  Opened |

5050,626300  VK7HDM-5  Opened |

5050,656200  VK2TV-2   Closed |

5050,699300  VK2XB-2   Opened |

3630,297585  P43L-4    Opened |

3100,813626  KP4DJT-9  Closed |

3100,727489  KD4YAL-9  Closed |

3100,352726  K4GBB-9   Opened |

2080,886801  F1MVP-5   Closed |

2080,428501  F4BWT-11  Closed |

2080,847501  F6GGY-9   Closed |

2080,833501  F5KBW-9   Closed |

2080,444501  F3KT-11   Opened |


Linux is performing a table lookup from the bottom to the top.
In case a user would ask for a connection to KP4DJT-8 we see that
the direct route is closed.
Without the patch, the request would time out after a direct
connection to KP4DJT-8 would have failed.
With the present patch, Linux kernel will first look in the table for
a connected node routing starting at a 10 digits address 3100,813626,
down to a less specific 4 digit address 3100 where it founds
that route to K4GBB-9 is opened.
Then, the connect request to KP4DJT-8 is relayed through K4GBB
that is the first ROSE node available.
If no route are already opened toward KP4DJT then a second
table lookup is performed and only at this time a connect request
is sent directly to KP4DJT.
Another example can illustrate the new behavior.
Suppose a user wants to connect F4BWT-10 from this node (F6BVP).
Linux will step over the following closed routes : 2080,428501 and
2080, 428.
It will finally reach DNIC 2080 (France) and see that first
node F5KBW-9 is not connected. However, second node, F3KT-11
routing all 2080 address is connected. Thus, the connect request
to F4BWT-10 will be send through F3KT.

The present algorithm gives more chances a user to succeed in
connecting a destination through ROSE network.

Before officially submitting this patch, I would appreciate any
report from OMs having used it.


73 de Bernard, f6bvp


--------------090006060809000905050808
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
 

--------------090006060809000905050808--

From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: AX.25 cb lookup patch
Date: Wed, 3 Nov 2004 05:43:32 +0100
Message-ID: <20041103044332.GA9102@linux-mips.org>
References: <20041102203107.GA25455@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20041102203107.GA25455@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: Thomas Osterried <thomas@osterried.de>

Ax AX.25 connection is identified only by it's source and destination,
not by the device it's routed through, so fix the connection block
lookup to ignore the device of a connection.  This fixes dying connections
in case of a routing flap.

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21

Index: net/ax25/af_ax25.c
===================================================================
RCS file: /home/cvs/linux/net/ax25/af_ax25.c,v
retrieving revision 1.59
diff -u -r1.59 af_ax25.c
--- net/ax25/af_ax25.c	12 Oct 2004 01:45:52 -0000	1.59
+++ net/ax25/af_ax25.c	3 Nov 2004 03:23:53 -0000
@@ -207,16 +207,8 @@
 			continue;
 		if (s->ax25_dev == NULL)
 			continue;
-		if (ax25cmp(&s->source_addr, src_addr) == 0 && ax25cmp(&s->dest_addr, dest_addr) == 0 && s->ax25_dev->dev == dev) {
-			if (digi != NULL && digi->ndigi != 0) {
-				if (s->digipeat == NULL)
-					continue;
-				if (ax25digicmp(s->digipeat, digi) != 0)
-					continue;
-			} else {
-				if (s->digipeat != NULL && s->digipeat->ndigi != 0)
-					continue;
-			}
+		if (ax25cmp(&s->source_addr, src_addr) == 0 &&
+		    ax25cmp(&s->dest_addr, dest_addr) == 0) {
 			ax25_cb_hold(s);
 			spin_unlock_bh(&ax25_list_lock);
 

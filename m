From: Ralf Baechle <ralf@linux-mips.org>
Subject: [AX.25] Make ax2asc thread-proof
Date: Tue, 6 Sep 2005 19:12:22 +0100
Message-ID: <20050906181222.GA451@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernelorg, linux-hams@vger.kernel.org

Ax2asc was still using a static buffer for all invocations which isn't
exactly SMP-safe.  Change ax2asc to take an additional result buffer as
the argument.  Change all callers to provide such a buffer.

Signed-off-by: Ralf Baechle DL5RB <ralf@linux-mips.org>

 include/net/ax25.h     |    2 +-
 net/ax25/af_ax25.c     |    7 ++++---
 net/ax25/ax25_addr.c   |    3 +--
 net/ax25/ax25_route.c  |    7 +++++--
 net/ax25/ax25_uid.c    |    4 +++-
 net/netrom/af_netrom.c |    7 ++++---
 net/netrom/nr_route.c  |    8 +++++---
 net/rose/af_rose.c     |    6 ++++--
 net/rose/rose_route.c  |   14 +++++++++-----
 net/rose/rose_subr.c   |    5 +++--
 10 files changed, 39 insertions(+), 24 deletions(-)

Index: linux-cvs/include/net/ax25.h
===================================================================
--- linux-cvs.orig/include/net/ax25.h
+++ linux-cvs/include/net/ax25.h
@@ -278,7 +278,7 @@ extern struct sock *ax25_make_new(struct
 
 /* ax25_addr.c */
 extern ax25_address null_ax25_address;
-extern char *ax2asc(ax25_address *);
+extern char *ax2asc(char *buf, ax25_address *);
 extern ax25_address *asc2ax(char *);
 extern int  ax25cmp(ax25_address *, ax25_address *);
 extern int  ax25digicmp(ax25_digi *, ax25_digi *);
Index: linux-cvs/net/ax25/af_ax25.c
===================================================================
--- linux-cvs.orig/net/ax25/af_ax25.c
+++ linux-cvs/net/ax25/af_ax25.c
@@ -1863,6 +1863,7 @@ static void ax25_info_stop(struct seq_fi
 static int ax25_info_show(struct seq_file *seq, void *v)
 {
 	ax25_cb *ax25 = v;
+	char buf[11];
 	int k;
 
 
@@ -1874,13 +1875,13 @@ static int ax25_info_show(struct seq_fil
 	seq_printf(seq, "%8.8lx %s %s%s ",
 		   (long) ax25,
 		   ax25->ax25_dev == NULL? "???" : ax25->ax25_dev->dev->name,
-		   ax2asc(&ax25->source_addr),
+		   ax2asc(buf, &ax25->source_addr),
 		   ax25->iamdigi? "*":"");
-	seq_printf(seq, "%s", ax2asc(&ax25->dest_addr));
+	seq_printf(seq, "%s", ax2asc(buf, &ax25->dest_addr));
 
 	for (k=0; (ax25->digipeat != NULL) && (k < ax25->digipeat->ndigi); k++) {
 		seq_printf(seq, ",%s%s",
-			   ax2asc(&ax25->digipeat->calls[k]),
+			   ax2asc(buf, &ax25->digipeat->calls[k]),
 			   ax25->digipeat->repeated[k]? "*":"");
 	}
 
Index: linux-cvs/net/ax25/ax25_addr.c
===================================================================
--- linux-cvs.orig/net/ax25/ax25_addr.c
+++ linux-cvs/net/ax25/ax25_addr.c
@@ -36,9 +36,8 @@ ax25_address null_ax25_address = {{0x40,
 /*
  *	ax25 -> ascii conversion
  */
-char *ax2asc(ax25_address *a)
+char *ax2asc(char *buf, ax25_address *a)
 {
-	static char buf[11];
 	char c, *s;
 	int n;
 
Index: linux-cvs/net/ax25/ax25_route.c
===================================================================
--- linux-cvs.orig/net/ax25/ax25_route.c
+++ linux-cvs/net/ax25/ax25_route.c
@@ -284,6 +284,8 @@ static void ax25_rt_seq_stop(struct seq_
 
 static int ax25_rt_seq_show(struct seq_file *seq, void *v)
 {
+	char buf[11];
+
 	if (v == SEQ_START_TOKEN)
 		seq_puts(seq, "callsign  dev  mode digipeaters\n");
 	else {
@@ -294,7 +296,7 @@ static int ax25_rt_seq_show(struct seq_f
 		if (ax25cmp(&ax25_rt->callsign, &null_ax25_address) == 0)
 			callsign = "default";
 		else
-			callsign = ax2asc(&ax25_rt->callsign);
+			callsign = ax2asc(buf, &ax25_rt->callsign);
 
 		seq_printf(seq, "%-9s %-4s",
 			callsign,
@@ -314,7 +316,8 @@ static int ax25_rt_seq_show(struct seq_f
 
 		if (ax25_rt->digipeat != NULL)
 			for (i = 0; i < ax25_rt->digipeat->ndigi; i++)
-				seq_printf(seq, " %s", ax2asc(&ax25_rt->digipeat->calls[i]));
+				seq_printf(seq, " %s",
+				     ax2asc(buf, &ax25_rt->digipeat->calls[i]));
 
 		seq_puts(seq, "\n");
 	}
Index: linux-cvs/net/ax25/ax25_uid.c
===================================================================
--- linux-cvs.orig/net/ax25/ax25_uid.c
+++ linux-cvs/net/ax25/ax25_uid.c
@@ -168,12 +168,14 @@ static void ax25_uid_seq_stop(struct seq
 
 static int ax25_uid_seq_show(struct seq_file *seq, void *v)
 {
+	char buf[11];
+
 	if (v == SEQ_START_TOKEN)
 		seq_printf(seq, "Policy: %d\n", ax25_uid_policy);
 	else {
 		struct ax25_uid_assoc *pt = v;
 
-		seq_printf(seq, "%6d %s\n", pt->uid, ax2asc(&pt->call));
+		seq_printf(seq, "%6d %s\n", pt->uid, ax2asc(buf, &pt->call));
 	}
 	return 0;
 }
Index: linux-cvs/net/netrom/af_netrom.c
===================================================================
--- linux-cvs.orig/net/netrom/af_netrom.c
+++ linux-cvs/net/netrom/af_netrom.c
@@ -1265,6 +1265,7 @@ static int nr_info_show(struct seq_file 
 	struct net_device *dev;
 	struct nr_sock *nr;
 	const char *devname;
+	char buf[11];
 
 	if (v == SEQ_START_TOKEN)
 		seq_puts(seq,
@@ -1280,11 +1281,11 @@ static int nr_info_show(struct seq_file 
 		else
 			devname = dev->name;
 
-		seq_printf(seq, "%-9s ", ax2asc(&nr->user_addr));
-		seq_printf(seq, "%-9s ", ax2asc(&nr->dest_addr));
+		seq_printf(seq, "%-9s ", ax2asc(buf, &nr->user_addr));
+		seq_printf(seq, "%-9s ", ax2asc(buf, &nr->dest_addr));
 		seq_printf(seq, 
 "%-9s %-3s  %02X/%02X %02X/%02X %2d %3d %3d %3d %3lu/%03lu %2lu/%02lu %3lu/%03lu %3lu/%03lu %2d/%02d %3d %5d %5d %ld\n",
-			ax2asc(&nr->source_addr),
+			ax2asc(buf, &nr->source_addr),
 			devname,
 			nr->my_index,
 			nr->my_id,
Index: linux-cvs/net/netrom/nr_route.c
===================================================================
--- linux-cvs.orig/net/netrom/nr_route.c
+++ linux-cvs/net/netrom/nr_route.c
@@ -881,6 +881,7 @@ static void nr_node_stop(struct seq_file
 
 static int nr_node_show(struct seq_file *seq, void *v)
 {
+	char buf[11];
 	int i;
 
 	if (v == SEQ_START_TOKEN)
@@ -890,7 +891,7 @@ static int nr_node_show(struct seq_file 
 		struct nr_node *nr_node = v;
 		nr_node_lock(nr_node);
 		seq_printf(seq, "%-9s %-7s  %d %d",
-			ax2asc(&nr_node->callsign),
+			ax2asc(buf, &nr_node->callsign),
 			(nr_node->mnemonic[0] == '\0') ? "*" : nr_node->mnemonic,
 			nr_node->which + 1,
 			nr_node->count);
@@ -964,6 +965,7 @@ static void nr_neigh_stop(struct seq_fil
 
 static int nr_neigh_show(struct seq_file *seq, void *v)
 {
+	char buf[11];
 	int i;
 
 	if (v == SEQ_START_TOKEN)
@@ -973,7 +975,7 @@ static int nr_neigh_show(struct seq_file
 
 		seq_printf(seq, "%05d %-9s %-4s  %3d    %d   %3d    %3d",
 			nr_neigh->number,
-			ax2asc(&nr_neigh->callsign),
+			ax2asc(buf, &nr_neigh->callsign),
 			nr_neigh->dev ? nr_neigh->dev->name : "???",
 			nr_neigh->quality,
 			nr_neigh->locked,
@@ -983,7 +985,7 @@ static int nr_neigh_show(struct seq_file
 		if (nr_neigh->digipeat != NULL) {
 			for (i = 0; i < nr_neigh->digipeat->ndigi; i++)
 				seq_printf(seq, " %s", 
-					   ax2asc(&nr_neigh->digipeat->calls[i]));
+					   ax2asc(buf, &nr_neigh->digipeat->calls[i]));
 		}
 
 		seq_puts(seq, "\n");
Index: linux-cvs/net/rose/af_rose.c
===================================================================
--- linux-cvs.orig/net/rose/af_rose.c
+++ linux-cvs/net/rose/af_rose.c
@@ -1361,6 +1361,8 @@ static void rose_info_stop(struct seq_fi
 
 static int rose_info_show(struct seq_file *seq, void *v)
 {
+	char buf[11];
+
 	if (v == SEQ_START_TOKEN)
 		seq_puts(seq, 
 			 "dest_addr  dest_call src_addr   src_call  dev   lci neigh st vs vr va   t  t1  t2  t3  hb    idle Snd-Q Rcv-Q inode\n");
@@ -1378,12 +1380,12 @@ static int rose_info_show(struct seq_fil
 		
 		seq_printf(seq, "%-10s %-9s ",
 			rose2asc(&rose->dest_addr),
-			ax2asc(&rose->dest_call));
+			ax2asc(buf, &rose->dest_call));
 
 		if (ax25cmp(&rose->source_call, &null_ax25_address) == 0)
 			callsign = "??????-?";
 		else
-			callsign = ax2asc(&rose->source_call);
+			callsign = ax2asc(buf, &rose->source_call);
 
 		seq_printf(seq,
 			   "%-10s %-9s %-5s %3.3X %05d  %d  %d  %d  %d %3lu %3lu %3lu %3lu %3lu %3lu/%03lu %5d %5d %ld\n",
Index: linux-cvs/net/rose/rose_route.c
===================================================================
--- linux-cvs.orig/net/rose/rose_route.c
+++ linux-cvs/net/rose/rose_route.c
@@ -851,6 +851,7 @@ int rose_route_frame(struct sk_buff *skb
 	unsigned char cause, diagnostic;
 	struct net_device *dev;
 	int len, res = 0;
+	char buf[11];
 
 #if 0
 	if (call_in_firewall(PF_ROSE, skb->dev, skb->data, NULL, &skb) != FW_ACCEPT)
@@ -876,7 +877,7 @@ int rose_route_frame(struct sk_buff *skb
 
 	if (rose_neigh == NULL) {
 		printk("rose_route : unknown neighbour or device %s\n",
-		       ax2asc(&ax25->dest_addr));
+		       ax2asc(buf, &ax25->dest_addr));
 		goto out;
 	}
 
@@ -1178,6 +1179,7 @@ static void rose_neigh_stop(struct seq_f
 
 static int rose_neigh_show(struct seq_file *seq, void *v)
 {
+	char buf[11];
 	int i;
 
 	if (v == SEQ_START_TOKEN)
@@ -1189,7 +1191,7 @@ static int rose_neigh_show(struct seq_fi
 		/* if (!rose_neigh->loopback) { */
 		seq_printf(seq, "%05d %-9s %-4s   %3d %3d  %3s     %3s %3lu %3lu",
 			   rose_neigh->number,
-			   (rose_neigh->loopback) ? "RSLOOP-0" : ax2asc(&rose_neigh->callsign),
+			   (rose_neigh->loopback) ? "RSLOOP-0" : ax2asc(buf, &rose_neigh->callsign),
 			   rose_neigh->dev ? rose_neigh->dev->name : "???",
 			   rose_neigh->count,
 			   rose_neigh->use,
@@ -1200,7 +1202,7 @@ static int rose_neigh_show(struct seq_fi
 
 		if (rose_neigh->digipeat != NULL) {
 			for (i = 0; i < rose_neigh->digipeat->ndigi; i++)
-				seq_printf(seq, " %s", ax2asc(&rose_neigh->digipeat->calls[i]));
+				seq_printf(seq, " %s", ax2asc(buf, &rose_neigh->digipeat->calls[i]));
 		}
 
 		seq_puts(seq, "\n");
@@ -1260,6 +1262,8 @@ static void rose_route_stop(struct seq_f
 
 static int rose_route_show(struct seq_file *seq, void *v)
 {
+	char buf[11];
+
 	if (v == SEQ_START_TOKEN)
 		seq_puts(seq, 
 			 "lci  address     callsign   neigh  <-> lci  address     callsign   neigh\n");
@@ -1271,7 +1275,7 @@ static int rose_route_show(struct seq_fi
 				   "%3.3X  %-10s  %-9s  %05d      ",
 				   rose_route->lci1,
 				   rose2asc(&rose_route->src_addr),
-				   ax2asc(&rose_route->src_call),
+				   ax2asc(buf, &rose_route->src_call),
 				   rose_route->neigh1->number);
 		else 
 			seq_puts(seq, 
@@ -1282,7 +1286,7 @@ static int rose_route_show(struct seq_fi
 				   "%3.3X  %-10s  %-9s  %05d\n",
 				rose_route->lci2,
 				rose2asc(&rose_route->dest_addr),
-				ax2asc(&rose_route->dest_call),
+				ax2asc(buf, &rose_route->dest_call),
 				rose_route->neigh2->number);
 		 else 
 			 seq_puts(seq,
Index: linux-cvs/net/rose/rose_subr.c
===================================================================
--- linux-cvs.orig/net/rose/rose_subr.c
+++ linux-cvs/net/rose/rose_subr.c
@@ -400,6 +400,7 @@ static int rose_create_facilities(unsign
 {
 	unsigned char *p = buffer + 1;
 	char *callsign;
+	char buf[11];
 	int len, nb;
 
 	/* National Facilities */
@@ -456,7 +457,7 @@ static int rose_create_facilities(unsign
 
 	*p++ = FAC_CCITT_DEST_NSAP;
 
-	callsign = ax2asc(&rose->dest_call);
+	callsign = ax2asc(buf, &rose->dest_call);
 
 	*p++ = strlen(callsign) + 10;
 	*p++ = (strlen(callsign) + 9) * 2;		/* ??? */
@@ -471,7 +472,7 @@ static int rose_create_facilities(unsign
 
 	*p++ = FAC_CCITT_SRC_NSAP;
 
-	callsign = ax2asc(&rose->source_call);
+	callsign = ax2asc(buf, &rose->source_call);
 
 	*p++ = strlen(callsign) + 10;
 	*p++ = (strlen(callsign) + 9) * 2;		/* ??? */

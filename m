From: bernard pidoux <bpidoux@free.fr>
Subject: libax25-0.0.12-rc2 patch
Date: Sun, 18 Oct 2009 13:41:40 +0200
Message-ID: <4ADAFEF4.9090709@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060901010505060207000606"
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: linux-hams <linux-hams@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Thomas Osterried DL9SAU <ax25@x-berg.in-berlin.de>

This is a multi-part message in MIME format.
--------------060901010505060207000606
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I noticed that "official" libax25 does not include patches introduced
into my "unofficial" libax25 versions a few months ago.

Thus, I send here the first set from my own work on libax25 .

   * BUG in proc_ax25 structure timers members size declared in        
          procutils.h. Since in kernel 2.6 the timers are now in 
milliseconds,
          they need more place to be saved (unsigned short --> unsigned 
long).
         Corrected, together with functions reading proc files in 
procutils.c.

    * BUG in procutils.h and procutils.c
          in structure proc_rs_neigh field "use" was missing,
          in function read_proc_rs_neigh proc_rs_neigh use was not read,

 -- Bernard Pidoux <f6bvp@amsat.org>  Jun 1 2008



--------------060901010505060207000606
Content-Type: text/plain;
 name="libax25-0.0.12-rc2_procutils.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="libax25-0.0.12-rc2_procutils.patch"

--- libax25-0.0.12-rc2/netax25/procutils.h	2009-06-21 00:53:51.000000000 +0200
+++ libax25-0.0.12-rc2/netax25/procutils.h	2008-07-10 21:32:18.000000000 +0200
@@ -55,13 +55,13 @@
 	int			ndigi;
 	unsigned char		st;
 	unsigned short		vs, vr, va;
-	unsigned short		t1, t1timer, t2, t2timer, t3, t3timer;
-	unsigned short		idle, idletimer;
-	unsigned char		n2, n2count;
-	unsigned short		rtt;
+	unsigned long		t1timer, t1, t2timer, t2, t3timer, t3;
+	unsigned long		idletimer, idle;
+	unsigned char		n2count, n2;
+	unsigned long		rtt;
 	unsigned char		window;
 	unsigned short		paclen;
-	unsigned long		sndq, rcvq;
+	unsigned short		sndq, rcvq;
 	unsigned long		inode;
 
 	struct proc_ax25	*next;
@@ -73,11 +73,11 @@
 	char			my_circuit[6], ur_circuit[6];
 	unsigned char		st;
 	unsigned short		vs, vr, va;
-	unsigned short		t1, t1timer, t2, t2timer, t4, t4timer;
-	unsigned short		idle, idletimer;
-	unsigned char		n2, n2count;
+	unsigned long		t1timer, t1, t2timer, t2, t4timer, t4;
+	unsigned long		idletimer, idle;
+	unsigned char		n2count, n2;
 	unsigned char		window;
-	unsigned long		sndq, rcvq;
+	unsigned short		sndq, rcvq;
 	unsigned long		inode;
 
 	struct proc_nr		*next;
@@ -120,33 +120,34 @@
 };
 
 struct proc_rs_route {
-	unsigned short	lci1;
+	unsigned short		lci1;
 	char			address1[11], call1[10];
-	unsigned int	neigh1;
-	unsigned short	lci2;
+	unsigned int		neigh1;
+	unsigned short		lci2;
 	char			address2[11], call2[10];
-	unsigned int	neigh2;
+	unsigned int		neigh2;
 
 	struct proc_rs_route	*next;
 };
 
 struct proc_rs_neigh {
-	int				addr;
+	int			addr;
 	char			call[10];
 	char			dev[14];
-	int				count;
+	unsigned int		count;
+	unsigned int		use;
 	char			mode[4];
 	char			restart[4];
-	unsigned short	t0, tf;
+	unsigned short		t0, tf;
 
 	struct proc_rs_neigh	*next;
 };
 
 struct proc_rs_nodes {
 	char			address[11];
-	unsigned char	mask;
-	unsigned char	n;
-	unsigned int	neigh1, neigh2, neigh3;
+	unsigned char		mask;
+	unsigned char		n;
+	unsigned int		neigh1, neigh2, neigh3;
 
 	struct proc_rs_nodes	*next;
 };
--- libax25-0.0.12-rc2/procutils.c	2009-06-21 00:54:50.000000000 +0200
+++ libax25-0.0.12-rc2/procutils.c	2008-07-10 21:32:18.000000000 +0200
@@ -117,22 +121,22 @@
 		p->vr = safe_atoi(token(&cp, space));
 		p->va = safe_atoi(token(&cp, space));
 
-		p->t1timer = safe_atoi(token(&cp, space));
-		p->t1      = safe_atoi(token(&cp, space));
+		p->t1timer = safe_atox(token(&cp, space));
+		p->t1      = safe_atox(token(&cp, space));
 
-		p->t2timer = safe_atoi(token(&cp, space));
-		p->t2      = safe_atoi(token(&cp, space));
+		p->t2timer = safe_atox(token(&cp, space));
+		p->t2      = safe_atox(token(&cp, space));
 
-		p->t3timer = safe_atoi(token(&cp, space));
-		p->t3      = safe_atoi(token(&cp, space));
+		p->t3timer = safe_atox(token(&cp, space));
+		p->t3      = safe_atox(token(&cp, space));
 
-		p->idletimer = safe_atoi(token(&cp, space));
-		p->idle      = safe_atoi(token(&cp, space));
+		p->idletimer = safe_atox(token(&cp, space));
+		p->idle      = safe_atox(token(&cp, space));
 
 		p->n2count = safe_atoi(token(&cp, space));
 		p->n2      = safe_atoi(token(&cp, space));
 
-		p->rtt    = safe_atoi(token(&cp, space));
+		p->rtt    = safe_atox(token(&cp, space));
 
 		p->window = safe_atoi(token(&cp, space));
 
@@ -141,7 +145,7 @@
 		p->sndq   = safe_atoi(token(&cp, space));
 		p->rcvq   = safe_atoi(token(&cp, space));
 
-		p->inode  = safe_atoi(token(&cp, space));
+		p->inode  = safe_atox(token(&cp, space));
 
 		p->next = list;
 		list = p;
@@ -244,21 +248,21 @@
 		p->vr = safe_atoi(token(&cp, space));
 		p->va = safe_atoi(token(&cp, space));
 
-		p->t1timer   = safe_atoi(token(&cp, "/"));
-		p->t1        = safe_atoi(token(&cp, "/ \t\r\n"));
-		p->t2timer   = safe_atoi(token(&cp, "/"));
-		p->t2        = safe_atoi(token(&cp, "/ \t\r\n"));
-		p->t4timer   = safe_atoi(token(&cp, "/"));
-		p->t4        = safe_atoi(token(&cp, "/ \t\r\n"));
-		p->idletimer = safe_atoi(token(&cp, "/"));
-		p->idle      = safe_atoi(token(&cp, "/ \t\r\n"));
+		p->t1timer   = safe_atox(token(&cp, "/"));
+		p->t1        = safe_atox(token(&cp, "/ \t\r\n"));
+		p->t2timer   = safe_atox(token(&cp, "/"));
+		p->t2        = safe_atox(token(&cp, "/ \t\r\n"));
+		p->t4timer   = safe_atox(token(&cp, "/"));
+		p->t4        = safe_atox(token(&cp, "/ \t\r\n"));
+		p->idletimer = safe_atox(token(&cp, "/"));
+		p->idle      = safe_atox(token(&cp, "/ \t\r\n"));
 		p->n2count   = safe_atoi(token(&cp, "/"));
 		p->n2        = safe_atoi(token(&cp, "/ \t\r\n"));
 
 		p->window = safe_atoi(token(&cp, space));
 		p->sndq   = safe_atoi(token(&cp, space));
 		p->rcvq   = safe_atoi(token(&cp, space));
-		p->inode  = safe_atoi(token(&cp, space));
+		p->inode  = safe_atox(token(&cp, space));
 
 		p->next = list;
 		list = p;
@@ -495,6 +499,7 @@
 		safe_strncpy(p->call, strtok(NULL, " \t\n\r"), 9);
 		safe_strncpy(p->dev,  strtok(NULL, " \t\n\r"), 13);
 		p->count = safe_atoi(strtok(NULL, " \t\n\r"));
+		p->use = safe_atoi(strtok(NULL, " \t\n\r"));
 		safe_strncpy(p->mode,  strtok(NULL, " \t\n\r"), 3);
 		safe_strncpy(p->restart,  strtok(NULL, " \t\n\r"), 3);
 		p->t0 = safe_atoi(strtok(NULL, " \t\n\r"));

--------------060901010505060207000606--

From: Cathryn Mataga <cathryn@junglevision.com>
Subject: Re: xfbbd oddness.
Date: Sat, 13 Nov 2010 22:52:04 -0800
Message-ID: <4CDF8714.70503@junglevision.com>
References: <Pine.LNX.4.64.1005271432450.5422@ask.diku.dk> <20100527.162919.115912825.davem@davemloft.net> <4CD99C63.4030406@junglevision.com> <4CDA0972.40108@junglevision.com> <4CDDB066.4040801@junglevision.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080706060001070002060009"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4CDDB066.4040801@junglevision.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org
Cc: bernard.pidoux@upmic.fr

This is a multi-part message in MIME format.
--------------080706060001070002060009
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Patch versus version r11



1. SOCK_MAXCHAN (drv_sock.c) now set to (MAXVOIES)  This was set to 50, which was less than MAXVOIES, and the code was
accessing data off the end of this table.  This was causing strange problems.  After I made this change the gateway
function started working again.  If anyone was having trouble with xfbbd and RF radio connections, this change may
possibly fix their problem.
2.  Several minor changes designed to eliminate "Bad file descriptor" error messages.  These occurred at the time
of housekeeping due to a minor bug.  The messages actually turned out to be harmless, as far as I can tell.
3.  Only use the signal handler for signals that have functionality in the code.  This is a simplification
to prevent bugs.  Other signals are set to SIG_IGN.




--------------080706060001070002060009
Content-Type: text/plain;
 name="diff.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="diff.patch"

diff -ruN fbbsrc.704r11/src/drv_sock.c fbbsrc.704r11cathryn/src/drv_sock.c
--- fbbsrc.704r11/src/drv_sock.c	2010-06-22 13:03:01.000000000 -0700
+++ fbbsrc.704r11cathryn/src/drv_sock.c	2010-11-13 22:43:56.284120401 -0800
@@ -74,7 +74,8 @@
 #define RETR_EVENT 3
 #define BUSY_EVENT 4
 
-#define SOCK_MAXCAN 50
+#define SOCK_MAXCAN  (MAXVOIES) /* was 50 -- this was causing bad problems. 
+			This table was being accessed beyond the array */
 
 #define	CAN_AX25	0
 #define	CAN_NETROM	1
@@ -104,7 +105,7 @@
 }
 scan_t;
 
-scan_t scan[SOCK_MAXCAN];
+scan_t scan[SOCK_MAXCAN] = {{0}};  /* I think this is necessary (Though not 100% sure.  */
 
 static int last_can = 1;
 static int msocket = -1;
@@ -692,8 +693,11 @@
 
 static int stop_cnx (int port)
 {
-	close(p_port[port].fd);
-	p_port[port].fd = 0;
+	if (p_port[port].fd) /* Prevent closing of 0 */
+	{
+		close(p_port[port].fd);
+		p_port[port].fd = 0;
+	}
 	return 1;
 }
 
diff -ruN fbbsrc.704r11/src/drv_tcp.c fbbsrc.704r11cathryn/src/drv_tcp.c
--- fbbsrc.704r11/src/drv_tcp.c	2009-11-27 08:50:44.000000000 -0800
+++ fbbsrc.704r11cathryn/src/drv_tcp.c	2010-11-13 16:55:53.363119445 -0800
@@ -950,8 +950,11 @@
 
 static int stop_cnx (int port)
 {
-	close(p_port[port].fd);
-	p_port[port].fd = 0;
+	if (p_port[port].fd) /* Prevent closing of 0 */
+	{
+		close(p_port[port].fd);
+		p_port[port].fd = 0;
+	}
 	return 1;
 }
 
@@ -1439,7 +1442,7 @@
 	fd_set tcp_excep;
 	struct timeval to;
 
-	if (can->sock == -1)
+	if (can->sock <= 0) /* Was -1.  Sock=0 during housekeeping.  Cause of select errors */
 		return (0);
 
 	if ((can->timeout) && (can->timeout < time (NULL)))
diff -ruN fbbsrc.704r11/src/xfbbd.c fbbsrc.704r11cathryn/src/xfbbd.c
--- fbbsrc.704r11/src/xfbbd.c	2009-11-27 08:50:44.000000000 -0800
+++ fbbsrc.704r11cathryn/src/xfbbd.c	2010-11-13 17:10:40.879123108 -0800
@@ -195,7 +195,10 @@
 	{
 		if (i == SIGBUS || i == SIGSEGV || i == SIGALRM)
 			continue;
-		signal (i, sig_fct);
+		else if (i == SIGHUP  || i == SIGTERM || i == SIGBUS || i == SIGSEGV)
+			signal (i, sig_fct); /* Use sig_fct only for signals that do something */
+		else 	
+			signal (i, SIG_IGN); /* Otherwise ignore */
 	}
 
 	for (ng = 1; ng < ac; ng++)

--------------080706060001070002060009--

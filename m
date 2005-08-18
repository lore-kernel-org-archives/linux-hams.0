From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: [PATCH 2/3] Eleminate HZ from NET/ROM kernel interfaces
Date: Thu, 18 Aug 2005 19:13:08 +0100
Message-ID: <20050818181308.GB24742@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams <linux-hams@vger.kernel.org>

Convert all NET/ROM sysctl time values from jiffies to ms as units.

Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

 include/net/netrom.h   |    8 ++++----
 net/netrom/af_netrom.c |   15 ++++++++++-----
 2 files changed, 14 insertions(+), 9 deletions(-)

Index: linux-cvs/include/net/netrom.h
===================================================================
--- linux-cvs.orig/include/net/netrom.h
+++ linux-cvs/include/net/netrom.h
@@ -42,11 +42,11 @@ enum {
 #define	NR_COND_PEER_RX_BUSY		0x04
 #define	NR_COND_OWN_RX_BUSY		0x08
 
-#define NR_DEFAULT_T1			(120 * HZ)	/* Outstanding frames - 120 seconds */
-#define NR_DEFAULT_T2			(5   * HZ)	/* Response delay     - 5 seconds */
+#define NR_DEFAULT_T1			120000		/* Outstanding frames - 120 seconds */
+#define NR_DEFAULT_T2			5000		/* Response delay     - 5 seconds */
 #define NR_DEFAULT_N2			3		/* Number of Retries - 3 */
-#define	NR_DEFAULT_T4			(180 * HZ)	/* Busy Delay - 180 seconds */
-#define	NR_DEFAULT_IDLE			(0 * 60 * HZ)	/* No Activity Timeout - none */
+#define	NR_DEFAULT_T4			180000		/* Busy Delay - 180 seconds */
+#define	NR_DEFAULT_IDLE			0		/* No Activity Timeout - none */
 #define	NR_DEFAULT_WINDOW		4		/* Default Window Size - 4 */
 #define	NR_DEFAULT_OBS			6		/* Default Obsolescence Count - 6 */
 #define	NR_DEFAULT_QUAL			10		/* Default Neighbour Quality - 10 */
Index: linux-cvs/net/netrom/af_netrom.c
===================================================================
--- linux-cvs.orig/net/netrom/af_netrom.c
+++ linux-cvs/net/netrom/af_netrom.c
@@ -424,11 +424,16 @@ static int nr_create(struct socket *sock
 
 	nr_init_timers(sk);
 
-	nr->t1     = sysctl_netrom_transport_timeout;
-	nr->t2     = sysctl_netrom_transport_acknowledge_delay;
-	nr->n2     = sysctl_netrom_transport_maximum_tries;
-	nr->t4     = sysctl_netrom_transport_busy_delay;
-	nr->idle   = sysctl_netrom_transport_no_activity_timeout;
+	nr->t1     =
+		msecs_to_jiffies(sysctl_netrom_transport_timeout);
+	nr->t2     =
+		msecs_to_jiffies(sysctl_netrom_transport_acknowledge_delay);
+	nr->n2     =
+		msecs_to_jiffies(sysctl_netrom_transport_maximum_tries);
+	nr->t4     =
+		msecs_to_jiffies(sysctl_netrom_transport_busy_delay);
+	nr->idle   =
+		msecs_to_jiffies(sysctl_netrom_transport_no_activity_timeout);
 	nr->window = sysctl_netrom_transport_requested_window_size;
 
 	nr->bpqext = 1;

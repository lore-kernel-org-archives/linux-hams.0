From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: [PATCH 3/3] Eleminate HZ from ROSE kernel interfaces
Date: Thu, 18 Aug 2005 19:13:56 +0100
Message-ID: <20050818181356.GC24742@linux-mips.org>
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

 include/net/rose.h   |   14 +++++++-------
 net/rose/af_rose.c   |   10 +++++-----
 net/rose/rose_link.c |    6 ++++--
 3 files changed, 16 insertions(+), 14 deletions(-)

Index: linux-cvs/include/net/rose.h
===================================================================
--- linux-cvs.orig/include/net/rose.h
+++ linux-cvs/include/net/rose.h
@@ -49,14 +49,14 @@ enum {
 	ROSE_STATE_5			/* Deferred Call Acceptance */
 };
 
-#define ROSE_DEFAULT_T0			(180 * HZ)	/* Default T10 T20 value */
-#define ROSE_DEFAULT_T1			(200 * HZ)	/* Default T11 T21 value */
-#define ROSE_DEFAULT_T2			(180 * HZ)	/* Default T12 T22 value */
-#define	ROSE_DEFAULT_T3			(180 * HZ)	/* Default T13 T23 value */
-#define	ROSE_DEFAULT_HB			(5 * HZ)	/* Default Holdback value */
-#define	ROSE_DEFAULT_IDLE		(0 * 60 * HZ)	/* No Activity Timeout - none */
+#define ROSE_DEFAULT_T0			180000		/* Default T10 T20 value */
+#define ROSE_DEFAULT_T1			200000		/* Default T11 T21 value */
+#define ROSE_DEFAULT_T2			180000		/* Default T12 T22 value */
+#define	ROSE_DEFAULT_T3			180000		/* Default T13 T23 value */
+#define	ROSE_DEFAULT_HB			5000		/* Default Holdback value */
+#define	ROSE_DEFAULT_IDLE		0		/* No Activity Timeout - none */
 #define	ROSE_DEFAULT_ROUTING		1		/* Default routing flag */
-#define	ROSE_DEFAULT_FAIL_TIMEOUT	(120 * HZ)	/* Time until link considered usable */
+#define	ROSE_DEFAULT_FAIL_TIMEOUT	120000		/* Time until link considered usable */
 #define	ROSE_DEFAULT_MAXVC		50		/* Maximum number of VCs per neighbour */
 #define	ROSE_DEFAULT_WINDOW_SIZE	7		/* Default window size */
 
Index: linux-cvs/net/rose/af_rose.c
===================================================================
--- linux-cvs.orig/net/rose/af_rose.c
+++ linux-cvs/net/rose/af_rose.c
@@ -516,11 +516,11 @@ static int rose_create(struct socket *so
 	init_timer(&rose->timer);
 	init_timer(&rose->idletimer);
 
-	rose->t1   = sysctl_rose_call_request_timeout;
-	rose->t2   = sysctl_rose_reset_request_timeout;
-	rose->t3   = sysctl_rose_clear_request_timeout;
-	rose->hb   = sysctl_rose_ack_hold_back_timeout;
-	rose->idle = sysctl_rose_no_activity_timeout;
+	rose->t1   = msecs_to_jiffies(sysctl_rose_call_request_timeout);
+	rose->t2   = msecs_to_jiffies(sysctl_rose_reset_request_timeout);
+	rose->t3   = msecs_to_jiffies(sysctl_rose_clear_request_timeout);
+	rose->hb   = msecs_to_jiffies(sysctl_rose_ack_hold_back_timeout);
+	rose->idle = msecs_to_jiffies(sysctl_rose_no_activity_timeout);
 
 	rose->state = ROSE_STATE_0;
 
Index: linux-cvs/net/rose/rose_link.c
===================================================================
--- linux-cvs.orig/net/rose/rose_link.c
+++ linux-cvs/net/rose/rose_link.c
@@ -40,7 +40,8 @@ void rose_start_ftimer(struct rose_neigh
 
 	neigh->ftimer.data     = (unsigned long)neigh;
 	neigh->ftimer.function = &rose_ftimer_expiry;
-	neigh->ftimer.expires  = jiffies + sysctl_rose_link_fail_timeout;
+	neigh->ftimer.expires  =
+		jiffies + msecs_to_jiffies(sysctl_rose_link_fail_timeout);
 
 	add_timer(&neigh->ftimer);
 }
@@ -51,7 +52,8 @@ static void rose_start_t0timer(struct ro
 
 	neigh->t0timer.data     = (unsigned long)neigh;
 	neigh->t0timer.function = &rose_t0timer_expiry;
-	neigh->t0timer.expires  = jiffies + sysctl_rose_restart_request_timeout;
+	neigh->t0timer.expires  =
+		jiffies + msecs_to_jiffies(sysctl_rose_restart_request_timeout);
 
 	add_timer(&neigh->t0timer);
 }

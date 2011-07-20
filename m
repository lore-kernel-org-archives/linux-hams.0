From: Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH 2/7] NET: ROSE: Factor our common code from functions.
Date: Wed, 20 Jul 2011 01:21:42 +0100
Message-ID: <b28b8493c126c09a3f5aed1b08e2616e60aec2e7.1311152437.git.ralf@linux-mips.org>
References: <cover.1311152437.git.ralf@linux-mips.org>
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <cover.1311152437.git.ralf@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: Bernard F6BVP <f6bvp@free.fr>

This will simplify a later fix.

Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
To: linux-hams@vger.kernel.org
Cc: Bernard F6BVP <f6bvp@free.fr>
---
 net/rose/rose_link.c |   32 ++++++++++++++++++--------------
 1 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
index fa5f564..fa8703b 100644
--- a/net/rose/rose_link.c
+++ b/net/rose/rose_link.c
@@ -94,6 +94,15 @@ static void rose_t0timer_expiry(unsigned long param)
 	rose_start_t0timer(neigh);
 }
 
+static void rose_get_neigh_callsign(ax25_address *rose_call,
+	struct rose_neigh *neigh)
+{
+	if (ax25cmp(&rose_callsign, &null_ax25_address) == 0)
+		memcpy(rose_call, neigh->dev->dev_addr, sizeof(rose_call));
+	else
+		memcpy(rose_call, &rose_callsign, sizeof(rose_call));
+}
+
 /*
  *	Interface to ax25_send_frame. Changes my level 2 callsign depending
  *	on whether we have a global ROSE callsign or use the default port
@@ -101,16 +110,14 @@ static void rose_t0timer_expiry(unsigned long param)
  */
 static int rose_send_frame(struct sk_buff *skb, struct rose_neigh *neigh)
 {
-	ax25_address *rose_call;
+	ax25_address rose_call;
 	ax25_cb *ax25s;
 
-	if (ax25cmp(&rose_callsign, &null_ax25_address) == 0)
-		rose_call = (ax25_address *)neigh->dev->dev_addr;
-	else
-		rose_call = &rose_callsign;
-
 	ax25s = neigh->ax25;
-	neigh->ax25 = ax25_send_frame(skb, 260, rose_call, &neigh->callsign, neigh->digipeat, neigh->dev);
+	rose_get_neigh_callsign(&rose_call, neigh);
+	neigh->ax25 = ax25_send_frame(skb, 260, &rose_call,
+				      &neigh->callsign, neigh->digipeat,
+				      neigh->dev);
 	if (ax25s)
 		ax25_cb_put(ax25s);
 
@@ -124,16 +131,13 @@ static int rose_send_frame(struct sk_buff *skb, struct rose_neigh *neigh)
  */
 static int rose_link_up(struct rose_neigh *neigh)
 {
-	ax25_address *rose_call;
+	ax25_address rose_call;
 	ax25_cb *ax25s;
 
-	if (ax25cmp(&rose_callsign, &null_ax25_address) == 0)
-		rose_call = (ax25_address *)neigh->dev->dev_addr;
-	else
-		rose_call = &rose_callsign;
-
 	ax25s = neigh->ax25;
-	neigh->ax25 = ax25_find_cb(rose_call, &neigh->callsign, neigh->digipeat, neigh->dev);
+	rose_get_neigh_callsign(&rose_call, neigh);
+	neigh->ax25 = ax25_find_cb(&rose_call, &neigh->callsign,
+				   neigh->digipeat, neigh->dev);
 	if (ax25s)
 		ax25_cb_put(ax25s);
 
-- 
1.7.4.4



From: Vaishali Thakkar <vthakkar1994@gmail.com>
Subject: [PATCH] net: rose: Use mod_timer
Date: Sat, 6 Jun 2015 09:52:34 +0530
Message-ID: <20150606042234.GA15542@vaishali-Ideapad-Z570>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:mime-version:content-type
         :content-disposition:user-agent;
        bh=xFwyHaP5w/d06S1NT5uMkuVzrmbhadosuxBHAb13BN0=;
        b=0jyeNB1dNgT5pEmXVG4kWtRlOuUNKVAxD0wzytHRkZhnxCWnRmD5flRSUm9sCenJ0V
         PIrdhVCFEfvK/8tYAQvGm2xg7IMyLd/gi8ossKozWyflgil1s78W/bBkFVse4vQEIeRa
         M4aG7b3x+unZK1XZmD7S2isQgR/LeL6vXYwSV4mdsM2BG1gW1d0JxEFfx4WOtyKty55t
         lzQ5NcbLO2K2Gm/w22IsoQguY0Bx0FIamrcaotezIkOqfJr5tVmU0ihFNO3A+zCn22Qq
         RrWe+95bgyYzunmWtFlBZ7FAuxh7V4vxYNF5pVCkitsDYX4PFdIQZWS2/29b3ZB4fcWP
         pWyg==
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>
Cc: "David S. Miller" <davem@davemloft.net>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

Use mod_timer instead of del_timer followed by add_timer to update
the expire field of the active timer.

The semantic patch that performs this transformation is as follows:

@change@
expression e1, e2, e3, e4;
@@

- del_timer(&e1);
... when != e1 = e3
- e1.expires = e2;
... when != e1 = e4
- add_timer (&e1);
+ mod_timer (&e1, e2);

Signed-off-by: Vaishali Thakkar <vthakkar1994@gmail.com>
---
 net/rose/rose_link.c     | 16 ++++------------
 net/rose/rose_loopback.c |  6 +-----
 net/rose/rose_timer.c    | 30 +++++-------------------------
 3 files changed, 10 insertions(+), 42 deletions(-)

diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
index e873d7d..a2409bb 100644
--- a/net/rose/rose_link.c
+++ b/net/rose/rose_link.c
@@ -36,26 +36,18 @@ static void rose_transmit_restart_request(struct rose_neigh *neigh);
 
 void rose_start_ftimer(struct rose_neigh *neigh)
 {
-	del_timer(&neigh->ftimer);
-
 	neigh->ftimer.data     = (unsigned long)neigh;
 	neigh->ftimer.function = &rose_ftimer_expiry;
-	neigh->ftimer.expires  =
-		jiffies + msecs_to_jiffies(sysctl_rose_link_fail_timeout);
-
-	add_timer(&neigh->ftimer);
+	mod_timer(&neigh->ftimer,
+		  jiffies + msecs_to_jiffies(sysctl_rose_link_fail_timeout));
 }
 
 static void rose_start_t0timer(struct rose_neigh *neigh)
 {
-	del_timer(&neigh->t0timer);
-
 	neigh->t0timer.data     = (unsigned long)neigh;
 	neigh->t0timer.function = &rose_t0timer_expiry;
-	neigh->t0timer.expires  =
-		jiffies + msecs_to_jiffies(sysctl_rose_restart_request_timeout);
-
-	add_timer(&neigh->t0timer);
+	mod_timer(&neigh->t0timer,
+		  jiffies + msecs_to_jiffies(sysctl_rose_restart_request_timeout));
 }
 
 void rose_stop_ftimer(struct rose_neigh *neigh)
diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
index 3444562..ed81864 100644
--- a/net/rose/rose_loopback.c
+++ b/net/rose/rose_loopback.c
@@ -54,13 +54,9 @@ static void rose_loopback_timer(unsigned long);
 
 static void rose_set_loopback_timer(void)
 {
-	del_timer(&loopback_timer);
-
 	loopback_timer.data     = 0;
 	loopback_timer.function = &rose_loopback_timer;
-	loopback_timer.expires  = jiffies + 10;
-
-	add_timer(&loopback_timer);
+	mod_timer(&loopback_timer, jiffies + 10);
 }
 
 static void rose_loopback_timer(unsigned long param)
diff --git a/net/rose/rose_timer.c b/net/rose/rose_timer.c
index bc5469d..7495730 100644
--- a/net/rose/rose_timer.c
+++ b/net/rose/rose_timer.c
@@ -34,65 +34,45 @@ static void rose_idletimer_expiry(unsigned long);
 
 void rose_start_heartbeat(struct sock *sk)
 {
-	del_timer(&sk->sk_timer);
-
 	sk->sk_timer.data     = (unsigned long)sk;
 	sk->sk_timer.function = &rose_heartbeat_expiry;
-	sk->sk_timer.expires  = jiffies + 5 * HZ;
-
-	add_timer(&sk->sk_timer);
+	mod_timer(&sk->sk_timer, jiffies + 5 * HZ);
 }
 
 void rose_start_t1timer(struct sock *sk)
 {
 	struct rose_sock *rose = rose_sk(sk);
 
-	del_timer(&rose->timer);
-
 	rose->timer.data     = (unsigned long)sk;
 	rose->timer.function = &rose_timer_expiry;
-	rose->timer.expires  = jiffies + rose->t1;
-
-	add_timer(&rose->timer);
+	mod_timer(&rose->timer, jiffies + rose->t1);
 }
 
 void rose_start_t2timer(struct sock *sk)
 {
 	struct rose_sock *rose = rose_sk(sk);
 
-	del_timer(&rose->timer);
-
 	rose->timer.data     = (unsigned long)sk;
 	rose->timer.function = &rose_timer_expiry;
-	rose->timer.expires  = jiffies + rose->t2;
-
-	add_timer(&rose->timer);
+	mod_timer(&rose->timer, jiffies + rose->t2);
 }
 
 void rose_start_t3timer(struct sock *sk)
 {
 	struct rose_sock *rose = rose_sk(sk);
 
-	del_timer(&rose->timer);
-
 	rose->timer.data     = (unsigned long)sk;
 	rose->timer.function = &rose_timer_expiry;
-	rose->timer.expires  = jiffies + rose->t3;
-
-	add_timer(&rose->timer);
+	mod_timer(&rose->timer, jiffies + rose->t3);
 }
 
 void rose_start_hbtimer(struct sock *sk)
 {
 	struct rose_sock *rose = rose_sk(sk);
 
-	del_timer(&rose->timer);
-
 	rose->timer.data     = (unsigned long)sk;
 	rose->timer.function = &rose_timer_expiry;
-	rose->timer.expires  = jiffies + rose->hb;
-
-	add_timer(&rose->timer);
+	mod_timer(&rose->timer, jiffies + rose->hb);
 }
 
 void rose_start_idletimer(struct sock *sk)
-- 
1.9.1


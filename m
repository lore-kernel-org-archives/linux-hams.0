From: Ralf Baechle <ralf@linux-mips.org>
Subject: NETROM locking, was: Re: [PATCH 1/9] Use netdev_priv in NETROM and ROSE
Date: Mon, 31 Jan 2005 04:33:37 +0000
Message-ID: <20050131043337.GA16895@linux-mips.org>
References: <20050130212147.GA6399@linux-mips.org> <20050131030602Z8225224-1340+2359@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20050131030602Z8225224-1340+2359@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin <kevin@w1ngl.us>
Cc: linux-hams@vger.kernel.org

On Sun, Jan 30, 2005 at 07:05:49PM -0800, Kevin wrote:

> Message-Id: <20050131030602Z8225224-1340+2359@linux-mips.org>

Your mailer seems to be sending out mails without message ID.  Seems like
time to fix it ;-)

> Will this fix this?
> kernel: net/netrom/nr_in.c:77: spin_lock(net/core/sock.c:ca9f2860) already
> locked by net/netrom/af_netrom.c/176
> kernel: net/netrom/af_netrom.c:914: spin_unlock(net/core/sock.c:ca9f2860)
> not locked

No.  Try below patch from Alan Cox which should solve your issue and a
minor security hole in AF_ROSE.

73 de DL5RB op Ralf

 netrom/nr_in.c    |   11 +----------
 rose/rose_route.c |    3 ++-
 2 files changed, 3 insertions(+), 11 deletions(-)

Index: bk-afu/net/netrom/nr_in.c
===================================================================
--- bk-afu.orig/net/netrom/nr_in.c	2005-01-29 23:05:54.000000000 +0000
+++ bk-afu/net/netrom/nr_in.c	2005-01-31 04:23:37.098462856 +0000
@@ -74,7 +74,6 @@
 static int nr_state1_machine(struct sock *sk, struct sk_buff *skb,
 	int frametype)
 {
-	bh_lock_sock(sk);
 	switch (frametype) {
 	case NR_CONNACK: {
 		nr_cb *nr = nr_sk(sk);
@@ -103,8 +102,6 @@
 	default:
 		break;
 	}
-	bh_unlock_sock(sk);
-
 	return 0;
 }
 
@@ -116,7 +113,6 @@
 static int nr_state2_machine(struct sock *sk, struct sk_buff *skb,
 	int frametype)
 {
-	bh_lock_sock(sk);
 	switch (frametype) {
 	case NR_CONNACK | NR_CHOKE_FLAG:
 		nr_disconnect(sk, ECONNRESET);
@@ -132,8 +128,6 @@
 	default:
 		break;
 	}
-	bh_unlock_sock(sk);
-
 	return 0;
 }
 
@@ -154,7 +148,6 @@
 	nr = skb->data[18];
 	ns = skb->data[17];
 
-	bh_lock_sock(sk);
 	switch (frametype) {
 	case NR_CONNREQ:
 		nr_write_internal(sk, NR_CONNACK);
@@ -265,12 +258,10 @@
 	default:
 		break;
 	}
-	bh_unlock_sock(sk);
-
 	return queued;
 }
 
-/* Higher level upcall for a LAPB frame */
+/* Higher level upcall for a LAPB frame - called with sk locked */
 int nr_process_rx_frame(struct sock *sk, struct sk_buff *skb)
 {
 	nr_cb *nr = nr_sk(sk);
Index: bk-afu/net/rose/rose_route.c
===================================================================
--- bk-afu.orig/net/rose/rose_route.c	2005-01-29 23:05:54.000000000 +0000
+++ bk-afu/net/rose/rose_route.c	2005-01-31 04:23:37.111460880 +0000
@@ -727,7 +727,8 @@
 		}
 		if (rose_route.mask > 10) /* Mask can't be more than 10 digits */
 			return -EINVAL;
-
+		if(rose_route.ndigis > 8) /* No more than 8 digipeats */
+			return -EINVAL;
 		err = rose_add_node(&rose_route, dev);
 		dev_put(dev);
 		return err;

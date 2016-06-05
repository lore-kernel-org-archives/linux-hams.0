From: Basil Gunn <basil@pacabunga.com>
Subject: Re: Can only connect to RMS gateway once
Date: Sun, 5 Jun 2016 16:46:35 -0700
Message-ID: <20160605164635.590575cb@brox.localnet>
References: <20160603131613.6037bcd0@brox.localnet>
	<20160604134348.38e3c4dd@brox.localnet>
	<575340AD.5090604@trinnet.net>
	<20160604143214.0f97393f@brox.localnet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20160604143214.0f97393f@brox.localnet>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org
Cc: David Ranch <linux-hams@trinnet.net>, Jeremy McDermond <mcdermj@xenotropic.com>

Below is a unified diff of the 4 files I changed in kernel 4.2.y from
the Raspbian repo.  At least for my case this fixed the problem of an
open socket not getting closed & preventing anymore connections from
the original connection callsign. In newer kernels (after 4.1.21)
an ax25_ disconnect was occurring and stopping the heartbeat timer. The
socket free code runs off the heartbeat timer.

/Basil Gunn n7nix


diff -Nau ax25/af_ax25.c /home/gunn/projects/rpi/rpi-4.2.y.dev/net/ax25/af_ax25.c
--- ax25/af_ax25.c	2016-03-07 06:13:41.000000000 -0800
+++ /home/gunn/projects/rpi/rpi-4.2.y.dev/net/ax25/af_ax25.c	2016-06-05 15:08:29.475604719 -0700
@@ -973,7 +973,9 @@
 			release_sock(sk);
 			ax25_disconnect(ax25, 0);
 			lock_sock(sk);
-			ax25_destroy_socket(ax25);
+			if(!sock_flag(ax25->sk, SOCK_DESTROY)) {
+				ax25_destroy_socket(ax25);
+			}
 			break;

 		case AX25_STATE_3:
diff -Nau ax25/ax25_ds_timer.c /home/gunn/projects/rpi/rpi-4.2.y.dev/net/ax25/ax25_ds_timer.c
--- ax25/ax25_ds_timer.c	2016-03-07 06:13:41.000000000 -0800
+++ /home/gunn/projects/rpi/rpi-4.2.y.dev/net/ax25/ax25_ds_timer.c	2016-06-05 16:19:00.023254345 -0700
@@ -101,7 +101,8 @@

 	switch (ax25->state) {

-	case AX25_STATE_0:
+		case AX25_STATE_0:
+		case AX25_STATE_2:
 		/* Magic here: If we listen() and a new link dies before it
 		   is accepted() it isn't 'dead' so doesn't get removed. */
 		if (!sk || sock_flag(sk, SOCK_DESTROY) ||
@@ -112,6 +113,8 @@
 				ax25_destroy_socket(ax25);
 				bh_unlock_sock(sk);
 				sock_put(sk);
+				ax25_cb_put(sk_to_ax25(sk));
+
 			} else
 				ax25_destroy_socket(ax25);
 			return;
diff -Nau ax25/ax25_std_timer.c /home/gunn/projects/rpi/rpi-4.2.y.dev/net/ax25/ax25_std_timer.c
--- ax25/ax25_std_timer.c	2016-03-07 06:13:41.000000000 -0800
+++ /home/gunn/projects/rpi/rpi-4.2.y.dev/net/ax25/ax25_std_timer.c	2016-06-05 16:18:15.334583540 -0700
@@ -38,6 +38,7 @@

 	switch (ax25->state) {
 	case AX25_STATE_0:
+	case AX25_STATE_2:
 		/* Magic here: If we listen() and a new link dies before it
 		   is accepted() it isn't 'dead' so doesn't get removed. */
 		if (!sk || sock_flag(sk, SOCK_DESTROY) ||
@@ -48,6 +49,7 @@
 				ax25_destroy_socket(ax25);
 				bh_unlock_sock(sk);
 				sock_put(sk);
+				ax25_cb_put(sk_to_ax25(sk));
 			} else
 				ax25_destroy_socket(ax25);
 			return;
@@ -144,7 +146,9 @@
 	case AX25_STATE_2:
 		if (ax25->n2count == ax25->n2) {
 			ax25_send_control(ax25, AX25_DISC, AX25_POLLON, AX25_COMMAND);
-			ax25_disconnect(ax25, ETIMEDOUT);
+
+			if(!sock_flag(ax25->sk, SOCK_DESTROY))
+				ax25_disconnect(ax25, ETIMEDOUT);
 			return;
 		} else {
 			ax25->n2count++;
diff -Nau ax25/ax25_subr.c /home/gunn/projects/rpi/rpi-4.2.y.dev/net/ax25/ax25_subr.c
--- ax25/ax25_subr.c	2016-03-07 06:13:41.000000000 -0800
+++ /home/gunn/projects/rpi/rpi-4.2.y.dev/net/ax25/ax25_subr.c	2016-06-05 14:06:39.424828134 -0700
@@ -262,9 +262,10 @@

 void ax25_disconnect(ax25_cb *ax25, int reason)
 {
-	ax25_clear_queues(ax25);

-	ax25_stop_heartbeat(ax25);
+	ax25_clear_queues(ax25);
+	if(!sock_flag(ax25->sk, SOCK_DESTROY))
+		ax25_stop_heartbeat(ax25);
 	ax25_stop_t1timer(ax25);
 	ax25_stop_t2timer(ax25);
 	ax25_stop_t3timer(ax25);

---------------------------------------

On Sat, 4 Jun 2016 14:32:14 -0700
Basil Gunn <basil@pacabunga.com> wrote:

> It looks like the SOCK_DESTROY flag should be serviced off the
> ax25_ds_timer or ax25_std_timer but that's not happening.
>
> /Basil

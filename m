From: f6bvp <f6bvp@free.fr>
Subject: [PATCH] NET:AX25:ROSE NULL ax25_cb kernel panic
Date: Sat, 19 Jan 2019 11:58:35 +0100
Message-ID: <19a0a879-8a8d-4c84-5de9-5ce222377fcb@free.fr>
References: <57ADC4F4.6080707@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <57ADC4F4.6080707@free.fr>
Content-Language: fr
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams <linux-hams@vger.kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Dmitry Vyukov <dvyukov@google.com>, David Miller <davem@davemloft.net>, Linux Netdev List <netdev@vger.kernel.org>, F6BVP <f6bvp@free.fr>, brian@support.uroweb.net


[PATCH] [ROSE] NULL ax25_cb kernel panic

When an internally generated frame is handled by rose_xmit(),
rose_route_frame() is called:

        if (!rose_route_frame(skb, NULL)) {
                dev_kfree_skb(skb);
                stats->tx_errors++;
                return NETDEV_TX_OK;
        }

We have the same code sequence in Net/Rom where an internally generated
frame is handled by nr_xmit() calling nr_route_frame(skb, NULL).
However, in this function NULL argument is tested while it is not in
rose_route_frame().
Then kernel panic occurs later on when calling ax25cmp() with a NULL
ax25_cb argument as reported many times and recently with syzbot.

We need to test if ax25 is NULL before using it.

Here is the patch:

diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
index 77e9f85a2c92..7f075255a372 100644
--- a/net/rose/rose_route.c
+++ b/net/rose/rose_route.c
@@ -850,6 +850,7 @@ void rose_link_device_down(struct net_device *dev)

 /*
  *	Route a frame to an appropriate AX.25 connection.
+ *	a NULL ax25_cb indicates an internally generated frame.
  */
 int rose_route_frame(struct sk_buff *skb, ax25_cb *ax25)
 {
@@ -867,6 +868,10 @@ int rose_route_frame(struct sk_buff *skb, ax25_cb
*ax25)

 	if (skb->len < ROSE_MIN_LEN)
 		return res;
+
+	if (!ax25)
+		return rose_loopback_queue(skb, NULL);
+
 	frametype = skb->data[2];
 	lci = ((skb->data[0] << 8) & 0xF00) + ((skb->data[1] << 0) & 0x0FF);
 	if (frametype == ROSE_CALL_REQUEST &&

Signed-off-by: Bernard Pidoux, f6bvp <f6bvp@free.fr>

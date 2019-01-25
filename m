From: Dmitry Vyukov <dvyukov@gmail.com>
Subject: [PATCH] net/rose: fix NULL ax25_cb kernel panic
Date: Fri, 25 Jan 2019 11:46:40 +0100
Message-ID: <20190125104640.253862-1-dvyukov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mQI/+sNPW3cWviJBz4RvXI4WSmKJyJbGpq6y4etWi2Y=;
        b=R6fRiCEuCyQwDdzgt9pkpz7iWPI1TjhhMLsrRoPbonYIHYVWgR6uCRYlvhoM+rbbRT
         M3q/elgkTOO/0brKEt3inLz4VoRCNWhZoErk1fa3VGwAoe+2DkAFFRfl3c1E3MjK/yEC
         LDo7U4brlqh5tErhSwJfU4AYq9Dh3379H5ZKNyoGL/j8WdfV7MCZzfU9iMK+TqymtLJQ
         z4CXIF8OC0absicNccaQdDDbMqM+kwcD5AMIwIi+LBODu1UbppGOpvZZkTm3H+37P39X
         mFKmAoaEnDPiK2zqxzAoaESS8e0F73AuZZ/yeBH/Sh4F+YX0MFDFHQAJ9HUpdu39972q
         nlqA==
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: f6bvp@free.fr, davem@davemloft.net, linux-hams@vger.kernel.org, netdev@vger.kernel.org
Cc: Dmitry Vyukov <dvyukov@google.com>, syzbot+1a2c456a1ea08fa5b5f7@syzkaller.appspotmail.com, Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org

From: Bernard Pidoux <f6bvp@free.fr>

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

Testing:
Built kernel with CONFIG_ROSE=y.

Signed-off-by: Bernard Pidoux <f6bvp@free.fr>
Acked-by: Dmitry Vyukov <dvyukov@google.com>
Reported-by: syzbot+1a2c456a1ea08fa5b5f7@syzkaller.appspotmail.com
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Bernard Pidoux <f6bvp@free.fr>
Cc: linux-hams@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 net/rose/rose_route.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
index 77e9f85a2c92..f2ff21d7df08 100644
--- a/net/rose/rose_route.c
+++ b/net/rose/rose_route.c
@@ -850,6 +850,7 @@ void rose_link_device_down(struct net_device *dev)
 
 /*
  *	Route a frame to an appropriate AX.25 connection.
+ *	A NULL ax25_cb indicates an internally generated frame.
  */
 int rose_route_frame(struct sk_buff *skb, ax25_cb *ax25)
 {
@@ -867,6 +868,10 @@ int rose_route_frame(struct sk_buff *skb, ax25_cb *ax25)
 
 	if (skb->len < ROSE_MIN_LEN)
 		return res;
+
+	if (!ax25)
+		return rose_loopback_queue(skb, NULL);
+
 	frametype = skb->data[2];
 	lci = ((skb->data[0] << 8) & 0xF00) + ((skb->data[1] << 0) & 0x0FF);
 	if (frametype == ROSE_CALL_REQUEST &&
-- 
2.20.1.495.gaa96b0ce6b-goog


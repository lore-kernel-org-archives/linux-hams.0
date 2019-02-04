From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 3.18 20/31] net/rose: fix NULL ax25_cb kernel panic
Date: Mon,  4 Feb 2019 11:36:35 +0100
Message-ID: <20190204103602.093690397@linuxfoundation.org>
References: <20190204103557.903263774@linuxfoundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1549276706;
        bh=3YPHFSWUC7bCgEi9ywtv41Flyfpmv7QsCuC9VOotdB4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JotT87WmnxcgmQ+71U/TJCNoND9PuZY0uqCWcQqOxu5omTQht8QUEWHMQfqFiuqz7
         9q/fUX3iqbHja+dopFALn1AfqSkNLLgYb7G8ECKnx7bDVFZF5mQxZF2acqPRxIEKZG
         vx4QZF9RJRviufSX4s3L7hDGp+y1OnG42nY8AzXM=
In-Reply-To: <20190204103557.903263774@linuxfoundation.org>
Sender: stable-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Bernard Pidoux <f6bvp@free.fr>, Dmitry Vyukov <dvyukov@google.com>, syzbot+1a2c456a1ea08fa5b5f7@syzkaller.appspotmail.com, "David S. Miller" <davem@davemloft.net>, Ralf Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org, netdev@vger.kernel.org

3.18-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Bernard Pidoux <f6bvp@free.fr>

[ Upstream commit b0cf029234f9b18e10703ba5147f0389c382bccc ]

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
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 net/rose/rose_route.c |    5 +++++
 1 file changed, 5 insertions(+)

--- a/net/rose/rose_route.c
+++ b/net/rose/rose_route.c
@@ -849,6 +849,7 @@ void rose_link_device_down(struct net_de
 
 /*
  *	Route a frame to an appropriate AX.25 connection.
+ *	A NULL ax25_cb indicates an internally generated frame.
  */
 int rose_route_frame(struct sk_buff *skb, ax25_cb *ax25)
 {
@@ -866,6 +867,10 @@ int rose_route_frame(struct sk_buff *skb
 
 	if (skb->len < ROSE_MIN_LEN)
 		return res;
+
+	if (!ax25)
+		return rose_loopback_queue(skb, NULL);
+
 	frametype = skb->data[2];
 	lci = ((skb->data[0] << 8) & 0xF00) + ((skb->data[1] << 0) & 0x0FF);
 	if (frametype == ROSE_CALL_REQUEST &&



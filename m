From: ralf@linux-mips.org
Subject: [PATCH 1/3] Remove ourselves from waitqueue when receiving a signal
Date: Sun, 11 Mar 2007 22:53:20 +0000
Message-ID: <20070311225739.679006723@denk.linux-mips.net>
References: <20070311225319.673076841@denk.linux-mips.net>
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline; filename=rose-remove-from-wait-queue.patch
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org

Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

 net/rose/af_rose.c |    2 ++
 1 file changed, 2 insertions(+)

Index: linux-net/net/rose/af_rose.c
===================================================================
--- linux-net.orig/net/rose/af_rose.c
+++ linux-net/net/rose/af_rose.c
@@ -877,6 +877,8 @@ static int rose_accept(struct socket *so
 			lock_sock(sk);
 			continue;
 		}
+		current->state = TASK_RUNNING;
+		remove_wait_queue(sk->sk_sleep, &wait);
 		return -ERESTARTSYS;
 	}
 	current->state = TASK_RUNNING;

-- 


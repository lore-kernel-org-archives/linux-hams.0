From: Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH 2/2] ax25: Fix deadlock hang during concurrent read and
 write on socket.
Date: Tue, 12 Oct 2021 22:05:30 +0200
Message-ID: <4a2f53386509164e60531750a02480a4c032d51a.1634069168.git.ralf@linux-mips.org>
References: <2dea23e9208d008e74faddf92acf4ef557f97a85.1634069168.git.ralf@linux-mips.org>
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <2dea23e9208d008e74faddf92acf4ef557f97a85.1634069168.git.ralf@linux-mips.org>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@lst.de>, Thomas Osterried <thomas@osterried.de>, linux-hams@vger.kernel.org

From: Thomas Habets <thomas@habets.se>

Before this patch, this hangs, because the read(2) blocks the
write(2).

Before:
strace -f -eread,write ./examples/client_lockcheck M0THC-9 M0THC-0 M0THC-2
strace: Process 3888 attached
[pid  3888] read(3,  <unfinished ...>
[pid  3887] write(3, "hello world", 11
[hang]

After:
strace -f -eread,write ./examples/client_lockcheck M0THC-9 M0THC-0 M0THC-2
strace: Process 2433 attached
[pid  2433] read(3,  <unfinished ...>
[pid  2432] write(3, "hello world", 11) = 11
[pid  2433] <... read resumed> "yo", 1000) = 2
[pid  2433] write(1, "yo\n", 3yo
)         = 3
[successful exit]

Signed-off-by: Thomas Habets <thomas@habets.se>
Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
---
 net/ax25/af_ax25.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 5e7ab76f7f9b..d2d0dd744bb4 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -1624,22 +1624,22 @@ static int ax25_recvmsg(struct socket *sock, struct msghdr *msg, size_t size,
 	int copied;
 	int err = 0;
 
-	lock_sock(sk);
 	/*
 	 * 	This works for seqpacket too. The receiver has ordered the
 	 *	queue for us! We do one quick check first though
 	 */
 	if (sk->sk_type == SOCK_SEQPACKET && sk->sk_state != TCP_ESTABLISHED) {
 		err =  -ENOTCONN;
-		goto out;
+		goto out_nolock;
 	}
 
 	/* Now we can treat all alike */
 	skb = skb_recv_datagram(sk, flags & ~MSG_DONTWAIT,
 				flags & MSG_DONTWAIT, &err);
 	if (skb == NULL)
-		goto out;
+		goto out_nolock;
 
+	lock_sock(sk);
 	if (!sk_to_ax25(sk)->pidincl)
 		skb_pull(skb, 1);		/* Remove PID */
 
@@ -1684,6 +1684,7 @@ static int ax25_recvmsg(struct socket *sock, struct msghdr *msg, size_t size,
 
 out:
 	release_sock(sk);
+out_nolock:
 
 	return err;
 }
-- 
2.31.1


From: Hyunwoo Kim <v4bel@theori.io>
Subject: [PATCH v2] net/rose: Fix to not accept on connected socket
Date: Mon, 23 Jan 2023 11:40:20 -0800
Message-ID: <20230123194020.GA115501@ubuntu>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theori.io; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G2ns64YdTQGyB93XCyw4IBhbiRpiReSdyKsHHqkh3Rc=;
        b=V1xiKjP/ewAPV6EOQxN2iCEk97jKjHvTsLYGRvPPg0he1XbCRVj3DrtEX9mdepX7OQ
         xu04xxcNb3JUxUrix5mzpDFjdiITerJkhTMacTENBS31h3o2nJVWwlkZHUDCmMxEhZSZ
         AlzNRZjbjJ2pUlm1ITZGoTDmrJYBbcvrdGaYc=
Content-Disposition: inline
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: v4bel@theori.io, imv4bel@gmail.com, linux-hams@vger.kernel.org, netdev@vger.kernel.org

If listen() and accept() are called on a rose socket
that connect() is successful, accept() succeeds immediately.
This is because rose_connect() queues the skb to
sk->sk_receive_queue, and rose_accept() dequeues it.

This creates a child socket with the sk of the parent
rose socket, which can cause confusion.

Fix rose_listen() to return -EINVAL if the socket has
already been successfully connected, and add lock_sock
to prevent this issue.

Signed-off-by: Hyunwoo Kim <v4bel@theori.io>
---
 net/rose/af_rose.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
index 36fefc3957d7..ca2b17f32670 100644
--- a/net/rose/af_rose.c
+++ b/net/rose/af_rose.c
@@ -488,6 +488,12 @@ static int rose_listen(struct socket *sock, int backlog)
 {
 	struct sock *sk = sock->sk;
 
+	lock_sock(sk);
+	if (sock->state != SS_UNCONNECTED) {
+		release_sock(sk);
+		return -EINVAL;
+	}
+
 	if (sk->sk_state != TCP_LISTEN) {
 		struct rose_sock *rose = rose_sk(sk);
 
@@ -497,8 +503,10 @@ static int rose_listen(struct socket *sock, int backlog)
 		memset(rose->dest_digis, 0, AX25_ADDR_LEN * ROSE_MAX_DIGIS);
 		sk->sk_max_ack_backlog = backlog;
 		sk->sk_state           = TCP_LISTEN;
+		release_sock(sk);
 		return 0;
 	}
+	release_sock(sk);
 
 	return -EOPNOTSUPP;
 }
-- 
2.25.1


From: Hyunwoo Kim <v4bel@theori.io>
Subject: [PATCH] net/rose: Fix to not accept on connected socket
Date: Sun, 22 Jan 2023 09:39:57 -0800
Message-ID: <20230122173957.GA99728@ubuntu>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theori.io; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O8QRkaT+jS8t0WyBt+vyX9selrndOVTAxVjn71JvR9U=;
        b=aT5NJknYYW7elr2s7nX9hvxv3SnWrgZu4LzJxEAB4Wy6kAcKE+oWJqHWo1FRGbjMWH
         1rD0AcXfUUEKFUuzITJUA5hmqE9P766lR02d+LV83ClQOtvED5wFovqtqObFLd7AcPYb
         jWd0X6MUc25JhtBRKrPer8016ElQLVwVTVL94=
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
index 36fefc3957d7..fa28c7e1805c 100644
--- a/net/rose/af_rose.c
+++ b/net/rose/af_rose.c
@@ -488,6 +488,12 @@ static int rose_listen(struct socket *sock, int backlog)
 {
 	struct sock *sk = sock->sk;
 
+	lock_sock(sk);
+	if (sock->state == SS_CONNECTED) {
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


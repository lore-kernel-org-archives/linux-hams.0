From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 6.1 15/38] net/rose: Fix to not accept on connected socket
Date: Thu,  9 Feb 2023 06:14:34 -0500
Message-ID: <20230209111459.1891941-15-sashal@kernel.org>
References: <20230209111459.1891941-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675941365;
        bh=cGkWrstXeteITJ8X8M0J1S+FTKotpSNO5vfR6lbgVxU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KRLc7Hn1DYk5jTUdJHdUPe1wY2tSjevxF4gIXwV8Ch9SMaekQkPVyuLceP3xOCVKz
         O4LeQvQMI2rNk+bCRnE+H3Gpo75heN9Lfofa2/ERVUtNBux+WpYXUIf5/q+dHJf4ml
         BI8csvjWTKRexKad+D5BRWqwSyqFVpx7a5M5UUAsbprivB7nwK+nPlkJBvh92zr1pr
         L8x91ORStGSrewWrE/tj8EPXOBOxHOyBKFTA/wh0lT4eyLbC4zwBOWzcBvrXvV9jyM
         tInBOwP60BPcAXAOm5RRz0VhWvoBqV7XJybE7f893cssscTR8n5kz+DOtrdI15sr+a
         4Mtq9afDCGotw==
In-Reply-To: <20230209111459.1891941-1-sashal@kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Hyunwoo Kim <v4bel@theori.io>, Kuniyuki Iwashima <kuniyu@amazon.com>, Jakub Kicinski <kuba@kernel.org>, Sasha Levin <sashal@kernel.org>, davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, linux-hams@vger.kernel.org, netdev@vger.kernel.org

From: Hyunwoo Kim <v4bel@theori.io>

[ Upstream commit 14caefcf9837a2be765a566005ad82cd0d2a429f ]

If you call listen() and accept() on an already connect()ed
rose socket, accept() can successfully connect.
This is because when the peer socket sends data to sendmsg,
the skb with its own sk stored in the connected socket's
sk->sk_receive_queue is connected, and rose_accept() dequeues
the skb waiting in the sk->sk_receive_queue.

This creates a child socket with the sk of the parent
rose socket, which can cause confusion.

Fix rose_listen() to return -EINVAL if the socket has
already been successfully connected, and add lock_sock
to prevent this issue.

Signed-off-by: Hyunwoo Kim <v4bel@theori.io>
Reviewed-by: Kuniyuki Iwashima <kuniyu@amazon.com>
Link: https://lore.kernel.org/r/20230125105944.GA133314@ubuntu
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/rose/af_rose.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
index 36fefc3957d77..ca2b17f32670d 100644
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
2.39.0


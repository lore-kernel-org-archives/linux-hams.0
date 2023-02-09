From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 3/6] net/rose: Fix to not accept on connected socket
Date: Thu,  9 Feb 2023 06:19:56 -0500
Message-ID: <20230209111959.1893269-3-sashal@kernel.org>
References: <20230209111959.1893269-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675941620;
        bh=4+DCYv2zGhoaxL5+EHAVjF5eJMGU1CVZfGmZ1VDD5G8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=g2hn8GFIgyF5vLVlS8i/Eu5CVhu6lJNWGFOgfHpOhoBuWWsbahbFuVjWjGDSUZTE4
         j62l1y2fSayKz3tV1MUug+JbqpGFNoXuAcTZToNPnAaqzFUVl+X0uAw6PXzMbMRNmb
         0HkL/DxU78plRS5ZJ/XMqxCLaOAflNd4q3IXQnoyy9Eh350p+2kDsJ+TNh0DKrxaBy
         iS3q5O1rTDWERM+PIEPE7AUVh6mMxsujyAXXCq65I+BWdLwTSmzvNnsH6V527BWtFO
         cGCd6XnNQH8sJXR41/3yjd2J6jMw7JghCP7PapqPYCiIJRoAdMiCPjWh/C9FMeBwmq
         CO/sXtQj23o2A==
In-Reply-To: <20230209111959.1893269-1-sashal@kernel.org>
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
index 03a1ee221112e..4edd127bb8928 100644
--- a/net/rose/af_rose.c
+++ b/net/rose/af_rose.c
@@ -490,6 +490,12 @@ static int rose_listen(struct socket *sock, int backlog)
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
 
@@ -499,8 +505,10 @@ static int rose_listen(struct socket *sock, int backlog)
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


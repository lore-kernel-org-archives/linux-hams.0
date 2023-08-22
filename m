From: eadavis@sina.com
Subject: [PATCH] sock: Fix sk_sleep return invalid pointer
Date: Tue, 22 Aug 2023 20:44:19 +0800
Message-ID: <20230822124419.1838055-1-eadavis@sina.com>
References: <000000000000e6c05806033522d3@google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev+bounces-29629-gl-netdev-2=m.gmane-mx.org@vger.kernel.org>
In-Reply-To: <000000000000e6c05806033522d3@google.com>
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: syzbot+666c97e4686410e79649@syzkaller.appspotmail.com
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, ralf@linux-mips.org, syzkaller-bugs@googlegroups.com, hdanton@sina.com, Edward AD <eadavis@sina.com>

From: Edward AD <eadavis@sina.com>

The parameter sk_sleep(sk) passed in when calling prepare_to_wait may 
return an invalid pointer due to nr-release reclaiming the sock.
Here, schedule_timeout_interruptible is used to replace the combination 
of 'prepare_to_wait, schedule, finish_wait' to solve the problem.

Reported-and-tested-by: syzbot+666c97e4686410e79649@syzkaller.appspotmail.com
Signed-off-by: Edward AD <eadavis@sina.com>
---
 net/netrom/af_netrom.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/net/netrom/af_netrom.c b/net/netrom/af_netrom.c
index eb8ccbd58d..c84a4c65b3 100644
--- a/net/netrom/af_netrom.c
+++ b/net/netrom/af_netrom.c
@@ -732,23 +732,18 @@ static int nr_connect(struct socket *sock, struct sockaddr *uaddr,
 	 * closed.
 	 */
 	if (sk->sk_state == TCP_SYN_SENT) {
-		DEFINE_WAIT(wait);
-
 		for (;;) {
-			prepare_to_wait(sk_sleep(sk), &wait,
-					TASK_INTERRUPTIBLE);
 			if (sk->sk_state != TCP_SYN_SENT)
 				break;
 			if (!signal_pending(current)) {
 				release_sock(sk);
-				schedule();
+				schedule_timeout_interruptible(HZ);
 				lock_sock(sk);
 				continue;
 			}
 			err = -ERESTARTSYS;
 			break;
 		}
-		finish_wait(sk_sleep(sk), &wait);
 		if (err)
 			goto out_release;
 	}
@@ -772,7 +767,6 @@ static int nr_accept(struct socket *sock, struct socket *newsock, int flags,
 {
 	struct sk_buff *skb;
 	struct sock *newsk;
-	DEFINE_WAIT(wait);
 	struct sock *sk;
 	int err = 0;
 
@@ -795,7 +789,6 @@ static int nr_accept(struct socket *sock, struct socket *newsock, int flags,
 	 *	hooked into the SABM we saved
 	 */
 	for (;;) {
-		prepare_to_wait(sk_sleep(sk), &wait, TASK_INTERRUPTIBLE);
 		skb = skb_dequeue(&sk->sk_receive_queue);
 		if (skb)
 			break;
@@ -806,14 +799,13 @@ static int nr_accept(struct socket *sock, struct socket *newsock, int flags,
 		}
 		if (!signal_pending(current)) {
 			release_sock(sk);
-			schedule();
+			schedule_timeout_uninterruptible(HZ);
 			lock_sock(sk);
 			continue;
 		}
 		err = -ERESTARTSYS;
 		break;
 	}
-	finish_wait(sk_sleep(sk), &wait);
 	if (err)
 		goto out_release;
 
-- 
2.25.1



From: Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH V5 1/2] ax25: Fix refcount leaks caused by ax25_cb_del()
Date: Fri, 18 Mar 2022 08:54:04 +0800
Message-ID: <3f17332016b149d4693d87bd26b9a6c3de049cb7.1647563511.git.duoming@zju.edu.cn>
References: <cover.1647563511.git.duoming@zju.edu.cn>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <cover.1647563511.git.duoming@zju.edu.cn>
In-Reply-To: <cover.1647563511.git.duoming@zju.edu.cn>
References: <cover.1647563511.git.duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org, davem@davemloft.net, ralf@linux-mips.org, jreuter@yaina.de, eric.dumazet@gmail.com, dan.carpenter@oracle.com, Duoming Zhou <duoming@zju.edu.cn>

The previous commit d01ffb9eee4a ("ax25: add refcount in ax25_dev to
avoid UAF bugs") and commit feef318c855a ("ax25: fix UAF bugs of
net_device caused by rebinding operation") increase the refcounts of
ax25_dev and net_device in ax25_bind() and decrease the matching refcounts
in ax25_kill_by_device() in order to prevent UAF bugs, but there are
reference count leaks.

The root cause of refcount leaks is shown below:

     (Thread 1)                      |      (Thread 2)
ax25_bind()                          |
 ...                                 |
 ax25_addr_ax25dev()                 |
  ax25_dev_hold()   //(1)            |
  ...                                |
 dev_hold_track()   //(2)            |
 ...                                 | ax25_destroy_socket()
                                     |  ax25_cb_del()
                                     |   ...
                                     |   hlist_del_init() //(3)
                                     |
                                     |
     (Thread 3)                      |
ax25_kill_by_device()                |
 ...                                 |
 ax25_for_each(s, &ax25_list) {      |
  if (s->ax25_dev == ax25_dev) //(4) |
   ...                               |

Firstly, we use ax25_bind() to increase the refcount of ax25_dev in
position (1) and increase the refcount of net_device in position (2).
Then, we use ax25_cb_del() invoked by ax25_destroy_socket() to delete
ax25_cb in hlist in position (3) before calling ax25_kill_by_device().
Finally, the decrements of refcounts in ax25_kill_by_device() will not
be executed, because no s->ax25_dev equals to ax25_dev in position (4).

This patch adds decrements of refcounts in ax25_release() and use
lock_sock() to do synchronization. If refcounts decrease in ax25_release(),
the decrements of refcounts in ax25_kill_by_device() will not be
executed and vice versa.

Fixes: d01ffb9eee4a ("ax25: add refcount in ax25_dev to avoid UAF bugs")
Fixes: 87563a043cef ("ax25: fix reference count leaks of ax25_dev")
Fixes: feef318c855a ("ax25: fix UAF bugs of net_device caused by rebinding operation")
Reported-by: Thomas Osterried <thomas@osterried.de>
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
Changes in V5:
  - Use sk->sk_socket to check in ax25_kill_by_device().

 net/ax25/af_ax25.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 6bd09718077..cf8847cfc66 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -98,8 +98,10 @@ static void ax25_kill_by_device(struct net_device *dev)
 			spin_unlock_bh(&ax25_list_lock);
 			lock_sock(sk);
 			s->ax25_dev = NULL;
-			dev_put_track(ax25_dev->dev, &ax25_dev->dev_tracker);
-			ax25_dev_put(ax25_dev);
+			if (sk->sk_socket) {
+				dev_put_track(ax25_dev->dev, &ax25_dev->dev_tracker);
+				ax25_dev_put(ax25_dev);
+			}
 			ax25_disconnect(s, ENETUNREACH);
 			release_sock(sk);
 			spin_lock_bh(&ax25_list_lock);
@@ -979,14 +981,20 @@ static int ax25_release(struct socket *sock)
 {
 	struct sock *sk = sock->sk;
 	ax25_cb *ax25;
+	ax25_dev *ax25_dev;
 
 	if (sk == NULL)
 		return 0;
 
 	sock_hold(sk);
-	sock_orphan(sk);
 	lock_sock(sk);
+	sock_orphan(sk);
 	ax25 = sk_to_ax25(sk);
+	ax25_dev = ax25->ax25_dev;
+	if (ax25_dev) {
+		dev_put_track(ax25_dev->dev, &ax25_dev->dev_tracker);
+		ax25_dev_put(ax25_dev);
+	}
 
 	if (sk->sk_type == SOCK_SEQPACKET) {
 		switch (ax25->state) {
-- 
2.17.1


From: Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH net v2 2/2] net: rose: fix null-ptr-deref caused by rose_kill_by_neigh
Date: Wed, 22 Jun 2022 12:57:48 +0800
Message-ID: <1ff88b1d5de81a12a33e577a19a6c949b0f7b864.1655871645.git.duoming@zju.edu.cn>
References: <cover.1655871645.git.duoming@zju.edu.cn>
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <cover.1655871645.git.duoming@zju.edu.cn>
In-Reply-To: <cover.1655871645.git.duoming@zju.edu.cn>
References: <cover.1655871645.git.duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, Duoming Zhou <duoming@zju.edu.cn>

When the link layer connection is broken, the rose->neighbour is
set to null. But rose->neighbour could be used by rose_connection()
and rose_release() later, because there is no synchronization among
them. As a result, the null-ptr-deref bugs will happen.

One of the null-ptr-deref bugs is shown below:

    (thread 1)                  |        (thread 2)
                                |  rose_connect
rose_kill_by_neigh              |    lock_sock(sk)
  spin_lock_bh(&rose_list_lock) |    if (!rose->neighbour)
  rose->neighbour = NULL;//(1)  |
                                |    rose->neighbour->use++;//(2)

The rose->neighbour is set to null in position (1) and dereferenced
in position (2).

The KASAN report triggered by POC is shown below:

KASAN: null-ptr-deref in range [0x0000000000000028-0x000000000000002f]
...
RIP: 0010:rose_connect+0x6c2/0xf30
RSP: 0018:ffff88800ab47d60 EFLAGS: 00000206
RAX: 0000000000000005 RBX: 000000000000002a RCX: 0000000000000000
RDX: ffff88800ab38000 RSI: ffff88800ab47e48 RDI: ffff88800ab38309
RBP: dffffc0000000000 R08: 0000000000000000 R09: ffffed1001567062
R10: dfffe91001567063 R11: 1ffff11001567061 R12: 1ffff11000d17cd0
R13: ffff8880068be680 R14: 0000000000000002 R15: 1ffff11000d17cd0
...
Call Trace:
  <TASK>
  ? __local_bh_enable_ip+0x54/0x80
  ? selinux_netlbl_socket_connect+0x26/0x30
  ? rose_bind+0x5b0/0x5b0
  __sys_connect+0x216/0x280
  __x64_sys_connect+0x71/0x80
  do_syscall_64+0x43/0x90
  entry_SYSCALL_64_after_hwframe+0x46/0xb0

This patch adds lock_sock() in rose_kill_by_neigh() in order to
synchronize with rose_connect() and rose_release().

Meanwhile, this patch adds sock_hold() protected by rose_list_lock
that could synchronize with rose_remove_socket() in order to mitigate
UAF bug caused by lock_sock() we add.

What's more, there is no need using rose_neigh_list_lock to protect
rose_kill_by_neigh(). Because we have already used rose_neigh_list_lock
to protect the state change of rose_neigh in rose_link_failed(), which
is well synchronized.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
Changes in v2:
  - Fix refcount leak of sock.

 net/rose/af_rose.c    | 6 ++++++
 net/rose/rose_route.c | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
index bf2d986a6bc..5caa222c490 100644
--- a/net/rose/af_rose.c
+++ b/net/rose/af_rose.c
@@ -169,9 +169,15 @@ void rose_kill_by_neigh(struct rose_neigh *neigh)
 		struct rose_sock *rose = rose_sk(s);
 
 		if (rose->neighbour == neigh) {
+			sock_hold(s);
 			rose_disconnect(s, ENETUNREACH, ROSE_OUT_OF_ORDER, 0);
 			rose->neighbour->use--;
+			spin_unlock_bh(&rose_list_lock);
+			lock_sock(s);
 			rose->neighbour = NULL;
+			release_sock(s);
+			spin_lock_bh(&rose_list_lock);
+			sock_put(s);
 		}
 	}
 	spin_unlock_bh(&rose_list_lock);
diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
index fee6409c2bb..b116828b422 100644
--- a/net/rose/rose_route.c
+++ b/net/rose/rose_route.c
@@ -827,7 +827,9 @@ void rose_link_failed(ax25_cb *ax25, int reason)
 		ax25_cb_put(ax25);
 
 		rose_del_route_by_neigh(rose_neigh);
+		spin_unlock_bh(&rose_neigh_list_lock);
 		rose_kill_by_neigh(rose_neigh);
+		return;
 	}
 	spin_unlock_bh(&rose_neigh_list_lock);
 }
-- 
2.17.1


From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.14 5/8] ax25: improve the incomplete fix to avoid UAF and NPD bugs
Date: Wed,  9 Feb 2022 13:44:58 -0500
Message-ID: <20220209184502.48363-5-sashal@kernel.org>
References: <20220209184502.48363-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644432337;
        bh=CiNSoGFlVE7Yc/N15ISxD4jbOC0FtDELKkzSvEf6aAY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tkgR2V0CrGDviOcODJMOxzjSypcHNastaiSh+H448/feaxkdOu8kG+2KhIIob1lki
         Mrcfpu+VnlXBr7dh7oIugzO/S2oeR7GciWbyBH09jhac5EZcSL421ra+xObyf5WEKT
         tC6pB1JIk7N9Hjj5x3rVfpr7TVSAG4Rga7Gsm+YxlGs3UTBHcUl4e7rWTjNEpdr1G0
         eId6FYoarGd9Y8ql6KC2cSREE5HA+3hFA4UJO09azaZXCKBog/tmFMD8HW1JsmoukR
         Gr1kxdxE8LPB5DvrMuf7epdeAqefHmqovwVQ+I97H4hGkj/7O6s82e26ejeiO6RuqD
         t9vnj7DxmTYZA==
In-Reply-To: <20220209184502.48363-1-sashal@kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Duoming Zhou <duoming@zju.edu.cn>, "David S . Miller" <davem@davemloft.net>, Sasha Levin <sashal@kernel.org>, jreuter@yaina.de, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org

From: Duoming Zhou <duoming@zju.edu.cn>

[ Upstream commit 4e0f718daf97d47cf7dec122da1be970f145c809 ]

The previous commit 1ade48d0c27d ("ax25: NPD bug when detaching
AX25 device") introduce lock_sock() into ax25_kill_by_device to
prevent NPD bug. But the concurrency NPD or UAF bug will occur,
when lock_sock() or release_sock() dereferences the ax25_cb->sock.

The NULL pointer dereference bug can be shown as below:

ax25_kill_by_device()        | ax25_release()
                             |   ax25_destroy_socket()
                             |     ax25_cb_del()
  ...                        |     ...
                             |     ax25->sk=NULL;
  lock_sock(s->sk); //(1)    |
  s->ax25_dev = NULL;        |     ...
  release_sock(s->sk); //(2) |
  ...                        |

The root cause is that the sock is set to null before dereference
site (1) or (2). Therefore, this patch extracts the ax25_cb->sock
in advance, and uses ax25_list_lock to protect it, which can synchronize
with ax25_cb_del() and ensure the value of sock is not null before
dereference sites.

The concurrency UAF bug can be shown as below:

ax25_kill_by_device()        | ax25_release()
                             |   ax25_destroy_socket()
  ...                        |   ...
                             |   sock_put(sk); //FREE
  lock_sock(s->sk); //(1)    |
  s->ax25_dev = NULL;        |   ...
  release_sock(s->sk); //(2) |
  ...                        |

The root cause is that the sock is released before dereference
site (1) or (2). Therefore, this patch uses sock_hold() to increase
the refcount of sock and uses ax25_list_lock to protect it, which
can synchronize with ax25_cb_del() in ax25_destroy_socket() and
ensure the sock wil not be released before dereference sites.

Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/ax25/af_ax25.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 0232afd9d9c3c..36d2e1dfa1e6b 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -80,6 +80,7 @@ static void ax25_kill_by_device(struct net_device *dev)
 {
 	ax25_dev *ax25_dev;
 	ax25_cb *s;
+	struct sock *sk;
 
 	if ((ax25_dev = ax25_dev_ax25dev(dev)) == NULL)
 		return;
@@ -88,13 +89,15 @@ static void ax25_kill_by_device(struct net_device *dev)
 again:
 	ax25_for_each(s, &ax25_list) {
 		if (s->ax25_dev == ax25_dev) {
+			sk = s->sk;
+			sock_hold(sk);
 			spin_unlock_bh(&ax25_list_lock);
-			lock_sock(s->sk);
+			lock_sock(sk);
 			s->ax25_dev = NULL;
-			release_sock(s->sk);
+			release_sock(sk);
 			ax25_disconnect(s, ENETUNREACH);
 			spin_lock_bh(&ax25_list_lock);
-
+			sock_put(sk);
 			/* The entry could have been deleted from the
 			 * list meanwhile and thus the next pointer is
 			 * no longer valid.  Play it safe and restart
-- 
2.34.1


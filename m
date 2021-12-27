From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.4 1/3] ax25: NPD bug when detaching AX25 device
Date: Mon, 27 Dec 2021 14:06:51 -0500
Message-ID: <20211227190653.1043578-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640632016;
        bh=055HlUvUQ2TxKb4Z4cpIUxi7M++pUMXyhB1W32PSMEI=;
        h=From:To:Cc:Subject:Date:From;
        b=k3jfpFaILbD9AsX5fG/Et+VaFTQnwI4SeHGxKaacFk2SU6Sm95b//7P1GAw22wyyv
         Ueuv8IUzUkd5q0Qhkm6EgKK5craMA9L02jr6Enp6t9ksArojoN08Zl2ArcT/rG1b/h
         qnsTtABe2+3Em4eAYTbXRZfNoSW4L6Fo2yETtRNbR2R18QS5Yb/E4vzD8Hnw1Nnu4V
         pBiFj0M9ZIfIdig03YtjTzfuaI0TxcAYPizbTTks65Q3W6aschOU7ijTlXTdjGTuTR
         T8HJy+KJRpOuYMb9C7PYo0mQT/NkLMNj9J3Py/fxgEmM44YgQCMNeLFNVsXCIXC/Rm
         3Nuees14JkYWQ==
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Lin Ma <linma@zju.edu.cn>, Hanjie Wu <nagi@zju.edu.cn>, "David S . Miller" <davem@davemloft.net>, Sasha Levin <sashal@kernel.org>, jreuter@yaina.de, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org

From: Lin Ma <linma@zju.edu.cn>

[ Upstream commit 1ade48d0c27d5da1ccf4b583d8c5fc8b534a3ac8 ]

The existing cleanup routine implementation is not well synchronized
with the syscall routine. When a device is detaching, below race could
occur.

static int ax25_sendmsg(...) {
  ...
  lock_sock()
  ax25 = sk_to_ax25(sk);
  if (ax25->ax25_dev == NULL) // CHECK
  ...
  ax25_queue_xmit(skb, ax25->ax25_dev->dev); // USE
  ...
}

static void ax25_kill_by_device(...) {
  ...
  if (s->ax25_dev == ax25_dev) {
    s->ax25_dev = NULL;
    ...
}

Other syscall functions like ax25_getsockopt, ax25_getname,
ax25_info_show also suffer from similar races. To fix them, this patch
introduce lock_sock() into ax25_kill_by_device in order to guarantee
that the nullify action in cleanup routine cannot proceed when another
socket request is pending.

Signed-off-by: Hanjie Wu <nagi@zju.edu.cn>
Signed-off-by: Lin Ma <linma@zju.edu.cn>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/ax25/af_ax25.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 64fede18aa33f..f4c8567e91b38 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -88,8 +88,10 @@ static void ax25_kill_by_device(struct net_device *dev)
 again:
 	ax25_for_each(s, &ax25_list) {
 		if (s->ax25_dev == ax25_dev) {
-			s->ax25_dev = NULL;
 			spin_unlock_bh(&ax25_list_lock);
+			lock_sock(s->sk);
+			s->ax25_dev = NULL;
+			release_sock(s->sk);
 			ax25_disconnect(s, ENETUNREACH);
 			spin_lock_bh(&ax25_list_lock);
 
-- 
2.34.1


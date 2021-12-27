From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.4 6/9] ax25: NPD bug when detaching AX25 device
Date: Mon, 27 Dec 2021 14:05:33 -0500
Message-ID: <20211227190536.1042975-6-sashal@kernel.org>
References: <20211227190536.1042975-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640631966;
        bh=hYzyBgDyGr9yez6MrTsZRXi128M8rHcoWTW7ij/g98c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kGrTYLf8xgh2aqJE0gMggK4yWLoZHQW2MmYSWgNwNB3heGeWPAUj7dqEhpjA7rvhy
         /iPlxOAIDUAHypz0tphE4/bXnFHfGfqzxzuF+XqiMrziaM93txsKGP6a0greQ326OO
         tWpsCZWwiqzXpeJ+f/9cmT/PMar8x7R1deDwsIpErd5ux/3FSDpKn2ppQ6kHJtmBH3
         pS4PmhNN5/6puATJqGy2+Q/P7/BBesh8/arKs1EKTTqOBjlmU86Mtn1p//5MvBSC7F
         uLkU2fqf50gl4oB6c0ctF84rJCE80ZGQB61y8BXfxkkMmtRs2kZmP4AP7jh1hjvrzy
         QEl5uHTXZsoJg==
In-Reply-To: <20211227190536.1042975-1-sashal@kernel.org>
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
index 2fdb1b573e8c8..1f84d41e22c36 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -85,8 +85,10 @@ static void ax25_kill_by_device(struct net_device *dev)
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


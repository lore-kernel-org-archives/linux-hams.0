From: Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH net-next] net: rose: Remove NULL check before dev_{put, hold}
Date: Tue, 28 Feb 2023 08:52:17 +0800
Message-ID: <20230228005217.105058-1-yang.lee@linux.alibaba.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: kuba@kernel.org
Cc: davem@davemloft.net, ralf@linux-mips.org, edumazet@google.com, pabeni@redhat.com, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>, Abaci Robot <abaci@linux.alibaba.com>

The call netdev_{put, hold} of dev_{put, hold} will check NULL,
so there is no need to check before using dev_{put, hold},
remove it to silence the warning=EF=BC=9A

./net/rose/rose_route.c:619:2-10: WARNING: NULL check before dev_{put, hold=
} functions is not needed.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D4239
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 net/rose/rose_route.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
index fee772b4637c..58d0312c0119 100644
--- a/net/rose/rose_route.c
+++ b/net/rose/rose_route.c
@@ -615,8 +615,7 @@ struct net_device *rose_dev_first(void)
 			if (first =3D=3D NULL || strncmp(dev->name, first->name, 3) < 0)
 				first =3D dev;
 	}
-	if (first)
-		dev_hold(first);
+	dev_hold(first);
 	rcu_read_unlock();
=20
 	return first;
--=20
2.20.1.7.g153144c


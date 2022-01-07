From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH net] netrom: fix api breakage in nr_setsockopt()
Date: Fri, 7 Jan 2022 10:12:10 +0300
Message-ID: <20220107071209.GA22086@kili>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=PDZN883zYs4dq9Y+Xn0tK95iHAS798QJFVlVRvCyIrY=;
 b=a/5T0l6R/KuZRfWs/zHxeXGp40wl8sZcR4rWheZkEEojV6l7UKv7lhSCOnb9BOwqUvIU
 AvDE/VHRgGXF2I0h9BvUrsi6dBn4ffItnKXWbWfy1r+aGgEEEtFaPzVyNNJQe6oFvMXi
 3PQF4W+59Gjlh3cKOXB46+1ve+qAhsVLNEs+UmJNA7KxkZa9Lqepy/kx2YgFhW0dea6z
 8e4ZJ8S+F9+CRABN7VAlwncz0lr4HDcugRcNvEcLGLr31dbBCMJXKUAnNC3CzkGnheuv
 FaudTySZEgEdLa3IpgqNHqFDGcuTgYxhg75wm8xmJih6dJfi+1fpLr01/eMexEKOxR6A DA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDZN883zYs4dq9Y+Xn0tK95iHAS798QJFVlVRvCyIrY=;
 b=CI7CKYFQdVn6nnQEwo1uWZKKl55RtSQJtX2BpOSU9TJo+Kj8XQIPp8yVFO2cSGb/EtcI+GJYwFDAo9wLRFTrwOXWMUGhZ9pG8AKjiij3q0l3j0NSu7ZCMHUMyaHEnG/Ax4YxYG/qrl7V+b0WLo6zTZGNjqAecmSLHXjMDscNerg=
Content-Disposition: inline
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This needs to copy an unsigned int from user space instead of a long to
avoid breaking user space with an API change.

I have updated all the integer overflow checks from ULONG to UINT as
well.  This is a slight API change but I do not expect it to affect
anything in real life.

Fixes: 3087a6f36ee0 ("netrom: fix copying in user data in nr_setsockopt")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/netrom/af_netrom.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/net/netrom/af_netrom.c b/net/netrom/af_netrom.c
index f1ba7dd3d253..fa9dc2ba3941 100644
--- a/net/netrom/af_netrom.c
+++ b/net/netrom/af_netrom.c
@@ -298,7 +298,7 @@ static int nr_setsockopt(struct socket *sock, int level, int optname,
 {
 	struct sock *sk = sock->sk;
 	struct nr_sock *nr = nr_sk(sk);
-	unsigned long opt;
+	unsigned int opt;
 
 	if (level != SOL_NETROM)
 		return -ENOPROTOOPT;
@@ -306,18 +306,18 @@ static int nr_setsockopt(struct socket *sock, int level, int optname,
 	if (optlen < sizeof(unsigned int))
 		return -EINVAL;
 
-	if (copy_from_sockptr(&opt, optval, sizeof(unsigned long)))
+	if (copy_from_sockptr(&opt, optval, sizeof(opt)))
 		return -EFAULT;
 
 	switch (optname) {
 	case NETROM_T1:
-		if (opt < 1 || opt > ULONG_MAX / HZ)
+		if (opt < 1 || opt > UINT_MAX / HZ)
 			return -EINVAL;
 		nr->t1 = opt * HZ;
 		return 0;
 
 	case NETROM_T2:
-		if (opt < 1 || opt > ULONG_MAX / HZ)
+		if (opt < 1 || opt > UINT_MAX / HZ)
 			return -EINVAL;
 		nr->t2 = opt * HZ;
 		return 0;
@@ -329,13 +329,13 @@ static int nr_setsockopt(struct socket *sock, int level, int optname,
 		return 0;
 
 	case NETROM_T4:
-		if (opt < 1 || opt > ULONG_MAX / HZ)
+		if (opt < 1 || opt > UINT_MAX / HZ)
 			return -EINVAL;
 		nr->t4 = opt * HZ;
 		return 0;
 
 	case NETROM_IDLE:
-		if (opt > ULONG_MAX / (60 * HZ))
+		if (opt > UINT_MAX / (60 * HZ))
 			return -EINVAL;
 		nr->idle = opt * 60 * HZ;
 		return 0;
-- 
2.20.1


From: Li zeming <zeming@nfschina.com>
Subject: [PATCH] ax25: af_ax25: Remove unnecessary (void*) conversions
Date: Tue, 15 Nov 2022 10:14:24 +0800
Message-ID: <20221115021424.3367-1-zeming@nfschina.com>
Return-path: <linux-hams-owner@vger.kernel.org>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jreuter@yaina.de, ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Li zeming <zeming@nfschina.com>

The valptr pointer is of (void *) type, so other pointers need not be
forced to assign values to it.

Signed-off-by: Li zeming <zeming@nfschina.com>
---
 net/ax25/af_ax25.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 6b4c25a92377..d8da400cb4de 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -723,7 +723,7 @@ static int ax25_getsockopt(struct socket *sock, int level, int optname,
 	if (maxlen < 1)
 		return -EFAULT;
 
-	valptr = (void *) &val;
+	valptr = &val;
 	length = min_t(unsigned int, maxlen, sizeof(int));
 
 	lock_sock(sk);
@@ -785,7 +785,7 @@ static int ax25_getsockopt(struct socket *sock, int level, int optname,
 			length = 1;
 		}
 
-		valptr = (void *) devname;
+		valptr = devname;
 		break;
 
 	default:
-- 
2.18.2


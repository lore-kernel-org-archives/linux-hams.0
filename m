From: Denis Efremov <efremov@linux.com>
Subject: [PATCH] net/hamradio/6pack: remove redundant check in sp_encaps()
Date: Fri,  5 Mar 2021 19:26:22 +0300
Message-ID: <20210305162622.67993-1-efremov@linux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Koensgen <ajk@comnets.uni-bremen.de>
Cc: Denis Efremov <efremov@linux.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

"len > sp->mtu" checked twice in a row in sp_encaps().
Remove the second check.

Signed-off-by: Denis Efremov <efremov@linux.com>
---
 drivers/net/hamradio/6pack.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
index 71d6629e65c9..9f5b5614a150 100644
--- a/drivers/net/hamradio/6pack.c
+++ b/drivers/net/hamradio/6pack.c
@@ -171,11 +171,6 @@ static void sp_encaps(struct sixpack *sp, unsigned char *icp, int len)
 		goto out_drop;
 	}
 
-	if (len > sp->mtu) {	/* sp->mtu = AX25_MTU = max. PACLEN = 256 */
-		msg = "oversized transmit packet!";
-		goto out_drop;
-	}
-
 	if (p[0] > 5) {
 		msg = "invalid KISS command";
 		goto out_drop;
-- 
2.26.2


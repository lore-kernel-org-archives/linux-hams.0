From: Nicolas Kaiser <nikai@nikai.net>
Subject: [PATCH] 6pack: remove duplicated packet size check
Date: Sat, 23 Oct 2010 21:11:29 +0200
Message-ID: <20101023211129.50d07640@absol.kitzblitz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Koensgen <ajk@comnets.uni-bremen.de>
Cc: linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org

Packet size is checked twice in a row.

Signed-off-by: Nicolas Kaiser <nikai@nikai.net>
---
 drivers/net/hamradio/6pack.c |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
index 3e5d0b6..bf71742 100644
--- a/drivers/net/hamradio/6pack.c
+++ b/drivers/net/hamradio/6pack.c
@@ -172,11 +172,6 @@ static void sp_encaps(struct sixpack *sp, unsigned char *icp, int len)
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
1.7.2.2

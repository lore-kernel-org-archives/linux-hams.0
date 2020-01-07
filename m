From: Colin King <colin.king@canonical.com>
Subject: [PATCH] net/rose: remove redundant assignment to variable failed
Date: Tue,  7 Jan 2020 15:24:15 +0000
Message-ID: <20200107152415.106353-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf Baechle <ralf@linux-mips.org>, "David S . Miller" <davem@davemloft.net>, linux-hams@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable failed is being assigned a value that is never read, the
following goto statement jumps to the end of the function and variable
failed is not referenced at all.  Remove the redundant assignment.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/rose/rose_route.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
index c53307623236..5277631fa14c 100644
--- a/net/rose/rose_route.c
+++ b/net/rose/rose_route.c
@@ -696,7 +696,6 @@ struct rose_neigh *rose_get_neigh(rose_address *addr, unsigned char *cause,
 				for (i = 0; i < node->count; i++) {
 					if (!rose_ftimer_running(node->neighbour[i])) {
 						res = node->neighbour[i];
-						failed = 0;
 						goto out;
 					}
 					failed = 1;
-- 
2.24.0


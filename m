From: Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH 7/7] NET: ROSE: Fix formatting.
Date: Wed, 20 Jul 2011 09:11:36 +0100
Message-ID: <a84acd3899f716e8aee132516c4f17e96552a730.1311152437.git.ralf@linux-mips.org>
References: <cover.1311152437.git.ralf@linux-mips.org>
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <cover.1311152437.git.ralf@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: Bernard F6BVP <f6bvp@free.fr>

Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
To: linux-hams@vger.kernel.org
Cc: Bernard F6BVP <f6bvp@free.fr>
---
 include/net/rose.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/net/rose.h b/include/net/rose.h
index 7578ed4..d2ebf13 100644
--- a/include/net/rose.h
+++ b/include/net/rose.h
@@ -94,7 +94,7 @@ struct rose_neigh {
 	ax25_address		callsign;
 	ax25_digi		*digipeat;
 	ax25_cb			*ax25;
-	struct net_device		*dev;
+	struct net_device	*dev;
 	unsigned short		count;
 	atomic_t		use;
 	unsigned int		number;
-- 
1.7.4.4


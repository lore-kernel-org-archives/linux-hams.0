From: Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH 5/7] NET: ROSE: Make rose_neigh_no atomic.
Date: Wed, 20 Jul 2011 09:11:14 +0100
Message-ID: <c58abd832957dd882cc233fd5913c671b6c00d26.1311152437.git.ralf@linux-mips.org>
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
 net/rose/rose_route.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
index db6b96d..7e90412 100644
--- a/net/rose/rose_route.c
+++ b/net/rose/rose_route.c
@@ -38,7 +38,7 @@
 #include <net/rose.h>
 #include <linux/seq_file.h>
 
-static unsigned int rose_neigh_no = 1;
+static atomic_t rose_neigh_no = ATOMIC_INIT(0);
 
 static struct rose_node  *rose_node_list;
 static DEFINE_SPINLOCK(rose_node_list_lock);
@@ -101,7 +101,7 @@ static int __must_check rose_add_node(struct rose_route_struct *rose_route,
 		atomic_set(&rose_neigh->use, 0);
 		rose_neigh->dce_mode  = 0;
 		rose_neigh->loopback  = 0;
-		rose_neigh->number    = rose_neigh_no++;
+		rose_neigh->number    = atomic_inc_return(rose_neigh_no);
 		rose_neigh->restarted = 0;
 
 		skb_queue_head_init(&rose_neigh->queue);
@@ -388,7 +388,7 @@ void rose_add_loopback_neigh(void)
 	atomic_set(&sn->use, 0);
 	sn->dce_mode  = 1;
 	sn->loopback  = 1;
-	sn->number    = rose_neigh_no++;
+	sn->number    = atomic_inc_return(rose_neigh_no);
 	sn->restarted = 1;
 
 	skb_queue_head_init(&sn->queue);
-- 
1.7.4.4



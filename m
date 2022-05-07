From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] [NET] ROSE: Remove unused code and clean up some inconsistent indenting
Date: Sat,  7 May 2022 11:42:07 +0800
Message-ID: <20220507034207.18651-1-jiapeng.chong@linux.alibaba.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ralf@linux-mips.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Abaci Robot <abaci@linux.alibaba.com>

Eliminate the follow smatch warning:

net/rose/rose_route.c:1136 rose_node_show() warn: inconsistent
indenting.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 net/rose/rose_route.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
index e2e6b6b78578..fee6409c2bb3 100644
--- a/net/rose/rose_route.c
+++ b/net/rose/rose_route.c
@@ -1128,22 +1128,15 @@ static int rose_node_show(struct seq_file *seq, void *v)
 		seq_puts(seq, "address    mask n neigh neigh neigh\n");
 	else {
 		const struct rose_node *rose_node = v;
-		/* if (rose_node->loopback) {
-			seq_printf(seq, "%-10s %04d 1 loopback\n",
-				   rose2asc(rsbuf, &rose_node->address),
-				   rose_node->mask);
-		} else { */
-			seq_printf(seq, "%-10s %04d %d",
-				   rose2asc(rsbuf, &rose_node->address),
-				   rose_node->mask,
-				   rose_node->count);
-
-			for (i = 0; i < rose_node->count; i++)
-				seq_printf(seq, " %05d",
-					rose_node->neighbour[i]->number);
-
-			seq_puts(seq, "\n");
-		/* } */
+		seq_printf(seq, "%-10s %04d %d",
+			   rose2asc(rsbuf, &rose_node->address),
+			   rose_node->mask,
+			   rose_node->count);
+
+		for (i = 0; i < rose_node->count; i++)
+			seq_printf(seq, " %05d", rose_node->neighbour[i]->number);
+
+		seq_puts(seq, "\n");
 	}
 	return 0;
 }
-- 
2.20.1.7.g153144c


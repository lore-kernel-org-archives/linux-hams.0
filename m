From: Young Xiao <92siuyang@gmail.com>
Subject: [PATCH] rose: af_rose: avoid overflows in rose_setsockopt()
Date: Tue,  4 Jun 2019 20:11:30 +0800
Message-ID: <1559650290-17054-1-git-send-email-92siuyang@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=EwJYsf92ydp+RtKiuVnWST5ck78zmLqyjDy58wjkNzk=;
        b=ALgMXYShkAFuscaf0G46Fe8IyL9l9sUJz35RiyTWOUtl+VQsGb3VE5G+kAFvWHJ989
         PzhD5ZvYnLcVx7VNy5G7ZxMWsPJ/EA4GdjGBTj1eyxgm7wi0fDim3GgYKIWP/UAlIHcK
         by1KonlJQhDWsjNTw4RJeeVd5uhcc9sFoTQe7jao13cWC/Lt2s6+rj4QdFK+EsLmCjsh
         Q9+fhsv77zWy4VweL+38l6VUado93b+f40sn8S2SE7dd8s1QPImSyoLhsooGIbYugyVS
         NNWrMuWwmz/yqigNzN2eRjfMiBv82P35nWrrgwBObfCb4jilxaFSQvDH0Pq3pLG/mElZ
         1hDw==
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ralf@linux-mips.org, davem@davemloft.net, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Young Xiao <92siuyang@gmail.com>

Check setsockopt arguments to avoid overflows and return -EINVAL for
too large arguments.

See commit 32288eb4d940 ("netrom: avoid overflows in nr_setsockopt()")
for details.

Signed-off-by: Young Xiao <92siuyang@gmail.com>
---
 net/rose/af_rose.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
index e274bc6..af831ee9 100644
--- a/net/rose/af_rose.c
+++ b/net/rose/af_rose.c
@@ -372,15 +372,15 @@ static int rose_setsockopt(struct socket *sock, int level, int optname,
 {
 	struct sock *sk = sock->sk;
 	struct rose_sock *rose = rose_sk(sk);
-	int opt;
+	unsigned long opt;
 
 	if (level != SOL_ROSE)
 		return -ENOPROTOOPT;
 
-	if (optlen < sizeof(int))
+	if (optlen < sizeof(unsigned int))
 		return -EINVAL;
 
-	if (get_user(opt, (int __user *)optval))
+	if (get_user(opt, (unsigned int __user *)optval))
 		return -EFAULT;
 
 	switch (optname) {
@@ -389,31 +389,31 @@ static int rose_setsockopt(struct socket *sock, int level, int optname,
 		return 0;
 
 	case ROSE_T1:
-		if (opt < 1)
+		if (opt < 1 || opt > ULONG_MAX / HZ)
 			return -EINVAL;
 		rose->t1 = opt * HZ;
 		return 0;
 
 	case ROSE_T2:
-		if (opt < 1)
+		if (opt < 1 || opt > ULONG_MAX / HZ)
 			return -EINVAL;
 		rose->t2 = opt * HZ;
 		return 0;
 
 	case ROSE_T3:
-		if (opt < 1)
+		if (opt < 1 || opt > ULONG_MAX / HZ)
 			return -EINVAL;
 		rose->t3 = opt * HZ;
 		return 0;
 
 	case ROSE_HOLDBACK:
-		if (opt < 1)
+		if (opt < 1 || opt > ULONG_MAX / HZ)
 			return -EINVAL;
 		rose->hb = opt * HZ;
 		return 0;
 
 	case ROSE_IDLE:
-		if (opt < 0)
+		if (opt < 0 || opt > ULONG_MAX / HZ)
 			return -EINVAL;
 		rose->idle = opt * 60 * HZ;
 		return 0;
-- 
2.7.4


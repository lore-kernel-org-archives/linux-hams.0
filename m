From: Cong Wang <xiyou.wangcong@gmail.com>
Subject: [Patch net] netrom: switch to sock timer API
Date: Thu, 24 Jan 2019 14:18:18 -0800
Message-ID: <20190124221818.15813-1-xiyou.wangcong@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M5HhvxUrpRt78axP+6gi5ZS/hYr0lroK/GS5qQyJO1c=;
        b=CLDKw9RWlj1yh3Q0Xnr3COL48HD4FkdP3jeGUr2Jp7MLqVhP0EY440nsUIr8tiWOkX
         274qhNFjs3W3P9Gg7VjJ0t0tRBhtvI4oD0Xf79kTTgBQfrsxJxY+DVBP7/CFESKXgdH6
         E97AHppNQ2sqEveNmIapwhPmqrX46fp3ihBd5fUrA0xHC6SVFG4hc4cgRxsZE2049TYQ
         pP+anhQ7qPXyEJYs+N4/eudVVvr8PTmobYaPTIkTAO0VKptGbKAB7Vve/S6BS4vfbdJr
         RySWeXx32HPkn83X1dnFRCoCHjSgxecp79hKNwzuFnQXX83LVp9jnoBo4i43SgkeBFMb
         GgaA==
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netdev@vger.kernel.org
Cc: Cong Wang <xiyou.wangcong@gmail.com>, syzbot+defa700d16f1bd1b9a05@syzkaller.appspotmail.com, Ralf Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org

sk_reset_timer() and sk_stop_timer() properly handle
sock refcnt for timer function. Switching to them
could fix a refcounting bug reported by syzbot.

Reported-and-tested-by: syzbot+defa700d16f1bd1b9a05@syzkaller.appspotmail.com
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org
Signed-off-by: Cong Wang <xiyou.wangcong@gmail.com>
---
 net/netrom/nr_timer.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/net/netrom/nr_timer.c b/net/netrom/nr_timer.c
index cbd51ed5a2d7..908e53ab47a4 100644
--- a/net/netrom/nr_timer.c
+++ b/net/netrom/nr_timer.c
@@ -52,21 +52,21 @@ void nr_start_t1timer(struct sock *sk)
 {
 	struct nr_sock *nr = nr_sk(sk);
 
-	mod_timer(&nr->t1timer, jiffies + nr->t1);
+	sk_reset_timer(sk, &nr->t1timer, jiffies + nr->t1);
 }
 
 void nr_start_t2timer(struct sock *sk)
 {
 	struct nr_sock *nr = nr_sk(sk);
 
-	mod_timer(&nr->t2timer, jiffies + nr->t2);
+	sk_reset_timer(sk, &nr->t2timer, jiffies + nr->t2);
 }
 
 void nr_start_t4timer(struct sock *sk)
 {
 	struct nr_sock *nr = nr_sk(sk);
 
-	mod_timer(&nr->t4timer, jiffies + nr->t4);
+	sk_reset_timer(sk, &nr->t4timer, jiffies + nr->t4);
 }
 
 void nr_start_idletimer(struct sock *sk)
@@ -74,37 +74,37 @@ void nr_start_idletimer(struct sock *sk)
 	struct nr_sock *nr = nr_sk(sk);
 
 	if (nr->idle > 0)
-		mod_timer(&nr->idletimer, jiffies + nr->idle);
+		sk_reset_timer(sk, &nr->idletimer, jiffies + nr->idle);
 }
 
 void nr_start_heartbeat(struct sock *sk)
 {
-	mod_timer(&sk->sk_timer, jiffies + 5 * HZ);
+	sk_reset_timer(sk, &sk->sk_timer, jiffies + 5 * HZ);
 }
 
 void nr_stop_t1timer(struct sock *sk)
 {
-	del_timer(&nr_sk(sk)->t1timer);
+	sk_stop_timer(sk, &nr_sk(sk)->t1timer);
 }
 
 void nr_stop_t2timer(struct sock *sk)
 {
-	del_timer(&nr_sk(sk)->t2timer);
+	sk_stop_timer(sk, &nr_sk(sk)->t2timer);
 }
 
 void nr_stop_t4timer(struct sock *sk)
 {
-	del_timer(&nr_sk(sk)->t4timer);
+	sk_stop_timer(sk, &nr_sk(sk)->t4timer);
 }
 
 void nr_stop_idletimer(struct sock *sk)
 {
-	del_timer(&nr_sk(sk)->idletimer);
+	sk_stop_timer(sk, &nr_sk(sk)->idletimer);
 }
 
 void nr_stop_heartbeat(struct sock *sk)
 {
-	del_timer(&sk->sk_timer);
+	sk_stop_timer(sk, &sk->sk_timer);
 }
 
 int nr_t1timer_running(struct sock *sk)
-- 
2.20.1


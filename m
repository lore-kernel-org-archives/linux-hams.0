From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 4.20 10/80] netrom: switch to sock timer API
Date: Mon,  4 Feb 2019 11:36:30 +0100
Message-ID: <20190204103621.678995364@linuxfoundation.org>
References: <20190204103620.287366543@linuxfoundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1549277492;
        bh=m+LPsmr2d7WPKUEbf79q4oUqVWtaQB6FMBWMnd+gWaw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mofbbj6brG4o9grOpziCDbsiF8c6KQWEyyZJiNrn4mUoZZaMuzO0w2zXQJe8PeAeP
         JE73l6UB7mo87ZOeui5452Zmi1OV/AcRyq4UA8Lwr51BINNMIghYPE84wmcpZcdPEC
         1/2Tosy4zgxzGfCHCL9MRNVvZem3RQ3UQkQNy8dI=
In-Reply-To: <20190204103620.287366543@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org, Cong Wang <xiyou.wangcong@gmail.com>, "David S. Miller" <davem@davemloft.net>, syzbot+defa700d16f1bd1b9a05@syzkaller.appspotmail.com

4.20-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Cong Wang <xiyou.wangcong@gmail.com>

[ Upstream commit 63346650c1a94a92be61a57416ac88c0a47c4327 ]

sk_reset_timer() and sk_stop_timer() properly handle
sock refcnt for timer function. Switching to them
could fix a refcounting bug reported by syzbot.

Reported-and-tested-by: syzbot+defa700d16f1bd1b9a05@syzkaller.appspotmail.com
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org
Signed-off-by: Cong Wang <xiyou.wangcong@gmail.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 net/netrom/nr_timer.c |   20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

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



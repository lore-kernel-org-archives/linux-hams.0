Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6975C14A4F0;
	Sat, 14 Mar 2026 03:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773460781; cv=none; b=iop6/PWI2Aso8N4DHz02PM7iU4bIdMnDg4QhlqqmFUc7myKPWR382/hnlFxIJpkJwoe1rV05ppIs286iILAo7kZDptQMgXKcUFIPlqh5Mvl+VyQc9FD+HZ8/A8o0MQKU4jVfL4EZIVke+6bbtJ8SRcS1EVChJes4ZP9ekFcxcNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773460781; c=relaxed/simple;
	bh=dJCKhLriSKEWRVCX7bCObv6L8OZaPT+smmA5fhDR19g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bgiYmR+xDqnFzZ1gpN6acyiupK+22gYCRyug2q/5sZHhXEOEQnd+kbD5maSjVsXm9DC9sJR2KJrzu8ytAOdh0YxcaJNmdcoUDbjXu0JnG2i24+QRd35oWg593/OpgBR0Q1rsFtSdQlEcRNHqfKpinPMzrpDMmu1jFP9hcc3SIuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=ZMGJuBrq; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="ZMGJuBrq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1773460759;
	bh=zKaQP4BBd/CPyaLUF3pAKzH5y8ytTnIhWePAaMB3h8s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ZMGJuBrqSPWM6hXLulP/IKR2WgCl4A+5cl86gdJaKSB6URpxnmZBu0FUqscUttZQa
	 /KVWIXzEKEgUWQuke+X7qetXIJ6YJN+BVPvbtBzHLeenSX9lxqkwOZRGOk5KMrGOOn
	 ISKyQFz5vux95q/GBS7OJP2hD7XE5IRuyr9Qvq2Q=
X-QQ-mid: zesmtpgz5t1773460743t7ff490cc
X-QQ-Originating-IP: d1eJD+aBLn4dYYNCQfLxV+EufdQQgksowjc7z31Kwds=
Received: from uos-PC ( [117.152.200.205])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 14 Mar 2026 11:59:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4723406575563594053
EX-QQ-RecipientCnt: 5
From: Morduan Zang <zhangdandan@uniontech.com>
To: jreuter@yaina.de
Cc: zhanjun@uniontech.com,
	linux-hams@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+41ebf587f04e2bcfa8e5@syzkaller.appspotmail.com
Subject: [PATCH] net: ax25: fix UAF in timer paths
Date: Sat, 14 Mar 2026 11:58:59 +0800
Message-ID: <E712E2CB8794B819+20260314035859.14272-1-zhangdandan@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N+eeeTl7NzFiU7O8NGo3Mdg4B52XnmZ8B+NLA0OXiL+GTQXMupGDuZ4t
	d3OJX47Tr0LVTt/h337itw5D9LnMJkCi0hOIJ/m5VQBozfjavlKxeFaixZNpK667AdFDnGH
	uXXcb72lf8Jrgj6Y7WcR356+tai7bjVpJCWdDqQ84YrD99vt0PNrphplZ7Yk7A7LmcbCeib
	KCV6Sy01k5Uhv1afGu5ieVxPqByZja+2tOxWdwCEqkvGr7mLDluzZm+T+V5Zv5RcQML7qMh
	lnpfT5IeF0IE238ADCeaW+O0oVWyN9OdcODF/VnKmr8+fP1sCjoSmQLQhwJiIFsf57Cvfb/
	csiL4dKtfNPzWwmr82KXA1hfupSU/HSRUXIEw6iXkPfjplln1o+1prtk5ZQXhTZVA5327nj
	3NY9DWsrP9Z/rXFoL8lnfNmUmY+jtW40x7fSuy4WjpORYf5ZcDVfLHA3xvmSPwGAAxXW+Vw
	BQNLHzi+aY+//mqJtH3I+IPl22Dxx2eiJOQbciAt5MKczncNz6dBJmeka+FY6B8WlKj60/w
	6omYmL2kPK35juVBapilRglzb9FPo7G9Z2ASXnigMr/hkIuBn7FDxNhQcbJXLV4IzBbHcgB
	atntt/6Fqp8MDRnCI3sOV+7s3uT64Ho2Warb8gf78WA5gR0m6GqumozotA18aMVV+tUUS6/
	G6bgb2244/TBADbKonflQWmjFFuEBEElD3nZQlKQY4eCSWxoLwPW8pORYEyOhD1fuyMne2Q
	wCS1wcWl0flaynVALNX8gnY99e5Vzityj7dYJ3YSP/WoUm9op94+75w83d5IgqtfzddrLW7
	pwTsZQtr1jiGeS+rXiIG849k048bidXmlvv6VHGNsE2CjOGSopanXRJRam8lua1zgvhvv1I
	rHLmEbC620FI4PIoQJnqI4zl9bMBdC4EPIpJenCxi8q3vq44JlrKM2ulm2jDHeCnbYR3wL3
	HysPwx8uUK2KWIsDF/nuIUStax0kMlmn+Bkpf8zznvqR089OpPM2rtvKqc4ZsLqN6BctbGc
	Uksqf14Yq7qyBmZBTrk6NvWWkKE0psTfNa/2oG8nqXTq2575cD5SY5tDlNUJg=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

From: zhanjun <zhanjun@uniontech.com>

syzbot reported a use-after-free in ax25_disconnect() from an AX.25
timer callback.

AX.25 protocol timers do not hold a reference to ax25_cb while they are
queued or running. As a result, one timer callback can tear down the
control block and drop the last reference through ax25_destroy_socket()
or ax25_link_failed() while another timer callback is still pending or
already executing on another CPU.

The deferred destroy timer has the same problem because it is embedded in
ax25_cb and can outlive the last external reference as well.

Fix this by making each armed timer hold a reference to ax25_cb. When a
timer callback starts, convert the queued-timer reference into a callback
reference and drop it when the callback finishes. Apply the same rule to
dtimer and initialize it once so it can be safely rearmed with mod_timer().

This keeps ax25_cb alive for all timer paths without adding
timer_delete_sync() to ax25_destroy_socket().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+41ebf587f04e2bcfa8e5@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=41ebf587f04e2bcfa8e5
Signed-off-by: zhanjun <zhanjun@uniontech.com>
---
 net/ax25/af_ax25.c    | 15 +++++++--
 net/ax25/ax25_timer.c | 75 ++++++++++++++++++++++++++++++++++++-------
 2 files changed, 75 insertions(+), 15 deletions(-)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index a76f4793aed2..862d65ff3e94 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -290,6 +290,9 @@ static void ax25_destroy_timer(struct timer_list *t)
 	ax25_cb *ax25 = timer_container_of(ax25, t, dtimer);
 	struct sock *sk;
 
+	ax25_cb_hold(ax25);
+	ax25_cb_put(ax25);
+
 	sk=ax25->sk;
 
 	bh_lock_sock(sk);
@@ -297,6 +300,13 @@ static void ax25_destroy_timer(struct timer_list *t)
 	ax25_destroy_socket(ax25);
 	bh_unlock_sock(sk);
 	sock_put(sk);
+	ax25_cb_put(ax25);
+}
+
+static void ax25_start_destroy_timer(ax25_cb *ax25)
+{
+	if (!mod_timer(&ax25->dtimer, jiffies + 2 * HZ))
+		ax25_cb_hold(ax25);
 }
 
 /*
@@ -343,9 +353,7 @@ void ax25_destroy_socket(ax25_cb *ax25)
 	if (ax25->sk != NULL) {
 		if (sk_has_allocations(ax25->sk)) {
 			/* Defer: outstanding buffers */
-			timer_setup(&ax25->dtimer, ax25_destroy_timer, 0);
-			ax25->dtimer.expires  = jiffies + 2 * HZ;
-			add_timer(&ax25->dtimer);
+			ax25_start_destroy_timer(ax25);
 		} else {
 			struct sock *sk=ax25->sk;
 			ax25->sk=NULL;
@@ -537,6 +545,7 @@ ax25_cb *ax25_create_cb(void)
 	skb_queue_head_init(&ax25->frag_queue);
 	skb_queue_head_init(&ax25->ack_queue);
 	skb_queue_head_init(&ax25->reseq_queue);
+	timer_setup(&ax25->dtimer, ax25_destroy_timer, 0);
 
 	ax25_setup_timers(ax25);
 
diff --git a/net/ax25/ax25_timer.c b/net/ax25/ax25_timer.c
index a69bfbc8b679..0fefb5643c6c 100644
--- a/net/ax25/ax25_timer.c
+++ b/net/ax25/ax25_timer.c
@@ -36,6 +36,35 @@ static void ax25_t2timer_expiry(struct timer_list *);
 static void ax25_t3timer_expiry(struct timer_list *);
 static void ax25_idletimer_expiry(struct timer_list *);
 
+static void ax25_mod_timer(struct timer_list *timer, ax25_cb *ax25,
+			   unsigned long expires)
+{
+	if (!mod_timer(timer, expires))
+		ax25_cb_hold(ax25);
+}
+
+static void ax25_del_timer(struct timer_list *timer, ax25_cb *ax25)
+{
+	if (timer_delete(timer))
+		ax25_cb_put(ax25);
+}
+
+static void ax25_timer_expiry_start(ax25_cb *ax25)
+{
+	/*
+	 * A pending timer holds one reference to the control block. Once the
+	 * timer callback starts running that reference no longer belongs to a
+	 * queued timer, so turn it into a temporary execution reference.
+	 */
+	ax25_cb_hold(ax25);
+	ax25_cb_put(ax25);
+}
+
+static void ax25_timer_expiry_stop(ax25_cb *ax25)
+{
+	ax25_cb_put(ax25);
+}
+
 void ax25_setup_timers(ax25_cb *ax25)
 {
 	timer_setup(&ax25->timer, ax25_heartbeat_expiry, 0);
@@ -47,58 +76,60 @@ void ax25_setup_timers(ax25_cb *ax25)
 
 void ax25_start_heartbeat(ax25_cb *ax25)
 {
-	mod_timer(&ax25->timer, jiffies + 5 * HZ);
+	ax25_mod_timer(&ax25->timer, ax25, jiffies + 5 * HZ);
 }
 
 void ax25_start_t1timer(ax25_cb *ax25)
 {
-	mod_timer(&ax25->t1timer, jiffies + ax25->t1);
+	ax25_mod_timer(&ax25->t1timer, ax25, jiffies + ax25->t1);
 }
 
 void ax25_start_t2timer(ax25_cb *ax25)
 {
-	mod_timer(&ax25->t2timer, jiffies + ax25->t2);
+	ax25_mod_timer(&ax25->t2timer, ax25, jiffies + ax25->t2);
 }
 
 void ax25_start_t3timer(ax25_cb *ax25)
 {
 	if (ax25->t3 > 0)
-		mod_timer(&ax25->t3timer, jiffies + ax25->t3);
+		ax25_mod_timer(&ax25->t3timer, ax25,
+			       jiffies + ax25->t3);
 	else
-		timer_delete(&ax25->t3timer);
+		ax25_del_timer(&ax25->t3timer, ax25);
 }
 
 void ax25_start_idletimer(ax25_cb *ax25)
 {
 	if (ax25->idle > 0)
-		mod_timer(&ax25->idletimer, jiffies + ax25->idle);
+		ax25_mod_timer(&ax25->idletimer, ax25,
+			       jiffies + ax25->idle);
 	else
-		timer_delete(&ax25->idletimer);
+		ax25_del_timer(&ax25->idletimer, ax25);
 }
 
 void ax25_stop_heartbeat(ax25_cb *ax25)
 {
-	timer_delete(&ax25->timer);
+	ax25_del_timer(&ax25->timer, ax25);
 }
 
 void ax25_stop_t1timer(ax25_cb *ax25)
 {
-	timer_delete(&ax25->t1timer);
+	ax25_del_timer(&ax25->t1timer, ax25);
 }
 
 void ax25_stop_t2timer(ax25_cb *ax25)
 {
-	timer_delete(&ax25->t2timer);
+	ax25_del_timer(&ax25->t2timer, ax25);
 }
 
 void ax25_stop_t3timer(ax25_cb *ax25)
 {
-	timer_delete(&ax25->t3timer);
+	ax25_del_timer(&ax25->t3timer, ax25);
 }
 
 void ax25_stop_idletimer(ax25_cb *ax25)
 {
-	timer_delete(&ax25->idletimer);
+	ax25_del_timer(&ax25->idletimer, ax25);
 }
 
 int ax25_t1timer_running(ax25_cb *ax25)
@@ -123,6 +154,8 @@ static void ax25_heartbeat_expiry(struct timer_list *t)
 	int proto = AX25_PROTO_STD_SIMPLEX;
 	ax25_cb *ax25 = timer_container_of(ax25, t, timer);
 
+	ax25_timer_expiry_start(ax25);
+
 	if (ax25->ax25_dev)
 		proto = ax25->ax25_dev->values[AX25_VALUES_PROTOCOL];
 
@@ -141,12 +174,16 @@ static void ax25_heartbeat_expiry(struct timer_list *t)
 		break;
 #endif
 	}
+
+	ax25_timer_expiry_stop(ax25);
 }
 
 static void ax25_t1timer_expiry(struct timer_list *t)
 {
 	ax25_cb *ax25 = timer_container_of(ax25, t, t1timer);
 
+	ax25_timer_expiry_start(ax25);
+
 	switch (ax25->ax25_dev->values[AX25_VALUES_PROTOCOL]) {
 	case AX25_PROTO_STD_SIMPLEX:
 	case AX25_PROTO_STD_DUPLEX:
@@ -160,12 +197,16 @@ static void ax25_t1timer_expiry(struct timer_list *t)
 		break;
 #endif
 	}
+
+	ax25_timer_expiry_stop(ax25);
 }
 
 static void ax25_t2timer_expiry(struct timer_list *t)
 {
 	ax25_cb *ax25 = timer_container_of(ax25, t, t2timer);
 
+	ax25_timer_expiry_start(ax25);
+
 	switch (ax25->ax25_dev->values[AX25_VALUES_PROTOCOL]) {
 	case AX25_PROTO_STD_SIMPLEX:
 	case AX25_PROTO_STD_DUPLEX:
@@ -179,12 +220,16 @@ static void ax25_t2timer_expiry(struct timer_list *t)
 		break;
 #endif
 	}
+
+	ax25_timer_expiry_stop(ax25);
 }
 
 static void ax25_t3timer_expiry(struct timer_list *t)
 {
 	ax25_cb *ax25 = timer_container_of(ax25, t, t3timer);
 
+	ax25_timer_expiry_start(ax25);
+
 	switch (ax25->ax25_dev->values[AX25_VALUES_PROTOCOL]) {
 	case AX25_PROTO_STD_SIMPLEX:
 	case AX25_PROTO_STD_DUPLEX:
@@ -200,12 +245,16 @@ static void ax25_t3timer_expiry(struct timer_list *t)
 		break;
 #endif
 	}
+
+	ax25_timer_expiry_stop(ax25);
 }
 
 static void ax25_idletimer_expiry(struct timer_list *t)
 {
 	ax25_cb *ax25 = timer_container_of(ax25, t, idletimer);
 
+	ax25_timer_expiry_start(ax25);
+
 	switch (ax25->ax25_dev->values[AX25_VALUES_PROTOCOL]) {
 	case AX25_PROTO_STD_SIMPLEX:
 	case AX25_PROTO_STD_DUPLEX:
@@ -221,4 +270,6 @@ static void ax25_idletimer_expiry(struct timer_list *t)
 		break;
 #endif
 	}
+
+	ax25_timer_expiry_stop(ax25);
 }
-- 
2.50.1


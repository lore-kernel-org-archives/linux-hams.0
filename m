From: Anmol Karn <anmol.karan123@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 net] rose: Fix Null pointer dereference in rose_send_frame()
Date: Thu,  5 Nov 2020 21:26:00 +0530
Message-ID: <20201105155600.9711-1-anmol.karan123@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0TyRW4uWJJtZcAW80DlztYPoMgVPukL6fuFYNjjkzDE=;
        b=CwLJVzbYeqMzwKr8N4c0irQdu/f97dx0RKkTorEdzvvTffs+0V8F7lfwdH4jpz7v0V
         4hY8MG81Xn4RgMBDNj5Icl/qMMibAXHmp1sdvvMX4IYVBQ32MFzzbGwAkT/mJhdHZy3L
         eHToAsxrCiRFUC15wNY0WrGDOavL5b3+xW5jaORefVxjMmZOk9Hka9w8tzBeeuas/jAT
         htExxA1jMPlWsGImkT25mD8uMsWLarf5hglLSBrLETRPtJiBpRSAZV49spj9nX1XcyUF
         QDrnaYexaB3zFCCVfGwFS4xNDa47SImXc8JBORQhIHNcQ6BaqZAopm5n30JhAaKZ1F9d
         1t3Q==
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ralf@linux-mips.org, davem@davemloft.net, kuba@kernel.org
Cc: gregkh@linuxfoundation.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hams@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, syzkaller-bugs@googlegroups.com, anmol.karan123@gmail.com, syzbot+a1c743815982d9496393@syzkaller.appspotmail.com

rose_send_frame() dereferences `neigh->dev` when called from
rose_transmit_clear_request(), and the first occurance of the `neigh`
is in rose_loopback_timer() as `rose_loopback_neigh`, and it is initialized
in rose_add_loopback_neigh() as NULL. i.e when `rose_loopback_neigh` used in 
rose_loopback_timer() its `->dev` was still NULL and rose_loopback_timer() 
was calling rose_rx_call_request() without checking for NULL.

- net/rose/rose_link.c
This bug seems to get triggered in this line:

rose_call = (ax25_address *)neigh->dev->dev_addr;

Fix it by adding NULL checking for `rose_loopback_neigh->dev` in rose_loopback_timer(). 

Reported-and-tested-by: syzbot+a1c743815982d9496393@syzkaller.appspotmail.com 
Link: https://syzkaller.appspot.com/bug?id=9d2a7ca8c7f2e4b682c97578dfa3f236258300b3 
Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
---
 net/rose/rose_loopback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
index 7b094275ea8b..cd7774cb1d07 100644
--- a/net/rose/rose_loopback.c
+++ b/net/rose/rose_loopback.c
@@ -96,7 +96,7 @@ static void rose_loopback_timer(struct timer_list *unused)
 		}
 
 		if (frametype == ROSE_CALL_REQUEST) {
-			if ((dev = rose_dev_get(dest)) != NULL) {
+			if (rose_loopback_neigh->dev && (dev = rose_dev_get(dest)) != NULL) {
 				if (rose_rx_call_request(skb, dev, rose_loopback_neigh, lci_o) == 0)
 					kfree_skb(skb);
 			} else {
-- 
2.29.2


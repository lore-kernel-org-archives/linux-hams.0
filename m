From: Anmol Karn <anmol.karan123@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v5 net] rose: Fix Null pointer dereference in rose_send_frame()
Date: Fri, 20 Nov 2020 00:40:43 +0530
Message-ID: <20201119191043.28813-1-anmol.karan123@gmail.com>
References: <20201115114448.GA40574@Thinkpad>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ET473FpFp3FzmBYHYLYam48z0xHPg334N2d9XOKTrpI=;
        b=M9O64TUOsf61++A5YWBgorUTqsUhConEUSLgnhF2hmpRoMo9gbHMK0Y5lS02yWOQMn
         xrFztSbuLNQ+ucnJjCg73QRIECuWEG+UR2GOfVP2Mi+rJVZf9I83c8TB9KF9Mx0DCQIA
         S5xL24QjlB8rFTuwVcmUY0UFBOak89hVYYiTrzQTOcOr09VZvuHUqOPNvaTHx/uOSWzr
         y5ZKb595uyBSpRpNI0CZNInd4rqqkQmzLNBTRx/yGjwDlJzPes7Gmth90pGXMZKrnfRh
         FJxt8mxU95GAFuC0N0CG+/whmIcWoGZUPxlmWUy8+JWcC8kzHnkSMrOxTotefn/d24i1
         cF5Q==
In-Reply-To: <20201115114448.GA40574@Thinkpad>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ralf@linux-mips.org, davem@davemloft.net, kuba@kernel.org
Cc: saeed@kernel.org, gregkh@linuxfoundation.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hams@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, syzkaller-bugs@googlegroups.com, anmol.karan123@gmail.com, syzbot+a1c743815982d9496393@syzkaller.appspotmail.com

rose_send_frame() dereferences `neigh->dev` when called from
rose_transmit_clear_request(), and the first occurrence of the
`neigh` is in rose_loopback_timer() as `rose_loopback_neigh`,
and it is initialized in rose_add_loopback_neigh() as NULL.
i.e when `rose_loopback_neigh` used in rose_loopback_timer()
its `->dev` was still NULL and rose_loopback_timer() was calling
rose_rx_call_request() without checking for NULL.

- net/rose/rose_link.c
This bug seems to get triggered in this line:

rose_call = (ax25_address *)neigh->dev->dev_addr;

Fix it by adding NULL checking for `rose_loopback_neigh->dev`
in rose_loopback_timer().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Suggested-by: Jakub Kicinski <kuba@kernel.org>
Reported-by: syzbot+a1c743815982d9496393@syzkaller.appspotmail.com
Tested-by: syzbot+a1c743815982d9496393@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=9d2a7ca8c7f2e4b682c97578dfa3f236258300b3
Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
---
Changes in v5:
	- Free `dev` in rose_rx_call_request() and add NULL check for `dev` before freeing it.
	(Suggested-by: Jakub Kicinski <kuba@kernel.org>)
Changes in v4:
	- Free `dev`(on dev_hold()), when neigh->dev is NULL. (Suggested-by: Jakub Kicinski <kuba@kernel.org>)
Changes in v3:
        - Corrected checkpatch warnings and errors (Suggested-by: Saeed Mahameed <saeed@kernel.org>)
        - Added "Fixes:" tag (Suggested-by: Saeed Mahameed <saeed@kernel.org>)
Changes in v2:
        - Added NULL check in rose_loopback_timer() (Suggested-by: Greg KH <gregkh@linuxfoundation.org>)

 net/rose/rose_loopback.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
index 7b094275ea8b..11c45c8c6c16 100644
--- a/net/rose/rose_loopback.c
+++ b/net/rose/rose_loopback.c
@@ -96,10 +96,19 @@ static void rose_loopback_timer(struct timer_list *unused)
 		}

 		if (frametype == ROSE_CALL_REQUEST) {
-			if ((dev = rose_dev_get(dest)) != NULL) {
-				if (rose_rx_call_request(skb, dev, rose_loopback_neigh, lci_o) == 0)
-					kfree_skb(skb);
-			} else {
+			if (!rose_loopback_neigh->dev) {
+				kfree_skb(skb);
+				continue;
+			}
+
+			dev = rose_dev_get(dest);
+			if (!dev) {
+				kfree_skb(skb);
+				continue;
+			}
+
+			if (rose_rx_call_request(skb, dev, rose_loopback_neigh, lci_o) == 0) {
+				dev_put(dev);
 				kfree_skb(skb);
 			}
 		} else {
--
2.29.2


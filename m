From: Anmol Karn <anmol.karan123@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v4 net] rose: Fix Null pointer dereference in rose_send_frame()
Date: Wed, 11 Nov 2020 22:29:54 +0530
Message-ID: <20201111165954.14743-1-anmol.karan123@gmail.com>
References: <20201110194518.GA97719@Thinkpad>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c94lztZhO2eT008D4pkLhU43B72yvq0WPJWvKsO0hew=;
        b=MOh286pQVrJTTVD8HcoPhcqT8q2yYoTL3bit4sDU9Mx5LKGgm5C8Ug8g0J6cNTUac2
         tsuqG1uOT1cVJaLGmgl9TCVBn9lAkM/KOgQS3/MGhJg7aCfJ5Q1kicPjfxOtMzP73kOy
         C69ar9hvwULSb6x6X2ojXTxGVhtRrXKoA4jCbGcFId4odlcU0lSSjOtUBQIM2VUanjlL
         FtkxvSMiY5DThI3jgfnZaVl7jd/sJnnfnsz6z9PGheLKZJse9vdUc/uJAopZ2VaBYjk5
         +Ni8MPJ/tXGN3WLucmZRebzS2Q6ifsk3YQVvbd/lG7mZXTm7MOrg1bQOp1qG6UZ/WLlp
         ltbw==
In-Reply-To: <20201110194518.GA97719@Thinkpad>
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
Reported-by: syzbot+a1c743815982d9496393@syzkaller.appspotmail.com
Tested-by: syzbot+a1c743815982d9496393@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=9d2a7ca8c7f2e4b682c97578dfa3f236258300b3
Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
---
Changes in v4:
	- Free `dev`(on dev_hold()), when neigh->dev is NULL. (Suggested-by: Jakub Kicinski <kuba@kernel.org>)
Changes in v3:
        - Corrected checkpatch warnings and errors (Suggested-by: Saeed Mahameed <saeed@kernel.org>)
        - Added "Fixes:" tag (Suggested-by: Saeed Mahameed <saeed@kernel.org>)
Changes in v2:
        - Added NULL check in rose_loopback_timer() (Suggested-by: Greg KH <gregkh@linuxfoundation.org>)

 net/rose/rose_loopback.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
index 7b094275ea8b..6a71b6947d92 100644
--- a/net/rose/rose_loopback.c
+++ b/net/rose/rose_loopback.c
@@ -96,10 +96,12 @@ static void rose_loopback_timer(struct timer_list *unused)
 		}

 		if (frametype == ROSE_CALL_REQUEST) {
-			if ((dev = rose_dev_get(dest)) != NULL) {
+			dev = rose_dev_get(dest);
+			if (rose_loopback_neigh->dev && dev) {
 				if (rose_rx_call_request(skb, dev, rose_loopback_neigh, lci_o) == 0)
 					kfree_skb(skb);
 			} else {
+				dev_put(dev);
 				kfree_skb(skb);
 			}
 		} else {
--
2.29.2

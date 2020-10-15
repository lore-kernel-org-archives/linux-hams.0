From: Anmol Karn <anmol.karan123@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] net: rose: Fix Null pointer dereference in rose_send_frame()
Date: Thu, 15 Oct 2020 05:47:12 +0530
Message-ID: <20201015001712.72976-1-anmol.karan123@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q5OVoE3pJbhdauHqlTDobbIRkF4tseIWuc4U1qOzq+k=;
        b=A/Z6g0IJ6RJqvoV2/izYHd/zFI83zBsUvMQMKk+wJFD0U7iXs69ZqVHfm1gCLTtw1c
         jSXGeZxxttxmRx50ZBSCb8D+fru54qFF/caQxWmrmhVbbhq8KegiZLd150mvM7Eb+4wI
         7zh92ZN0K0zA3zociLwYzzbSzZbzd4P0iCwiUAkdHM/b+QFmSigWQ3A0S/WFaarzgIbl
         M5UlnQZjT6+dXqdDkSqwb3hW/fAuXH3exOe4A2Plkch6mSH8ZOcM3ewVfyRmy9Rvoyjr
         9k1K2GRsGyzkE0pQcl4J4Y5BDBGFuIH4Hhnq9aRv3TbZpxT6pQBHHVM2Ru7+8SIZx5UK
         lm4w==
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ralf@linux-mips.org, davem@davemloft.net, kuba@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hams@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, syzkaller-bugs@googlegroups.com, anmol.karan123@gmail.com, syzbot+a1c743815982d9496393@syzkaller.appspotmail.com

In rose_send_frame(), when comparing two ax.25 addresses, it assigns rose_call to 
either global ROSE callsign or default port, but when the former block triggers and 
rose_call is assigned by (ax25_address *)neigh->dev->dev_addr, a NULL pointer is 
dereferenced by 'neigh' when dereferencing 'dev'.

- net/rose/rose_link.c
This bug seems to get triggered in this line:

rose_call = (ax25_address *)neigh->dev->dev_addr;

Prevent it by checking NULL condition for neigh->dev before comparing addressed for 
rose_call initialization.

Reported-by: syzbot+a1c743815982d9496393@syzkaller.appspotmail.com 
Link: https://syzkaller.appspot.com/bug?id=9d2a7ca8c7f2e4b682c97578dfa3f236258300b3 
Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
---
I am bit sceptical about the error return code, please suggest if anything else is 
appropriate in place of '-ENODEV'.

 net/rose/rose_link.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/rose/rose_link.c b/net/rose/rose_link.c
index f6102e6f5161..92ea6a31d575 100644
--- a/net/rose/rose_link.c
+++ b/net/rose/rose_link.c
@@ -97,6 +97,9 @@ static int rose_send_frame(struct sk_buff *skb, struct rose_neigh *neigh)
 	ax25_address *rose_call;
 	ax25_cb *ax25s;
 
+	if (!neigh->dev)
+		return -ENODEV;
+
 	if (ax25cmp(&rose_callsign, &null_ax25_address) == 0)
 		rose_call = (ax25_address *)neigh->dev->dev_addr;
 	else
-- 
2.28.0


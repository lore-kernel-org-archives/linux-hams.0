From: Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH] net: 6pack: fix slab-out-of-bounds in decode_data
Date: Fri, 13 Aug 2021 14:28:55 +0300
Message-ID: <20210813112855.11170-1-paskripkin@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ACKfswNNvHRBBpNemW++qzxjOqdIX0HI3XRS7XVqFYw=;
        b=oUkhvc5gv8BZBW5FLmApDisWxSrrMdPvdrSD3FPpvW3oNA4LTa+G3AkccS251UuOpJ
         YCihrqpl0EFV/Md1ONntGnIJ8dyvKNUZr8yHd4VymjFQJbQj7lexQALWYDch+Tkge0xZ
         RhotYnORed/zVVBO5E+LLej/tlMNtZteuNyTQ0EUbaAYva5rcLAougQjwDzoB682WinD
         NR11eozp63Mkn8eQxqptaiHxoQlx02abVzc6kvQIAV7IcClT7ZC+j37rWvBqwOBx1Gei
         fwecd4IyjLIUmxO4VH9ROi395Utmp93f3cJlAOtFsVSXwPQnEq1YWj5COxIQ/8Q5uU2e
         HoXA==
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ajk@comnets.uni-bremen.de, davem@davemloft.net, kuba@kernel.org
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Pavel Skripkin <paskripkin@gmail.com>, syzbot+fc8cd9a673d4577fb2e4@syzkaller.appspotmail.com

Syzbot reported slab-out-of bounds write in decode_data().
The problem was in missing validation checks.

Syzbot's reproducer generated malicious input, which caused
decode_data() to be called a lot in sixpack_decode(). Since
rx_count_cooked is only 400 bytes and noone reported before,
that 400 bytes is not enough, let's just check if input is malicious
and complain about buffer overrun.

Fail log:
==================================================================
BUG: KASAN: slab-out-of-bounds in drivers/net/hamradio/6pack.c:843
Write of size 1 at addr ffff888087c5544e by task kworker/u4:0/7

CPU: 0 PID: 7 Comm: kworker/u4:0 Not tainted 5.6.0-rc3-syzkaller #0
...
Workqueue: events_unbound flush_to_ldisc
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x197/0x210 lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xd4/0x30b mm/kasan/report.c:374
 __kasan_report.cold+0x1b/0x32 mm/kasan/report.c:506
 kasan_report+0x12/0x20 mm/kasan/common.c:641
 __asan_report_store1_noabort+0x17/0x20 mm/kasan/generic_report.c:137
 decode_data.part.0+0x23b/0x270 drivers/net/hamradio/6pack.c:843
 decode_data drivers/net/hamradio/6pack.c:965 [inline]
 sixpack_decode drivers/net/hamradio/6pack.c:968 [inline]

Reported-and-tested-by: syzbot+fc8cd9a673d4577fb2e4@syzkaller.appspotmail.com
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/net/hamradio/6pack.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
index fcf3af76b6d7..f4ffc2a80ab7 100644
--- a/drivers/net/hamradio/6pack.c
+++ b/drivers/net/hamradio/6pack.c
@@ -827,6 +827,12 @@ static void decode_data(struct sixpack *sp, unsigned char inbyte)
 		return;
 	}
 
+	if (sp->rx_count_cooked + 3 >= sizeof(sp->cooked_buf)) {
+		pr_err("6pack: cooked buffer overrun, data loss\n");
+		sp->rx_count = 0;
+		return;
+	}
+
 	buf = sp->raw_buf;
 	sp->cooked_buf[sp->rx_count_cooked++] =
 		buf[0] | ((buf[1] << 2) & 0xc0);
-- 
2.32.0


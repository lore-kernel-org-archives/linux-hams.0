From: Fuqian Huang <huangfq.daxian@gmail.com>
Subject: [PATCH v2 04/06] net: ax25: fix misuse of %x
Date: Sun, 21 Apr 2019 19:48:06 +0800
Message-ID: <20190421114806.20450-1-huangfq.daxian@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=h25SF50tyXVax+xbR9rwt5N9iky28EFEb4s4IWQ/1P0=;
        b=oiG6p+L54Wro6phc+iiwvLShxIKHLoOq+V0jzo8HmPfC7ztQ8vyn55gkLq68S/JPzO
         ziapPZd4mgXxBNhSL3ZGfIbmD3/MJBw7wH+JMohEvahInk+Uyw88Cz5ej28/5pExBbWD
         pZ/968dUokRtdMCRc7HB1VaIJfYvagbmKjm9nQBuH7nsmpxq7ofcIY6A9NWAPFcvQjrl
         F59MwDKsYYQkS4k1mqeWBOgO+pLDE0AeydbAQSk9tdEaLOUW+AgXEw3EOO5eSoJ0OKzH
         AjnD++b7OzQ4W9B7JI39riki3ykcvzgND0LSGujdTT/KZnCQpBgJEgFhabKjPY9xZktd
         zPKw==
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 
Cc: Fuqian Huang <huangfq.daxian@gmail.com>, Joerg Reuter <jreuter@yaina.de>, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Pointers should be printed with %p or %px rather than
cast to long type and printed with %8.8lx.
Change %8.8lx to %p to print the pointer.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
 net/ax25/af_ax25.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 5d01edf..90c2831 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -1888,8 +1888,8 @@ static int ax25_info_show(struct seq_file *seq, void *v)
 	 * magic dev src_addr dest_addr,digi1,digi2,.. st vs vr va t1 t1 t2 t2 t3 t3 idle idle n2 n2 rtt window paclen Snd-Q Rcv-Q inode
 	 */
 
-	seq_printf(seq, "%8.8lx %s %s%s ",
-		   (long) ax25,
+	seq_printf(seq, "%p %s %s%s ",
+		   ax25,
 		   ax25->ax25_dev == NULL? "???" : ax25->ax25_dev->dev->name,
 		   ax2asc(buf, &ax25->source_addr),
 		   ax25->iamdigi? "*":"");
-- 
2.11.0


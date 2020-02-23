From: Jules Irenge <jbi.octave@gmail.com>
Subject: [PATCH 12/30] net: netrom: Add missing annotation for nr_neigh_start()
Date: Sun, 23 Feb 2020 23:16:53 +0000
Message-ID: <20200223231711.157699-13-jbi.octave@gmail.com>
References: <0/30>
 <20200223231711.157699-1-jbi.octave@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=snlmcYtYDuvHwXmAmC2g0GkUCFgaXil3Rfxn4Ydoo+Q=;
        b=ZGuy3lgMu6uKf/X9D2SHX21zkV8GcEgjqUfqBX2/VsMNPWYVv9yk3VmWIbeXKBoX6h
         IEJ5XfchVqFSi5MortQ5DvdrkJ+w6DJtKX2ZjIJ6wkteB+gd7FLkaXNDXHT3keEqhEGq
         7+VzVRQE9s0hXskUNxNOZ1YsJPA+Ll+rRERd8aC840MN4w43/E4tHYsQuiRIN+mOa3aq
         X7VT1xs+3VvF/1BZzbft8ylQ9pmp2UcMokZfMj713duCV8mVFuct7/zrHVwDxHr3ZCe6
         3w6dfyqLL0yA7WnUEHuuQNoqoUNTw1sula3AR/Ic6Ip3Swd+DPlzTjzyNTVt6RVbhvWV
         dxRg==
In-Reply-To: <20200223231711.157699-1-jbi.octave@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: boqun.feng@gmail.com
Cc: jbi.octave@gmail.com, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, "open list:NETROM NETWORK LAYER" <linux-hams@vger.kernel.org>, "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>

Sparse reports a warning at nr_neigh_start()
warning: context imbalance in nr_neigh_start() - wrong count at exit
The root cause is the missing annotation at nr_neigh_start()
Add the missing __acquires(&nr_neigh_list_lock) annotation

Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
---
 net/netrom/nr_route.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
index 637a743c060d..33e7b91fc805 100644
--- a/net/netrom/nr_route.c
+++ b/net/netrom/nr_route.c
@@ -895,6 +895,7 @@ const struct seq_operations nr_node_seqops = {
 };
 
 static void *nr_neigh_start(struct seq_file *seq, loff_t *pos)
+	__acquires(&nr_neigh_list_lock)
 {
 	spin_lock_bh(&nr_neigh_list_lock);
 	return seq_hlist_start_head(&nr_neigh_list, *pos);
-- 
2.24.1


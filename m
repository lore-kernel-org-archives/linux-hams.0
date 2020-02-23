From: Jules Irenge <jbi.octave@gmail.com>
Subject: [PATCH 10/30] net: netrom: Add missing annotation for nr_node_start()
Date: Sun, 23 Feb 2020 23:16:51 +0000
Message-ID: <20200223231711.157699-11-jbi.octave@gmail.com>
References: <0/30>
 <20200223231711.157699-1-jbi.octave@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DK0fVk7T3WgMmj7v3ZYkeDPV2tF/ZuuJFCw88aNzFqM=;
        b=e8nA0Wxonp+zTCZjgn2t/zpZFdtKtlLPDAr5rCVr5QpiUkqjORtDc13zzswFAdvr8p
         Tol12dMs8diVyJpebXw7ag+dd8tEQClzpWP8Uqboy+1eVvoHE0sBSxzRvrwgmuH1DCSc
         nl2lfcL/ZyyFqzGtaJLnYFJjWPGU3UDUmbKdxj/NYAQpEqdtAg16dsdWsiAIQHuS6Ps0
         hEts00G2RPIs/cAawLTHULkqVC2Odh1sviqFy8AkfUIvD2boKDeuedyfymE8P7mGVk79
         EtOAb5pYUjqMyeAT3LFo/r271os1dcrIxBEP1Hp4ZyrIyld2iA3Luh6m9ApHjtAqeqWG
         r72w==
In-Reply-To: <20200223231711.157699-1-jbi.octave@gmail.com>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: boqun.feng@gmail.com
Cc: jbi.octave@gmail.com, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, "open list:NETROM NETWORK LAYER" <linux-hams@vger.kernel.org>, "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>

Sparse reports a warning at nr_node_start()
warning: context imbalance in nr_node_start() - wrong count at exit
The root cause is the missing annotation at nr_node_start()
Add the missing __acquires(&nr_node_list_lock) annotation

Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
---
 net/netrom/nr_route.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
index d41335bad1f8..fe278fc24153 100644
--- a/net/netrom/nr_route.c
+++ b/net/netrom/nr_route.c
@@ -838,6 +838,7 @@ int nr_route_frame(struct sk_buff *skb, ax25_cb *ax25)
 #ifdef CONFIG_PROC_FS
 
 static void *nr_node_start(struct seq_file *seq, loff_t *pos)
+	__acquires(&nr_node_list_lock)
 {
 	spin_lock_bh(&nr_node_list_lock);
 	return seq_hlist_start_head(&nr_node_list, *pos);
-- 
2.24.1


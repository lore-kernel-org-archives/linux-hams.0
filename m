From: Jules Irenge <jbi.octave@gmail.com>
Subject: [PATCH 08/30] netrom: Add missing annotation for nr_info_start()
Date: Sun, 23 Feb 2020 23:16:49 +0000
Message-ID: <20200223231711.157699-9-jbi.octave@gmail.com>
References: <0/30>
 <20200223231711.157699-1-jbi.octave@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pyULC8zRDdQ34YS1FTwq1d6c2T2bCIAgmeM9ejfxUJc=;
        b=dqmHA7Di0z6aZI3DD8tanMjnukyJD16fQbr/5grwhOZtuCqBEYND7nYu4+UmdUsJAx
         hSJdgFo0+xzAwCJLYtxmAl/EMFGp2kZig+OA9U/Rh3hrYBMavTHWGGNxzkFVVQ4cA6Be
         3fW61yP6HjwLvT5IzDfVnEjYvkDY9llWN7EtVmTZiRtocnsO14/e9qqrxnvps0XS3C5b
         Kxu5hhHUtoZSsGCUxrC+Anz2EOQ+QHv5tsyaELIcxjd+7Kdp5ofgnCIS1g2mY2dmgw0a
         vaHA4rZU/Im0r5Y8oMpnzyUgFvR6MZxrlHn4+bTYkx+DPFCQO/HEo1dCmtdMzzRlTBE5
         BedQ==
In-Reply-To: <20200223231711.157699-1-jbi.octave@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: boqun.feng@gmail.com
Cc: jbi.octave@gmail.com, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, "open list:NETROM NETWORK LAYER" <linux-hams@vger.kernel.org>, "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>

Sparse reports a warning at nr_info_start()
warning: context imbalance in nr_info_start() - wrong count at exit
The root cause is the missing annotation at nr_info_start()
Add the missing __acquires(&nr_list_lock)

Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
---
 net/netrom/af_netrom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/netrom/af_netrom.c b/net/netrom/af_netrom.c
index 58d5373c513c..8be06e61ff03 100644
--- a/net/netrom/af_netrom.c
+++ b/net/netrom/af_netrom.c
@@ -1230,6 +1230,7 @@ static int nr_ioctl(struct socket *sock, unsigned int cmd, unsigned long arg)
 #ifdef CONFIG_PROC_FS
 
 static void *nr_info_start(struct seq_file *seq, loff_t *pos)
+	__acquires(&nr_list_lock)
 {
 	spin_lock_bh(&nr_list_lock);
 	return seq_hlist_start_head(&nr_list, *pos);
-- 
2.24.1


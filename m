From: Jules Irenge <jbi.octave@gmail.com>
Subject: [PATCH 11/30] net: netrom: Add missing annotation for nr_node_stop()
Date: Sun, 23 Feb 2020 23:16:52 +0000
Message-ID: <20200223231711.157699-12-jbi.octave@gmail.com>
References: <0/30>
 <20200223231711.157699-1-jbi.octave@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mf++eeayLsVrcTVe6kbYrrnwfp2AEx+dRuICz5iDthY=;
        b=scWgaIOmdbwqRz8XkqHo3LJ08oQDqJ3XycbTlHUlm8XzHxJhpKqJfSdF0FCZSu+wt+
         EJQQ9eT8yxLTRUnQ82BPqcNqNkxMEAa3G67UWTrXc/6+ahq0CKSGNtKwuFHuZWUn9auX
         azqIYlkeRinAvqOhM7MQ+IOrq13QADRIHzvzY97SyucZERwLddvzN60FbpklkB0dSdLv
         ovhemh57TsX4vmc06v3yPGdNy7HrzZcO3tRLQc6sqAoPE9izZ+ZK72Vac+wW7Mlq1RBI
         pYZj6uRzVeaSd4q1+91EHj8tXrUGT5XJdA5Or2jCnSdrSDGCgoIzJeGlzyL9jiYy+K0Q
         6XzQ==
In-Reply-To: <20200223231711.157699-1-jbi.octave@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: boqun.feng@gmail.com
Cc: jbi.octave@gmail.com, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, "open list:NETROM NETWORK LAYER" <linux-hams@vger.kernel.org>, "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>

Sparse reports a warning at nr_node_stop()
warning: context imbalance in nr_node_stop() - wrong count at exit
The root cause is the missing annotation at nr_node_stop()
Add the missing __releases(&nr_node_list_lock) annotation

Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
---
 net/netrom/nr_route.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
index fe278fc24153..637a743c060d 100644
--- a/net/netrom/nr_route.c
+++ b/net/netrom/nr_route.c
@@ -850,6 +850,7 @@ static void *nr_node_next(struct seq_file *seq, void *v, loff_t *pos)
 }
 
 static void nr_node_stop(struct seq_file *seq, void *v)
+	__releases(&nr_node_list_lock)
 {
 	spin_unlock_bh(&nr_node_list_lock);
 }
-- 
2.24.1


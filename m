From: Jules Irenge <jbi.octave@gmail.com>
Subject: [PATCH 09/30] netrom: Add missing annotation for nr_info_stop()
Date: Sun, 23 Feb 2020 23:16:50 +0000
Message-ID: <20200223231711.157699-10-jbi.octave@gmail.com>
References: <0/30>
 <20200223231711.157699-1-jbi.octave@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=izHY1F8j+df2t9OwA9fWXu5eRF5eYehm5029wXHxxig=;
        b=LreYWf0DBloZvb0KlyMsbV8daJZDxN7BzedhxGS2M1vxfwFELagpDmYWt5Jqr4vQl1
         6H3cfxQLjYeYnA6UqxYh7KwwxqS8sxUbiYUhf5kVlbodHMYsT8a8UyxPEF2hCH9q8sds
         I2dvpeuvF5WRifLIwgumAkIalFx32wfYw1G7XsaYUK+ptM0NQXNJZTejWvLnSdqp5Ysh
         NREckGmZ9lf8PsCgrmYObPP1KZrSYO6uyXNc/e6ApYZqWLU309w8sEEA7wd+bn7MC4bB
         g10ZNjs0NPwIyCwAlJPcru/B/TRmEWKCIGv4p6bLccdyIILCnQeeiI7HmePQa6dIfS+a
         Oe0w==
In-Reply-To: <20200223231711.157699-1-jbi.octave@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: boqun.feng@gmail.com
Cc: jbi.octave@gmail.com, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, "open list:NETROM NETWORK LAYER" <linux-hams@vger.kernel.org>, "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>

Sparse reports a warning at nr_info_stop()
warning: context imbalance in nr_info_stop() - unexpected unlock
The root cause is the missing annotation at nr_info_stop()
Add the missing __releases(&nr_list_lock)

Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
---
 net/netrom/af_netrom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/netrom/af_netrom.c b/net/netrom/af_netrom.c
index 8be06e61ff03..7b1a74f74aad 100644
--- a/net/netrom/af_netrom.c
+++ b/net/netrom/af_netrom.c
@@ -1242,6 +1242,7 @@ static void *nr_info_next(struct seq_file *seq, void *v, loff_t *pos)
 }
 
 static void nr_info_stop(struct seq_file *seq, void *v)
+	__releases(&nr_list_lock)
 {
 	spin_unlock_bh(&nr_list_lock);
 }
-- 
2.24.1


From: Jules Irenge <jbi.octave@gmail.com>
Subject: [PATCH 13/30] net: netrom: Add missing annotation for nr_neigh_stop()
Date: Sun, 23 Feb 2020 23:16:54 +0000
Message-ID: <20200223231711.157699-14-jbi.octave@gmail.com>
References: <0/30>
 <20200223231711.157699-1-jbi.octave@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CGy+45WF1yFjQt9PrNIN82SV4WB+MIWNf+141Nv3d4s=;
        b=WBallZcCQBVP54ycId2IyweZf0OIRq3Vs6MGepXlXQ3yqR/UyfmPea+5VtxZ9agXi5
         +XUHhpN7tc8mo2FBAgr6+0YVx3JoUk2iTX14/CVqlnaVfE3woUEVW5XXdtjVNUOH8UUz
         Xevzd/wE3T3ViJfH+pF6iy3SxPdPFuRnJ1BxCh0U1b5nKQAVNj6+knS78LyqvADTjq3R
         LbNYfiQpXnOLxzHR15UPmEMr96M9P1rOWxHHqro+NbETgIc22ECDlmVGTwn9SNYvM9Un
         6EhPhsenbowTuX8NY4rh2oollFLlvIrdHo4bIE8nkyNKEMtIvCkbTHDuerZMDOB5D3Wi
         NE9g==
In-Reply-To: <20200223231711.157699-1-jbi.octave@gmail.com>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: boqun.feng@gmail.com
Cc: jbi.octave@gmail.com, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, "open list:NETROM NETWORK LAYER" <linux-hams@vger.kernel.org>, "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>

Sparse reports a warning at nr_neigh_stop()
warning: context imbalance in nr_neigh_stop() - unexpected unlock
The root cause is the missing annotation at nr_neigh_stop()
Add the missing __releases(&nr_neigh_list_lock) annotation

Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
---
 net/netrom/nr_route.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
index 33e7b91fc805..79f12d8c7b86 100644
--- a/net/netrom/nr_route.c
+++ b/net/netrom/nr_route.c
@@ -907,6 +907,7 @@ static void *nr_neigh_next(struct seq_file *seq, void *v, loff_t *pos)
 }
 
 static void nr_neigh_stop(struct seq_file *seq, void *v)
+	__releases(&nr_neigh_list_lock)
 {
 	spin_unlock_bh(&nr_neigh_list_lock);
 }
-- 
2.24.1


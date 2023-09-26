From: Chengfeng Ye <dg573847474@gmail.com>
Subject: [PATCH] ax25: Fix potential deadlock on &ax25_list_lock
Date: Tue, 26 Sep 2023 10:57:32 +0000
Message-ID: <20230926105732.10864-1-dg573847474@gmail.com>
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695725873; x=1696330673; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjoNcHNpSndbmROelnkAs9z2pMPBqViv/3mMpfzHcDI=;
        b=HhA/AH+HKx5baG3aDbhCPF8xm6+w77wf9fbNvj4m0MRV9mi+66Z0tvFR42HbgCPKH3
         /L6JvLfHz0uw+fgK44OZtTYpglKx5+Nbt8MytEn1ohDoGoaKHtoKo6QABbOWkuzqvZvL
         USqR17uSvn9rkTf2pprXF1Kr73izDP0E+JdC9dgcJo5WeYjx29M4ff5paoJsMdWUJ4IZ
         3gHY4ubtyBLdNrGkH/S/sQVhHgLgo1fD27F4y8YWv7zegjtjeqecQOdektgKzNfy+cK+
         ljFjtOPu6pQqC3tPy429zGv/e0jeMrbcg/92/htZvHk6mB270+2AstzClRangqQWwCau
         YQ8g==
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jreuter@yaina.de, ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Chengfeng Ye <dg573847474@gmail.com>

Timer interrupt ax25_ds_timeout() could introduce double locks on
&ax25_list_lock.

ax25_ioctl()
--> ax25_ctl_ioctl()
--> ax25_dama_off()
--> ax25_dev_dama_off()
--> ax25_check_dama_slave()
--> spin_lock(&ax25_list_lock)
<timer interrupt>
   --> ax25_ds_timeout()
   --> spin_lock(&ax25_list_lock)

This flaw was found by an experimental static analysis tool I am
developing for irq-related deadlock.

To prevent the potential deadlock, the patch use spin_lock_bh()
on &ax25_list_lock inside ax25_check_dama_slave().

Signed-off-by: Chengfeng Ye <dg573847474@gmail.com>
---
 net/ax25/ax25_ds_subr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ax25/ax25_ds_subr.c b/net/ax25/ax25_ds_subr.c
index f00e27df3c76..010b11303d32 100644
--- a/net/ax25/ax25_ds_subr.c
+++ b/net/ax25/ax25_ds_subr.c
@@ -156,13 +156,13 @@ static int ax25_check_dama_slave(ax25_dev *ax25_dev)
 	ax25_cb *ax25;
 	int res = 0;
 
-	spin_lock(&ax25_list_lock);
+	spin_lock_bh(&ax25_list_lock);
 	ax25_for_each(ax25, &ax25_list)
 		if (ax25->ax25_dev == ax25_dev && (ax25->condition & AX25_COND_DAMA_MODE) && ax25->state > AX25_STATE_1) {
 			res = 1;
 			break;
 		}
-	spin_unlock(&ax25_list_lock);
+	spin_unlock_bh(&ax25_list_lock);
 
 	return res;
 }
-- 
2.17.1


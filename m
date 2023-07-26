From: Joel Granados <j.granados@samsung.com>
Subject: [PATCH 09/14] ax.25: Update to register_net_sysctl_sz
Date: Wed, 26 Jul 2023 16:06:29 +0200
Message-ID: <20230726140635.2059334-10-j.granados@samsung.com>
References: <20230726140635.2059334-1-j.granados@samsung.com>
	<CGME20230726140703eucas1p2786577bcc67d5ae434671dac11870c60@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev+bounces-21409-gl-netdev-2=m.gmane-mx.org@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20230726140704euoutp016a3838b3abacf87deac9eb5cbbd5ab67~1cApBgTei3202732027euoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1690380424;
	bh=Nj7Ghn+kSOTETzoJsaSu9wi1agkqgAyigWTwaRVhj0w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HbnW/01MMcRCUhrsw3LYP6YjvDlXVP1MYApY5uoZdJmbfsrwN26OoN2OHYPgCiOBd
	 0YucJmFEG67aChRlzsG8aquq5auZfYYNphVIxMK/01giXLTjURJ+6zxGk4TpO7tvCt
	 6xZXQkBs3Kfs5pzrNM3yGS9pXvThzX9I2zh5pxks=
In-Reply-To: <20230726140635.2059334-1-j.granados@samsung.com>
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mcgrof@kernel.org, Joerg Reuter <jreuter@yaina.de>, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: willy@infradead.org, keescook@chromium.org, josh@joshtriplett.org, Joel Granados <j.granados@samsung.com>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

This is part of the effort to remove the sentinel (last empty) element
from the ctl_table arrays. We update to the new function and pass it the
array size.

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 net/ax25/sysctl_net_ax25.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/ax25/sysctl_net_ax25.c b/net/ax25/sysctl_net_ax25.c
index 2154d004d3dc..db66e11e7fe8 100644
--- a/net/ax25/sysctl_net_ax25.c
+++ b/net/ax25/sysctl_net_ax25.c
@@ -159,7 +159,8 @@ int ax25_register_dev_sysctl(ax25_dev *ax25_dev)
 		table[k].data = &ax25_dev->values[k];
 
 	snprintf(path, sizeof(path), "net/ax25/%s", ax25_dev->dev->name);
-	ax25_dev->sysheader = register_net_sysctl(&init_net, path, table);
+	ax25_dev->sysheader = register_net_sysctl_sz(&init_net, path, table,
+						     ARRAY_SIZE(ax25_param_table));
 	if (!ax25_dev->sysheader) {
 		kfree(table);
 		return -ENOMEM;
-- 
2.30.2



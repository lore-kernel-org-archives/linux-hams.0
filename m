From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.14 030/108] yam: fix possible memory leak in yam_init_driver
Date: Wed, 17 Jun 2020 21:24:42 -0400
Message-ID: <20200618012600.608744-30-sashal@kernel.org>
References: <20200618012600.608744-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592443600;
        bh=eLj+WZVX7RpEdUqqaCcfffgguX5NmI4xWHrpyxqcq7M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sI/F9QmNO2nV/RHuuAjyTawetsfqfWoSRMoN5m3tVFzxILj7FMAfK/bwyrqVzBFfN
         V5Cd5qCT7Pf4nZfdqy5f/loh2zEXM0YLAtx4epzx7fvFWPorLgb+EGRYEF9QnPhfxX
         3FKdkDr5fcNeH0F96ryYlwPwjy4k6x8C53ainFhY=
In-Reply-To: <20200618012600.608744-1-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Wang Hai <wanghai38@huawei.com>, Hulk Robot <hulkci@huawei.com>, "David S . Miller" <davem@davemloft.net>, Sasha Levin <sashal@kernel.org>, linux-hams@vger.kernel.org, netdev@vger.kernel.org

From: Wang Hai <wanghai38@huawei.com>

[ Upstream commit 98749b7188affbf2900c2aab704a8853901d1139 ]

If register_netdev(dev) fails, free_netdev(dev) needs
to be called, otherwise a memory leak will occur.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wang Hai <wanghai38@huawei.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/hamradio/yam.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/hamradio/yam.c b/drivers/net/hamradio/yam.c
index 16a6e1193912..b74c735a423d 100644
--- a/drivers/net/hamradio/yam.c
+++ b/drivers/net/hamradio/yam.c
@@ -1162,6 +1162,7 @@ static int __init yam_init_driver(void)
 		err = register_netdev(dev);
 		if (err) {
 			printk(KERN_WARNING "yam: cannot register net device %s\n", dev->name);
+			free_netdev(dev);
 			goto error;
 		}
 		yam_devs[i] = dev;
-- 
2.25.1


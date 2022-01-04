From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH] netrom: fix copying in user data in nr_setsockopt
Date: Tue,  4 Jan 2022 10:21:26 +0100
Message-ID: <20220104092126.172508-1-hch@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=/EGiF3exvN0CmzCzzHj2LPHV2IaoCNuj0zydEgdxAKE=; b=Pt15MAngYfgJqqKX4nxiaLuLfe
        QKoioIJ57OZVAbpbRmhHVEwZLKRRbl0YSRQenum4jJg9v9GFSZMkGq/Y4YCpF9vBsXDZ0+/rAxNro
        5rw7jTN1M/7Hhfhuj855xCp5nkhUJ23hBnVGWw7tQYhfXuVC/eIT6k4m+1QO7sz+P/N93rDXwoWDA
        CC6wtP9nX0oi61HzMBjubVvAv4r4Tmb2UDWSo+ATNn7CFB8nlJ32uw77vR2m76uKlQp3lA23nCwUV
        0uPnk61gPWH40ZIsSNp1TRj4vUgPDRvpKmyKuCMfDdZB/sz/MLIqVlot+gnCxVsD7qN5szaxGTD/5
        r3M9jzZQ==;
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ralf@linux-mips.org, davem@davemloft.net, kuba@kernel.org
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>

This code used to copy in an unsigned long worth of data before
the sockptr_t conversion, so restore that.

Fixes: a7b75c5a8c41 ("net: pass a sockptr_t into ->setsockopt")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 net/netrom/af_netrom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/netrom/af_netrom.c b/net/netrom/af_netrom.c
index 775064cdd0ee4..f1ba7dd3d253d 100644
--- a/net/netrom/af_netrom.c
+++ b/net/netrom/af_netrom.c
@@ -306,7 +306,7 @@ static int nr_setsockopt(struct socket *sock, int level, int optname,
 	if (optlen < sizeof(unsigned int))
 		return -EINVAL;
 
-	if (copy_from_sockptr(&opt, optval, sizeof(unsigned int)))
+	if (copy_from_sockptr(&opt, optval, sizeof(unsigned long)))
 		return -EFAULT;
 
 	switch (optname) {
-- 
2.30.2


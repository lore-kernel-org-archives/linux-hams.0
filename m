From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH][next] net: ax25: Fix fall-through warnings for Clang
Date: Fri, 5 Mar 2021 01:39:40 -0600
Message-ID: <20210305073940.GA122747@embeddedor>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614929984;
        bh=oHCWpgfauurcAwVAR+BNJveAfh0IeEwBSn1ChD9wm2k=;
        h=Date:From:To:Cc:Subject:From;
        b=dDbc4Tjw6qHfF32EiUMWKcdAqqpKKN9yxFwNhNTUffyNhLUFe4Fgtf5tF2d7Q/1dL
         oae9F5bD8Fxv/wQwkj/sSir0bzd355/D3d207SE6r6IqHQ7ZECIYiuTvlkvwKjCuKT
         o74uEiKZPHXueprc8MXVLx0yIuBPfxQjJL1pvC1DPSSuKP9C5CzYKHszNTb8X6yqAx
         jJC/RSzn3HQ3u8yxOqPEqeOfQh2ggqtTfaUhE0inkS2IE4cbxQYtCdKsRNWdCdelFQ
         ZOYBACSn6j4c4JorVvkPHUDqqRyX/iw6wRQJWlQvIU04RBXOMwL450/PO4qDh7CAy8
         +jtqUUh/1mSKA==
Content-Disposition: inline
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Reuter <jreuter@yaina.de>, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-hardening@vger.kernel.org

In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
by explicitly adding a break statement instead of letting the code fall
through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 net/ax25/af_ax25.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 269ee89d2c2b..2631efc6e359 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -850,6 +850,7 @@ static int ax25_create(struct net *net, struct socket *sock, int protocol,
 		case AX25_P_ROSE:
 			if (ax25_protocol_is_registered(AX25_P_ROSE))
 				return -ESOCKTNOSUPPORT;
+			break;
 #endif
 		default:
 			break;
-- 
2.27.0


From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH RESEND][next] net: ax25: Fix fall-through warnings for Clang
Date: Tue, 9 Mar 2021 23:39:41 -0600
Message-ID: <20210310053941.GA285638@embeddedor>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615354784;
        bh=OSa/NWiOxT9hUBy3oJFQuT8JLZChm6Td8cUlrIATMfc=;
        h=Date:From:To:Cc:Subject:From;
        b=n1bGpmAFfRDZ7DSpW+rsiDie5b+sW0p4yQan1cFEHhG9CCiMNyhmr66lnypjtBvS+
         WmvkmqB7X5gDmWGWQ3g/MKqjmACoWuCT4IV0/DdJO0GnBT/lBqVKmMWs6NiQ5SieIu
         s5Cl7d6IGx0gllc8fOviZoCyjFnzebPUODE2mngET2vMAs8Z4Surm+XdIE9DHIWAFZ
         aEqByUjJzIEGGh+IVPHgMzN3ulyxvPNedHExDNXo7IEpRo4OVOkBPHiO8hVIzop84P
         RYXJZxcLrkUjn6vNkUu5MSeCq1TAPEZd7tIUOdY0A+MRf7MKLjVij31GN5Ro1PsPom
         qnrQS5jzbSjfg==
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
 Changes in RESEND:
 - None. Resending now that net-next is open.

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


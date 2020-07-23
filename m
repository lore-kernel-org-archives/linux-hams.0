From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH net] AX.25: Prevent integer overflows in connect and sendmsg
Date: Thu, 23 Jul 2020 17:49:57 +0300
Message-ID: <20200723144957.GA293102@mwanda>
References: <20200722.175714.1713497446730685740.davem@davemloft.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=jykVeaaj1de3HdC9bQbpFC12yVlqXQBg90kokCdh8VM=;
 b=OFlBu+ZyA5PUaIeiOHa/OCO2esXfYFSgbTbN/iF6x97HEwumrDf9+IkqKtNqXm/GYFv5
 e8ugZFFlFLyXTwGS+s2/86DvWT+5baDMN0wmlm0U5VUKOUjH+oCXl5hLdJfOvIkPTWcf
 TSB1DboGbimlTcmNuiJNxfR+nuNVh35WU4yYWGfg+MYkHsz/O75pjf548HXsDnmaZhYr
 5m1QJa+aP7FOOaGmDIuisacRMNHHOfKAwxxMFVwAezt+53XE13aUNLg71ouzVwJriKJf
 xyAmSX7cj8uSsyrSO9/ZEtOViSQTmaYVay+M9qtnWjcSVdvwFEbepHt9sp0dmdfzC4xK ew== 
Content-Disposition: inline
In-Reply-To: <20200722.175714.1713497446730685740.davem@davemloft.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Reuter <jreuter@yaina.de>, Peilin Ye <yepeilin.cs@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, gregkh@linuxfoundation.org, syzkaller-bugs@googlegroups.com, linux-kernel-mentees@lists.linuxfoundation.org

We recently added some bounds checking in ax25_connect() and
ax25_sendmsg() and we so we removed the AX25_MAX_DIGIS checks because
they were no longer required.

Unfortunately, I believe they are required to prevent integer overflows
so I have added them back.

Fixes: 8885bb0621f0 ("AX.25: Prevent out-of-bounds read in ax25_sendmsg()")
Fixes: 2f2a7ffad5c6 ("AX.25: Fix out-of-bounds read in ax25_connect()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From code review.  Not tested.  It should be harmless though.

 net/ax25/af_ax25.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 0862fe49d434..dec3f35467c9 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -1188,6 +1188,7 @@ static int __must_check ax25_connect(struct socket *sock,
 	    fsa->fsa_ax25.sax25_ndigis != 0) {
 		/* Valid number of digipeaters ? */
 		if (fsa->fsa_ax25.sax25_ndigis < 1 ||
+		    fsa->fsa_ax25.sax25_ndigis > AX25_MAX_DIGIS ||
 		    addr_len < sizeof(struct sockaddr_ax25) +
 		    sizeof(ax25_address) * fsa->fsa_ax25.sax25_ndigis) {
 			err = -EINVAL;
@@ -1509,7 +1510,9 @@ static int ax25_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
 			struct full_sockaddr_ax25 *fsa = (struct full_sockaddr_ax25 *)usax;
 
 			/* Valid number of digipeaters ? */
-			if (usax->sax25_ndigis < 1 || addr_len < sizeof(struct sockaddr_ax25) +
+			if (usax->sax25_ndigis < 1 ||
+			    usax->sax25_ndigis > AX25_MAX_DIGIS ||
+			    addr_len < sizeof(struct sockaddr_ax25) +
 			    sizeof(ax25_address) * usax->sax25_ndigis) {
 				err = -EINVAL;
 				goto out;
-- 
2.27.0


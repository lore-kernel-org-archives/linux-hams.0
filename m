From: Vasiliy Kulikov <segooon@gmail.com>
Subject: [PATCH 1/3] net: ax25: fix information leak to userland
Date: Sun, 31 Oct 2010 20:10:22 +0300
Message-ID: <1288545022-16393-1-git-send-email-segooon@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer;
        bh=+u5HV3EvsZA/D5l2QbWdTE/S0vpF1hTfBbDMhlWTFvY=;
        b=D0HbQyu5UKveZR4IbV5Qqh0bHEuZ+2ZThtLiu/754ybVoLxupiSZA1dzG46IWC1xIT
         0an76yUyVdnMSY5KQdF9CeIEEj/GKNN2pg95jCDs+4r/274wXRiidwe2siHLM01lvIe4
         3th5y8OrLKbgTcChNLRoRLpNznK0SZg6S45iE=
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Joerg Reuter <jreuter@yaina.de>, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Sometimes ax25_getname() doesn't initialize all members of fsa_digipeater
field of fsa struct.  This structure is then copied to userland.  It leads to
leaking of contents of kernel stack memory.  We have to initialize them to zero.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 net/ax25/af_ax25.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 26eaebf..a324d83 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -1392,6 +1392,7 @@ static int ax25_getname(struct socket *sock, struct sockaddr *uaddr,
 	ax25_cb *ax25;
 	int err = 0;
 
+	memset(&fsa->fsa_digipeater, 0, sizeof(fsa->fsa_digipeater));
 	lock_sock(sk);
 	ax25 = ax25_sk(sk);
 
-- 
1.7.0.4


From: Vasiliy Kulikov <segooon@gmail.com>
Subject: [PATCH v2] net: ax25: fix information leak to userland
Date: Wed, 10 Nov 2010 21:12:36 +0300
Message-ID: <1289412757-11411-1-git-send-email-segooon@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer;
        bh=HzmHEJ3/OExyew19gvJbYgqguIO0pMEskwbAU+ys5Tw=;
        b=pXtrknj7R8bVFgZjxsWSKKKzZS/WkLUlEOx571nLqLHDwXIkUe+t/XsFwguN8NWYnl
         +1l5ZDfhibYND7axgjMRdA9RMeAhgnkT3m8xgzCH+avEXG2+UZBfIc6F48HtZy+msWnC
         hUrXMQxpqRGM/VJTWO7Yl/tkDrCeTAxgiyTcQ=
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Joerg Reuter <jreuter@yaina.de>, Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Sometimes ax25_getname() doesn't initialize all members of fsa_digipeater
field of fsa struct, also the struct has padding bytes between
sax25_call and sax25_ndigis fields.  This structure is then copied to
userland.  It leads to leaking of contents of kernel stack memory.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 net/ax25/af_ax25.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 26eaebf..bb86d29 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -1392,6 +1392,7 @@ static int ax25_getname(struct socket *sock, struct sockaddr *uaddr,
 	ax25_cb *ax25;
 	int err = 0;
 
+	memset(fsa, 0, sizeof(fsa));
 	lock_sock(sk);
 	ax25 = ax25_sk(sk);
 
@@ -1403,7 +1404,6 @@ static int ax25_getname(struct socket *sock, struct sockaddr *uaddr,
 
 		fsa->fsa_ax25.sax25_family = AF_AX25;
 		fsa->fsa_ax25.sax25_call   = ax25->dest_addr;
-		fsa->fsa_ax25.sax25_ndigis = 0;
 
 		if (ax25->digipeat != NULL) {
 			ndigi = ax25->digipeat->ndigi;
-- 
1.7.0.4


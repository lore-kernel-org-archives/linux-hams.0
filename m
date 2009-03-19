From: bernard pidoux <f6bvp@free.fr>
Subject: [PATCH 1/3] [AX25] SOCK_DEBUG message simplification
Date: Thu, 19 Mar 2009 19:15:03 +0100
Message-ID: <1237486504.30285.15.camel@f6bvp-11>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

This patch condenses two debug messages in one.

Signed-off-by: Bernard Pidoux <f6bvp@amsat.org>
---
 net/ax25/af_ax25.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 00d9e5e..532a031 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -1529,10 +1529,8 @@ static int ax25_sendmsg(struct kiocb *iocb, struct socket *sock,
 		dp = ax25->digipeat;
 	}
 
-	SOCK_DEBUG(sk, "AX.25: sendto: Addresses built.\n");
-
 	/* Build a packet */
-	SOCK_DEBUG(sk, "AX.25: sendto: building packet.\n");
+	SOCK_DEBUG(sk, "AX.25: sendto: Addresses built. Building packet.\n");
 
 	/* Assume the worst case */
 	size = len + ax25->ax25_dev->dev->hard_header_len;
-- 
1.6.0.6


From: Julia Lawall <julia@diku.dk>
Subject: [PATCH 13/16] net/ax25: Use available error codes
Date: Mon, 16 Aug 2010 18:28:19 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.1008161828030.19313@ask.diku.dk>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Reuter <jreuter@yaina.de>, Ralf Baechle <ralf@linux-mips.org>, "D, avid S. Miller" <davem@davemloft.net>, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.

From: Julia Lawall <julia@diku.dk>

Error codes are stored in err, but the return value is always 0.  Return
err instead.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
local idexpression x;
constant C;
@@

if (...) { ...
  x = -C
  ... when != x
(
  return <+...x...+>;
|
  return NULL;
|
  return;
|
* return ...;
)
}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
This changes the semantics of the function and has not been tested.

 net/ax25/af_ax25.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index cfdfd7e..26eaebf 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -1103,7 +1103,7 @@ done:
 out:
 	release_sock(sk);
 
-	return 0;
+	return err;
 }
 
 /*

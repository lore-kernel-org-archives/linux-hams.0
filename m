From: Xi Wang <xi.wang@gmail.com>
Subject: [PATCH 1/2] ax25: integer overflows in ax25_setsockopt()
Date: Tue, 22 Nov 2011 23:28:24 -0500
Message-ID: <7187C142-99F1-4A96-9BE6-650B10C9B22D@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=from:content-type:content-transfer-encoding:subject:date:message-id
         :cc:to:mime-version:x-mailer;
        bh=jRlcUqIHZGilQy0WW1L18e9DGi2kwoOopXAd6kQkML8=;
        b=RCqg8d3QopFeh4i0ZaFg0ovJwhuM6jQEyB47pVE8Lzoe9caMbwoYjZoIhq/hvlWz52
         PuRplTAci85GiMEibxh92nGXgwAp9vTqeRM2tQ0iPyYLjokhXDC3TBkHxEyPQjAc31sx
         KQeEKIZ1oi9Kqa5ro35P0RttuDZSUm4KUkhuk=
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: Joerg Reuter <jreuter@yaina.de>, Ralf Baechle <ralf@linux-mips.org>, David Miller <davem@davemloft.net>, linux-hams@vger.kernel.org, netdev@vger.kernel.org

ax25_setsockopt() misses several upper-bound checks on the
user-controlled value.


Reported-by: Fan Long <longfancn@gmail.com>
Signed-off-by: Xi Wang <xi.wang@gmail.com>
---
 net/ax25/af_ax25.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index e7c69f4..be6a8cf 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -571,7 +571,7 @@ static int ax25_setsockopt(struct socket *sock, int level, int optname,
 		break;
 
 	case AX25_T1:
-		if (opt < 1) {
+		if (opt < 1 || opt > 30) {
 			res = -EINVAL;
 			break;
 		}
@@ -580,7 +580,7 @@ static int ax25_setsockopt(struct socket *sock, int level, int optname,
 		break;
 
 	case AX25_T2:
-		if (opt < 1) {
+		if (opt < 1 || opt > 20) {
 			res = -EINVAL;
 			break;
 		}
@@ -596,7 +596,7 @@ static int ax25_setsockopt(struct socket *sock, int level, int optname,
 		break;
 
 	case AX25_T3:
-		if (opt < 1) {
+		if (opt < 0 || opt > 3600) {
 			res = -EINVAL;
 			break;
 		}
@@ -604,7 +604,7 @@ static int ax25_setsockopt(struct socket *sock, int level, int optname,
 		break;
 
 	case AX25_IDLE:
-		if (opt < 0) {
+		if (opt < 0 || opt > 65535) {
 			res = -EINVAL;
 			break;
 		}
-- 
1.7.5.4


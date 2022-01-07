From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH net] ax25: uninitialized variable in ax25_setsockopt()
Date: Fri, 7 Jan 2022 10:13:12 +0300
Message-ID: <20220107071312.GB22086@kili>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=y1/1IYj4VZR12tlsBXeTnPhSnhePaIuDaoRg3ngQA68=;
 b=kus4a5AVpCADMI1Zn/InG28DFHXxrHdiNLAfYytAM/N/Sajc7O9H4P87kJqFLSBIGnH+
 DBl3sYg0x0MRv/DnxiFINE6FxB5ZRuti/0ZZ2JKkD/WfCx43UcOiyZ0SYPuiTL1CdC4U
 l7r7Ycgb8HLgYewXbumSM3ox2InwiTievCQcFJuqOg8EC/x+tX4CbRedRNz/YScspdsa
 gIbnshSHTxb9hFIULasZah7/mjV9r+GcN/arTeFpy9C1gNgfnXFwTX7BHjCFRDVJAXxQ
 T2D8gX4AFWn6eJSHZXN81LaENgZqO9nlqC9rtlWHynGFFrtZJtrr7+8/pH6iqBV6vCEd iw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1/1IYj4VZR12tlsBXeTnPhSnhePaIuDaoRg3ngQA68=;
 b=UUYQ6po5DiLi9b/iylE8NOoqFoVSJYBFcLNA6djuBIP9DwatNSUtCG0pA47sl3F9SdoqdjWOXaLURwt95QlLNMYCBkORWM5ohKjm8PjXAiO+FET55f2La5kVZNfviCrvKlUZ5UxfzeXIMex23hZsANkhyzdau6qrOOTKJ73Yfhk=
Content-Disposition: inline
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Reuter <jreuter@yaina.de>, Christoph Hellwig <hch@lst.de>
Cc: Ralf Baechle <ralf@linux-mips.org>, Stefan Schmidt <stefan@datenfreihafen.org>, Matthieu Baerts <matthieu.baerts@tessares.net>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The "opt" variable is unsigned long but we only copy 4 bytes from
the user so the lower 4 bytes are uninitialized.

I have changed the integer overflow checks from ULONG to UINT as well.
This is a slight API change but I don't expect it to break anything.

Fixes: a7b75c5a8c41 ("net: pass a sockptr_t into ->setsockopt")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/ax25/af_ax25.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index cfca99e295b8..02f43f3e2c56 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -536,7 +536,7 @@ static int ax25_setsockopt(struct socket *sock, int level, int optname,
 	ax25_cb *ax25;
 	struct net_device *dev;
 	char devname[IFNAMSIZ];
-	unsigned long opt;
+	unsigned int opt;
 	int res = 0;
 
 	if (level != SOL_AX25)
@@ -568,7 +568,7 @@ static int ax25_setsockopt(struct socket *sock, int level, int optname,
 		break;
 
 	case AX25_T1:
-		if (opt < 1 || opt > ULONG_MAX / HZ) {
+		if (opt < 1 || opt > UINT_MAX / HZ) {
 			res = -EINVAL;
 			break;
 		}
@@ -577,7 +577,7 @@ static int ax25_setsockopt(struct socket *sock, int level, int optname,
 		break;
 
 	case AX25_T2:
-		if (opt < 1 || opt > ULONG_MAX / HZ) {
+		if (opt < 1 || opt > UINT_MAX / HZ) {
 			res = -EINVAL;
 			break;
 		}
@@ -593,7 +593,7 @@ static int ax25_setsockopt(struct socket *sock, int level, int optname,
 		break;
 
 	case AX25_T3:
-		if (opt < 1 || opt > ULONG_MAX / HZ) {
+		if (opt < 1 || opt > UINT_MAX / HZ) {
 			res = -EINVAL;
 			break;
 		}
@@ -601,7 +601,7 @@ static int ax25_setsockopt(struct socket *sock, int level, int optname,
 		break;
 
 	case AX25_IDLE:
-		if (opt > ULONG_MAX / (60 * HZ)) {
+		if (opt > UINT_MAX / (60 * HZ)) {
 			res = -EINVAL;
 			break;
 		}
-- 
2.20.1


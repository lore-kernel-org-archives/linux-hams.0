From: Roel Kluin <roel.kluin@gmail.com>
Subject: [PATCH] ax25: unsigned cannot be less than 0 in ax25_ctl_ioctl()
Date: Sat, 10 Oct 2009 23:22:19 +0200
Message-ID: <4AD0FB0B.8050609@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=aVukb9dOgB8NjBuc2FHJ0p1fa4d4HMZVRh3onYdpuWI=;
        b=UbX/i83ySFNoFKT6ZEKI11GKkbgNttTc9Tia45TCfQmpBSB5pDcHCarDvLHsYibmuC
         O9FrfFzqBDXmhz2Tuo7tlHgWLZyS+xlXoGZHfFXJ67flHP8XRyfM38wLRaK6W5kcoZbd
         w1ZbtuHsADGMj2Oe4OTGJ1dqhciEEKT31/+L0=
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joerg Reuter <jreuter@yaina.de>, linux-hams@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, netdev <netdev@vger.kernel.org>

struct ax25_ctl_struct member `arg' is unsigned and cannot be less
than 0.

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
If the ax25_ctl.arg limit is known to be lower, please suggest
other values.

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index f454607..0d99704 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -398,14 +398,14 @@ static int ax25_ctl_ioctl(const unsigned int cmd, void __user *arg)
 		break;
 
 	case AX25_T1:
-		if (ax25_ctl.arg < 1)
+		if (ax25_ctl.arg < 1 || ax25_ctl.arg * HZ > ULONG_MAX)
 			goto einval_put;
 		ax25->rtt = (ax25_ctl.arg * HZ) / 2;
 		ax25->t1  = ax25_ctl.arg * HZ;
 		break;
 
 	case AX25_T2:
-		if (ax25_ctl.arg < 1)
+		if (ax25_ctl.arg < 1 || ax25_ctl.arg * HZ > ULONG_MAX)
 			goto einval_put;
 		ax25->t2 = ax25_ctl.arg * HZ;
 		break;
@@ -418,13 +418,13 @@ static int ax25_ctl_ioctl(const unsigned int cmd, void __user *arg)
 		break;
 
 	case AX25_T3:
-		if (ax25_ctl.arg < 0)
+		if (ax25_ctl.arg * HZ > ULONG_MAX)
 			goto einval_put;
 		ax25->t3 = ax25_ctl.arg * HZ;
 		break;
 
 	case AX25_IDLE:
-		if (ax25_ctl.arg < 0)
+		if (ax25_ctl.arg * 60 * HZ > ULONG_MAX)
 			goto einval_put;
 		ax25->idle = ax25_ctl.arg * 60 * HZ;
 		break;

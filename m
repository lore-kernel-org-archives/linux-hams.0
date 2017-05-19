From: Firo Yang <firogm@gmail.com>
Subject: [PATCH v2] hdlcdrv: fix divide error bug if bitrate is 0
Date: Fri, 19 May 2017 21:21:46 +0800
Message-ID: <20170519132146.744-1-firogm@gmail.com>
References: <CAAeHK+ya2sAtLmJ0VyP6e=13OXUw98dp1WdRFU=o5+xGFGPtbQ@mail.gmail.com>
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=E7OW49peyeFGDpeJVDdgYY+twbKBwh745+BWFZbLuYM=;
        b=moZzLWdr+qxG+Dm3Kub7ROVtlhJc7kkD1gd7ZCsgcdLYOc9t/tgrfvYR7BA6ynzrZO
         nLXy2OToRrTWzT8Moa3nTgIdG+qU+tJbE7zSOX+5L0D2rumB3DStQ0Ted411WZB/hklt
         22B8VvDrO3Va+3hZqzSn5r1NA8zCllWYfqeMZTJzjlNk+4zq4qJj12w4ZhpceOGoyleo
         WQSrD2mYtNR+aKhe15KGlIUhwD3uhR0XBdtJIxpxgUuYwX1hy3bod8iR/TNoRq+UoJD1
         mBmGI+NJuPNJmCZHihA5iLxFHK+wXX9OfDqNXLCPLgMOtRxjM+q9VobtvmUSdGdbA6kz
         2c6w==
In-Reply-To: <CAAeHK+ya2sAtLmJ0VyP6e=13OXUw98dp1WdRFU=o5+xGFGPtbQ@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: t.sailer@alumni.ethz.ch, wharms@bfs.de, andreyknvl@google.com
Cc: linux-hams@vger.kernel.org, davem@davemloft.net, gregkh@linuxfoundation.org, netdev@vger.kernel.org, Firo Yang <firogm@gmail.com>

The divisor s->par.bitrate will always be 0 until initialized by
ndo_open() and hdlcdrv_open().

In order to fix this divide zero error, check whether the netdevice was
opened by ndo_open() before performing divide.And we also check the the
value of bitrate in case of bad setting of it.

Reported-by: Andrey Konovalov <andreyknvl@google.com>
Signed-off-by: Firo Yang <firogm@gmail.com>
---
v1->v2:
	Change Reported-by to Andrey Konovalov.
	Send it to original report thread.

v0->v1:
        Reviewed by walter harms <wharms@bfs.de>.
        Return ENODEV instead of EPERM if !netif_running(dev)
        Check if s->par.bitrate > 0.
 drivers/net/hamradio/hdlcdrv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/hamradio/hdlcdrv.c b/drivers/net/hamradio/hdlcdrv.c
index 8c3633c..b0f417f 100644
--- a/drivers/net/hamradio/hdlcdrv.c
+++ b/drivers/net/hamradio/hdlcdrv.c
@@ -576,6 +576,10 @@ static int hdlcdrv_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
 	case HDLCDRVCTL_CALIBRATE:
 		if(!capable(CAP_SYS_RAWIO))
 			return -EPERM;
+		if (!netif_running(dev))
+			return -ENODEV;
+		if (!(s->par.bitrate > 0))
+			return -EINVAL;
 		if (bi.data.calibrate > INT_MAX / s->par.bitrate)
 			return -EINVAL;
 		s->hdlctx.calibrate = bi.data.calibrate * s->par.bitrate / 16;
-- 
2.9.4


From: Firo Yang <firogm@gmail.com>
Subject: [PATCH] hdlcdrv: fix divide error bug if bitrate is 0
Date: Wed, 17 May 2017 20:35:49 +0800
Message-ID: <20170517123549.22659-1-firogm@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=VgztTuAo20x8cZJBR8zcCKIBWahYuY1VdVPVW4/9+NM=;
        b=GDBgFU8toy1oT6TD/2NgRLUJyHIVByID5KzFRUj21HlNuohbdxqSbKFmQGbZG0dUzi
         gjvooLLhWN7y6cYftjW/IfQRNfv0154Oj0W0OaMY251SWFg6WFYo6wl8VeAzxbYzfACW
         vsCNAAp5bcaFYau4182ahzSBd6O+l7u/gb9SXepeiCcHeLcZ4XqydEbaNamEUSQbHbCk
         lyozBby6fR79abXEMTtSEyHT6rqgq4XUbfVSNXlPq3pkf3f4xegzwiLQsysci2B7DFlC
         dEmf9tjFa8XuHyT7PhD0cxdbsJr1uFUckuiwizbPHfWcNP/wSz4UMypxslYl3gO27pfa
         E3Ag==
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: t.sailer@alumni.ethz.ch
Cc: davem@davemloft.net, gregkh@linuxfoundation.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, dvyukov@google.com, syzkaller@googlegroups.com, Firo Yang <firogm@gmail.com>

The divisor s->par.bitrate will always be 0 until initialized by
ndo_open() and hdlcdrv_open().

In order to fix this divide zero error, check whether the netdevice
was opened by ndo_open() before performing divide.

Reported-by: Dmitry Vyukov <dvyukov@google.com>
Signed-off-by: Firo Yang <firogm@gmail.com>
---
 drivers/net/hamradio/hdlcdrv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/hamradio/hdlcdrv.c b/drivers/net/hamradio/hdlcdrv.c
index 8c3633c..3c783fd 100644
--- a/drivers/net/hamradio/hdlcdrv.c
+++ b/drivers/net/hamradio/hdlcdrv.c
@@ -574,7 +574,7 @@ static int hdlcdrv_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
 		break;		
 
 	case HDLCDRVCTL_CALIBRATE:
-		if(!capable(CAP_SYS_RAWIO))
+		if (!capable(CAP_SYS_RAWIO) || !netif_running(dev))
 			return -EPERM;
 		if (bi.data.calibrate > INT_MAX / s->par.bitrate)
 			return -EINVAL;
-- 
2.9.4


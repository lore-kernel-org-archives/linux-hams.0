From: Wenwen Wang <wang6495@umn.edu>
Subject: [PATCH] yam: fix a missing-check bug
Date: Fri,  5 Oct 2018 10:59:36 -0500
Message-ID: <1538755176-22355-1-git-send-email-wang6495@umn.edu>
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=SZ+IKJaLqG32Em6f8LOmJdvlpvwhZjzlbCjbXT0/1l4=;
        b=ax75dUezaVrD/5PsNZEqWBrByIHEJOYvQopInjzeo8hLR8FcIrmt6A+HTyQaYwirvx
         AZDAqFZdF2ZOP+gJXT22bfy4tt6/LpTxawJp18QRko1pJ1YHUQ/Awo85oXzl3iHrxRPC
         +pRi+yBNQcReFVplveXZyZu7XUHuxFBS2LWHH9wEJN7U3aKq2jq/fdBI0FamefiDI2P6
         CQxpa6PfovqDVXXNxAN8TZaFzEGER2AVJqQVEu67ZeeBqh1o0pOeleMprxLQ9sNCnJ7/
         jbgF1dDs2C4THOQzGqv6/gGhm/iJfgJtc8bhGgYdcql/2RIaVdas38DEwluWw6Fa3inj
         Svjg==
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wenwen Wang <wang6495@umn.edu>
Cc: Kangjie Lu <kjlu@umn.edu>, Jean-Paul Roubelat <jpr@f6fbb.org>, "David S. Miller" <davem@davemloft.net>, "open list:YAM DRIVER FOR AX.25" <linux-hams@vger.kernel.org>, "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

In yam_ioctl(), the concrete ioctl command is firstly copied from the
user-space buffer 'ifr->ifr_data' to 'ioctl_cmd' and checked through the
following switch statement. If the command is not as expected, an error
code EINVAL is returned. In the following execution the buffer
'ifr->ifr_data' is copied again in the cases of the switch statement to
specific data structures according to what kind of ioctl command is
requested. However, after the second copy, no re-check is enforced on the
newly-copied command. Given that the buffer 'ifr->ifr_data' is in the user
space, a malicious user can race to change the command between the two
copies. This way, the attacker can inject inconsistent data and cause
undefined behavior.

This patch adds a re-check in each case of the switch statement if there is
a second copy in that case, to re-check whether the command obtained in the
second copy is the same as the one in the first copy. If not, an error code
EINVAL will be returned.

Signed-off-by: Wenwen Wang <wang6495@umn.edu>
---
 drivers/net/hamradio/yam.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/hamradio/yam.c b/drivers/net/hamradio/yam.c
index 16ec7af..ba9df43 100644
--- a/drivers/net/hamradio/yam.c
+++ b/drivers/net/hamradio/yam.c
@@ -966,6 +966,8 @@ static int yam_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
 				 sizeof(struct yamdrv_ioctl_mcs));
 		if (IS_ERR(ym))
 			return PTR_ERR(ym);
+		if (ym->cmd != SIOCYAMSMCS)
+			return -EINVAL;
 		if (ym->bitrate > YAM_MAXBITRATE) {
 			kfree(ym);
 			return -EINVAL;
@@ -981,6 +983,8 @@ static int yam_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
 		if (copy_from_user(&yi, ifr->ifr_data, sizeof(struct yamdrv_ioctl_cfg)))
 			 return -EFAULT;
 
+		if (yi.cmd != SIOCYAMSCFG)
+			return -EINVAL;
 		if ((yi.cfg.mask & YAM_IOBASE) && netif_running(dev))
 			return -EINVAL;		/* Cannot change this parameter when up */
 		if ((yi.cfg.mask & YAM_IRQ) && netif_running(dev))
-- 
2.7.4


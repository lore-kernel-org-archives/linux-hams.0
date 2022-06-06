From: Peter Lafreniere <pjlafren@mtu.edu>
Subject: [PATCH v2] ax25: use GFP_KERNEL in ax25_dev_device_up()
Date: Mon,  6 Jun 2022 13:40:12 -0400
Message-ID: <20220606174012.10262-1-pjlafren@mtu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mtu.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DtyyUcod6yH34VWx/gOEMfrYC3WTarSagW2RLB8d30k=;
        b=ib70jNGgk10w5WIrphmuEnyzmUa7hIwQAM5XAXTZVCho1WRGnDJ11O1LyhiurdX+h7
         uCY8liPjgJaoaH4ysb20pPxj1xJwYswpJjnGmufGsLTR+K2U5p1B6ztjcgt8R48OO0j3
         rNyk+pJy12WY+D6GVS7hghy6OAhO3i1ufPuLNsu4pIe3/2zOJvRs7aHBL1zakgNmY5Ki
         I/kGciTVE+d6UmXJjafUpt+hDcruUbgMQ+mJ9VmLWXx5y9GiX0FF62oz3qUwxX/wYd/G
         g5DcZzyOgDjtoq3YN+u64pyWxgfXrAVx7AutWhCIeS1HWoSHd/0aWUB4d70WHIrFpHFJ
         rrug==
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org
Cc: Peter Lafreniere <pjlafren@mtu.edu>, kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>

ax25_dev_device_up() is only called during device setup, which is
done in user context. In addition, ax25_dev_device_up()
unconditionally calls ax25_register_dev_sysctl(), which already
allocates with GFP_KERNEL.

Since it is allowed to sleep in this function, here we change
ax25_dev_device_up() to use GFP_KERNEL to reduce unnecessary
out-of-memory errors.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Peter Lafreniere <pjlafren@mtu.edu>
---
v1 -> v2:
 - Renamed patch from "ax25: use GFP_KERNEL over GFP_ATOMIC where possible"
   (Is that okay?)
 - Removed invalid changes to ax25_rt_add()

This isn't related to the patch itself, but thanks are owed to everyone
who had to handle my mistakes in submitting this patch the first time.
First the posting during the merge window, which I know better to do,
then me making the stupidest error of missing a lock directly next to the
relevant code.

I'm sorry for taking up your time, especially with these small and
insignificant patches. That said, I hope to be able to work with everyone
in this community in the future.

Thank you all for your time,
Peter L.

 net/ax25/ax25_dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
index 95a76d571c44..af5892ee0066 100644
--- a/net/ax25/ax25_dev.c
+++ b/net/ax25/ax25_dev.c
@@ -52,7 +52,7 @@ void ax25_dev_device_up(struct net_device *dev)
 {
 	ax25_dev *ax25_dev;
 
-	if ((ax25_dev = kzalloc(sizeof(*ax25_dev), GFP_ATOMIC)) == NULL) {
+	if ((ax25_dev = kzalloc(sizeof(*ax25_dev), GFP_KERNEL)) == NULL) {
 		printk(KERN_ERR "AX.25: ax25_dev_device_up - out of memory\n");
 		return;
 	}
@@ -60,7 +60,7 @@ void ax25_dev_device_up(struct net_device *dev)
 	refcount_set(&ax25_dev->refcount, 1);
 	dev->ax25_ptr     = ax25_dev;
 	ax25_dev->dev     = dev;
-	dev_hold_track(dev, &ax25_dev->dev_tracker, GFP_ATOMIC);
+	dev_hold_track(dev, &ax25_dev->dev_tracker, GFP_KERNEL);
 	ax25_dev->forward = NULL;
 	ax25_dev->device_up = true;
 
-- 
2.36.1


From: Peter Lafreniere <pjlafren@mtu.edu>
Subject: [PATCH v3] ax25: use GFP_KERNEL in ax25_dev_device_up()
Date: Wed, 15 Jun 2022 18:09:47 -0400
Message-ID: <20220615220947.3767-1-pjlafren@mtu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mtu.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jwBTpwlbhfCVNJ9PEhTg+PXi8hEimJhId2EarbK+x8M=;
        b=RC7EgbpsQneQqVwvJi/QqTjQr4qObak0dsB2To0WPpzlLCMQaGlmQ53dEQIOsFbhHO
         vHDHv+7zr0ygcDljkEYQ2Mlq8XbMvc9w9IXXXMj0nucQbsUQkt8WtN9VLugWGT9lVv4s
         ETYvwUodDLnvOxg0DFx1ZQ8UcqK4GuPf21pFOK7w8fJ4cXRmmQ8Y519k7oiUShi2QYcN
         iJNKSQDyyDrV5xZNc+0az+p0qtk1GjOy8CjDTBTOqRV11yqfw/PHnJ5tBI5t7GuEbIdd
         lMYd+iYTR5mdyRivwq7TTl/YO96TDwwtrJTCmBBAkiE7p9NkYn7nDD/yYmXUjGXE/UJ3
         ERNA==
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org
Cc: netdev@vger.kernel.org, Peter Lafreniere <pjlafren@mtu.edu>, kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>

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
v2 -> v3:
 - Rebased for clean application to net-next

v1 -> v2:
 - Renamed patch from "ax25: use GFP_KERNEL over GFP_ATOMIC where possible"
   (Is that okay?)
 - Removed invalid changes to ax25_rt_add()

 net/ax25/ax25_dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
index ab88b6ac5401..2093f94f6852 100644
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
-	netdev_hold(dev, &ax25_dev->dev_tracker, GFP_ATOMIC);
+	netdev_hold(dev, &ax25_dev->dev_tracker, GFP_KERNEL);
 	ax25_dev->forward = NULL;
 	ax25_dev->device_up = true;
 

base-commit: fbb89d02e33a8c8f522d75882f5f19c65b722b46
-- 
2.36.1


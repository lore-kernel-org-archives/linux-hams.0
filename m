From: Peter Lafreniere <pjlafren@mtu.edu>
Subject: [PATCH v4] ax25: use GFP_KERNEL in ax25_dev_device_up()
Date: Thu, 16 Jun 2022 11:23:33 -0400
Message-ID: <20220616152333.9812-1-pjlafren@mtu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mtu.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uf2srz+jvUuBHVzeHSAw8LdbJCHtKsvu2sAafAia9yQ=;
        b=edJu7G4J3ImG0fR3ZwDCYQThhDqRjboD6CjK6OqPgfSVQd+yOL+zAtuxSkiTs6cuQ+
         tNtcqOMnQiysxZInQmPdjPM+XE6NBULDg0NmXyScAvf2r0UYfOqpOPipMmTw4JE4DDas
         +V/8DBgKhk/JDTuOiJcSzBEM3K6uB368O2J+iDwRojbODRsaDBRcpDmo0NdwtNktb/s3
         jIaujkjpwjxTjafHiFg3eygK71rA1O26SumVkqjoUUkaJ8ajm14TRRBYd7wt+NYlw2b6
         94xZtn1R9tEfqxvDgdtdi9ZrUqFQRefROHsJu1pZpJWx1AxWE6Ul5YHGC+LMtVbHQ4MB
         k5UA==
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org
Cc: netdev@vger.kernel.org, ralf@linux-mips.org, Peter Lafreniere <pjlafren@mtu.edu>, kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>

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
v3 -> v4:
 - Cleaned up coding style
    - Thanks to to Paolo Abeni

v2 -> v3:
 - Rebased for clean application to net-next

v1 -> v2:
 - Renamed patch from "ax25: use GFP_KERNEL over GFP_ATOMIC where possible"
 - Removed invalid changes to ax25_rt_add()

 net/ax25/ax25_dev.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/net/ax25/ax25_dev.c b/net/ax25/ax25_dev.c
index ab88b6ac5401..c5462486dbca 100644
--- a/net/ax25/ax25_dev.c
+++ b/net/ax25/ax25_dev.c
@@ -52,7 +52,8 @@ void ax25_dev_device_up(struct net_device *dev)
 {
 	ax25_dev *ax25_dev;
 
-	if ((ax25_dev = kzalloc(sizeof(*ax25_dev), GFP_ATOMIC)) == NULL) {
+	ax25_dev = kzalloc(sizeof(*ax25_dev), GFP_KERNEL);
+	if (!ax25_dev) {
 		printk(KERN_ERR "AX.25: ax25_dev_device_up - out of memory\n");
 		return;
 	}
@@ -60,7 +61,7 @@ void ax25_dev_device_up(struct net_device *dev)
 	refcount_set(&ax25_dev->refcount, 1);
 	dev->ax25_ptr     = ax25_dev;
 	ax25_dev->dev     = dev;
-	netdev_hold(dev, &ax25_dev->dev_tracker, GFP_ATOMIC);
+	netdev_hold(dev, &ax25_dev->dev_tracker, GFP_KERNEL);
 	ax25_dev->forward = NULL;
 	ax25_dev->device_up = true;
 

base-commit: 5dcb50c009c9f8ec1cfca6a81a05c0060a5bbf68
-- 
2.36.1

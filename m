From: Amitoj Kaur Chawla <amitoj1606@gmail.com>
Subject: [PATCH] dmascc: Return correct error codes
Date: Wed, 10 Feb 2016 00:12:36 +0530
Message-ID: <20160209184236.GA23644@amitoj-Inspiron-3542>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:mime-version:content-type
         :content-disposition:user-agent;
        bh=v+ivaZQQGENDu1DDClXcamqUS/0jKNm4nbxg/bhbicM=;
        b=QrEfbbSXykndbfHaVcsCh+XVEgazK9teW1OPauD2IA19bbinPcI2MwEVGQMY5nAZ84
         /FFat2+8yiRrOj7C5J38ojXngTGItBUKQyFn5zpBiXZFE0lHy8oB0YnsojTRs7Hrrlkn
         7o4Tnbr7uabtBu2Hf6ZR+NArpDA8Cyum07NTgr3trvgEs9gEKkewq+qHywqC+YXA1ryP
         /s9LquYpOfAmhS9ZhdPVmzwR26c+fOOE532lgpbCyZF1Q67zydUyPhvmN//Oy1+OrsMD
         4s1auJAKCJARx4xSLyBbaZyRJJ2gnlm2g4jHsVYi9yeSyS4O+kjPv9rbprLgsygbbyk3
         0C2Q==
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jreuter@yaina.de, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: julia.lawall@lip6.fr

This change has been made with the goal that kernel functions should
return something more descriptive than -1 on failure.

A variable `err` has been introduced for storing error codes.

The return value of kzalloc on failure should return a -1 and not a
-ENOMEM. This was found using Coccinelle. A simplified version of
the semantic patch used is:

//<smpl>
@@
expression *e;
identifier l1;
@@

e = kzalloc(...);
if (e == NULL) {
...
goto l1;
}
l1:
...
return -1
+ -ENOMEM
;
//</smpl

Furthermore, set `err` to -ENOMEM on failure of alloc_netdev(), and to
-ENODEV on failure of register_netdev() and probe_irq_off().

The single call site only checks that the return value is not 0,
hence no change is required at the call site.

Signed-off-by: Amitoj Kaur Chawla <amitoj1606@gmail.com>
---
Not sure if -ENODEV is the right error code for probe_irq_off(irqs),
since there are few other examples with this function.

 drivers/net/hamradio/dmascc.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/hamradio/dmascc.c b/drivers/net/hamradio/dmascc.c
index c3d3777..e4137c1 100644
--- a/drivers/net/hamradio/dmascc.c
+++ b/drivers/net/hamradio/dmascc.c
@@ -451,7 +451,7 @@ static const struct net_device_ops scc_netdev_ops = {
 
 static int __init setup_adapter(int card_base, int type, int n)
 {
-	int i, irq, chip;
+	int i, irq, chip, err;
 	struct scc_info *info;
 	struct net_device *dev;
 	struct scc_priv *priv;
@@ -463,14 +463,17 @@ static int __init setup_adapter(int card_base, int type, int n)
 
 	/* Initialize what is necessary for write_scc and write_scc_data */
 	info = kzalloc(sizeof(struct scc_info), GFP_KERNEL | GFP_DMA);
-	if (!info)
+	if (!info) {
+		err = -ENOMEM;
 		goto out;
+	}
 
 	info->dev[0] = alloc_netdev(0, "", NET_NAME_UNKNOWN, dev_setup);
 	if (!info->dev[0]) {
 		printk(KERN_ERR "dmascc: "
 		       "could not allocate memory for %s at %#3x\n",
 		       hw[type].name, card_base);
+		err = -ENOMEM;
 		goto out1;
 	}
 
@@ -479,6 +482,7 @@ static int __init setup_adapter(int card_base, int type, int n)
 		printk(KERN_ERR "dmascc: "
 		       "could not allocate memory for %s at %#3x\n",
 		       hw[type].name, card_base);
+		err = -ENOMEM;
 		goto out2;
 	}
 	spin_lock_init(&info->register_lock);
@@ -549,6 +553,7 @@ static int __init setup_adapter(int card_base, int type, int n)
 		printk(KERN_ERR
 		       "dmascc: could not find irq of %s at %#3x (irq=%d)\n",
 		       hw[type].name, card_base, irq);
+		err = -ENODEV;
 		goto out3;
 	}
 
@@ -585,11 +590,13 @@ static int __init setup_adapter(int card_base, int type, int n)
 	if (register_netdev(info->dev[0])) {
 		printk(KERN_ERR "dmascc: could not register %s\n",
 		       info->dev[0]->name);
+		err = -ENODEV;
 		goto out3;
 	}
 	if (register_netdev(info->dev[1])) {
 		printk(KERN_ERR "dmascc: could not register %s\n",
 		       info->dev[1]->name);
+		err = -ENODEV;
 		goto out4;
 	}
 
@@ -612,7 +619,7 @@ static int __init setup_adapter(int card_base, int type, int n)
       out1:
 	kfree(info);
       out:
-	return -1;
+	return err;
 }
 
 
-- 
1.9.1


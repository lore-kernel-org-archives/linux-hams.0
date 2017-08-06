From: Bhumika Goyal <bhumirks@gmail.com>
Subject: [PATCH] hamradio: baycom: make hdlcdrv_ops const
Date: Sun,  6 Aug 2017 14:21:45 +0530
Message-ID: <1502009505-12973-1-git-send-email-bhumirks@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=j8wVXh6QjK6b/uTRyqu3Ar2I0wIDlemzMcE9iFf+WLM=;
        b=mBZERbopsqgGfclQoieGV5Mi5xeXb9P6pon8i9H9hTiS0k12YLpm6swfs/CUjUVC3J
         EGdJdfZ0XBegkiw1yNl0EZ935O1nQN8qYNchCBrislhy45/t/ynpBQU5Eb6ROekHck+Y
         WZBTGQKLocS/1/Kaa32YtOcEQQqDWrSYKxOlKfKZ+ONHmr/QvREh411s6q2m5ExRty+w
         +7TbyXqaLi+aFQtqt1UctVVl7BpXXRs5ZVUvfU36jE73QELzUNySp3/cuDReMqg0QPaZ
         j7KvcHA787T9HfHHYNFmLjGIJTy3tbnejwYSBRJkjE+BqMSNpImVLbQT9IG9eVJ+AfCr
         aunA==
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia.lawall@lip6.fr, t.sailer@alumni.ethz.ch, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bhumika Goyal <bhumirks@gmail.com>

Make hdlcdrv_ops structures const as they are only passed to
hdlcdrv_register function. The corresponding argument is of type const,
so make the structures const.

Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
---
 drivers/net/hamradio/baycom_par.c     | 2 +-
 drivers/net/hamradio/baycom_ser_fdx.c | 2 +-
 drivers/net/hamradio/baycom_ser_hdx.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/hamradio/baycom_par.c b/drivers/net/hamradio/baycom_par.c
index 92b13b3..e178383 100644
--- a/drivers/net/hamradio/baycom_par.c
+++ b/drivers/net/hamradio/baycom_par.c
@@ -386,7 +386,7 @@ static int baycom_ioctl(struct net_device *dev, struct ifreq *ifr,
 
 /* --------------------------------------------------------------------- */
 
-static struct hdlcdrv_ops par96_ops = {
+static const struct hdlcdrv_ops par96_ops = {
 	.drvname = bc_drvname,
 	.drvinfo = bc_drvinfo,
 	.open    = par96_open,
diff --git a/drivers/net/hamradio/baycom_ser_fdx.c b/drivers/net/hamradio/baycom_ser_fdx.c
index d9a646a..190f66c 100644
--- a/drivers/net/hamradio/baycom_ser_fdx.c
+++ b/drivers/net/hamradio/baycom_ser_fdx.c
@@ -508,7 +508,7 @@ static int baycom_ioctl(struct net_device *dev, struct ifreq *ifr,
 
 /* --------------------------------------------------------------------- */
 
-static struct hdlcdrv_ops ser12_ops = {
+static const struct hdlcdrv_ops ser12_ops = {
 	.drvname = bc_drvname,
 	.drvinfo = bc_drvinfo,
 	.open    = ser12_open,
diff --git a/drivers/net/hamradio/baycom_ser_hdx.c b/drivers/net/hamradio/baycom_ser_hdx.c
index f1c8a9f..3c823c6 100644
--- a/drivers/net/hamradio/baycom_ser_hdx.c
+++ b/drivers/net/hamradio/baycom_ser_hdx.c
@@ -542,7 +542,7 @@ static int baycom_ioctl(struct net_device *dev, struct ifreq *ifr,
 
 /* --------------------------------------------------------------------- */
 
-static struct hdlcdrv_ops ser12_ops = {
+static const struct hdlcdrv_ops ser12_ops = {
 	.drvname = bc_drvname,
 	.drvinfo = bc_drvinfo,
 	.open    = ser12_open,
-- 
1.9.1


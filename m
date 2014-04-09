From: Paul McQuade <paulmcquad@gmail.com>
Subject: [PATCH 2/2] drivers:baycom_epp.c tabs
Date: Thu, 10 Apr 2014 00:25:21 +0100
Message-ID: <1397085921-13803-2-git-send-email-paulmcquad@gmail.com>
References: <1397085921-13803-1-git-send-email-paulmcquad@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yCGdmbFoMo4lKa5p3XqK9nguzpBdu+Y2yZrIaAIZFEE=;
        b=WNIbUm4a9Ov1GjnYwImO9JBceCvYMsA65SiMOQRoqK9zgGqbcLiiVv0gECfspBUPC0
         k8DNjrq3TR0+JYRLXeTmiDNHGdHBMNG9qMuuDYg5MLYG9aumBGR+FugPKOwyiOxxV7x+
         qAKywvc8SiGTzxUv95ZgYt4u2moaXo5K/l3BkoxDDKwdOdVC7tBUV0AKnFWcijnZzboR
         7JynDy89IAUaePlVlj6WTBqnVDjjujxkoLxaLSa1XSbl6G9ZDft1l/HDJSQRvMc3tdnT
         fGHmO0iznp2WbNfAYxcklHA9KmuAMv2O+mbfT5qeZKpukWr+y8p3HZ8nBSQC7EmeV9wh
         zbGQ==
In-Reply-To: <1397085921-13803-1-git-send-email-paulmcquad@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: t.sailer@alumni.ethz.ch
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

ERROR: code indent should use tabs where possible
ERROR: space required after that ';' (ctx:VxV)

Signed-off-by: Paul McQuade <paulmcquad@gmail.com>
---
 drivers/net/hamradio/baycom_epp.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/hamradio/baycom_epp.c b/drivers/net/hamradio/baycom_epp.c
index 3daafec..5012ab5 100644
--- a/drivers/net/hamradio/baycom_epp.c
+++ b/drivers/net/hamradio/baycom_epp.c
@@ -54,7 +54,7 @@
 #include <linux/baycom.h>
 #include <linux/jiffies.h>
 #include <linux/random.h>
-#include <net/ax25.h> 
+#include <net/ax25.h>
 #include <linux/uaccess.h>
 
 /* --------------------------------------------------------------------- */
@@ -64,7 +64,7 @@
 
 /* --------------------------------------------------------------------- */
 
-static const char paranoia_str[] = KERN_ERR 
+static const char paranoia_str[] = KERN_ERR
 	"baycom_epp: bad magic number for hdlcdrv_state struct in routine %s\n";
 
 static const char bc_drvname[] = "baycom_epp";
@@ -169,7 +169,7 @@ static struct net_device *baycom_device[NR_PORTS];
 struct baycom_state {
 	int magic;
 
-        struct pardevice *pdev;
+	struct pardevice *pdev;
 	struct net_device *dev;
 	unsigned int work_running;
 	struct delayed_work run_work;
@@ -185,18 +185,18 @@ struct baycom_state {
 		unsigned int loopback;
 	} cfg;
 
-        struct hdlcdrv_channel_params ch_params;
+	struct hdlcdrv_channel_params ch_params;
 
-        struct {
+	struct {
 		unsigned int bitbuf, bitstream, numbits, state;
 		unsigned char *bufptr;
 		int bufcnt;
 		unsigned char buf[TXBUFFER_SIZE];
-        } hdlcrx;
+	} hdlcrx;
 
-        struct {
+	struct {
 		int calibrate;
-                int slotcnt;
+		int slotcnt;
 		int flags;
 		enum { tx_idle = 0, tx_keyup, tx_data, tx_tail } state;
 		unsigned char *bufptr;
@@ -246,9 +246,9 @@ struct baycom_state {
 #if 0
 static inline void append_crc_ccitt(unsigned char *buffer, int len)
 {
- 	unsigned int crc = 0xffff;
+	unsigned int crc = 0xffff;
 
-	for (;len>0;len--)
+	for ( ; len > 0; len--)
 		crc = (crc >> 8) ^ crc_ccitt_table[(crc ^ *buffer++) & 0xff];
 	crc ^= 0xffff;
 	*buffer++ = crc;
-- 
1.8.3.2

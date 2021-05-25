From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] net/hamradio/6pack: Fix inconsistent indenting
Date: Tue, 25 May 2021 18:55:45 +0800
Message-ID: <1621940145-70195-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Return-path: <linux-hams-owner@vger.kernel.org>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ajk@comnets.uni-bremen.de
Cc: davem@davemloft.net, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Eliminate the follow smatch warning:

drivers/net/hamradio/6pack.c:728 sixpack_ioctl() warn: inconsistent
indenting.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/net/hamradio/6pack.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
index 686c38c..fcf3af7 100644
--- a/drivers/net/hamradio/6pack.c
+++ b/drivers/net/hamradio/6pack.c
@@ -716,11 +716,11 @@ static int sixpack_ioctl(struct tty_struct *tty, struct file *file,
 		err = 0;
 		break;
 
-	 case SIOCSIFHWADDR: {
-		char addr[AX25_ADDR_LEN];
+	case SIOCSIFHWADDR: {
+			char addr[AX25_ADDR_LEN];
 
-		if (copy_from_user(&addr,
-		                   (void __user *) arg, AX25_ADDR_LEN)) {
+			if (copy_from_user(&addr,
+					   (void __user *)arg, AX25_ADDR_LEN)) {
 				err = -EFAULT;
 				break;
 			}
@@ -728,11 +728,9 @@ static int sixpack_ioctl(struct tty_struct *tty, struct file *file,
 			netif_tx_lock_bh(dev);
 			memcpy(dev->dev_addr, &addr, AX25_ADDR_LEN);
 			netif_tx_unlock_bh(dev);
-
 			err = 0;
 			break;
 		}
-
 	default:
 		err = tty_mode_ioctl(tty, file, cmd, arg);
 	}
-- 
1.8.3.1


From: Xu Jia <xujia39@huawei.com>
Subject: [PATCH] hamradio: 6pack: fix array-index-out-of-bounds in decode_std_command()
Date: Mon, 13 Jun 2022 17:25:37 +0800
Message-ID: <1655112337-48005-1-git-send-email-xujia39@huawei.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: ajk@comnets.uni-bremen.de, davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, xujia39@huawei.com

Hulk Robot reports incorrect sp->rx_count_cooked value in decode_std_command().
This should be caused by the subtracting from sp->rx_count_cooked before.
It seems that sp->rx_count_cooked value is changed to 0, which bypassed the
previous judgment.
sp->rx_count_cooked is a shared variable but is not protected by a lock.
The same applies to sp->rx_count. This patch adds a lock to fix the bug.

The fail log is shown below:
=======================================================================
UBSAN: array-index-out-of-bounds in drivers/net/hamradio/6pack.c:925:31
index 400 is out of range for type 'unsigned char [400]'
CPU: 3 PID: 7433 Comm: kworker/u10:1 Not tainted 5.18.0-rc5-00163-g4b97bac0756a #2
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014
Workqueue: events_unbound flush_to_ldisc
Call Trace:
 <TASK>
 dump_stack_lvl+0xcd/0x134
 ubsan_epilogue+0xb/0x50
 __ubsan_handle_out_of_bounds.cold+0x62/0x6c
 sixpack_receive_buf+0xfda/0x1330
 tty_ldisc_receive_buf+0x13e/0x180
 tty_port_default_receive_buf+0x6d/0xa0
 flush_to_ldisc+0x213/0x3f0
 process_one_work+0x98f/0x1620
 worker_thread+0x665/0x1080
 kthread+0x2e9/0x3a0
 ret_from_fork+0x1f/0x30
 ...

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Xu Jia <xujia39@huawei.com>
---
 drivers/net/hamradio/6pack.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
index 45c3c4a..194f22f 100644
--- a/drivers/net/hamradio/6pack.c
+++ b/drivers/net/hamradio/6pack.c
@@ -100,6 +100,8 @@ struct sixpack {
 	unsigned int		rx_count;
 	unsigned int		rx_count_cooked;
 
+	spinlock_t		rxlock;
+
 	int			mtu;		/* Our mtu (to spot changes!) */
 	int			buffsize;       /* Max buffers sizes */
 
@@ -565,6 +567,7 @@ static int sixpack_open(struct tty_struct *tty)
 	sp->dev = dev;
 
 	spin_lock_init(&sp->lock);
+	spin_lock_init(&sp->rxlock);
 	refcount_set(&sp->refcnt, 1);
 	init_completion(&sp->dead);
 
@@ -913,6 +916,7 @@ static void decode_std_command(struct sixpack *sp, unsigned char cmd)
 			sp->led_state = 0x60;
 			/* fill trailing bytes with zeroes */
 			sp->tty->ops->write(sp->tty, &sp->led_state, 1);
+			spin_lock(&sp->rxlock);
 			rest = sp->rx_count;
 			if (rest != 0)
 				 for (i = rest; i <= 3; i++)
@@ -930,6 +934,7 @@ static void decode_std_command(struct sixpack *sp, unsigned char cmd)
 				sp_bump(sp, 0);
 			}
 			sp->rx_count_cooked = 0;
+			spin_unlock(&sp->rxlock);
 		}
 		break;
 	case SIXP_TX_URUN: printk(KERN_DEBUG "6pack: TX underrun\n");
-- 
1.8.3.1


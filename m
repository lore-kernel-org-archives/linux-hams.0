From: Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH] drivers: hamradio: 6pack: fix UAF bug caused by mod_timer()
Date: Wed, 16 Feb 2022 10:35:49 +0800
Message-ID: <20220216023549.50223-1-duoming@zju.edu.cn>
Return-path: <linux-hams-owner@vger.kernel.org>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: ajk@comnets.uni-bremen.de, davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Duoming Zhou <duoming@zju.edu.cn>

Although del_timer_sync() in sixpack_close() waits for the timer handler
to finish its execution and then releases the timer, the mod_timer()
in sp_xmit_on_air() could be called by userspace syscall such as
ax25_sendmsg(), ax25_connect() and ax25_ioctl() and wakes up the timer
again. If the timer uses sp_xmit_on_air() to write data on pty work queue
that already released by unregister_netdev(), the UAF bug will happen.

One of the possible race conditions is shown below:

      (USE)                     |      (FREE)
ax25_sendmsg()                  |
  ax25_queue_xmit()             |
    ...                         |
    sp_encaps()                 |  sixpack_close()
      sp_xmit_on_air()          |    del_timer_sync(&sp->tx_t)
        mod_timer(&sp->tx_t,..) |    ...
        (wait a while)          |    unregister_netdev(sp->dev)) //FREE
      sp_xmit_on_air()          |    ...
        pty_write()             |
          queue_work_on() //USE |

The corresponding fail log is shown below:
===============================================================
BUG: KASAN: use-after-free in __run_timers.part.0+0x170/0x470
Write of size 8 at addr ffff88800a652ab8 by task swapper/2/0
...
Call Trace:
  ...
  queue_work_on+0x3f/0x50
  pty_write+0xcd/0xe0pty_write+0xcd/0xe0
  sp_xmit_on_air+0xb2/0x1f0
  call_timer_fn+0x28/0x150
  __run_timers.part.0+0x3c2/0x470
  run_timer_softirq+0x3b/0x80
  __do_softirq+0xf1/0x380
  ...

This patch add condition check in sp_xmit_on_air(). If the
registration status of net_device is not equal to NETREG_REGISTERED,
the sp_xmit_on_air() will not write data to pty work queue and
return instead.

Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
 drivers/net/hamradio/6pack.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
index b1fc153125d..7ee25e06915 100644
--- a/drivers/net/hamradio/6pack.c
+++ b/drivers/net/hamradio/6pack.c
@@ -141,7 +141,8 @@ static void sp_xmit_on_air(struct timer_list *t)
 	struct sixpack *sp = from_timer(sp, t, tx_t);
 	int actual, when = sp->slottime;
 	static unsigned char random;
-
+	if (sp->dev->reg_state !=  NETREG_REGISTERED)
+		return;
 	random = random * 17 + 41;
 
 	if (((sp->status1 & SIXP_DCD_MASK) == 0) && (random < sp->persistence)) {
-- 
2.17.1


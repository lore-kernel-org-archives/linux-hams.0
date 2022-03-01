From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.16 13/28] drivers: hamradio: 6pack: fix UAF bug caused by mod_timer()
Date: Tue,  1 Mar 2022 15:13:18 -0500
Message-ID: <20220301201344.18191-13-sashal@kernel.org>
References: <20220301201344.18191-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646165691;
        bh=mP0xiCBVTZASpvu8NNbLJL21KC5qPlxAQ6iuEZZckyA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lmn6PpA2vAMF0xESuvaq6m5wkC7LpxWx6MgC0l7GQCTlShYvqg5rjlA6hvczSQcCv
         HAdQKVAta5kcQfL50aafT50jpDLHauhdb2/g4GQFv6mBbqPDxBNmmD7M3k6+kNS1es
         Mv2OfuXDXPrQ4hJNJlDle7Dc4vjwuuCkDKbTBEee57Z8x10/RWLA8FBlDfxQc9xgn/
         MhD0gyqTnPD/95+8Yw+KiMgKOPGzpib+Uth/tJYAwh+aBSvdzzImEbHqehHh5olej2
         B00UKuRvjyfuBpTQfODfHcV7tj1SidPtLKjvEVTElhDP4YAHM4AUGj/4FUOB1C9C3Z
         9UVm8KtLamVqA==
In-Reply-To: <20220301201344.18191-1-sashal@kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Duoming Zhou <duoming@zju.edu.cn>, Lin Ma <linma@zju.edu.cn>, "David S . Miller" <davem@davemloft.net>, Sasha Levin <sashal@kernel.org>, ajk@comnets.uni-bremen.de, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org

From: Duoming Zhou <duoming@zju.edu.cn>

[ Upstream commit efe4186e6a1b54bf38b9e05450d43b0da1fd7739 ]

When a 6pack device is detaching, the sixpack_close() will act to cleanup
necessary resources. Although del_timer_sync() in sixpack_close()
won't return if there is an active timer, one could use mod_timer() in
sp_xmit_on_air() to wake up timer again by calling userspace syscall such
as ax25_sendmsg(), ax25_connect() and ax25_ioctl().

This unexpected waked handler, sp_xmit_on_air(), realizes nothing about
the undergoing cleanup and may still call pty_write() to use driver layer
resources that have already been released.

One of the possible race conditions is shown below:

      (USE)                      |      (FREE)
ax25_sendmsg()                   |
 ax25_queue_xmit()               |
  ...                            |
  sp_xmit()                      |
   sp_encaps()                   | sixpack_close()
    sp_xmit_on_air()             |  del_timer_sync(&sp->tx_t)
     mod_timer(&sp->tx_t,...)    |  ...
                                 |  unregister_netdev()
                                 |  ...
     (wait a while)              | tty_release()
                                 |  tty_release_struct()
                                 |   release_tty()
    sp_xmit_on_air()             |    tty_kref_put(tty_struct) //FREE
     pty_write(tty_struct) //USE |    ...

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

This patch reorders the del_timer_sync() after the unregister_netdev()
to avoid UAF bugs. Because the unregister_netdev() is well synchronized,
it flushs out any pending queues, waits the refcount of net_device
decreases to zero and removes net_device from kernel. There is not any
running routines after executing unregister_netdev(). Therefore, we could
not arouse timer from userspace again.

Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
Reviewed-by: Lin Ma <linma@zju.edu.cn>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/hamradio/6pack.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
index 8a19a06b505d1..ff2bb3d80fac8 100644
--- a/drivers/net/hamradio/6pack.c
+++ b/drivers/net/hamradio/6pack.c
@@ -668,11 +668,11 @@ static void sixpack_close(struct tty_struct *tty)
 	 */
 	netif_stop_queue(sp->dev);
 
+	unregister_netdev(sp->dev);
+
 	del_timer_sync(&sp->tx_t);
 	del_timer_sync(&sp->resync_t);
 
-	unregister_netdev(sp->dev);
-
 	/* Free all 6pack frame buffers after unreg. */
 	kfree(sp->rbuff);
 	kfree(sp->xbuff);
-- 
2.34.1


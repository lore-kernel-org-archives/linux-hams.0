From: Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH net v2] net: rose: fix UAF bug caused by rose_t0timer_expiry
Date: Tue,  5 Jul 2022 20:56:10 +0800
Message-ID: <20220705125610.77971-1-duoming@zju.edu.cn>
Return-path: <netdev-owner@vger.kernel.org>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, Duoming Zhou <duoming@zju.edu.cn>

There are UAF bugs caused by rose_t0timer_expiry(). The
root cause is that del_timer() could not stop the timer
handler that is running and there is no synchronization.
One of the race conditions is shown below:

    (thread 1)             |        (thread 2)
                           | rose_device_event
                           |   rose_rt_device_down
                           |     rose_remove_neigh
rose_t0timer_expiry        |       rose_stop_t0timer(rose_neigh)
  ...                      |         del_timer(&neigh->t0timer)
                           |         kfree(rose_neigh) //[1]FREE
  neigh->dce_mode //[2]USE |

The rose_neigh is deallocated in position [1] and use in
position [2].

The crash trace triggered by POC is like below:

BUG: KASAN: use-after-free in expire_timers+0x144/0x320
Write of size 8 at addr ffff888009b19658 by task swapper/0/0
...
Call Trace:
 <IRQ>
 dump_stack_lvl+0xbf/0xee
 print_address_description+0x7b/0x440
 print_report+0x101/0x230
 ? expire_timers+0x144/0x320
 kasan_report+0xed/0x120
 ? expire_timers+0x144/0x320
 expire_timers+0x144/0x320
 __run_timers+0x3ff/0x4d0
 run_timer_softirq+0x41/0x80
 __do_softirq+0x233/0x544
 ...

This patch changes rose_stop_ftimer() and rose_stop_t0timer()
in rose_remove_neigh() to del_timer_sync() in order that the
timer handler could be finished before the resources such as
rose_neigh and so on are deallocated. As a result, the UAF
bugs could be mitigated.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
Changes in v2:
  - v2: Use del_timer_sync to stop timer in rose_remove_neigh.

 net/rose/rose_route.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
index fee6409c2bb..eb0b8197ac8 100644
--- a/net/rose/rose_route.c
+++ b/net/rose/rose_route.c
@@ -227,8 +227,8 @@ static void rose_remove_neigh(struct rose_neigh *rose_neigh)
 {
 	struct rose_neigh *s;
 
-	rose_stop_ftimer(rose_neigh);
-	rose_stop_t0timer(rose_neigh);
+	del_timer_sync(&rose_neigh->ftimer);
+	del_timer_sync(&rose_neigh->t0timer);
 
 	skb_queue_purge(&rose_neigh->queue);
 
-- 
2.17.1


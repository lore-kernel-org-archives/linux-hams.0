From: Li RongQing <lirongqing@baidu.com>
Subject: [PATCH] net: ax25: replace bh_lock_sock with lock_sock_fast in ax25_rt_autobind
Date: Thu,  4 Apr 2019 08:51:03 +0800
Message-ID: <1554339063-28712-1-git-send-email-lirongqing@baidu.com>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ralf@linux-mips.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org

ax25_rt_autobind is always called in user context, so lock_sock_fast
should be used, and bh_lock_sock should only be used in BH context
this replacement fixes a possible deadlock

inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
ksoftirqd/1/16 [HC0[0]:SC1[1]:HE1:SE0] takes:
000000008282a7d4 (slock-AF_AX25){+.?.}, at: spin_lock
include/linux/spinlock.h:329 [inline]
000000008282a7d4 (slock-AF_AX25){+.?.}, at:
ax25_std_heartbeat_expiry+0x5d/0x3e0 net/ax25/ax25_std_timer.c:37 {SOFTIRQ-ON-W} state was registered at:
   lock_acquire+0x16f/0x3f0 kernel/locking/lockdep.c:4211
   __raw_spin_lock include/linux/spinlock_api_smp.h:142 [inline]
   _raw_spin_lock+0x2f/0x40 kernel/locking/spinlock.c:144
   spin_lock include/linux/spinlock.h:329 [inline]
   ax25_rt_autobind+0x3ca/0x720 net/ax25/ax25_route.c:432
   ax25_connect.cold+0x30/0xa4 net/ax25/af_ax25.c:1224
   __sys_connect+0x266/0x330 net/socket.c:1808
   __do_sys_connect net/socket.c:1819 [inline]
   __se_sys_connect net/socket.c:1816 [inline]
   __x64_sys_connect+0x73/0xb0 net/socket.c:1816
   do_syscall_64+0x103/0x610 arch/x86/entry/common.c:290
   entry_SYSCALL_64_after_hwframe+0x49/0xbe
irq event stamp: 296868110
hardirqs last  enabled at (296868110): [<ffffffff870f1ad8>] __raw_spin_unlock_irq include/linux/spinlock_api_smp.h:168 [inline] hardirqs last  enabled at (296868110): [<ffffffff870f1ad8>]
_raw_spin_unlock_irq+0x28/0x90 kernel/locking/spinlock.c:192 hardirqs last disabled at (296868109): [<ffffffff870f1c4a>] __raw_spin_lock_irq include/linux/spinlock_api_smp.h:126 [inline] hardirqs last disabled at (296868109): [<ffffffff870f1c4a>]
_raw_spin_lock_irq+0x3a/0x80 kernel/locking/spinlock.c:160 softirqs last  enabled at (296868102): [<ffffffff87400662>] __do_softirq+0x662/0x95a kernel/softirq.c:320 softirqs last disabled at (296868107): [<ffffffff8144c8ae>] run_ksoftirqd
kernel/softirq.c:655 [inline]
softirqs last disabled at (296868107): [<ffffffff8144c8ae>]
run_ksoftirqd+0x8e/0x110 kernel/softirq.c:647

other info that might help us debug this:
  Possible unsafe locking scenario:

        CPU0
        ----
   lock(slock-AF_AX25);
   <Interrupt>
     lock(slock-AF_AX25);

  *** DEADLOCK ***

1 lock held by ksoftirqd/1/16:
  #0: 00000000654921c3 ((&ax25->timer)){+.-.}, at: lockdep_copy_map
include/linux/lockdep.h:170 [inline]
  #0: 00000000654921c3 ((&ax25->timer)){+.-.}, at: call_timer_fn+0xda/0x720
kernel/time/timer.c:1315

stack backtrace:
CPU: 1 PID: 16 Comm: ksoftirqd/1 Not tainted 5.0.0+ #134 Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011 Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x172/0x1f0 lib/dump_stack.c:113
  print_usage_bug.cold+0x330/0x42a kernel/locking/lockdep.c:2839
  valid_state kernel/locking/lockdep.c:2852 [inline]
  mark_lock_irq kernel/locking/lockdep.c:3046 [inline]
  mark_lock+0xd58/0x1380 kernel/locking/lockdep.c:3421
  mark_irqflags kernel/locking/lockdep.c:3299 [inline]
  __lock_acquire+0x1654/0x3fb0 kernel/locking/lockdep.c:3653
  lock_acquire+0x16f/0x3f0 kernel/locking/lockdep.c:4211
  __raw_spin_lock include/linux/spinlock_api_smp.h:142 [inline]
  _raw_spin_lock+0x2f/0x40 kernel/locking/spinlock.c:144
  spin_lock include/linux/spinlock.h:329 [inline]
  ax25_std_heartbeat_expiry+0x5d/0x3e0 net/ax25/ax25_std_timer.c:37
  ax25_heartbeat_expiry+0xf3/0x120 net/ax25/ax25_timer.c:141
  call_timer_fn+0x190/0x720 kernel/time/timer.c:1325
  expire_timers kernel/time/timer.c:1362 [inline]
  __run_timers kernel/time/timer.c:1681 [inline]
  __run_timers kernel/time/timer.c:1649 [inline]
  run_timer_softirq+0x652/0x1700 kernel/time/timer.c:1694
  __do_softirq+0x266/0x95a kernel/softirq.c:293
  run_ksoftirqd kernel/softirq.c:655 [inline]
  run_ksoftirqd+0x8e/0x110 kernel/softirq.c:647
  smpboot_thread_fn+0x6ab/0xa10 kernel/smpboot.c:164
  kthread+0x357/0x430 kernel/kthread.c:253
  ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:352

Reported-by: syzbot+e350b81e95a6a214da8a@syzkaller.appspotmail.com
Signed-off-by: Li RongQing <lirongqing@baidu.com>
---
 net/ax25/ax25_route.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/ax25/ax25_route.c b/net/ax25/ax25_route.c
index 66f74c85cf6b..28e21259ff08 100644
--- a/net/ax25/ax25_route.c
+++ b/net/ax25/ax25_route.c
@@ -429,9 +429,11 @@ int ax25_rt_autobind(ax25_cb *ax25, ax25_address *addr)
 	}
 
 	if (ax25->sk != NULL) {
-		bh_lock_sock(ax25->sk);
+		bool slow;
+
+		slow = lock_sock_fast(ax25->sk);
 		sock_reset_flag(ax25->sk, SOCK_ZAPPED);
-		bh_unlock_sock(ax25->sk);
+		unlock_sock_fast(ax25->sk, slow);
 	}
 
 put:
-- 
2.16.2


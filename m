From: syzbot <syzbot+e350b81e95a6a214da8a@syzkaller.appspotmail.com>
Subject: inconsistent lock state in ax25_std_heartbeat_expiry
Date: Mon, 25 Mar 2019 11:55:05 -0700
Message-ID: <0000000000001b07250584efbee3@google.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, ralf@linux-mips.org, syzkaller-bugs@googlegroups.com

Hello,

syzbot found the following crash on:

HEAD commit:    5f543a54 net: hns3: fix for not calculating tx bd num corr..
git tree:       net
console output: https://syzkaller.appspot.com/x/log.txt?x=10c8652b200000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f05902bca21d8935
dashboard link: https://syzkaller.appspot.com/bug?extid=e350b81e95a6a214da8a
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+e350b81e95a6a214da8a@syzkaller.appspotmail.com

bridge0: received packet on bridge_slave_0 with own address as source  
address (addr:aa:aa:aa:aa:aa:1b, vlan:0)
bridge0: received packet on veth0_to_bridge with own address as source  
address (addr:66:56:21:74:14:df, vlan:0)
bridge0: received packet on bridge_slave_0 with own address as source  
address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
================================
WARNING: inconsistent lock state
5.0.0+ #134 Not tainted
--------------------------------
inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W} usage.
ksoftirqd/1/16 [HC0[0]:SC1[1]:HE1:SE0] takes:
000000008282a7d4 (slock-AF_AX25){+.?.}, at: spin_lock  
include/linux/spinlock.h:329 [inline]
000000008282a7d4 (slock-AF_AX25){+.?.}, at:  
ax25_std_heartbeat_expiry+0x5d/0x3e0 net/ax25/ax25_std_timer.c:37
{SOFTIRQ-ON-W} state was registered at:
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
hardirqs last  enabled at (296868110): [<ffffffff870f1ad8>]  
__raw_spin_unlock_irq include/linux/spinlock_api_smp.h:168 [inline]
hardirqs last  enabled at (296868110): [<ffffffff870f1ad8>]  
_raw_spin_unlock_irq+0x28/0x90 kernel/locking/spinlock.c:192
hardirqs last disabled at (296868109): [<ffffffff870f1c4a>]  
__raw_spin_lock_irq include/linux/spinlock_api_smp.h:126 [inline]
hardirqs last disabled at (296868109): [<ffffffff870f1c4a>]  
_raw_spin_lock_irq+0x3a/0x80 kernel/locking/spinlock.c:160
softirqs last  enabled at (296868102): [<ffffffff87400662>]  
__do_softirq+0x662/0x95a kernel/softirq.c:320
softirqs last disabled at (296868107): [<ffffffff8144c8ae>] run_ksoftirqd  
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
CPU: 1 PID: 16 Comm: ksoftirqd/1 Not tainted 5.0.0+ #134
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
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
net_ratelimit: 21613 callbacks suppressed
bridge0: received packet on veth0_to_bridge with own address as source  
address (addr:66:56:21:74:14:df, vlan:0)
bridge0: received packet on bridge_slave_0 with own address as source  
address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on veth0_to_bridge with own address as source  
address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on veth0_to_bridge with own address as source  
address (addr:66:56:21:74:14:df, vlan:0)
bridge0: received packet on bridge_slave_0 with own address as source  
address (addr:aa:aa:aa:aa:aa:1b, vlan:0)
bridge0: received packet on bridge_slave_0 with own address as source  
address (addr:aa:aa:aa:aa:aa:1b, vlan:0)
bridge0: received packet on bridge_slave_0 with own address as source  
address (addr:aa:aa:aa:aa:aa:1b, vlan:0)
bridge0: received packet on bridge_slave_0 with own address as source  
address (addr:aa:aa:aa:aa:aa:1b, vlan:0)
bridge0: received packet on bridge_slave_0 with own address as source  
address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on veth0_to_bridge with own address as source  
address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
net_ratelimit: 16407 callbacks suppressed
bridge0: received packet on bridge_slave_0 with own address as source  
address (addr:aa:aa:aa:aa:aa:1b, vlan:0)
bridge0: received packet on bridge_slave_0 with own address as source  
address (addr:aa:aa:aa:aa:aa:1b, vlan:0)
bridge0: received packet on bridge_slave_0 with own address as source  
address (addr:aa:aa:aa:aa:aa:1b, vlan:0)
bridge0: received packet on bridge_slave_0 with own address as source  
address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on veth0_to_bridge with own address as source  
address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on bridge_slave_0 with own address as source  
address (addr:aa:aa:aa:aa:aa:1b, vlan:0)
bridge0: received packet on veth0_to_bridge with own address as source  
address (addr:66:56:21:74:14:df, vlan:0)
bridge0: received packet on bridge_slave_0 with own address as source  
address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on veth0_to_bridge with own address as source  
address (addr:aa:aa:aa:aa:aa:0c, vlan:0)
bridge0: received packet on veth0_to_bridge with own address as source  
address (addr:66:56:21:74:14:df, vlan:0)


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

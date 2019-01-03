From: syzbot <syzbot+55f9d3e51d49e20b2ce5@syzkaller.appspotmail.com>
Subject: general protection fault in prepare_to_wait
Date: Thu, 03 Jan 2019 02:44:04 -0800
Message-ID: <000000000000fa6a2c057e8b7064@google.com>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, ralf@linux-mips.org, syzkaller-bugs@googlegroups.com

Hello,

syzbot found the following crash on:

HEAD commit:    e888402789b9 net: hns3: call hns3_nic_net_open() while doi..
git tree:       net
console output: https://syzkaller.appspot.com/x/log.txt?x=11876fb3400000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b6c41ffa3d657353
dashboard link: https://syzkaller.appspot.com/bug?extid=55f9d3e51d49e20b2ce5
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+55f9d3e51d49e20b2ce5@syzkaller.appspotmail.com

kasan: CONFIG_KASAN_INLINE enabled
kasan: GPF could be caused by NULL-ptr deref or user memory access
general protection fault: 0000 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 22808 Comm: syz-executor4 Not tainted 4.20.0+ #4
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
RIP: 0010:__lock_acquire+0x904/0x4a30 kernel/locking/lockdep.c:3215
Code: 28 00 00 00 0f 85 32 29 00 00 48 8d 65 d8 5b 41 5c 41 5d 41 5e 41 5f  
5d c3 48 b8 00 00 00 00 00 fc ff df 4c 89 da 48 c1 ea 03 <80> 3c 02 00 0f  
85 2d 2c 00 00 49 81 3b e0 a3 9a 8a 0f 84 09 f8 ff
RSP: 0018:ffff8880903ff6a0 EFLAGS: 00010006
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000003 RSI: 0000000000000000 RDI: 0000000000000018
RBP: ffff8880903ff928 R08: 0000000000000001 R09: 0000000000000001
R10: 0000000000000001 R11: 0000000000000018 R12: ffff8880a0410200
R13: 0000000000000001 R14: 0000000000000001 R15: 0000000000000000
FS:  00007f56c8420700(0000) GS:ffff8880ae600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f7c92bf84a0 CR3: 00000000931da000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
kobject: 'loop1' (00000000563158a3): kobject_uevent_env
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
kobject: 'loop1' (00000000563158a3): fill_kobj_path: path  
= '/devices/virtual/block/loop1'
Call Trace:
kobject: 'loop2' (000000007e06da14): kobject_uevent_env
kobject: 'loop2' (000000007e06da14): fill_kobj_path: path  
= '/devices/virtual/block/loop2'
  lock_acquire+0x1db/0x570 kernel/locking/lockdep.c:3841
  __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
  _raw_spin_lock_irqsave+0x95/0xcd kernel/locking/spinlock.c:152
  prepare_to_wait+0xa7/0x420 kernel/sched/wait.c:230
  nr_accept+0x31f/0xa20 net/netrom/af_netrom.c:796
kobject: 'loop1' (00000000563158a3): kobject_uevent_env
  __sys_accept4+0x3a9/0x840 net/socket.c:1590
kobject: 'loop1' (00000000563158a3): fill_kobj_path: path  
= '/devices/virtual/block/loop1'
  __do_sys_accept net/socket.c:1631 [inline]
  __se_sys_accept net/socket.c:1628 [inline]
  __x64_sys_accept+0x75/0xb0 net/socket.c:1628
  do_syscall_64+0x1a3/0x800 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x457ec9
Code: 6d b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 3b b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f56c841fc78 EFLAGS: 00000246 ORIG_RAX: 000000000000002b
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000000457ec9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000005
RBP: 000000000073c0e0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f56c84206d4
R13: 00000000004bdcb6 R14: 00000000004cdac0 R15: 00000000ffffffff
Modules linked in:
---[ end trace 950cf3f0884cbe4a ]---
RIP: 0010:__lock_acquire+0x904/0x4a30 kernel/locking/lockdep.c:3215
Code: 28 00 00 00 0f 85 32 29 00 00 48 8d 65 d8 5b 41 5c 41 5d 41 5e 41 5f  
5d c3 48 b8 00 00 00 00 00 fc ff df 4c 89 da 48 c1 ea 03 <80> 3c 02 00 0f  
85 2d 2c 00 00 49 81 3b e0 a3 9a 8a 0f 84 09 f8 ff
RSP: 0018:ffff8880903ff6a0 EFLAGS: 00010006
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000003 RSI: 0000000000000000 RDI: 0000000000000018
RBP: ffff8880903ff928 R08: 0000000000000001 R09: 0000000000000001
R10: 0000000000000001 R11: 0000000000000018 R12: ffff8880a0410200
R13: 0000000000000001 R14: 0000000000000001 R15: 0000000000000000
FS:  00007f56c8420700(0000) GS:ffff8880ae600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f7c92bf84a0 CR3: 00000000931da000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#bug-status-tracking for how to communicate with  
syzbot.

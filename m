From: syzbot <syzbot+d0b03d6dbe11a950e0ce@syzkaller.appspotmail.com>
Subject: general protection fault in ax25_send_control
Date: Mon, 07 Jan 2019 22:40:02 -0800
Message-ID: <00000000000077264c057eec9ddd@google.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, ralf@linux-mips.org, syzkaller-bugs@googlegroups.com

Hello,

syzbot found the following crash on:

HEAD commit:    b71acb0e3721 Merge branch 'linus' of git://git.kernel.org/..
git tree:       net-next
console output: https://syzkaller.appspot.com/x/log.txt?x=174ccdbb400000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b03c5892bb940c76
dashboard link: https://syzkaller.appspot.com/bug?extid=d0b03d6dbe11a950e0ce
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+d0b03d6dbe11a950e0ce@syzkaller.appspotmail.com

ax25_connect(): syz-executor5 uses autobind, please contact jreuter@yaina.de
ax25_connect(): syz-executor4 uses autobind, please contact jreuter@yaina.de
kasan: CONFIG_KASAN_INLINE enabled
kasan: GPF could be caused by NULL-ptr deref or user memory access
general protection fault: 0000 [#1] PREEMPT SMP KASAN
kobject: 'loop5' (000000000a8c8c40): kobject_uevent_env
CPU: 0 PID: 13309 Comm: syz-executor0 Not tainted 4.20.0+ #3
kobject: 'loop5' (000000000a8c8c40): fill_kobj_path: path  
= '/devices/virtual/block/loop5'
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
RIP: 0010:ax25_send_control+0x5a/0x560 net/ax25/ax25_subr.c:155
Code: ff df 48 c1 ea 03 80 3c 02 00 0f 85 b1 04 00 00 48 b8 00 00 00 00 00  
fc ff df 4d 8b 65 28 49 8d 7c 24 08 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f  
85 83 04 00 00 48 b8 00 00 00 00 00 fc ff df 4d 8b
RSP: 0018:ffff888042c377f8 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: 0000000000000043 RCX: ffffc90005de9000
RDX: 0000000000000001 RSI: ffffffff87058725 RDI: 0000000000000008
RBP: ffff888042c37830 R08: ffff888064a5c380 R09: ffff888064a5cc48
R10: ffff888064a5c380 R11: 0000000000000000 R12: 0000000000000000
kobject: 'loop4' (000000005a2eed4e): kobject_uevent_env
R13: ffff88808baaa040 R14: 0000000000000001 R15: ffff88808baaa068
FS:  00007f25a1e3a700(0000) GS:ffff8880ae600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000001f01e80 CR3: 00000000a4311000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
kobject: 'loop4' (000000005a2eed4e): fill_kobj_path: path  
= '/devices/virtual/block/loop4'
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
  ax25_release+0x503/0x680 net/ax25/af_ax25.c:974
  __sock_release+0xd3/0x250 net/socket.c:579
  sock_close+0x1b/0x30 net/socket.c:1141
  __fput+0x3c5/0xaf0 fs/file_table.c:278
  ____fput+0x16/0x20 fs/file_table.c:309
  task_work_run+0x1f4/0x2b0 kernel/task_work.c:113
  get_signal+0x168d/0x19b0 kernel/signal.c:2347
  do_signal+0x91/0x1e80 arch/x86/kernel/signal.c:816
  exit_to_usermode_loop+0x2f7/0x3b0 arch/x86/entry/common.c:162
  prepare_exit_to_usermode arch/x86/entry/common.c:197 [inline]
  syscall_return_slowpath arch/x86/entry/common.c:268 [inline]
  do_syscall_64+0x696/0x800 arch/x86/entry/common.c:293
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x457ec9
Code: 6d b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 3b b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f25a1e39c78 EFLAGS: 00000246 ORIG_RAX: 000000000000002a
RAX: 0000000000000000 RBX: 0000000000000003 RCX: 0000000000457ec9
RDX: 0000000000000048 RSI: 0000000020000140 RDI: 0000000000000004
RBP: 000000000073bf00 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f25a1e3a6d4
R13: 00000000004be2ae R14: 00000000004ce648 R15: 00000000ffffffff
Modules linked in:
---[ end trace dcff9655958a2d47 ]---
RIP: 0010:ax25_send_control+0x5a/0x560 net/ax25/ax25_subr.c:155
Code: ff df 48 c1 ea 03 80 3c 02 00 0f 85 b1 04 00 00 48 b8 00 00 00 00 00  
fc ff df 4d 8b 65 28 49 8d 7c 24 08 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f  
85 83 04 00 00 48 b8 00 00 00 00 00 fc ff df 4d 8b
RSP: 0018:ffff888042c377f8 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: 0000000000000043 RCX: ffffc90005de9000
RDX: 0000000000000001 RSI: ffffffff87058725 RDI: 0000000000000008
RBP: ffff888042c37830 R08: ffff888064a5c380 R09: ffff888064a5cc48
R10: ffff888064a5c380 R11: 0000000000000000 R12: 0000000000000000
R13: ffff88808baaa040 R14: 0000000000000001 R15: ffff88808baaa068
FS:  00007f25a1e3a700(0000) GS:ffff8880ae600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ff3c6de5db8 CR3: 00000000a4311000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#bug-status-tracking for how to communicate with  
syzbot.

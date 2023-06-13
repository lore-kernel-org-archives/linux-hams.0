From: syzbot <syzbot+d327a1f3b12e1e206c16@syzkaller.appspotmail.com>
Subject: [syzbot] [hams?] memory leak in nr_create (3)
Date: Tue, 13 Jun 2023 12:24:10 -0700
Message-ID: <0000000000009612bc05fe07c73f@google.com>
Mime-Version: 1.0
Return-path: <netdev+bounces-10500-gl-netdev-2=m.gmane-mx.org@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, ralf@linux-mips.org, syzkaller-bugs@googlegroups.com

Hello,

syzbot found the following issue on:

HEAD commit:    33f2b5785a2b Merge tag 'drm-fixes-2023-06-09' of git://ano..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=127f61b3280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ee975febba574924
dashboard link: https://syzkaller.appspot.com/bug?extid=d327a1f3b12e1e206c16
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=110a6ef1280000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/33eb581c818f/disk-33f2b578.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0bcbec3a83cf/vmlinux-33f2b578.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0e577c2e8783/bzImage-33f2b578.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d327a1f3b12e1e206c16@syzkaller.appspotmail.com

2023/06/09 19:03:53 executed programs: 18
BUG: memory leak
unreferenced object 0xffff888114e76800 (size 2048):
  comm "syz-executor.3", pid 5156, jiffies 4294942146 (age 20.470s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    06 00 07 40 00 00 00 00 00 00 00 00 00 00 00 00  ...@............
  backtrace:
    [<ffffffff815461aa>] __do_kmalloc_node mm/slab_common.c:965 [inline]
    [<ffffffff815461aa>] __kmalloc+0x4a/0x120 mm/slab_common.c:979
    [<ffffffff83dbe78d>] kmalloc include/linux/slab.h:563 [inline]
    [<ffffffff83dbe78d>] sk_prot_alloc+0xcd/0x1b0 net/core/sock.c:2035
    [<ffffffff83dc0f06>] sk_alloc+0x36/0x300 net/core/sock.c:2088
    [<ffffffff843dea54>] nr_create+0x84/0x1c0 net/netrom/af_netrom.c:438
    [<ffffffff83db6e3e>] __sock_create+0x1de/0x300 net/socket.c:1547
    [<ffffffff83dba452>] sock_create net/socket.c:1598 [inline]
    [<ffffffff83dba452>] __sys_socket_create net/socket.c:1635 [inline]
    [<ffffffff83dba452>] __sys_socket_create net/socket.c:1620 [inline]
    [<ffffffff83dba452>] __sys_socket+0xa2/0x190 net/socket.c:1663
    [<ffffffff83dba55e>] __do_sys_socket net/socket.c:1676 [inline]
    [<ffffffff83dba55e>] __se_sys_socket net/socket.c:1674 [inline]
    [<ffffffff83dba55e>] __x64_sys_socket+0x1e/0x30 net/socket.c:1674
    [<ffffffff84a17749>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
    [<ffffffff84a17749>] do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
    [<ffffffff84c0008b>] entry_SYSCALL_64_after_hwframe+0x63/0xcd

BUG: memory leak
unreferenced object 0xffff8881185accc0 (size 32):
  comm "syz-executor.3", pid 5156, jiffies 4294942146 (age 20.470s)
  hex dump (first 32 bytes):
    a8 d1 a3 00 81 88 ff ff 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff81545ac4>] kmalloc_trace+0x24/0x90 mm/slab_common.c:1057
    [<ffffffff823168c2>] kmalloc include/linux/slab.h:559 [inline]
    [<ffffffff823168c2>] kzalloc include/linux/slab.h:680 [inline]
    [<ffffffff823168c2>] apparmor_sk_alloc_security+0x52/0xd0 security/apparmor/lsm.c:828
    [<ffffffff822dbe95>] security_sk_alloc+0x35/0x70 security/security.c:4372
    [<ffffffff83dbe7be>] sk_prot_alloc+0xfe/0x1b0 net/core/sock.c:2038
    [<ffffffff83dc0f06>] sk_alloc+0x36/0x300 net/core/sock.c:2088
    [<ffffffff843dea54>] nr_create+0x84/0x1c0 net/netrom/af_netrom.c:438
    [<ffffffff83db6e3e>] __sock_create+0x1de/0x300 net/socket.c:1547
    [<ffffffff83dba452>] sock_create net/socket.c:1598 [inline]
    [<ffffffff83dba452>] __sys_socket_create net/socket.c:1635 [inline]
    [<ffffffff83dba452>] __sys_socket_create net/socket.c:1620 [inline]
    [<ffffffff83dba452>] __sys_socket+0xa2/0x190 net/socket.c:1663
    [<ffffffff83dba55e>] __do_sys_socket net/socket.c:1676 [inline]
    [<ffffffff83dba55e>] __se_sys_socket net/socket.c:1674 [inline]
    [<ffffffff83dba55e>] __x64_sys_socket+0x1e/0x30 net/socket.c:1674
    [<ffffffff84a17749>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
    [<ffffffff84a17749>] do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
    [<ffffffff84c0008b>] entry_SYSCALL_64_after_hwframe+0x63/0xcd

BUG: memory leak
unreferenced object 0xffff888115867800 (size 2048):
  comm "syz-executor.0", pid 5159, jiffies 4294942269 (age 19.240s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    06 00 07 40 00 00 00 00 00 00 00 00 00 00 00 00  ...@............
  backtrace:
    [<ffffffff815461aa>] __do_kmalloc_node mm/slab_common.c:965 [inline]
    [<ffffffff815461aa>] __kmalloc+0x4a/0x120 mm/slab_common.c:979
    [<ffffffff83dbe78d>] kmalloc include/linux/slab.h:563 [inline]
    [<ffffffff83dbe78d>] sk_prot_alloc+0xcd/0x1b0 net/core/sock.c:2035
    [<ffffffff83dc0f06>] sk_alloc+0x36/0x300 net/core/sock.c:2088
    [<ffffffff843dea54>] nr_create+0x84/0x1c0 net/netrom/af_netrom.c:438
    [<ffffffff83db6e3e>] __sock_create+0x1de/0x300 net/socket.c:1547
    [<ffffffff83dba452>] sock_create net/socket.c:1598 [inline]
    [<ffffffff83dba452>] __sys_socket_create net/socket.c:1635 [inline]
    [<ffffffff83dba452>] __sys_socket_create net/socket.c:1620 [inline]
    [<ffffffff83dba452>] __sys_socket+0xa2/0x190 net/socket.c:1663
    [<ffffffff83dba55e>] __do_sys_socket net/socket.c:1676 [inline]
    [<ffffffff83dba55e>] __se_sys_socket net/socket.c:1674 [inline]
    [<ffffffff83dba55e>] __x64_sys_socket+0x1e/0x30 net/socket.c:1674
    [<ffffffff84a17749>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
    [<ffffffff84a17749>] do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
    [<ffffffff84c0008b>] entry_SYSCALL_64_after_hwframe+0x63/0xcd

BUG: memory leak
unreferenced object 0xffff88811896cae0 (size 32):
  comm "syz-executor.0", pid 5159, jiffies 4294942269 (age 19.240s)
  hex dump (first 32 bytes):
    a8 d1 a3 00 81 88 ff ff 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff81545ac4>] kmalloc_trace+0x24/0x90 mm/slab_common.c:1057
    [<ffffffff823168c2>] kmalloc include/linux/slab.h:559 [inline]
    [<ffffffff823168c2>] kzalloc include/linux/slab.h:680 [inline]
    [<ffffffff823168c2>] apparmor_sk_alloc_security+0x52/0xd0 security/apparmor/lsm.c:828
    [<ffffffff822dbe95>] security_sk_alloc+0x35/0x70 security/security.c:4372
    [<ffffffff83dbe7be>] sk_prot_alloc+0xfe/0x1b0 net/core/sock.c:2038
    [<ffffffff83dc0f06>] sk_alloc+0x36/0x300 net/core/sock.c:2088
    [<ffffffff843dea54>] nr_create+0x84/0x1c0 net/netrom/af_netrom.c:438
    [<ffffffff83db6e3e>] __sock_create+0x1de/0x300 net/socket.c:1547
    [<ffffffff83dba452>] sock_create net/socket.c:1598 [inline]
    [<ffffffff83dba452>] __sys_socket_create net/socket.c:1635 [inline]
    [<ffffffff83dba452>] __sys_socket_create net/socket.c:1620 [inline]
    [<ffffffff83dba452>] __sys_socket+0xa2/0x190 net/socket.c:1663
    [<ffffffff83dba55e>] __do_sys_socket net/socket.c:1676 [inline]
    [<ffffffff83dba55e>] __se_sys_socket net/socket.c:1674 [inline]
    [<ffffffff83dba55e>] __x64_sys_socket+0x1e/0x30 net/socket.c:1674
    [<ffffffff84a17749>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
    [<ffffffff84a17749>] do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
    [<ffffffff84c0008b>] entry_SYSCALL_64_after_hwframe+0x63/0xcd



---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to change bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup


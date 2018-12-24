From: Dmitry Vyukov <dvyukov@google.com>
Subject: net/rose: GPF in rose_route_frame
Date: Mon, 24 Dec 2018 11:25:22 +0100
Message-ID: <CACT4Y+bDnO1dL+o6MJtT42ouhiZhvJEiW4eZCLB4dof261v6DA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=hetFAfGJuCOQl97n8noYGHvYm/O2QoeflsnRDHofOjA=;
        b=Jklx0YtscBemfRZlmWj5OLWJQIsvKvTWSXHcMaIc5yotNHbIb6lPaAVkdJoxTv8EL2
         3cdcRI0cPD7nZPIKPZEwce1FNw+tnA66Hxdv52VP5SpohqCvbqiZ1s9YH/ifwXmZ+gGN
         7Eu+q7OUMpmKgsmjvfQKQyduisqNw8q62PP94MhfyvyjBpAkzTConA+c2QmmiO3Djrpw
         L+qGCXYAulTdKv1rcpRP2DdD/TImhnKuRJ5vKZASAT9hXgZLOh+2ksiYKc1CI1bV3nxh
         hmjIwYxMJhHNiWDK8hiMhPxxr+eq9YRdl62+GAFUt9rIbXHcIUnbnzSmM8hKO8VrgJn1
         mmsw==
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ralf@linux-mips.org, David Miller <davem@davemloft.net>, linux-hams@vger.kernel.org, netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>
Cc: syzkaller <syzkaller@googlegroups.com>

Hi,

Rose device crashes kernel after several seconds after up'ping. I am doing just:

# ip link set dev rose0 address 11:22:33:44:55
# ip link set dev rose0 up

Then after ~15 seconds or so:

kasan: CONFIG_KASAN_INLINE enabled
kasan: GPF could be caused by NULL-ptr deref or user memory access
general protection fault: 0000 [#1] PREEMPT SMP KASAN
CPU: 3 PID: 2747 Comm: aoe_tx0 Not tainted 4.20.0-rc7-next-20181221 #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.10.2-1 04/01/2014
RIP: 0010:ax25cmp+0x3e/0x180 net/ax25/ax25_addr.c:122
Code: f6 41 55 49 89 fd 41 54 49 89 f4 53 48 83 ec 10 48 89 7d d0 48
89 75 c8 e8 cf 73 6d fa 4c 89 e8 4c 89 ea 48 c1 e8 03 83 e2 07 <42> 0f
b6 04 38 38 d0 7f 08 84 c0 0f 85 23 01 00 00 4c 89 e0 4c 89
RSP: 0018:ffff888069ec73c8 EFLAGS: 00010202
RAX: 0000000000000002 RBX: ffff888064ce8080 RCX: 0000000000000001
RDX: 0000000000000007 RSI: ffffffff8711cd61 RDI: 0000000000000017
RBP: ffff888069ec7400 R08: ffffed100d3d8e70 R09: ffffed100d3d8e6f
R10: ffffed100d3d8e6f R11: 0000000000000003 R12: ffff888064ce8088
R13: 0000000000000017 R14: 0000000000000000 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff88806c780000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2a68767000 CR3: 0000000068f90003 CR4: 00000000001606e0
Call Trace:
 rose_route_frame+0x2d0/0x19a0 net/rose/rose_route.c:885
 rose_xmit+0x88/0x180 net/rose/rose_dev.c:110
 __netdev_start_xmit include/linux/netdevice.h:4382 [inline]
 netdev_start_xmit include/linux/netdevice.h:4391 [inline]
 xmit_one net/core/dev.c:3278 [inline]
 dev_hard_start_xmit+0x286/0xc80 net/core/dev.c:3294
 __dev_queue_xmit+0x2efb/0x3940 net/core/dev.c:3864
 dev_queue_xmit+0x17/0x20 net/core/dev.c:3897
 tx+0x77/0xd0 drivers/block/aoe/aoenet.c:63
 kthread+0x296/0x4a0 drivers/block/aoe/aoecmd.c:1239
 kthread+0x35a/0x440 kernel/kthread.c:246
 ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:352
Modules linked in:
---[ end trace 1e8c52d44c421a9f ]---
RIP: 0010:ax25cmp+0x3e/0x180 net/ax25/ax25_addr.c:122
Code: f6 41 55 49 89 fd 41 54 49 89 f4 53 48 83 ec 10 48 89 7d d0 48
89 75 c8 e8 cf 73 6d fa 4c 89 e8 4c 89 ea 48 c1 e8 03 83 e2 07 <42> 0f
b6 04 38 38 d0 7f 08 84 c0 0f 85 23 01 00 00 4c 89 e0 4c 89
RSP: 0018:ffff888069ec73c8 EFLAGS: 00010202
RAX: 0000000000000002 RBX: ffff888064ce8080 RCX: 0000000000000001
RDX: 0000000000000007 RSI: ffffffff8711cd61 RDI: 0000000000000017
RBP: ffff888069ec7400 R08: ffffed100d3d8e70 R09: ffffed100d3d8e6f
R10: ffffed100d3d8e6f R11: 0000000000000003 R12: ffff888064ce8088
R13: 0000000000000017 R14: 0000000000000000 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff88806c780000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2a68767000 CR3: 0000000068f90003 CR4: 00000000001606e0


Kernel is on today's linux-next head:

commit 340ae71f9dd421227a58c14a909b63033745dca4 (HEAD, tag:
next-20181221, next/master)
Date:   Fri Dec 21 19:27:46 2018 +1100
    Add linux-next specific files for 20181221

Kernel config:
https://gist.githubusercontent.com/dvyukov/fccf387306df8a1042949da46028302a/raw/f817219bdb8d5ef63fdd56f17e0cc13e620e1978/gistfile1.txt

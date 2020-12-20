From: syzbot <syzbot+7078ae989d857fe17988@syzkaller.appspotmail.com>
Subject: Re: general protection fault in rose_send_frame
Date: Sun, 20 Dec 2020 05:27:03 -0800
Message-ID: <00000000000014086305b6e54cfc@google.com>
References: <00000000000089904d057f1e0ae0@google.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <00000000000089904d057f1e0ae0@google.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: anmol.karan123@gmail.com, davem@davemloft.net, kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, ralf@linux-mips.org, syzkaller-bugs@googlegroups.com, yepeilin.cs@gmail.com

syzbot suspects this issue was fixed by commit:

commit 3b3fd068c56e3fbea30090859216a368398e39bf
Author: Anmol Karn <anmol.karan123@gmail.com>
Date:   Thu Nov 19 19:10:43 2020 +0000

    rose: Fix Null pointer dereference in rose_send_frame()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=139e2b9b500000
start commit:   23ee3e4e Merge tag 'pci-v5.8-fixes-2' of git://git.kernel...
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=f87a5e4232fdb267
dashboard link: https://syzkaller.appspot.com/bug?extid=7078ae989d857fe17988
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=157e8964900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10046c54900000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: rose: Fix Null pointer dereference in rose_send_frame()

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

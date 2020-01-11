From: syzbot <syzbot+500c69d1e21d970e461b@syzkaller.appspotmail.com>
Subject: Re: KASAN: use-after-free Read in lock_sock_nested
Date: Sat, 11 Jan 2020 02:00:01 -0800
Message-ID: <0000000000004078ac059bda4ef9@google.com>
References: <0000000000007a5aad057e7748c9@google.com>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <0000000000007a5aad057e7748c9@google.com>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, jhogan@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, netdev@vger.kernel.org, paul.burton@mips.com, paulburton@kernel.org, ralf@linux-mips.org, syzkaller-bugs@googlegroups.com, tbogendoerfer@suse.de

syzbot suspects this bug was fixed by commit:

commit a07e3324538a989b7cdbf2c679be6a7f9df2544f
Author: Thomas Bogendoerfer <tbogendoerfer@suse.de>
Date:   Mon May 13 11:47:25 2019 +0000

     MIPS: kernel: only use i8253 clocksource with periodic clockevent

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11dd033ee00000
start commit:   3ea54d9b Merge tag 'docs-5.3-1' of git://git.lwn.net/linux
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=195ab3ca46c2e324
dashboard link: https://syzkaller.appspot.com/bug?extid=500c69d1e21d970e461b
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=145318b4600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14ac7b78600000

If the result looks correct, please mark the bug fixed by replying with:

#syz fix: MIPS: kernel: only use i8253 clocksource with periodic clockevent

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

From: syzbot <syzbot+701728447042217b67c1@syzkaller.appspotmail.com>
Subject: Re: KASAN: use-after-free Read in nr_rx_frame (2)
Date: Wed, 31 Jul 2019 14:32:00 -0700
Message-ID: <000000000000fdd90c058f00daca@google.com>
References: <000000000000e42667058e554371@google.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <000000000000e42667058e554371@google.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, dvyukov@google.com, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, ralf@linux-mips.org, syzkaller-bugs@googlegroups.com, xiyou.wangcong@gmail.com

syzbot has bisected this bug to:

commit c8c8218ec5af5d2598381883acbefbf604e56b5e
Author: Cong Wang <xiyou.wangcong@gmail.com>
Date:   Thu Jun 27 21:30:58 2019 +0000

     netrom: fix a memory leak in nr_rx_frame()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=122ddaec600000
start commit:   629f8205 Merge tag 'for-linus-20190730' of git://git.kerne..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=112ddaec600000
console output: https://syzkaller.appspot.com/x/log.txt?x=162ddaec600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e397351d2615e10
dashboard link: https://syzkaller.appspot.com/bug?extid=701728447042217b67c1
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14a6e008600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11937d92600000

Reported-by: syzbot+701728447042217b67c1@syzkaller.appspotmail.com
Fixes: c8c8218ec5af ("netrom: fix a memory leak in nr_rx_frame()")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

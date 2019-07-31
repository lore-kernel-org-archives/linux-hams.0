From: syzbot <syzbot+107429d62fb1d293602f@syzkaller.appspotmail.com>
Subject: Re: KASAN: use-after-free Read in release_sock
Date: Wed, 31 Jul 2019 06:58:00 -0700
Message-ID: <0000000000005f7805058efa8333@google.com>
References: <000000000000de000a058e9025db@google.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <000000000000de000a058e9025db@google.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, ralf@linux-mips.org, syzkaller-bugs@googlegroups.com, xiyou.wangcong@gmail.com

syzbot has bisected this bug to:

commit c8c8218ec5af5d2598381883acbefbf604e56b5e
Author: Cong Wang <xiyou.wangcong@gmail.com>
Date:   Thu Jun 27 21:30:58 2019 +0000

     netrom: fix a memory leak in nr_rx_frame()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13b52242600000
start commit:   629f8205 Merge tag 'for-linus-20190730' of git://git.kerne..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=10752242600000
console output: https://syzkaller.appspot.com/x/log.txt?x=17b52242600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4c7b914a2680c9c6
dashboard link: https://syzkaller.appspot.com/bug?extid=107429d62fb1d293602f
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16a7c8dc600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1498cfa2600000

Reported-by: syzbot+107429d62fb1d293602f@syzkaller.appspotmail.com
Fixes: c8c8218ec5af ("netrom: fix a memory leak in nr_rx_frame()")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

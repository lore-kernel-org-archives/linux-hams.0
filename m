From: syzbot <syzbot+6eaef7158b19e3fec3a0@syzkaller.appspotmail.com>
Subject: Re: KASAN: use-after-free Read in nr_release
Date: Wed, 17 Jul 2019 21:05:01 -0700
Message-ID: <000000000000bb2b51058decb6a2@google.com>
References: <0000000000007e8b70058acbd60f@google.com>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <0000000000007e8b70058acbd60f@google.com>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, hdanton@sina.com, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, ralf@linux-mips.org, syzkaller-bugs@googlegroups.com, xiyou.wangcong@gmail.com

syzbot has bisected this bug to:

commit c8c8218ec5af5d2598381883acbefbf604e56b5e
Author: Cong Wang <xiyou.wangcong@gmail.com>
Date:   Thu Jun 27 21:30:58 2019 +0000

     netrom: fix a memory leak in nr_rx_frame()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10a3bcd0600000
start commit:   192f0f8e Merge tag 'powerpc-5.3-1' of git://git.kernel.org..
git tree:       net-next
final crash:    https://syzkaller.appspot.com/x/report.txt?x=12a3bcd0600000
console output: https://syzkaller.appspot.com/x/log.txt?x=14a3bcd0600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=87305c3ca9c25c70
dashboard link: https://syzkaller.appspot.com/bug?extid=6eaef7158b19e3fec3a0
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15882cd0600000

Reported-by: syzbot+6eaef7158b19e3fec3a0@syzkaller.appspotmail.com
Fixes: c8c8218ec5af ("netrom: fix a memory leak in nr_rx_frame()")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

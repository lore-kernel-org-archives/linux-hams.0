From: syzbot <syzbot+a34e5f3d0300163f0c87@syzkaller.appspotmail.com>
Subject: Re: WARNING: held lock freed in nr_release
Date: Wed, 17 Jul 2019 03:05:00 -0700
Message-ID: <000000000000561cd5058ddda0ce@google.com>
References: <00000000000015d943058ddcb1b3@google.com>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <00000000000015d943058ddcb1b3@google.com>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, ralf@linux-mips.org, syzkaller-bugs@googlegroups.com, xiyou.wangcong@gmail.com

syzbot has bisected this bug to:

commit c8c8218ec5af5d2598381883acbefbf604e56b5e
Author: Cong Wang <xiyou.wangcong@gmail.com>
Date:   Thu Jun 27 21:30:58 2019 +0000

     netrom: fix a memory leak in nr_rx_frame()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14022e8fa00000
start commit:   a5b64700 fix: taprio: Change type of txtime-delay paramete..
git tree:       net
final crash:    https://syzkaller.appspot.com/x/report.txt?x=16022e8fa00000
console output: https://syzkaller.appspot.com/x/log.txt?x=12022e8fa00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=87305c3ca9c25c70
dashboard link: https://syzkaller.appspot.com/bug?extid=a34e5f3d0300163f0c87
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1460b458600000

Reported-by: syzbot+a34e5f3d0300163f0c87@syzkaller.appspotmail.com
Fixes: c8c8218ec5af ("netrom: fix a memory leak in nr_rx_frame()")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

From: syzbot <syzbot+ec1fd464d849d91c3665@syzkaller.appspotmail.com>
Subject: Re: WARNING: refcount bug in nr_insert_socket
Date: Tue, 09 Jul 2019 13:22:00 -0700
Message-ID: <000000000000280332058d45509c@google.com>
References: <0000000000000595ea058d411c35@google.com>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <0000000000000595ea058d411c35@google.com>
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

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1677f227a00000
start commit:   4608a726 Add linux-next specific files for 20190709
git tree:       linux-next
final crash:    https://syzkaller.appspot.com/x/report.txt?x=1577f227a00000
console output: https://syzkaller.appspot.com/x/log.txt?x=1177f227a00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7a02e36d356a9a17
dashboard link: https://syzkaller.appspot.com/bug?extid=ec1fd464d849d91c3665
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16b47be8600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15172e7ba00000

Reported-by: syzbot+ec1fd464d849d91c3665@syzkaller.appspotmail.com
Fixes: c8c8218ec5af ("netrom: fix a memory leak in nr_rx_frame()")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

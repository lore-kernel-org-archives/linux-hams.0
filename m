From: syzbot <syzbot+7078ae989d857fe17988@syzkaller.appspotmail.com>
Subject: Re: general protection fault in rose_send_frame
Date: Thu, 21 Mar 2019 10:39:00 -0700
Message-ID: <000000000000ae4e4405849e364b@google.com>
References: <00000000000089904d057f1e0ae0@google.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <00000000000089904d057f1e0ae0@google.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, ralf@linux-mips.org, syzkaller-bugs@googlegroups.com

Bisection is inconclusive: the bug happens on the oldest tested release.

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14e635fb200000
start commit:   [unknown
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=16e635fb200000
console output: https://syzkaller.appspot.com/x/log.txt?x=12e635fb200000
dashboard link: https://syzkaller.appspot.com/bug?extid=7078ae989d857fe17988
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1688239f200000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1059214f200000

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

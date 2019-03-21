From: syzbot <syzbot+55f9d3e51d49e20b2ce5@syzkaller.appspotmail.com>
Subject: Re: general protection fault in prepare_to_wait
Date: Thu, 21 Mar 2019 10:39:00 -0700
Message-ID: <000000000000b1e96305849e36f1@google.com>
References: <000000000000fa6a2c057e8b7064@google.com>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <000000000000fa6a2c057e8b7064@google.com>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, ralf@linux-mips.org, syzkaller-bugs@googlegroups.com, xiyou.wangcong@gmail.com

Bisection is inconclusive: the bug happens on the oldest tested release.

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14fb90ef200000
start commit:   [unknown
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=16fb90ef200000
console output: https://syzkaller.appspot.com/x/log.txt?x=12fb90ef200000
dashboard link: https://syzkaller.appspot.com/bug?extid=55f9d3e51d49e20b2ce5
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=109c886cc00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11ed20d0c00000

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

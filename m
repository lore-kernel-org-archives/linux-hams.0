From: syzbot <syzbot+eff6b596cc8194e2f029@syzkaller.appspotmail.com>
Subject: Re: KASAN: use-after-free Read in refcount_inc_not_zero_checked (2)
Date: Fri, 14 Aug 2020 11:48:08 -0700
Message-ID: <000000000000ab163105acdadc50@google.com>
References: <000000000000eea12405843bc43c@google.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <000000000000eea12405843bc43c@google.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ardb@kernel.org, davem@davemloft.net, linux-efi@vger.kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@kernel.org, netdev@vger.kernel.org, nivedita@alum.mit.edu, ralf@linux-mips.org, syzkaller-bugs@googlegroups.com

syzbot suspects this issue was fixed by commit:

commit 987053a30016a7d9ab3e4ad973e7c51aeb1f1ef6
Author: Arvind Sankar <nivedita@alum.mit.edu>
Date:   Thu Apr 30 18:28:40 2020 +0000

    efi/x86: Move command-line initrd loading to efi_main

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11680f6a900000
start commit:   9c7dc824 Merge tag '5.1-rc-smb3' of git://git.samba.org/sf..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=7e1aaa1cfbfe1abf
dashboard link: https://syzkaller.appspot.com/bug?extid=eff6b596cc8194e2f029
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17e294a3200000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: efi/x86: Move command-line initrd loading to efi_main

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

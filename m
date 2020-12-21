From: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: general protection fault in rose_send_frame
Date: Mon, 21 Dec 2020 10:22:07 +0100
Message-ID: <CACT4Y+a+KHz924KNzNkxs=kWwM9Udf8t7=uCfg+uH_WPyJN=qg@mail.gmail.com>
References: <00000000000089904d057f1e0ae0@google.com> <00000000000014086305b6e54cfc@google.com>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x3vPUkaHqxxnpGause6hsihZy19vITzBYUQC4M2DuK0=;
        b=GkpADlDK6kXFRky6ufX56elk9icvfmz+M/J6l59CmtSlPLH4ncsqlMJrTCazhfJ5X3
         s9uf+YK+LyK5apriQZBpnEe1NOezzU8cY+o290rhjsdfxEecdiilZc14u0sDnzJy5+wK
         OtdoxUWZxuNBbRed6LfnlO+DpyZeSGcQeOffSLDYxyFYwgQ9CEcOKy3n6eJPErWfK7Jk
         nSuSI9xfPG0v4U8ei7XwFxiujcljbZe5+5BLMpycVMd2+eNjFbc7ZT9GhSvrycBtyEFO
         dKDkTVLlpCjAzIWfJSqZvbeQd5BMRNMsjHRU23Y285BmuAQism5IhrPL23rJoADHHKFo
         HvHA==
In-Reply-To: <00000000000014086305b6e54cfc@google.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: syzbot <syzbot+7078ae989d857fe17988@syzkaller.appspotmail.com>
Cc: anmol.karan123@gmail.com, David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-hams <linux-hams@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, netdev <netdev@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, syzkaller-bugs <syzkaller-bugs@googlegroups.com>, Peilin Ye <yepeilin.cs@gmail.com>

On Sun, Dec 20, 2020 at 2:27 PM syzbot
<syzbot+7078ae989d857fe17988@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit 3b3fd068c56e3fbea30090859216a368398e39bf
> Author: Anmol Karn <anmol.karan123@gmail.com>
> Date:   Thu Nov 19 19:10:43 2020 +0000
>
>     rose: Fix Null pointer dereference in rose_send_frame()
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=139e2b9b500000
> start commit:   23ee3e4e Merge tag 'pci-v5.8-fixes-2' of git://git.kernel...
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=f87a5e4232fdb267
> dashboard link: https://syzkaller.appspot.com/bug?extid=7078ae989d857fe17988
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=157e8964900000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10046c54900000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: rose: Fix Null pointer dereference in rose_send_frame()
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

#syz fix: rose: Fix Null pointer dereference in rose_send_frame()

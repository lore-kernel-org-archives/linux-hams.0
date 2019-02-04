From: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: KASAN: use-after-free Read in selinux_netlbl_socket_setsockopt
Date: Mon, 4 Feb 2019 09:04:11 +0100
Message-ID: <CACT4Y+bOvQNBmE6y1Q4qn0EBz_yKfMqgtMUG5FGAtMT6n7bp5w@mail.gmail.com>
References: <0000000000003d28d10580b335cd@google.com> <CAHC9VhR9wwqVcnmAVcqfwmRuX02F8oMVzNNNQym-TeceHFLqOQ@mail.gmail.com>
 <CACT4Y+Yk=bsS7Ti3PjeZm8yG_txt=orBztowHwddHRP_MzuTxw@mail.gmail.com> <CAM_iQpV42EyuUFcxR7kn7WipkTAkvSxMc+-Me_QZCCUziy_wiQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VkylmgMdehQfvynhBtYYAv/bT1W9TjUptWRKEttu4wo=;
        b=GoXaM5PGSHAjnTruS71/oGif0Wu46X5F4aBLloKuYFa/dqXbuigJtZVoiu0/TvMXl1
         F8WUYbrvYKf+gO3xhVavL/X3Be4CcxbqYQY0RD3YzzWiiz7Bm5ZeaUC10GJP2eZtdNpO
         1GFP9Pb1NSE4OmvdCX4To4ameIl83tjAS0KypgbO0b81tRlIV2LS1PiyQ9ur1sk65aWc
         jVIftKP7Iq1DBP8843sA4T2ms4mJ2QB0THJIT1lQ8K+SPArdmq3NzJwXzO5RpeCoQf7W
         6YIxgxgZSbJczH2lDlCL0N6DjIgfrqlIIuvkij/RXEHxX7ORJjnnPi1SzUtpyZKT2uPJ
         JC3A==
In-Reply-To: <CAM_iQpV42EyuUFcxR7kn7WipkTAkvSxMc+-Me_QZCCUziy_wiQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cong Wang <xiyou.wangcong@gmail.com>
Cc: Paul Moore <paul@paul-moore.com>, Ralf Baechle <ralf@linux-mips.org>, David Miller <davem@davemloft.net>, linux-hams <linux-hams@vger.kernel.org>, netdev <netdev@vger.kernel.org>, syzbot <syzbot+1bfc00ca3aabe5bcd4cb@syzkaller.appspotmail.com>, Eric Paris <eparis@parisplace.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Smalley <sds@tycho.nsa.gov>, selinux@vger.kernel.org, syzkaller-bugs <syzkaller-bugs@googlegroups.com>

On Fri, Feb 1, 2019 at 6:58 PM Cong Wang <xiyou.wangcong@gmail.com> wrote:
>
> On Thu, Jan 31, 2019 at 10:56 PM Dmitry Vyukov <dvyukov@google.com> wrote:
> > Hi Paul,
> >
> > Searching for af_netrom across other syzbot bugs:
> > https://groups.google.com/forum/#!searchin/syzkaller-bugs/af_netrom%7Csort:date
> >
> > I see at least:
> > https://syzkaller.appspot.com/bug?extid=b0b1952f5864b4009b09
> > https://syzkaller.appspot.com/bug?extid=febf3c50d4262e578b1c
> > https://syzkaller.appspot.com/bug?extid=defa700d16f1bd1b9a05
> >
> > Which suggests there are some serious lifetime problems in netrom
> > sockets. That would probably explain this crash as well.
>
> This is supposed to be fixed by:
> https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git/commit/?id=63346650c1a94a92be61a57416ac88c0a47c4327
>
> Please let me know if it isn't.

syzbot can tell if it's not fixed, but for that we need to mark these
bugs as fixed, otherwise syzbot will just consider any new crashes as
the same old bug so nothing to notify about.

#syz fix: netrom: switch to sock timer API

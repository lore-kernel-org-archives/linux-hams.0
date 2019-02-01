From: Cong Wang <xiyou.wangcong@gmail.com>
Subject: Re: KASAN: use-after-free Read in selinux_netlbl_socket_setsockopt
Date: Fri, 1 Feb 2019 09:58:21 -0800
Message-ID: <CAM_iQpV42EyuUFcxR7kn7WipkTAkvSxMc+-Me_QZCCUziy_wiQ@mail.gmail.com>
References: <0000000000003d28d10580b335cd@google.com> <CAHC9VhR9wwqVcnmAVcqfwmRuX02F8oMVzNNNQym-TeceHFLqOQ@mail.gmail.com>
 <CACT4Y+Yk=bsS7Ti3PjeZm8yG_txt=orBztowHwddHRP_MzuTxw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6yuBq+p/+RIOzZlkxjHuTgou8HUguPZ2ENXLbgDkUCE=;
        b=gM9+4gvmij3S4ggChDo5gYBx/hmUZDCbJ3Vdw2M1+dz7sgVfHif1eXUuXQvFl3HNe8
         h2zLdT4oEMvo9G3lsorkQRbmIIhTQoI8svUKVFTBjZViIYwTTVQMH/jXqU4dRWcItnMs
         PABIVMR7kcnTv51E/yobTyKlZXOF6LcYdk63zSmAsrBLhUNbwPKAb9q0jPL4/TrKUOZR
         hFXphOlGJt+zFvE219ExT1QK+dKbGobbN9lbLufHDAc4QhCCexAMcizaVPEssS48eR+U
         B3Bg5XcN5gfWS7MqQzOI+aizLVr461iHE2ejxutkS1l3UHBBhJnPrE/GOHF+ihU/xE7M
         SWqA==
In-Reply-To: <CACT4Y+Yk=bsS7Ti3PjeZm8yG_txt=orBztowHwddHRP_MzuTxw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Paul Moore <paul@paul-moore.com>, Ralf Baechle <ralf@linux-mips.org>, David Miller <davem@davemloft.net>, linux-hams <linux-hams@vger.kernel.org>, netdev <netdev@vger.kernel.org>, syzbot <syzbot+1bfc00ca3aabe5bcd4cb@syzkaller.appspotmail.com>, Eric Paris <eparis@parisplace.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Smalley <sds@tycho.nsa.gov>, selinux@vger.kernel.org, syzkaller-bugs <syzkaller-bugs@googlegroups.com>

On Thu, Jan 31, 2019 at 10:56 PM Dmitry Vyukov <dvyukov@google.com> wrote:
> Hi Paul,
>
> Searching for af_netrom across other syzbot bugs:
> https://groups.google.com/forum/#!searchin/syzkaller-bugs/af_netrom%7Csort:date
>
> I see at least:
> https://syzkaller.appspot.com/bug?extid=b0b1952f5864b4009b09
> https://syzkaller.appspot.com/bug?extid=febf3c50d4262e578b1c
> https://syzkaller.appspot.com/bug?extid=defa700d16f1bd1b9a05
>
> Which suggests there are some serious lifetime problems in netrom
> sockets. That would probably explain this crash as well.

This is supposed to be fixed by:
https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git/commit/?id=63346650c1a94a92be61a57416ac88c0a47c4327

Please let me know if it isn't.

Thanks.

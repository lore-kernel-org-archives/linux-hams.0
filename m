From: Paul Moore <paul@paul-moore.com>
Subject: Re: KASAN: use-after-free Read in selinux_netlbl_socket_setsockopt
Date: Fri, 1 Feb 2019 11:48:21 -0500
Message-ID: <CAHC9VhRkDLsQUAHUHYYKO=6vAZxDdw2Dwf+O1QKKQjckMNa1Rg@mail.gmail.com>
References: <0000000000003d28d10580b335cd@google.com> <CAHC9VhR9wwqVcnmAVcqfwmRuX02F8oMVzNNNQym-TeceHFLqOQ@mail.gmail.com>
 <CACT4Y+Yk=bsS7Ti3PjeZm8yG_txt=orBztowHwddHRP_MzuTxw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IubtPrPJEji2UXzIB3QJ5rB/j9k5X35j3mG98zoFdkQ=;
        b=oCL3zgqSXYMZ4XEa7eGkl0V0jiMkoSJJXTKXsYApovlqnLZ9pq9ep+8E0KZL7PZpxN
         1IYfUvXQkcRyGs8zOCPA857FxrE5zzNe7CGOuuQ66UjYEs4SwO32JBhmrBIctTelc7O0
         ehbraI5vEP4vjJJGmRI3Y175GRMZDodze7V21HMLNFgHbmzeZ4tmk9fxfu4DqQiqiRo9
         8syMgYhtXrx13LibrDW6kh15UGsOKqCVlsqNnIXg+MwQvE2RFKkjTTCmKAntQwfrO3rh
         PBjvARmJq5dPAXnRr9jjdRQyXcR0BLOHgFP1qgcAcWxZDcCchlxMv8fldQJolBXBL3li
         Glmw==
In-Reply-To: <CACT4Y+Yk=bsS7Ti3PjeZm8yG_txt=orBztowHwddHRP_MzuTxw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, David Miller <davem@davemloft.net>, linux-hams <linux-hams@vger.kernel.org>, netdev <netdev@vger.kernel.org>, syzbot <syzbot+1bfc00ca3aabe5bcd4cb@syzkaller.appspotmail.com>, Eric Paris <eparis@parisplace.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Smalley <sds@tycho.nsa.gov>, selinux@vger.kernel.org, syzkaller-bugs <syzkaller-bugs@googlegroups.com>

On Fri, Feb 1, 2019 at 1:26 AM Dmitry Vyukov <dvyukov@google.com> wrote:
> On Wed, Jan 30, 2019 at 10:30 PM Paul Moore <paul@paul-moore.com> wrote:
> >
> > On Wed, Jan 30, 2019 at 4:01 PM syzbot
> > <syzbot+1bfc00ca3aabe5bcd4cb@syzkaller.appspotmail.com> wrote:
> > >
> > > Hello,
> > >
> > > syzbot found the following crash on:
> > >
> > > HEAD commit:    62967898789d Merge git://git.kernel.org/pub/scm/linux/kern..
> > > git tree:       upstream
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=167fdef8c00000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=4fceea9e2d99ac20
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=1bfc00ca3aabe5bcd4cb
> > > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > >
> > > Unfortunately, I don't have any reproducer for this crash yet.
> > >
> > > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > > Reported-by: syzbot+1bfc00ca3aabe5bcd4cb@syzkaller.appspotmail.com
> > >
> > > 8021q: adding VLAN 0 to HW filter on device team0
> > > ==================================================================
> > > BUG: KASAN: use-after-free in selinux_netlbl_socket_setsockopt+0x49b/0x510
> > > security/selinux/netlabel.c:525
> > > Read of size 8 at addr ffff8880a63cf078 by task syz-executor3/18477
> > >
> > > CPU: 1 PID: 18477 Comm: syz-executor3 Not tainted 5.0.0-rc4+ #51
> > > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> > > Google 01/01/2011
> > > Call Trace:
> > >   __dump_stack lib/dump_stack.c:77 [inline]
> > >   dump_stack+0x1db/0x2d0 lib/dump_stack.c:113
> > >   print_address_description.cold+0x7c/0x20d mm/kasan/report.c:187
> > >   kasan_report.cold+0x1b/0x40 mm/kasan/report.c:317
> > >   __asan_report_load8_noabort+0x14/0x20 mm/kasan/generic_report.c:135
> > >   selinux_netlbl_socket_setsockopt+0x49b/0x510
> > > security/selinux/netlabel.c:525
> >
> > At first glance this seems odd.  The line above is simply
> > dereferencing sock->sk_security (getting the "sksec"), which we also
> > do higher up selinux_socket_setsockopt() via sock_has_perm().  Unless
> > somehow the socket is being released/freed in the middle of a
> > setsockopt() syscall this looks like maybe it's something else?
>
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

That definitely looks plausible.  While I'm not one to say it could
*never* be the SELinux/NetLabel code, I can say that the SELinux code
path in question hasn't changed in some time so I would be a little
surprised if it was suddenly broken.

> +netrom maintainers, does this explanation look plausible to you?
> should we dup this crash onto one of the other netrom bugs? and
> perhaps these netrom bugs across themselves too?

-- 
paul moore
www.paul-moore.com

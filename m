From: Cong Wang <xiyou.wangcong@gmail.com>
Subject: Re: KASAN: use-after-free Read in tomoyo_socket_sendmsg_permission
Date: Fri, 9 Aug 2019 10:29:00 -0700
Message-ID: <CAM_iQpVUZGrz_w2Mv1YzCZaOpi9WdhJAZm_=ZkWRame=6odoog@mail.gmail.com>
References: <000000000000a244b3058f9dc7d6@google.com> <4616850c-bf9e-d32a-3cfb-dbbaec5e17f2@I-love.SAKURA.ne.jp>
 <CACT4Y+Y7d29kA1fpS13QvSopknuChPANRc9evxeWiJd-zkyNug@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FUrszxfu12TYz4RSVAJdRYMRyY1/E4H2D0WlNLvKSkU=;
        b=kdszIFnCo6sZZCcRhyiqMMSZhlU8v9rxWv4gClrYhWcMSOFFyiNSwbUzdaAjCk0RGj
         jpZpkE50HqF55Vq3vd/tqgnYNVGXou0jM7Vw3SyRlfYcGheZBxa6TJuvs9P+k2xOzRxf
         ohVGmJ5t0+s6BU+tYqq/KEXmo9Tj3otw8BO8XS0cRmrarLZyZgTjQEcqOJMAw3z4FZiu
         mn6glH3aeIXR3mpcuOPegWlySanHChSNkE4WM/wJWZ6k0Hwins7b/RjM9rQWkCoZeL8u
         P0raqZHkk8UlURJTbOPbIzpoB2KMoTyigkkjH6MeGiz0NeoiTpWiCPYe3yK5BQgX41Dh
         g+0w==
In-Reply-To: <CACT4Y+Y7d29kA1fpS13QvSopknuChPANRc9evxeWiJd-zkyNug@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, syzbot <syzbot+b91501546ab4037f685f@syzkaller.appspotmail.com>, syzkaller-bugs <syzkaller-bugs@googlegroups.com>, Ralf Baechle <ralf@linux-mips.org>, linux-hams <linux-hams@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, netdev <netdev@vger.kernel.org>

On Fri, Aug 9, 2019 at 1:53 AM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Fri, Aug 9, 2019 at 12:08 AM Tetsuo Handa
> <penguin-kernel@i-love.sakura.ne.jp> wrote:
> >
> > On 2019/08/09 1:45, syzbot wrote:
> > > Hello,
> > >
> > > syzbot found the following crash on:
> > >
> > > HEAD commit:    107e47cc vrf: make sure skb->data contains ip header to ma..
> > > git tree:       net
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=139506d8600000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=4dba67bf8b8c9ad7
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=b91501546ab4037f685f
> > > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> >
> > This is not TOMOYO's bug. LSM modules expect that "struct sock" does not go away.
> >
> > Also, another use-after-free (presumably on the same "struct sock") was concurrently
> > inflight at nr_insert_socket() in net/netrom/af_netrom.c . Thus, suspecting netrom's bug.
>
> There is a number of UAFs/refcount bugs in nr sockets lately. Most
> likely it's the same issue them. Most of them were bisected to:
>
> commit c8c8218ec5af5d2598381883acbefbf604e56b5e
> Date: Thu Jun 27 21:30:58 2019 +0000
>   netrom: fix a memory leak in nr_rx_frame()

The UAF introduced by this commit has been fixed. There is
another UAF in netrom which exists long before the above commit,
it is not fixed. The last time I looked at it, it seems related to the
state machine used by netrom sockets, so it is not easy.

Thanks,

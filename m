From: Marco Elver <elver@google.com>
Subject: Re: UBSAN: array-index-out-of-bounds in decode_data
Date: Fri, 22 Jan 2021 08:23:47 +0100
Message-ID: <CANpmjNNkvG1vBMpsE9ORTrz4sVTdW3KW4CvHiaA_c7vDD5+B7A@mail.gmail.com>
References: <0000000000004c9e3505b96c58eb@google.com> <000000000000d0e9a705b96d4332@google.com>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q2cnartO5VSigxEhPJCDzt4hVZPHOHRMZn656f4qH9k=;
        b=g5QR4ZtUmJDjkmnh3DTuoxiYrAcmWMYo0up4e1Vv9+gyTD1rA7CO/gPK59cLO7cBmP
         V5NeWoLxVAsWM8y7enfl2uumiysE2Dcsglkds30d26UasufFkTRUsTQK4Ur3HPLlJqsN
         2IZhPV+gi35UDfmHX4ZzgdKCPnHyIPuwcU6+mOlqaCHm9zRmY0m34JVbB7O1evv6Pduk
         ZC+hp+hAES8ShaMt2OiD52gJmargt/U1oNTk3ApLBs6Vh2KquFfsAKg5PfoBOihh3IJr
         ial0jb05bA7B2C9LvmADd0iZbmwOplN5Z13hrJdeQKAChl1EupvbkUZi5A2+lcYtuoV8
         1t2g==
In-Reply-To: <000000000000d0e9a705b96d4332@google.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: syzbot <syzbot+70ba6cae2f44c82dcb76@syzkaller.appspotmail.com>
Cc: ajk@comnets.uni-bremen.de, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-hams@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Netdev <netdev@vger.kernel.org>, syzkaller-bugs <syzkaller-bugs@googlegroups.com>, Dmitry Vyukov <dvyukov@google.com>

On Thu, 21 Jan 2021 at 19:30, syzbot
<syzbot+70ba6cae2f44c82dcb76@syzkaller.appspotmail.com> wrote:
> syzbot has found a reproducer for the following issue on:
>
> HEAD commit:    9791581c Merge tag 'for-5.11-rc4-tag' of git://git.kernel...
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=13cd09a4d00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=39701af622f054a9
> dashboard link: https://syzkaller.appspot.com/bug?extid=70ba6cae2f44c82dcb76
> compiler:       gcc (GCC) 10.1.0-syz 20200507
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=133d8030d00000
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+70ba6cae2f44c82dcb76@syzkaller.appspotmail.com
>
> ================================================================================
> UBSAN: array-index-out-of-bounds in drivers/net/hamradio/6pack.c:845:16
> index 400 is out of range for type 'unsigned char [400]'
> CPU: 1 PID: 8 Comm: kworker/u4:0 Not tainted 5.11.0-rc4-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Workqueue: events_unbound flush_to_ldisc
> Call Trace:
>  __dump_stack lib/dump_stack.c:79 [inline]
>  dump_stack+0x107/0x163 lib/dump_stack.c:120
>  ubsan_epilogue+0xb/0x5a lib/ubsan.c:148
>  __ubsan_handle_out_of_bounds.cold+0x62/0x6c lib/ubsan.c:356
>  decode_data.part.0+0x2c8/0x2e0 drivers/net/hamradio/6pack.c:845

It looks like this might be due to a race condition; syzbot had
detected a data race in this code a while back, but it seems this was
never fixed: https://lore.kernel.org/lkml/000000000000bbb17d05a19540cd@google.com/

>  decode_data drivers/net/hamradio/6pack.c:965 [inline]
>  sixpack_decode drivers/net/hamradio/6pack.c:968 [inline]
>  sixpack_receive_buf drivers/net/hamradio/6pack.c:458 [inline]
>  sixpack_receive_buf+0xd8c/0x1320 drivers/net/hamradio/6pack.c:435
>  tty_ldisc_receive_buf+0x14a/0x190 drivers/tty/tty_buffer.c:465
>  tty_port_default_receive_buf+0x6e/0xa0 drivers/tty/tty_port.c:38
>  receive_buf drivers/tty/tty_buffer.c:481 [inline]
>  flush_to_ldisc+0x20d/0x380 drivers/tty/tty_buffer.c:533
>  process_one_work+0x98d/0x15f0 kernel/workqueue.c:2275
>  worker_thread+0x64c/0x1120 kernel/workqueue.c:2421
>  kthread+0x3b1/0x4a0 kernel/kthread.c:292
>  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296
> ================================================================================

Thanks,
-- Marco

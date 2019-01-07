From: Cong Wang <xiyou.wangcong@gmail.com>
Subject: Re: KASAN: use-after-free Read in nr_rx_frame
Date: Mon, 7 Jan 2019 11:02:08 -0800
Message-ID: <CAM_iQpW-Kx1okkDwcz=NVgm54PbNKOffCANML4Y-SuocpsjFiA@mail.gmail.com>
References: <000000000000c8d239057e77004f@google.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6AH9VpkMRBNmXPNdtI74G0Mk3aIffXeCFTmKG77tkhA=;
        b=vADPUMepm2klM+fdJUXr2t1dobIdIMvQiD20cL2mZNtzbll3cVYq6Ua0t5Yx5MGX2l
         ppx4rO0zx/tPlnPUeEzSX4WfYpHAsEB7a9jzXROzglLDWVmxkKTqpl3mb9aUMCXAas/B
         Lhchyvq+XPtUjJ9vjmoBpV48N2TIQL+qVtGszKrnXxy4wQPLTvdFuPHR/xwB2nslQJ7Q
         Eio7n7VEXnLiI2+JZ7VqMlP/DOllavScnuOw/zkw+0C8nE9wO0nfZZLCMafJv33hYCaI
         azu9UlzxISq3WAY2LwdxogCjlbbX35lmi0pA5ccTjYLpEp+QTlMlWFbS13Jo1K7675GZ
         x7WA==
In-Reply-To: <000000000000c8d239057e77004f@google.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: syzbot <syzbot+72f911fa716e011378ae@syzkaller.appspotmail.com>
Cc: David Miller <davem@davemloft.net>, linux-hams@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linux Kernel Network Developers <netdev@vger.kernel.org>, ralf@linux-mips.org, syzkaller-bugs <syzkaller-bugs@googlegroups.com>

#syz fix: netrom: fix locking in nr_find_socket()

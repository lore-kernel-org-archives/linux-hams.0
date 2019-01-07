From: Cong Wang <xiyou.wangcong@gmail.com>
Subject: Re: possible deadlock in nr_destroy_socket
Date: Mon, 7 Jan 2019 14:43:17 -0800
Message-ID: <CAM_iQpW8xgf1cfX-nCtoGfbvHBSucm4j3pctu1gUoR6qLBmk-A@mail.gmail.com>
References: <000000000000a7904f057e772492@google.com> <0000000000002ddfbe057ed0ffc9@google.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4oN+orXtG10b0JCzbMkxy50k1S0E95LkRNUAr7zyAGk=;
        b=mgroByBQz1oeidtr4rMvUhq18aBD1iP9D5A7O/zo26y95zRTZOGH1BSjrN7qmT+9Uw
         qzTNxX+tHaQju2mxnOwoAIP2PUhW1j41JkVWh4rqfD5UDo88Wl9NkXgjBsmqIyWTMv8x
         RiKoXqx76OhziOIwfrFipTWcbDeAidfEsiO7I+kBRMf6yXy3oH7wro+EiTVcTAjPVeob
         DR5kcWzweUf2C9Nj9KsIE9psaUQgffpES65c0YT/DlQ06Di83O0WX1qrOi8cQoDwFNfy
         7z+6nX1XTfOqgi+nzqi6IFEdgniMY4H0fc/Gdf52PwxwHLQZF/MYHb1ngRR84DTCzw8n
         elLA==
In-Reply-To: <0000000000002ddfbe057ed0ffc9@google.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: syzbot <syzbot+acfc1713819b146ae4b2@syzkaller.appspotmail.com>
Cc: David Miller <davem@davemloft.net>, linux-hams@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linux Kernel Network Developers <netdev@vger.kernel.org>, ralf@linux-mips.org, syzkaller-bugs <syzkaller-bugs@googlegroups.com>

syzbot confirmed the latest net tree is fine, so:

#syz fix: netrom: fix locking in nr_find_socket()

From: Peter Lafreniere <peter@n8pjl.ca>
Subject: Re: [syzbot] general protection fault in ax25_send_frame (2)
Date: Tue, 22 Nov 2022 21:24:15 +0000
Message-ID: <JJGUy6QkMUNauicWmgsVM8Q7NyGQpFad_3TlRqZsc0lwyR5e2jaNf6--kUKcNBcBpI2ZQ89SC5KtsuboH3g8PgbJqZsgvvVwxd4mKcMDCMk=@n8pjl.ca>
References: <000000000000da093705edbd2ca4@google.com> <_EStAmQIIbOHjwEqqb54KlnJy9ltngO0A__i8T4sJISE0rRSCaa8TlYBrwJ9AJPxJtrp27MNaXRISYfABlCoIWA1bze3-o2Oblw7PcCdxM4=@n8pjl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n8pjl.ca;
        s=protonmail; t=1669152259; x=1669411459;
        bh=9ofKl9oHCU42v/48JpRRjgnyMPeMwcajH/4A4AXLFDU=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=ZDAfSB4DCJAH+65PTSJ3aueEoK8pVz5ogbV5wHTi3jbxaGfnx/1sqO+Rw4BRvly2E
         NRicdFIso1eL5xnFS+cuqbwuQwzScQ+bHBgIj0g5o4QVgwQubWdzCylY/gf4Ql51tI
         63Q+329SOkqP+eHgfTfSIFgjeY36TTnvdzEydFmfyhy0lSP2grmMqfgnXEF95/sOLh
         LrSDRFVL4qNi00jVjmkl/aYW1+dP50Fag/ExpbGW/MLrOaZbJtH3H5K5kQeB3GAkm8
         FRM1RPv+EZKouB9k1OJkBYk2IDjJn7HtPKyNfpJtFPwAkfRvClQ4cQb0WTjfnpVNGz
         0qi7dRT16ObNw==
In-Reply-To: <_EStAmQIIbOHjwEqqb54KlnJy9ltngO0A__i8T4sJISE0rRSCaa8TlYBrwJ9AJPxJtrp27MNaXRISYfABlCoIWA1bze3-o2Oblw7PcCdxM4=@n8pjl.ca>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Peter Lafreniere <peter@n8pjl.ca>, syzbot <syzbot+4643bc868f47ad276452@syzkaller.appspotmail.com>, "syzbot+b25099bc0c49d0c2962e@syzkaller.appspotmail.com" <syzbot+b25099bc0c49d0c2962e@syzkaller.appspotmail.com>
Cc: davem@davemloft.net, edumazet@google.com, jreuter@yaina.de, kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, ralf@linux-mips.org, syzkaller-bugs@googlegroups.com

> Does anyone object to marking syzbot bugs
> "general protection fault in {ax25|rose}_send_frame (2)"
> as fixed?

As nobody seems to object to closing these reports:
#syz fix: rose: Fix NULL pointer dereference in rose_send_frame()

- Peter

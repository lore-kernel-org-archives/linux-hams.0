From: Cong Wang <xiyou.wangcong@gmail.com>
Subject: Re: KASAN: use-after-free Read in ax25_fillin_cb
Date: Sat, 29 Dec 2018 18:06:52 -0800
Message-ID: <CAM_iQpUoBiWTM77JD0LPXpU2Fykw4b+c4FNx4iSLjA5rOzgHjQ@mail.gmail.com>
References: <000000000000da8f65057e1ce530@google.com> <20181229173658.GA13856@yaina.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OJKFFczQ+bZuXrD/WI8ziv70382O9ZE78dw0/23jYWE=;
        b=qEl/FxYrBNDgvagUI04v5D6U7L88OB3rhWN1XMG0qOKoq8GssxnCuIvSwkeUFvq2mV
         GPc0Ux2peqeo0YhK3pwgIvvC1baM4jHlAVR5A5nL4WtlONEBmf5x/ZFe/aANeSRCJJ2p
         IHJ7u75Qntai/I45SMoH8A1q3GlSrr2SZnkdapjwJoVRJtwuCynDXBertrRDkqYDeoW/
         z4VBiCmE84qzO3+A5dGcj/t6qvh+VV+4AfNATZFvJiSNc5WAUKoNdigKs0Wjd/4WMGY1
         7YAQoqbge/44fewtLrF6cmSQhuIZ+oxtCRJ56sdMwRboKuFr8GKwJLcoU/XgDLvAYdRz
         n9Sw==
In-Reply-To: <20181229173658.GA13856@yaina.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Reuter <jreuter@yaina.de>
Cc: Linux Kernel Network Developers <netdev@vger.kernel.org>, David Miller <davem@davemloft.net>, linux-hams@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ralf@linux-mips.org, syzkaller-bugs <syzkaller-bugs@googlegroups.com>

Hi, Joerg

On Sat, Dec 29, 2018 at 2:06 PM Joerg Reuter <jreuter@yaina.de> wrote:
> Unfortunately, I'm on a low bandwidth connection right now. I'd be
> grateful if someone could create a patch. This is likely not a high
> impact issue (unpriviliged users can't set up or tear down interfaces),
> still it may cause hard to find memory corruptions.

I already sent a patch:
http://patchwork.ozlabs.org/patch/1019386/

Sorry for forgetting to Cc more people.

Thanks.

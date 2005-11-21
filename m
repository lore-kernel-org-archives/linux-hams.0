From: Peter <pc2a@pi4cc.nl>
Subject: Re: mkiss SMP-safe?
Date: Mon, 21 Nov 2005 15:48:32 +0000
Message-ID: <4381EC50.BF4CDCD5@pi4cc.nl>
References: <20051120004101.GB27244@cloud.net.au> <20051121123517.GA2698@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org

Ralf

I have 2.6.14-2-686-smp #1 SMP Mon Nov 14 14:56:10 UTC 2005 i686 GNU/Linux
installed from debian/unstable, but modprobe mkiss gives FATAL: Module mkiss not found.

So in my dual pentiumIII system, ax25  will not work.

Peter
PC2A



Ralf Baechle DL5RB wrote:

> On Sun, Nov 20, 2005 at 11:41:01AM +1100, Hamish Moffatt wrote:
>
> > Is mkiss safe on SMP systems?
> >
> > Debian appears to omit it from our x86 SMP kernels. I expect this is
> > just a leftover from old problems with the driver. If it's safe now,
> > I'll submit a bug report.
>
> It should be SMP-safe on 2.6.14-rc1 and newer.
>
> This is stricly speaking about mkiss; there are locking holes in the actual
> AX.25 stack - it's just that typical usage patterns tend to not trigger
> those.
>
> 73 de DL5RB op Ralf
>
> --
> Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html




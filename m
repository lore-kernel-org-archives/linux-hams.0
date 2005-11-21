From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: mkiss SMP-safe?
Date: Mon, 21 Nov 2005 12:35:17 +0000
Message-ID: <20051121123517.GA2698@linux-mips.org>
References: <20051120004101.GB27244@cloud.net.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20051120004101.GB27244@cloud.net.au>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Sun, Nov 20, 2005 at 11:41:01AM +1100, Hamish Moffatt wrote:

> Is mkiss safe on SMP systems?
> 
> Debian appears to omit it from our x86 SMP kernels. I expect this is
> just a leftover from old problems with the driver. If it's safe now,
> I'll submit a bug report.

It should be SMP-safe on 2.6.14-rc1 and newer.

This is stricly speaking about mkiss; there are locking holes in the actual
AX.25 stack - it's just that typical usage patterns tend to not trigger
those.

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21

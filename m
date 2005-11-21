From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: mkiss SMP-safe?
Date: Tue, 22 Nov 2005 07:29:39 +1100
Message-ID: <20051121202939.GA24366@cloud.net.au>
References: <20051120004101.GB27244@cloud.net.au> <20051121123517.GA2698@linux-mips.org> <4381EC50.BF4CDCD5@pi4cc.nl> <20051121161047.GA23578@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20051121161047.GA23578@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Mon, Nov 21, 2005 at 04:10:47PM +0000, Ralf Baechle DL5RB wrote:
> On Mon, Nov 21, 2005 at 03:48:32PM +0000, Peter wrote:
> 
> > I have 2.6.14-2-686-smp #1 SMP Mon Nov 14 14:56:10 UTC 2005 i686 GNU/Linux
> > installed from debian/unstable, but modprobe mkiss gives FATAL: Module mkiss not found.
> > 
> > So in my dual pentiumIII system, ax25  will not work.
> 
> But that's a Debian issue if they don't include all the needed modules ...

Yes. Debian's SMP kernel package is missing the mkiss module, but it's
included in the non-SMP. Hence my original question, which was triggered
by a private exchange between Peter and I.

I'll submit a bug report for Debian.

Thanks
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>

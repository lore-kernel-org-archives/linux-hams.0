From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: Timers in 2.6.x kernels
Date: Mon, 15 Mar 2004 14:38:25 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040315133825.GA3483@linux-mips.org>
References: <200403121310.02980.oh1mrr@nic.fi> <200403140801.27105.oh1mrr@nic.fi> <20040315005108.GA23580@linux-mips.org> <200403150806.46071.oh1mrr@nic.fi>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200403150806.46071.oh1mrr@nic.fi>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jarmo <oh1mrr@nic.fi>
Cc: linux-hams@vger.kernel.org

On Mon, Mar 15, 2004 at 08:06:45AM +0200, Jarmo wrote:

(Adding mailing list back to Cc list because your mail server doesn't accept
my mails)

> > Let me know how well this is working.  I've tested this as well as possible
> > without having 6pack hardware myself and that's not too much ...  Anyway,
> > I need testers before I send this patch upstream with good conscious and
> > that means it at least has to reach stability comparable to what's in stock
> > 2.6.4.
> >
> > This patch is also available on ftp.linux-mips.net in /pub/ham/6pack/.
> >
> > 73 de DO1GRB op Ralf
> 
> Hi Ralf
> 
> FB that someone tries to modernize these things.

Exactly.  6pack.c and mkiss are derived from slip.c which being an uncommon
protocol these days is also suffering from bitrot.  Many of the past
updates for 6pack.c and mkiss were following the path set by slip.c ...

Admitedly, there are few good examples for how to write a line discipline
like slip.  PPP is reasonably well written but a way too complex protocol
to be a good example, n_tty.c is too simple to be useful and the Linux tty
code is hard to read.  So in short, there's a lack of good and simple
examples, maybe one reason of several why this code was suffering from
bitrot so badly ...

> Now,how I patch my 6pack.c...Normally I do it by command..
> 
> cat "file-patch.diff" | patch -p0
> 
> With this patch that does not work.

Well, you didn't say how it failed so I can only guess ...

Well, the command is right asssuming your working directory was the root
directory of the kernel source tree like in this example:

  cd /usr/src/linux-2.6.4
  patch -p0 < 2.6.3-6pack-6.diff

Just in case if the patch file got corrupted, ftp it from ftp.linux-mips.net
in /pub/ham/6pack/.

  Ralf


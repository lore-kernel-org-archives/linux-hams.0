From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: ax25
Date: Mon, 26 Aug 2002 16:46:51 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020826164651.A18406@pull.privacy.nb.ca>
References: <Pine.LNX.4.33.0208252310120.1012-100000@n1uan.ampr.org> <02082606171202.02211@unix.pa3gcu> <05f301c24cd4$401e4ae0$0500a8c0@terrigal.net.au> <02082613125506.02211@unix.pa3gcu>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <02082613125506.02211@unix.pa3gcu>; from pa3gcu@zeelandnet.nl on Mon, Aug 26, 2002 at 01:12:55PM +0000
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Hart <mhart@terrigal.net.au>
Cc: linux-hams@vger.kernel.org

On Mon, Aug 26, 2002 at 01:12:55PM +0000, pa3gcu wrote:
> On Monday 26 August 2002 07:43, Michael Hart wrote:
> > Hi everyone,
> >
> > I have RedHat 7.3 and the kernel version is 2.4.18
> >
> > Could someone tell me what version of the ax25 tools/utilities and libs
> 
> Some has told you which files you need, i will add a somewhat important note 
> about kernel 2.4.18.
> Basicly the advice is dont use it with ax25 as it will hang your machine if 
> you try and down interfaces which use 'mkiss'.
> Upgrade to 2.4.19 where i belive that problem has been solved.
> 
> Now kernel 2.4.19 is far to big to send you in a mail, patch-2.4.19.bz2 is 
> 4591 Kb IMHO also too large for a mail.

Agreed, 2.4.19 is what linux hams should be using.

Kernels are available from many local mirrors, try your country code in place
of 'xx' (us for USA, uk for UK, au for Australia, etc.):
  http://www.xx.kernel.org/pub/linux/kernel/v2.4/

e.g. http://www.au.kernel.org/pub/linux/kernel/v2.4/linux-2.4.19.tar.bz2
For "down under" hams. The bz2 file is handled by bunzip2, and is 5MB smaller
than the gzip file.


Also build the libax25 first, before trying to build the tools and utilities.


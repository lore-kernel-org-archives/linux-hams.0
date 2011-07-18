From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: Can AX25 socket debug message be removed ?
Date: Mon, 18 Jul 2011 16:17:41 +0100
Message-ID: <20110718151740.GB5257@linux-mips.org>
References: <4E22E8FD.9000805@upmc.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4E22E8FD.9000805@upmc.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernard Pidoux <bernard.pidoux@upmc.fr>
Cc: linux-hams <linux-hams@vger.kernel.org>

On Sun, Jul 17, 2011 at 03:51:57PM +0200, Bernard Pidoux wrote:

> I am actually concerned by two remaining bugs in ROSE module :
> First, is the occurence of negative values for neighbour->use parameter
> from time to time.

In the past week I noticed various ROSE bugs including non-atomic
manipulation of variables which may explain this and other issues.  Some
may be hard to trigger but ROSE (and probably AX.25 and NETROM) are still
quite full of bugs.

> Second, is the impossibility to remove rose module after an application such
> as FPAC has initialized rose nodes and routes.

I never noticed that one - I tend to build my AX.25 test kernels with all
protocols and drivers built in most of the time.

Certain other kernel modules - IPv4 and IPv6 come to mind - cannot be
unloaded either.  It was deemed to much work for too little gain to make
that work.  I'm not sure if ROSE belongs into that group?  Probably not.

  Ralf

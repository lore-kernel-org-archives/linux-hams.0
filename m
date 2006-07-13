From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: netstat with rose support?
Date: Thu, 13 Jul 2006 14:36:33 +0100
Message-ID: <20060713133633.GA23187@linux-mips.org>
References: <620c90570607112014j5857afecs2e4a69eb4b1bc2e7@mail.gmail.com> <20060712231643.GA16205@linux-mips.org> <620c90570607130408w44cc5d59n508ab8268db24021@mail.gmail.com> <20060713112041.GA20294@linux-mips.org> <20060713122824.GA4729@lina.inka.de>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060713122824.GA4729@lina.inka.de>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernd Eckenfels <be-mail2006@lina.inka.de>
Cc: Chuck Hast <wchast@gmail.com>, linux-hams <linux-hams@vger.kernel.org>

On Thu, Jul 13, 2006 at 02:28:24PM +0200, Bernd Eckenfels wrote:

> > Yes, you just need to recompile net-tools.
> 
> I think the reason why rose is not enabled by default is because there are
> some header files (kernel, libc, other package - cant remeber) which are not
> available on all distributions.
> 
> This used to be also the case for AX25, but that changed with recent libcs.
>
> Running configure is enough to enable ROSE support. If your system misses
> some headers in that case, let me know so i can document this.

Glibc 2.1 which is over 7 years old will suffice which is why I proposed
the change at all.

Asking users to rebuild their software without an urgent need is just
raising the user pain level for distributions which go with the provided
defaults so I figured it's going to be the most productive approach to
convince you to change the defaults.

Patch below,

  Ralf

diff -ur net-tools-1.60.orig/config.in net-tools-1.60/config.in
--- net-tools-1.60.orig/config.in	Sun May 21 16:32:12 2000
+++ net-tools-1.60/config.in	Thu Jul 13 15:17:30 2006
@@ -54,7 +54,7 @@
 bool 'Appletalk DDP protocol family' HAVE_AFATALK y
 bool 'AX25 (packet radio) protocol family' HAVE_AFAX25 y
 bool 'NET/ROM (packet radio) protocol family' HAVE_AFNETROM y
-bool 'Rose (packet radio) protocol family' HAVE_AFROSE n
+bool 'Rose (packet radio) protocol family' HAVE_AFROSE y
 bool 'X.25 (CCITT) protocol family' HAVE_AFX25 y
 bool 'Econet protocol family' HAVE_AFECONET n
 bool 'DECnet protocol family' HAVE_AFDECnet n
@@ -71,7 +71,7 @@
 bool 'STRIP (Metricom radio) support' HAVE_HWSTRIP y
 bool 'Token ring (generic) support' HAVE_HWTR y
 bool 'AX25 (packet radio) support' HAVE_HWAX25 y
-bool 'Rose (packet radio) support' HAVE_HWROSE n
+bool 'Rose (packet radio) support' HAVE_HWROSE y
 bool 'NET/ROM (packet radio) support' HAVE_HWNETROM y
 bool 'X.25 (generic) support' HAVE_HWX25 y
 bool 'DLCI/FRAD (frame relay) support' HAVE_HWFR y

From: csmall@eye-net.com.au (Craig Small)
Subject: Re: Bug fix of ax25-tools-0.0.8 for ppc
Date: Wed, 19 Jun 2002 22:52:51 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020619125251.GB8358@eye-net.com.au>
References: <B9366788.32A3%lxham@hie.nibh.go.jp>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <B9366788.32A3%lxham@hie.nibh.go.jp>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ichiro Hieda JE1SGH <lxham@hie.nibh.go.jp>
Cc: linux-hams@vger.kernel.org

On Wed, Jun 19, 2002 at 04:53:28PM +0900, Ichiro Hieda JE1SGH wrote:
> I posted a bug information to Sourceforge before. When I tried to complie
> ax25-tools-0.0.8 on my ppc Linux, compile time error occurred. Today I have
> found the problem and solved it.
> 
> Three programs, mkiss.c, netromd.c and rip98d.c cause the error that won't
> have problem on x86 Linux.
> 
> One include line is necessary to the three routines;
> #include <sys/time.h>
> somewhere on the top portion of them. This solves the problem for ppc and I
> believe this is harmless to x86.

OK, added to CVS so it will be there for 0.0.9

  - Craig
-- 
Craig Small VK2XLZ  GnuPG:1C1B D893 1418 2AF4 45EE  95CB C76C E5AC 12CA DFA5
Eye-Net Consulting http://www.eye-net.com.au/        <csmall@eye-net.com.au>
MIEEE <csmall@ieee.org>                 Debian developer <csmall@debian.org>

From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: Embedded Linux and Amateur Radio
Date: Sat, 25 Jun 2005 21:36:02 +0200
Message-ID: <20050625193602.GA23792@linux-mips.org>
References: <42B84FB5.8090907@wa7v.com> <42BB49C4.10004@wa7v.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <42BB49C4.10004@wa7v.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brett Mueller <wa7v@wa7v.com>
Cc: Linux-Hams <linux-hams@vger.kernel.org>

On Thu, Jun 23, 2005 at 04:46:12PM -0700, Brett Mueller wrote:

> Ralf's MIPS port of (X)Net also opens up other possibilities, having the
> option of using it on SBCs based on the MIPS architecture.  He also
> correctly points out the inherent problems in the kernel AX.25 code, and
> I came to the realization that AX.25 support in the kernel would be
> unnecessary if (X)Net was running.

In the end I however consider usermode stack integrated with a whole set
of applications and server daemons such as Xnet a design mistake for
operating systems such as Linux that are pretending to have full blown and
universal network stacks and I'm working - time permitting - on getting
the kernel stack to work just as well.  Nontrivial, challenging - and
hopefully at some point - also rewarding ...

  Ralf

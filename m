From: Ralf Baechle DO1GRB <ralf@linux-mips.org>
Subject: Re: Odd Message when loading AX25 / NETROM Modules
Date: Thu, 10 Oct 2002 19:44:21 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021010194421.A1031@linux-mips.org>
References: <Pine.LNX.4.33.0210022152150.17242-100000@gb7lgs.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0210022152150.17242-100000@gb7lgs.ampr.org>; from g0lgs@gb7lgs.co.uk on Sat, Oct 05, 2002 at 10:14:50PM +0000
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stewart Wilkinson <g0lgs@gb7lgs.co.uk>
Cc: linux-hams@vger.kernel.org

On Sat, Oct 05, 2002 at 10:14:50PM +0000, Stewart Wilkinson wrote:

> /lib/modules/2.4.18/kernel/net/netrom/netrom.o will taint the kernel: no 
> license
> 
> When loading the AX25 or NETROM modules.
> 
> Anyone shed any light why ?

The 2.4.18 kernel doesn't have a MODULE_LICENSE("GPL"); statement in the
ax25, netrom, rose and other modules.  Ignore that, it's just a wrong
warning.  The problem is fixed in later 2.4 kernels and 2.5.

73 de DO1GRB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21

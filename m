From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: Kernel NULL pointer vulnerability:  AX.25 module
Date: Wed, 26 Aug 2009 18:16:30 +0100
Message-ID: <20090826171630.GB26668@linux-mips.org>
References: <Pine.LNX.4.64.0908141052000.9150@shell.eskimo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0908141052000.9150@shell.eskimo.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Curt, WE7U" <archer@eskimo.com>
Cc: linux-hams@vger.kernel.org

On Fri, Aug 14, 2009 at 10:59:00AM -0700, Curt, WE7U wrote:

> FYI:  My CentOS 5.x systems appear to be ok.  CentOS 4.x systems are
> supposed to be vulnerable.  My OpenSuSE 11.x systems appear to be
> vulnerable but I'm only running AX.25 on one machine and only
> occasionally.  Note that there's a type in the net-pf-24 line below
> also.  Read the LWM link or Google for additional info.  --we7u
>
> ---------- Forwarded message ----------
> Date: Fri, 14 Aug 2009 14:24:39 +0200
> From: Marcus Moeller <mail@marcus-moeller.de>
> To: CentOS mailing list <centos@centos.org>
> Subject: [CentOS] Kernel NULL pointer vulnerability
>
> Hi all.
>
> Julien Tinnes and Tavis Ormandy from the Google Security Team have
> recently found a Linux kernel vulnerability which affects all 2.4 and
> 2.6 kernels since 2001 on all architectures. Please read the
> announcement on LWM: http://lwn.net/Articles/347006/ for further
> information about the vulnerability and the exploit which has been
> provided by Brad Spengler (you will find updates on his twitter site).
>
> The only workaroud that is known to me atm is to disable the affected
> kernel modules (which should be handled with care as some of them may
> provide necessary functionality in your operating environment):
>
> echo "alias net-pf-3 off # Amateur Radio AX.25

No.  AX.25 had the .sendpage methode in its ax25_proto_ops so is not
vulnerable to this attack.  The same is true for NETROM and ROSE and for
all kernel versions since the sendpage method was introduced in 2.4.4.

Which btw doesn't changes why AX.25 should not be used on mission
critical system.  There is a sufficient number of locking issues in the
code that I recommend avoiding that.  These issues can only result in
panic, hangs or malfunction of the protocol state engine or minor resource
wastage but no priviledge escalation afaics.

  Ralf

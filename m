From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: request for AX25 help
Date: Fri, 23 Jan 2004 03:15:26 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040123031526.A7617@pull.privacy.nb.ca>
References: <001601c3e125$b93e4010$554689d8@oem7paq6co5hph>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <001601c3e125$b93e4010$554689d8@oem7paq6co5hph>; from wb8zrl@avalon.net on Thu, Jan 22, 2004 at 08:23:22PM -0000
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Vavra <wb8zrl@avalon.net>
Cc: Linux-Hams <linux-hams@vger.kernel.org>

On Thu, Jan 22, 2004 at 08:23:22PM -0000, Tom Vavra wrote:
> I'm trying to get AX25 working on a RedHat 7.3 system.  The following
> packages are on the system.
> 
> ax25 is not compiled into the kernel so I insmod   ax25.o and   netrom.o
> 
> I'm only trying to drive a kiss tnc, and provide ax25 and netrom.  When
> trying to run kissattach i get
> 
> # /usr/sbin/kissattach /dev/ttyS1 port1 44.1.1.1
> kissattach: Error setting line discipline: TIOCSETD: Invalid argument
> Are you sure you have enabled MKISS support in the kernel
> or, if you made it a module, that the module is loaded?
> 
> Any idea what I'm doing wrong?
> Are the kernel and packages a good match?

You need the mkiss module loaded as well,
	modprobe mkiss

The mkiss module is not included with Red Hat Linux if I recall correctly,
so you will have to rebuild your kernel. There is a Kernel-HOWTO avalilable
to help guide your through the process if you are not familiar with it.

I will note that Red Hat Linux 7.3 is beyond the "end-of-life" support
from Red Hat Inc., you might want to consider Red Hat Linux 9 or Fedora
core 1 as possible replaces in the near future.

Good luck, and I hope that helps,
-ve3tix

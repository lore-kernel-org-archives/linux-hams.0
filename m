From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: RedHat 7.3 and AX25
Date: Sat, 7 Sep 2002 16:24:04 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020907162404.A19510@pull.privacy.nb.ca>
References: <Pine.LNX.4.33.0209070059470.137-100000@gb7lgs.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0209070059470.137-100000@gb7lgs.ampr.org>; from g0lgs@gb7lgs.co.uk on Sat, Sep 07, 2002 at 01:03:43AM +0000
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stewart Wilkinson <g0lgs@gb7lgs.co.uk>
Cc: linux-hams@vger.kernel.org

On Sat, Sep 07, 2002 at 01:03:43AM +0000, Stewart Wilkinson wrote:
> Hi,
> 
> I seem to have a problem using kissattach with the 2.4.18-3 kernel. I have
> rebuilt a kernel with MKISS support on (ie: CONFIG_MKISS=y in .config),
> yet when I try to run kissattach I get:
> 
> kissattach: Error setting line discipline: TIOCSETD: Invalid argument
> Are you sure you have enabled MKISS support in the kernel
> or, if you made it a module, that the module is loaded?
> 
> Any Idea's ??

This won't work well without AX.25 also being in the kernel. BUT it is 
much much better to use KISS as a module (CONFIG_MKISS=m) instead.

mv .config .config.old
sed 's/CONFIG_MKISS=y/CONFIG_MKISS=m/' <.config.old >.config
make modules
make modules-install
make bzImage (only needed to rebuild kernel without mkiss in it)
...whatever steps you use to install new kernel 
...and update MBR (i.e. run lilo)

reboot

depmod -a

/sbin/modprobe ax25
/sbin/modprobe mkiss
kissattach ...

I would recommend building a kernel from generic 2.4.19 sources 
(www.us.kernel.org) rather than RedHat's kernel source rpm unless you need to 
use RedHat's patches for some non-standard reason. 2.4.19 has some fixes
for amateur radio.

I hope that helps,
-ve1mct

From: Wilbert Knol <zl2bsj@zl2tze.myip.org>
Subject: Re: patch
Date: Thu, 23 May 2002 23:33:32 +1200 (NZST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0205232256460.2607-100000@zl2bsj.ampr.org>
References: <NCBBKBAJDJIPKFIAFBKLCEJBEFAC.wilson.hein@verizon.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <NCBBKBAJDJIPKFIAFBKLCEJBEFAC.wilson.hein@verizon.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Wed, 22 May 2002, Wilson G. Hein wrote:

> Hi,
> 
> Trying to patch kerbel 2.4.18 with patch 2.4.19-pre2. Can someone tell me in
> what RedHat package the patch command is in. Apparently I don't have it

On a related note...I am not sure if this applies to the kernel sources 
Red Hat distibutes...but I haven't had much luck applying official kernel 
patches against 'distributed' kernel source trees.

The patch program generated *lots* of complaints. My impression was, that 
most (if not all)  of those errors related to architectures such as SUN, 
PPC, Alpha etc etc, not supported by my particular distro.

I ended up downloading the 'official' kernel sources from kernel.org..the 
patches worked fine against them.

Also, I found I had to rename the to-be-patched source tree  to 'linux/' 
for the patches to work.

On the subject of rolling your own kernel...I find it handy to edit the 
top-level Makefile immediately after the 'make menuconfig' step. At the 
top, you can set a variable. The line looks like this:

EXTRAVERSION = pre99

...which appends pre99 (just an example) to your kernel version, and also 
to the modules directory

After the 'make modules-install' you can then do a 'make install' which 
copies the new stuff to /boot...this saves you having to copy bzImage and 
setting symlinks, etc, etc. 

I haven't seen the 'EXTRAVERSION' and 'make install' things documented 
anywhere (perhaps they are, in RH?), and have found them very handy. As a 
linux-ham, I am always home-brewing kernels.


Wilbert, ZL2BSJ



From: Richard Adams <pa3gcu@zeelandnet.nl>
Subject: Re: patch
Date: Thu, 23 May 2002 16:01:47 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <0205231601471W.27213@unix.pa3gcu>
References: <Pine.LNX.4.44.0205232256460.2607-100000@zl2bsj.ampr.org>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0205232256460.2607-100000@zl2bsj.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Wilbert Knol <zl2bsj@zl2tze.myip.org>, linux-hams@vger.kernel.org

On Thursday 23 May 2002 11:33, Wilbert Knol wrote:
> On Wed, 22 May 2002, Wilson G. Hein wrote:
> > Hi,
> >
> > Trying to patch kerbel 2.4.18 with patch 2.4.19-pre2. Can someone tell me
> > in what RedHat package the patch command is in. Apparently I don't have
> > it
>
> On a related note...I am not sure if this applies to the kernel sources
> Red Hat distibutes...but I haven't had much luck applying official kernel
> patches against 'distributed' kernel source trees.
>
> The patch program generated *lots* of complaints. My impression was, that
> most (if not all)  of those errors related to architectures such as SUN,
> PPC, Alpha etc etc, not supported by my particular distro.
>
> I ended up downloading the 'official' kernel sources from kernel.org..the
> patches worked fine against them.

You said the magic word, "offical kernel source" and offical patches, they go 
together, i can comment on your redhat probs as i always install kernel sorce 
from ftp.kernel.org (patches as well).
 
>
> Also, I found I had to rename the to-be-patched source tree  to 'linux/'
> for the patches to work.

No need, patch has the -p option, all you need to do is go into the dir where 
your linux sorce is and type
gzip -cd /path/to/patch-xx.xx.gz | patch -p1 -s
-s is silent and will only show rejected hunks of patches of which there 
should be none if it was a proper patch for the peroper kernel source.
(At least thats generaly accepted as the case).

>
> On the subject of rolling your own kernel...I find it handy to edit the
> top-level Makefile immediately after the 'make menuconfig' step. At the
> top, you can set a variable. The line looks like this:
>
> EXTRAVERSION = pre99
>
> ...which appends pre99 (just an example) to your kernel version, and also
> to the modules directory
>
> After the 'make modules-install' you can then do a 'make install' which
> copies the new stuff to /boot...this saves you having to copy bzImage and
> setting symlinks, etc, etc.

Doing a make install is according to some (including me) not a good idea 
"unless" you take steps to make sure your old kernel will boot via lilo (or 
whatever bootloader is used).

I always advise coping arch/i386/boot/bzImage to /boot/vmlinuz-xx.xx-prex
and adding a new entry in /ect/lilo.conf then trying lilo with the -t(est) 
option if all is ok then issue /sbin/lilo to install the new kernel.

I have had make install go bad on me and left me to boot with floppy's.
As a matter of fact a better idea when experimenting with new kernels is to 
use make bzdisk and boot from floppy first, that way there is no need to use 
lilo and risk an unbootable system (at the extream of corse).

>
> I haven't seen the 'EXTRAVERSION' and 'make install' things documented
> anywhere (perhaps they are, in RH?), and have found them very handy. As a
> linux-ham, I am always home-brewing kernels.

There is no mention in the Kernel-HOWTO (AFAIK) on the extraversion, there is 
on my home page tho. It explains all and more that i have just disscussed.

I hope this all helps.

>
>
> Wilbert, ZL2BSJ

-- 
Regards Richard
pa3gcu@zeelandnet.nl
http://people.zeelandnet.nl/pa3gcu/


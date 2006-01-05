From: "Mike McCarthy, W1NR" <lists@w1nr.net>
Subject: RE: 2.6.13 mkiss update?
Date: Wed, 4 Jan 2006 19:16:44 -0500
Message-ID: <000a01c6118d$4f4c76f0$3849a8c0@lan.w1nr.net>
References: <F207312C-FF7D-49CD-95AB-BDC8E021EF9C@oz.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <F207312C-FF7D-49CD-95AB-BDC8E021EF9C@oz.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Bob Nielsen' <nielsen@oz.net>, linux-hams@vger.kernel.org

I have no problem with kernel hacking and compilation when it involves a
desktop machine that is used for personal use, development and testing.
However, my production server is my DX cluster node, email server, WEB
server for multiple domains, time server, etc.  I have a real hard time
using a kernel outside of the normal support channels on production machines
that are exposed to the internet.  Currently, SuSE 10.0 ships with 2.6.13.
If the maintainer gets bug fixes (like the broken AX25 support) into the CVS
for it, then SuSE should pick them up for the next live update.  That would
make me real happy.  From what I have read, it did not get into .13 and may
not.  Looks like I will need to wait until 10.1.  For now, I tried the SuSE
kotd (kernel of the day) build 2.6.15 but loading the AX25 and mkiss modules
with that patched into 10.0 causes a hard lockup of the whole machine.  Next
I will try 10.1 alpha4 to see if that works.  Hopefully 10.1 will be better.

For now, my production machine will stay on SuSE 9.3.

Mike, W1NR


-----Original Message-----
From: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org] On Behalf Of Bob Nielsen
Sent: Wednesday, January 04, 2006 4:19 PM
To: linux-hams@vger.kernel.org
Subject: Re: 2.6.13 mkiss update?

With any distribution (I think) you do not need to use their kernel
(although sometimes there desirable patches).  For instance, I am running
Ubuntu on both my Linux machines, using 2.6.14.2 kernels, although Ubuntu
5.10 comes with 2.6.12.  I took the Ubuntu
config-2.6.12 file and copied it to /usr/src/linux/.config, ran 'make
menuconfig' and compiled my new kernels.  I think some of the distributions
even package up their standard patches, although the stock kernel works fine
for me (I needed ndiswrapper on one of the machines to use my unsupported
802.11g PCI card, but was able to find a Ubuntu package which allowed me to
create the module with my new kernel).  I have been compiling my own kernels
for about 11 years (when it was necessary to do so in order to  have AX.25
support) and have never run into insurmountable problems.

73, Bob N7XY

On Jan 4, 2006, at 12:46 PM, oz6bl@amsat.dk wrote:

> Bob Nielsen wrote:
>> I thought it was the ax25 module that was broken.  In any case,
>> 2.6.14 (and presumably 2.6.15) works, so you could try one of them.
>> If there is some other reason why you need 2.6.13, ...
>
> The 'problem' with Suse is that once they have made a release they 
> stick to the kernel version with which the original release was made.
> They will
> provide security updates but not kernel updates. For this very reason 
> I'm seriously considering switching to e.g. Gentoo, because there you 
> can update the kernel. I use Gentoo on my router/gateway but am still 
> on Suse with my workstation.
>
> Best 73 de Bent/OZ6BL
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux- hams" 
> in the body of a message to majordomo@vger.kernel.org More majordomo 
> info at  http://vger.kernel.org/majordomo-info.html
>

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


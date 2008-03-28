From: "IT2 Stuart Blake Tener, USNR" <teners@bh90210.net>
Subject: Re: kernel 2.6.24.3 patches for AX25
Date: Thu, 27 Mar 2008 19:39:14 -0700
Message-ID: <C411A862.1EEA6%teners@bh90210.net>
References: <47EC2AC6.7020509@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <47EC2AC6.7020509@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernard Pidoux F6BVP <f6bvp@free.fr>, List for LINUX ROSE/FPAC network switch <fpac@f6fbb.org>, List for the LINUX version of FBB <xfbb@f6fbb.org>, linux-hams <linux-hams@vger.kernel.org>

Mr. Pidoux, et alia:

    Are these patches bound to become part of the Linux kernel in a future
Linux Kernel release or are these patches not yet blessed to be put into the
next Linux Kernel release or never will be?


V/R and 73,

Stuart, N3GWG


On 3/27/08 4:16 PM, "Bernard Pidoux F6BVP" <f6bvp@free.fr> wrote:

> Hi All,
> 
> Participating in AX25, ROSE, FPAC, and LinFBB debugging, I want to share
> with you the recent progress accomplished with Linux kernel.
> 
> While the code is not yet fully debugged, there have been significant
> progress and I summarized them into two patches that, when applied to
> kernel 2.6.24.3, lead to a much more stable system.
> 
> The two patches must be applied one after the other.
> 
> First one is here :
> http://f6bvp.free.fr/logiciels/ax25/patch-2.6.24.3-net_rose_ax25
> 
> I have already reported it to a few OMs running FPAC application.
> It was here : 
> http://f6bvp.free.fr/logiciels/rose-fpac/patch-2.6.24.3.ax25.tgz
> 
> Do not try to apply the first patch if the original kernel source have
> been already patched.
> 
> Second patch is here :
> http://f6bvp.free.fr/logiciels/ax25/patch-2.6.24.3-net_rose_ax25_plus_plus
> 
> I am running patched kernels on three different architectures with AX25
> applications and the systems are quite stable.
> One of them has even a core2 duo CPU and the kernel was compiled with
> SMP option for multiple CPUs.
> 
> To apply the patches, you need kernel 2.6.24.3 sources installed and it
> is required that you have already succeeded in compiling the kernel with
> ax25 module.
> 
> Save the above files into directory /usr/src
> cd into that directory.
> 
> Kernel source directory is :
> 
> /usr/src/linux-2.6.24.3
> 
> Make the following symbolic links if not already present :
> ln -s linux-2.6.24.3 linux
> ln -s linux a
> ln -s linux b
> 
> Then apply the patches by typing the following commands :
> 
> patch -p0 <  patch-2.6.24.3-net_rose_ax25
> 
> patch -p0 <  patch-2.6.24.3-net_rose_ax25_plus_plus
> 
> 
> note: in -p0 above 0 is a zero (not letter O).
> 
> The cd into linux.
> Type the command :
> 
>   make
> 
> 
> When compilation is finished, type the command :
> 
>   make modules_install
> 
> And finally, type :
> 
>   make install
> 
> Then reboot your system.
> 
> You are encouraged to send any bug report to linux-hams list.
> 
> 
> 73 de Bernard, f6bvp
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 

Very Respectfully,

IT2 Stuart Blake Tener, USNR
Las Vegas, NV / Beverly Hills, CA / Philadelphia, PA / Washington, DC
Amateur Radio Call Sign: N3GWG (Extra) / Marine Radio Operator Permit (MROP)
email: teners@bh90210.net (also carbon copies to my Blackberry)
phone: +(1) 310.358.0202 (Beverly Hills, CA, forwards to mobile phone)
phone: +(1) 215.338.6005 (Philadelphia, PA, voice mail only)
E-Fax: +(1) 915.773.0935 (Telecopier, fax to email gateway)

Military emails (checked monthly until remote NMCI access is secured)
NIPRNET: stuart.tener@navy.mil
NRO:     teners@nro.mil
DOE:     teners@nv.doe.gov
SIPRNET: NONE
TS/SCI:  tenerstu@nro.ic.gov (GWAN)
TS/SCI:  stuart.b.tener@nga.ic.gov

Confidentiality Notice: This e-mail message, including any attachments, is
for the sole use of the intended recipient(s) and may contain confidential
and/or privileged information, though strictly at the UNCLASSIFIED level.
Any unauthorized review, use, disclosure or distribution is prohibited. If
you are not the intended recipient, please contact the sender by reply
e-mail and destroy all copies of the originate message.




From: Bernard Pidoux F6BVP <f6bvp@free.fr>
Subject: kernel 2.6.24.3 patches for AX25
Date: Fri, 28 Mar 2008 00:16:22 +0100
Message-ID: <47EC2AC6.7020509@free.fr>
References: <4787000B.3000606@exemail.com.au>	<47911A1A.5010107@ccr.jussieu.fr>	<47911E64.4080201@exemail.com.au>	<000901c85a23$f00a6f30$d01f4d90$@rr.com>	<47913227.3070504@exemail.com.au>	<620c90570801182002w7575fe39j4e94d982b945a24a@mail.gmail.com>	<479179C8.70505@exemail.com.au>	<4791CC2F.5060307@ccr.jussieu.fr>	<47926437.3020005@exemail.com.au>	<47928684.8090108@ccr.jussieu.fr> <47B2292A.7020001@free.fr>	<47B22D82.1060206@exemail.com.au>	<47B30AC4.9050306@earthlink.net> <47C07B3B.4000700@free.fr>	<47CD71B7.6060606@earthlink.net> <47D3B37C.5050901@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <47D3B37C.5050901@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: List for LINUX ROSE/FPAC network switch <fpac@f6fbb.org>, List for the LINUX version of FBB <xfbb@f6fbb.org>, linux-hams <linux-hams@vger.kernel.org>

Hi All,

Participating in AX25, ROSE, FPAC, and LinFBB debugging, I want to share 
with you the recent progress accomplished with Linux kernel.

While the code is not yet fully debugged, there have been significant 
progress and I summarized them into two patches that, when applied to 
kernel 2.6.24.3, lead to a much more stable system.

The two patches must be applied one after the other.

First one is here :
http://f6bvp.free.fr/logiciels/ax25/patch-2.6.24.3-net_rose_ax25

I have already reported it to a few OMs running FPAC application.
It was here : 
http://f6bvp.free.fr/logiciels/rose-fpac/patch-2.6.24.3.ax25.tgz

Do not try to apply the first patch if the original kernel source have 
been already patched.

Second patch is here :
http://f6bvp.free.fr/logiciels/ax25/patch-2.6.24.3-net_rose_ax25_plus_plus

I am running patched kernels on three different architectures with AX25
applications and the systems are quite stable.
One of them has even a core2 duo CPU and the kernel was compiled with 
SMP option for multiple CPUs.

To apply the patches, you need kernel 2.6.24.3 sources installed and it 
is required that you have already succeeded in compiling the kernel with 
ax25 module.

Save the above files into directory /usr/src
cd into that directory.

Kernel source directory is :

/usr/src/linux-2.6.24.3

Make the following symbolic links if not already present :
ln -s linux-2.6.24.3 linux
ln -s linux a
ln -s linux b

Then apply the patches by typing the following commands :

patch -p0 <  patch-2.6.24.3-net_rose_ax25

patch -p0 <  patch-2.6.24.3-net_rose_ax25_plus_plus


note: in -p0 above 0 is a zero (not letter O).

The cd into linux.
Type the command :

  make


When compilation is finished, type the command :

  make modules_install

And finally, type :

  make install

Then reboot your system.

You are encouraged to send any bug report to linux-hams list.


73 de Bernard, f6bvp

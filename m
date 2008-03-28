From: Pidoux <f6bvp@free.fr>
Subject: Re: kernel 2.6.24.3 patches for AX25
Date: Fri, 28 Mar 2008 19:19:53 +0100
Message-ID: <47ED36C9.2030901@free.fr>
References: <C411A862.1EEA6%teners@bh90210.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <C411A862.1EEA6%teners@bh90210.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "IT2 Stuart Blake Tener, USNR" <teners@bh90210.net>
Cc: List for LINUX ROSE/FPAC network switch <fpac@f6fbb.org>, List for the LINUX version of FBB <xfbb@f6fbb.org>, linux-hams <linux-hams@vger.kernel.org>

IT2 Stuart Blake Tener, USNR a =E9crit :
> Mr. Pidoux, et alia:
>
>     Are these patches bound to become part of the Linux kernel in a f=
uture
> Linux Kernel release or are these patches not yet blessed to be put i=
nto the
> next Linux Kernel release or never will be?
>
>
> V/R and 73,
>
> Stuart, N3GWG
>
>
> On 3/27/08 4:16 PM, "Bernard Pidoux F6BVP" <f6bvp@free.fr> wrote:
>
>  =20
>> Hi All,
>>
>> Participating in AX25, ROSE, FPAC, and LinFBB debugging, I want to s=
hare
>> with you the recent progress accomplished with Linux kernel.
>>
>> While the code is not yet fully debugged, there have been significan=
t
>> progress and I summarized them into two patches that, when applied t=
o
>> kernel 2.6.24.3, lead to a much more stable system.
>>
>> The two patches must be applied one after the other.
>>
>> First one is here :
>> http://f6bvp.free.fr/logiciels/ax25/patch-2.6.24.3-net_rose_ax25
>>
>> I have already reported it to a few OMs running FPAC application.
>> It was here :=20
>> http://f6bvp.free.fr/logiciels/rose-fpac/patch-2.6.24.3.ax25.tgz
>>
>> Do not try to apply the first patch if the original kernel source ha=
ve
>> been already patched.
>>
>> Second patch is here :
>> http://f6bvp.free.fr/logiciels/ax25/patch-2.6.24.3-net_rose_ax25_plu=
s_plus
>>
>> I am running patched kernels on three different architectures with A=
X25
>> applications and the systems are quite stable.
>> One of them has even a core2 duo CPU and the kernel was compiled wit=
h
>> SMP option for multiple CPUs.
>>
>> To apply the patches, you need kernel 2.6.24.3 sources installed and=
 it
>> is required that you have already succeeded in compiling the kernel =
with
>> ax25 module.
>>
>> Save the above files into directory /usr/src
>> cd into that directory.
>>
>> Kernel source directory is :
>>
>> /usr/src/linux-2.6.24.3
>>
>> Make the following symbolic links if not already present :
>> ln -s linux-2.6.24.3 linux
>> ln -s linux a
>> ln -s linux b
>>
>> Then apply the patches by typing the following commands :
>>
>> patch -p0 <  patch-2.6.24.3-net_rose_ax25
>>
>> patch -p0 <  patch-2.6.24.3-net_rose_ax25_plus_plus
>>
>>
>> note: in -p0 above 0 is a zero (not letter O).
>>
>> The cd into linux.
>> Type the command :
>>
>>   make
>>
>>
>> When compilation is finished, type the command :
>>
>>   make modules_install
>>
>> And finally, type :
>>
>>   make install
>>
>> Then reboot your system.
>>
>> You are encouraged to send any bug report to linux-hams list.
>>
>>
>> 73 de Bernard, f6bvp
>>    =20
Most of the AX25 patches above are to be incorporated in a future kerne=
l=20
release.
They were discussed on netdev list and approved by Dave Miller.
There is on:y one that is not yet official, as it is very new and the=20
bug it addresses is not yet completily solved.
However, like all others, its purpose is to remove causes of kernel=20
panics or crash.
And it works.

By informing refered lists about these patches my goal was to help OMs=20
having crash problems when using intensively AX25 applications.
They may safely upgrade to kernel.2.6.24.3 and use the patches provided=
=2E
You can also wait a month or two and you will have those patch included=
=20
in kernel 2.6.25 or 2.6.26.

Other part of the patches are related to ROSE module and not yet in the=
=20
future kernels cooker.
I built it after months of intensive experiments, in order to improve=20
ROSE routing.
I submitted the patches for ROSE to linux development Netdev list and=20
Ralf DL5RB.
I hope that most of them will be accepted for they give us good results=
=20
with FPAC a packet router based on ROSE protocole.


73 de Bernard, f6bvp

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

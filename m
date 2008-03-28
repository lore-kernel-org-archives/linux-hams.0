From: Pidoux <f6bvp@free.fr>
Subject: Re: kernel 2.6.24.3 patches for AX25
Date: Fri, 28 Mar 2008 22:31:07 +0100
Message-ID: <47ED639B.9010805@free.fr>
References: <4791CC2F.5060307@ccr.jussieu.fr> <47926437.3020005@exemail.com.au> <47928684.8090108@ccr.jussieu.fr> <47B2292A.7020001@free.fr> <47B22D82.1060206@exemail.com.au> <47B30AC4.9050306@earthlink.net> <47C07B3B.4000700@free.fr> <47CD71B7.6060606@earthlink.net> <47D3B37C.5050901@free.fr> <47EC2AC6.7020509@free.fr> <20080328162140.GC22445@flying-gecko.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20080328162140.GC22445@flying-gecko.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Patrick Ouellette <ne4po@arrl.net>
Cc: List for LINUX ROSE/FPAC network switch <fpac@f6fbb.org>, List for the LINUX version of FBB <xfbb@f6fbb.org>, linux-hams <linux-hams@vger.kernel.org>

Patrick Ouellette a =E9crit :
> On Fri, Mar 28, 2008 at 12:16:22AM +0100, Bernard Pidoux F6BVP wrote:
>  =20
>> Hi All,
>>
>> Participating in AX25, ROSE, FPAC, and LinFBB debugging, I want to s=
hare =20
>> with you the recent progress accomplished with Linux kernel.
>>
>> While the code is not yet fully debugged, there have been significan=
t =20
>> progress and I summarized them into two patches that, when applied t=
o =20
>> kernel 2.6.24.3, lead to a much more stable system.
>>
>> The two patches must be applied one after the other.
>>
>> First one is here :
>> http://f6bvp.free.fr/logiciels/ax25/patch-2.6.24.3-net_rose_ax25
>>
>> I have already reported it to a few OMs running FPAC application.
>> It was here : =20
>> http://f6bvp.free.fr/logiciels/rose-fpac/patch-2.6.24.3.ax25.tgz
>>
>> Do not try to apply the first patch if the original kernel source ha=
ve =20
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
h =20
>> SMP option for multiple CPUs.
>>
>>    =20
>
> Could you share what particular problems the patches address?  Maybe
> send the changelog entries to the list?
>
> Thanks & 73,
>
> Pat NE4PO
> .
>  =20
When running ax25 applications, linux 2.6 kernels suffers from chronic=20
instability leading to kernel panic and system reboot or sudden blockad=
e.
The above mentionned AX25 patches remove the already identified causes=20
of kernel locking.
Others are aimed at ROSE network  packet routing improvements.
You may find all the information you want about these patches on Linux=20
netdev mailing list archive (MARC) site
 http://marc.info/?l=3Dlinux-netdev&r=3D1&w=3D2
and search for AX25 or ROSE keyword to select the threads.


73 de Bernard, f6bvp

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

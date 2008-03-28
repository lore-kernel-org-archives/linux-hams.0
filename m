From: Patrick Ouellette <ne4po@arrl.net>
Subject: Re: kernel 2.6.24.3 patches for AX25
Date: Fri, 28 Mar 2008 12:21:40 -0400
Message-ID: <20080328162140.GC22445@flying-gecko.net>
References: <4791CC2F.5060307@ccr.jussieu.fr> <47926437.3020005@exemail.com.au> <47928684.8090108@ccr.jussieu.fr> <47B2292A.7020001@free.fr> <47B22D82.1060206@exemail.com.au> <47B30AC4.9050306@earthlink.net> <47C07B3B.4000700@free.fr> <47CD71B7.6060606@earthlink.net> <47D3B37C.5050901@free.fr> <47EC2AC6.7020509@free.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <47EC2AC6.7020509@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernard Pidoux F6BVP <f6bvp@free.fr>
Cc: List for LINUX ROSE/FPAC network switch <fpac@f6fbb.org>, List for the LINUX version of FBB <xfbb@f6fbb.org>, linux-hams <linux-hams@vger.kernel.org>

On Fri, Mar 28, 2008 at 12:16:22AM +0100, Bernard Pidoux F6BVP wrote:
> 
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

Could you share what particular problems the patches address?  Maybe
send the changelog entries to the list?

Thanks & 73,

Pat NE4PO


-- 

Patrick Ouellette                 pat@flying-gecko.net
ne4po (at) arrl (dot) net         Amateur Radio: NE4PO 
"Crank the amp to 11, this needs more cowbell - and a llama wouldn't hurt either"
"Your arguments are an odd mix of overly optimistic on one side and overly 
pessimistic on the other"

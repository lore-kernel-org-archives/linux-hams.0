From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: [PATCH] ax25, netrom and rose fixes for 2.6.0
Date: Wed, 24 Dec 2003 17:39:47 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20031224173947.A203@jeroen.pe1rxq.ampr.org>
References: <20031219234435.C211@jeroen.pe1rxq.ampr.org> <3FE8BD47.4010108@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3FE8BD47.4010108@free.fr>; from f6bvp@free.fr on Tue, Dec 23, 2003 at 23:10:15 +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernard Pidoux F6BVP <f6bvp@free.fr>
Cc: linux-hams@vger.kernel.org

On 2003.12.23 23:10:15 +0100 Bernard Pidoux F6BVP wrote:
> 
> I just tried to compile FPAC 3.25 and FBB 7.04j against kernel 6.0 just 
> to see how compilation would perform.
> Although I was sure there would be a number of obsolete code and that 
> the programs will not run.
> 
> I had to modify a few #includes.
> 
> Replacing for example
> 
> #include <linux/ax25.h> by "netax25/kernel_ax25.h"
> #include <linux/rose.h> by "netax25/kernel_rose.h"
> #include <linux/netrom.h> by "netax25/kernel_netrom.h"
> 
> helped the compilation.
> 
> However in kernel_ax25.h I found that
> #define AX25_PIDINCL 8
> that was in former ax25.h was no more defined.
> 
> I guess this was removed on purpose ?
> Am I wrong ?

AX25_PIDINCL is a socket option for the ax25 stack...
I am guessing that your kernel_ax25.h file is from a time that that didn't
exist yet.....

What exactly went wrong with the header files from linux?

Jeroen


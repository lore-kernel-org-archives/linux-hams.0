From: Bernard Pidoux F6BVP <f6bvp@free.fr>
Subject: Re: [PATCH] ax25, netrom and rose fixes for 2.6.0
Date: Tue, 23 Dec 2003 23:10:15 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3FE8BD47.4010108@free.fr>
References: <20031219234435.C211@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20031219234435.C211@jeroen.pe1rxq.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


I just tried to compile FPAC 3.25 and FBB 7.04j against kernel 6.0 just 
to see how compilation would perform.
Although I was sure there would be a number of obsolete code and that 
the programs will not run.

I had to modify a few #includes.

Replacing for example

#include <linux/ax25.h> by "netax25/kernel_ax25.h"
#include <linux/rose.h> by "netax25/kernel_rose.h"
#include <linux/netrom.h> by "netax25/kernel_netrom.h"

helped the compilation.

However in kernel_ax25.h I found that
#define AX25_PIDINCL 8
that was in former ax25.h was no more defined.

I guess this was removed on purpose ?
Am I wrong ?

73 de Bernard, F6BVP

-------------------------

Jeroen Vreeken wrote:

> Hi,
> 
> These are a few fixes for bugs I encountered over the last few weeks:
> 
> - Fix some socket locking in ax25
> - Fix a waitqueue bug in ax25
> - Use sock_orphan in ax25
> - Fix a waitqueue bug in netrom
> - Fix a waitqueue bug in rose
> - Fix raw socket behaviour in ax25
> 
> Ralf, can you give your stamp of approval so Dave can apply them?
> 
> Jeroen



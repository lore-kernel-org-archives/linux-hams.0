From: Thomas Osterried <thomas@osterried.de>
Subject: Re: Please explain /proc/net/ax25_route
Date: Mon, 17 Jan 2022 12:55:26 +0100
Message-ID: <20220117115526.GA18529@x-berg.in-berlin.de>
References: <74ced8bf-f742-b2d2-b2bb-3eff2b168cd8@blackspace.at>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <74ced8bf-f742-b2d2-b2bb-3eff2b168cd8@blackspace.at>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Schwarz <roland.schwarz@blackspace.at>
Cc: linux-hams@vger.kernel.org

Hello Roland,

On Sun, Jan 16, 2022 at 12:33:57PM +0100, Roland Schwarz wrote:
> Dear all,
> 
> can anyone, please, give me a helping hand understanding ax25 kernel
> routing? Will the tables allow digipeating of ax25 frames or are they only
> meant for use with axip?

Unfortunately, linux kernel ax25 does not implement (even simple) AX.2 layer2 digipeating.

This functionality is up to userspace programs. Personaly, I think simple digipeating
would be great (for reasons as performance and simplicity), butt that's another story.

The kernel routing table is basically for IP over AX.25.
You see the reference for ax25_ip_xmit in ax25_ip_xmit in ax25_ip.c
If kernel likes to send an IP-frame, it requests IP routes for interfces, finds i.e.
an AX.25 ARP for that route, and need two things to know:
1. use Mode VC or Mode DG?
2. is it directly reachable or via an ax25 path (that's why the struct has the
   digi path information).
This is done without interaction with userspace utilities.

For beeing easily able to see the content of that routing table, it's available through
/proc.
It can be filled and adjusted from userspace with axparms (by hand, startup script, etc.)
or by ax25rtd.

The userspace programs use ioctls via ax25_ioctl()
like SIOCADDRT, SIOCDELRT, SIOCAX25OPTRT,
in af_ax25.c, which calls ax25_rt_ioctl() in ax25_route.c


vy 73,
		- Thomas  dl9sau

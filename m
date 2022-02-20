From: Thomas Osterried <thomas@osterried.de>
Subject: Re: [AX25] unreleased sockets after disconnecting
Date: Sun, 20 Feb 2022 10:18:13 +0100
Message-ID: <6D71ECB7-775D-4D98-B856-C48B88E4DF7C@osterried.de>
References: <4B2CD772.1030106@upmc.fr> <4B2D1025.1020106@gmail.com>
 <4B2E6729.1090102@free.fr> <4B507FAA.8010007@free.fr>
 <20100115203654.GA3084@del.dom.local> <4DFA6A59.2000709@free.fr>
 <581f0c8e-f4fb-523d-df6e-7a973b506c34@sorbonne-universite.fr>
 <207b1242-dfb9-1832-c7f6-c4602ad2e9e6@free.fr>
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <207b1242-dfb9-1832-c7f6-c4602ad2e9e6@free.fr>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Bernard Pidoux , f6bvp" <f6bvp@free.fr>
Cc: linux-hams@vger.kernel.org



> Am 06.02.2022 um 22:12 schrieb Bernard Pidoux , f6bvp <f6bvp@free.fr>:
> 
> For long time it as been reported by many AX.25 users that connexions were precluded after terminating a connexion with a remote station.
> 
> Some hamradio maintainers have been pretending not to be aware of such issue for lacking proofs.

The problem is known. Iirc correctly, we have seen some approaches over the years to fix this issue. The last one I'd like to discuss is by YO2LOJ
(Subject "NET/ROM bug fix from YO2LOJ?" in this list):

That patch is against the problem, that disconnected sessions still are listet, in "LISTENING" state'.

I'm not sure if it is exactly your problem, because in your /proc/net/ax25 example, those sessions seem to belong to iface "???" instead of "ax0".

I can reproduce (testet last week) is the following:
boot
configure ax25 iface
no userspace process started
connect from outside
disconnect from outside
-> 
netstat --ax25 shows that session in LISTEN state. In contrast to your output, it refers to the interface (not to "???").


The problem with the patch is, we observed a new, in my opinion unliked, behavior:
now a new connection is disconnected instantly (as long as no userspace daemon is listening).
But there are protocols like "IP mode VC" need to be able to connect, even when no userspace daemon is running.

> I must restart my packet radio FPAC node (AX.25, ROSE and NetRom protocoles) every other hour in order to let connexions available again for neighbours.

Perhaps you could try YO2LOJ's kernel patch and test if it helps for your urgent problem, or if there's another problem in the session-cleanup code.

> Here are some evidence from cat  /proc/net/ax25 showing old remnants of connexions presumably there for ax25 sockets were not released.
> 
> 73 de Bernard, f6bvp

vy 73,
	- Thomas  dl9sau

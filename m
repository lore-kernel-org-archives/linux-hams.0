From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: txdelay and kissparms hardware question
Date: Mon, 31 Oct 2005 11:37:37 +0000
Message-ID: <20051031113737.GB13561@linux-mips.org>
References: <60418.192.168.1.2.1130098885.squirrel@192.168.1.12> <20051029204357.GD2935@linux-mips.org> <63925.192.168.1.2.1130629453.squirrel@192.168.1.12>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <63925.192.168.1.2.1130629453.squirrel@192.168.1.12>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: aa6qn@aa6qn.sytes.net
Cc: linux-hams@vger.kernel.org

On Sat, Oct 29, 2005 at 04:44:13PM -0700, aa6qn@aa6qn.sytes.net wrote:
> Date:	Sat, 29 Oct 2005 16:44:13 -0700 (PDT)
> Subject: Re: txdelay and kissparms hardware question
> From:	aa6qn@aa6qn.sytes.net
> To:	"Ralf Baechle DL5RB" <ralf@linux-mips.org>
> Cc:	aa6qn@aa6qn.sytes.net, linux-hams@vger.kernel.org
> Content-Type:	text/plain; charset=US-ASCII
> 
> > On Sun, Oct 23, 2005 at 01:21:25PM -0700, aa6qn@aa6qn.sytes.net wrote:
> >
> >> I am wondering is kissparms configuration is really working for me. I
> >> have
> >> made adjustments and there seems to be no change in the tnc timing. For
> >> instance if I set txdelay to -t 30 the tnc acts as if it was set to
> >> 10ms.
> >> I am wondering if the timing is effected by the faster machines
> >> available
> >> today. In my case its a Intel 4, 3.2Ghz hyperthreading dual channel SMP
> >> image. Could this hardware also be the cause of my kernel panic's when I
> >> load ax25?
> >
> > In case you're using the kiss driver the kernel should just forward this
> > setting to your TNC which then controls the actual tx delay.  Other
> > drivers
> > such as 6pack do the tx delay themselves.  So, what driver are you using?
> >
> > 73 de DL5RB op Ralf
> >
> > --
> 
> I was using kissparms to adjust the timing. The input from another person
> did help to change the kernel timing to 1000HZ.
> 
> Even then the system was still not stable. I have tabled the ax25 suite in
> favor of JNOS2 which has been very solid with the latest kernel and Gentoo
> linux. Its all working (tunnels, netrom, iptables, snort...) with uDev
> etc.

The HZ value should not have any influence on stability other than maybe
changing some statistcal patterns in the code.  Iow if it makes a
difference on stability that would be a bug.

That said, a few AX.25 system interfaces are using timer ticks as their
unit - a timer tick on i386 used to be 10ms in 2.4, then became 1ms in 2.5
until HZ became a configuration option.  Just to make things more
entertaining (warning: your definition of entertaining may differ ;-) the
size also differs between architectures and even some sub-architectures.
In short: a mess.  So I've cooked a patch that standardizes the unit of
time on 1ms for all platforms.  I did post that a while ago, no feedback
so it must be good.  I'm planning to submitting those patches for 2.6.15
with small changes - 1ms is probably a way to small unit for some of the
values, for example the T3 timer where I believe seconds would be more
convenient.

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21

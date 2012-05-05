From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: Re: AX25 and related software's future in Debian
Date: Sat, 5 May 2012 15:33:52 +0200
Message-ID: <20120505133352.GD32411@x-berg.in-berlin.de>
References: <20120504013200.GB3489@flying-gecko.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120504013200.GB3489@flying-gecko.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick Ouellette <pat@flying-gecko.net>
Cc: linux-hams@vger.kernel.org, debian-hams@lists.debian.org

Hello,

I know this thread became large. But I'm currently at a ham-event until sunday
evening. Thus please excuse that I respond without having read the thread and
my arguments may have already been stated.

HAM-Radio is an innovative hobby. We have several software that uses the AX.25
stack.
Your list of dependencies is only a short overview. I.e. I'm maintainer of
conversd-saupp (a irc-like conversation mode). It's not for users but for SysOP's.
They get the source of this daemon from my CVS. Because the low number of users
I do not intend to put it on the debian package servers. Nevertheless, it relies
on libax25. There are also several mailbox softwares around which rely on
libax25 (baybox, dpbox together with the pr-program tnt, etc).
Imagine the mess we get if all those programs decide to hard-link the library
in order to get it run on any debian system - just because you decide to leave
support for it out - "just because there are so few users".
Apropos the amount of users (I think it was the debian installation statistics
where users may take part (I do not, and many digipeaters with only RF access
never do)). Because ax25apps/-tools and libax25 were quite outdated, I recommended
to use the CVS HEAD and to recompile - if better support and fixed bugs were
needed. Those self-compiled systems do not occur on any other statistic.

The mess you had with "node" (which is _not_ part of ax25apps/-tools) we
already know from "net". ka9q NOS or unix-improved derivate of WAMPES.
But samba chose to name their control program net. What has the net to
do with samba? That is a really pain. Years ago, poeple at suse and
debian began to rename "call" to "axcall", and "ax25_call" (bad name
anyway) is now hardly distinguischable.

Imho, the free software community -and the distri's in the first line- have to
have find solutions. My it special path to the real program, or a rename structure
where we also will have to talk about the change to i.E. samba_net. You can
see, the names will become quite unreadable. And yes, I hope we will not tend to
name our programs like org.ampr.ax25.tools.call and org.win$compat.networking.samba.net ;)

I'd really appreciate if we leave things as they are: support for the ham-radio
community by debian.
..and yes - I've also talked to people who said "ah, ham - I know this from the
package list" - and I could make them "hot" for our fascinating hobby.

vy 73,
	- Thomas  dl9sau



On 2012-05-03 21:32:00 -0400, Patrick Ouellette <pat@flying-gecko.net>
wrote in <20120504013200.GB3489@flying-gecko.net>:
> I come to the lists mentally and physically exhausted from the
> current struggle to defend the ham radio package node in the Debian
> distribution.  I also seem to be the only person interested in the
> ax25 software (libax25, ax25-tools, ax25-xtools, and ax25-utils).
> The situation with node has made me wonder why I am even bothering.  I can
> compile the ax25 stack for my use, and not have to put up with the baggage
> Debian requires.
> 
> The question I have for the lists - is there really any interest in having
> ham radio software, particularly libax25 and the tools/utils in Debian?
> I know if it disappears from Debian it affects all Debian derived distros
> (like Ubuntu for instance).
> 
> Reverse depends output for libax25:
> libax25
>   Reverse Depends: aprsd (>= 1:2.2.5-13-5.1)
>   Reverse Depends: aprsdigi (>= 2.4.4-3.1)
>   Reverse Depends: ax25-apps (>= 0.0.8-rc2+cvs20120204-2)
>   Reverse Depends: ax25-tools (>= 0.0.10-rc2+cvs20120204-3)
>   Reverse Depends: ax25mail-utils (>= 0.11-6.1)
>   Reverse Depends: fbb (>= 7.04j-8.2)
>   Reverse Depends: libax25-dev (= 0.0.12-rc2+cvs20120204-2)
>   Reverse Depends: linamc (>= 2.0rc5-2)
>   Reverse Depends: node (>= 0.3.2-7.1)
>   Reverse Depends: xastir (>= 2.0.0-2+b1)
> aprsd
> aprsdigi
> ax25-apps
> ax25-tools
> ax25mail-utils
> fbb
> libax25-dev
> linamc
> node
> xastir
> 
> 
> So, what inspiration can you give me to keep me from packing up the tent?
> 
> 73,
> 
> Pat NE4PO
> -- 
> ,-----------------------------------------------------------------------------.
> >   Patrick Ouellette         |    It is in pardoning that we are pardoned.   <
> >   pat(at)flying-gecko.net   |    -- Francis of Assisi                       <
> >   Amateur Radio: NE4PO      |                                               <
> `-----------------------------------------------------------------------------'
> 
> 
> -- 
> To UNSUBSCRIBE, email to debian-hams-REQUEST@lists.debian.org
> with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
> Archive: http://lists.debian.org/20120504013200.GB3489@flying-gecko.net
> 

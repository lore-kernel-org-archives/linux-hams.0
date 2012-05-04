From: Patrick Ouellette <pat@flying-gecko.net>
Subject: Re: AX25 and related software's future in Debian
Date: Fri, 04 May 2012 11:14:24 -0400
Message-ID: <20120504151424.GC24655@flying-gecko.net>
References: <20120504013200.GB3489@flying-gecko.net>
 <4FA3E269.4060801@danplanet.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-disposition: inline
In-reply-to: <4FA3E269.4060801@danplanet.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Smith <dsmith@danplanet.com>
Cc: linux-hams@vger.kernel.org, debian-hams@lists.debian.org, ralf@linux-mips.org, ax25@x-berg.in-berlin.de

(I added Ralf DL5RB and Thomas DL9SAU to the Cc: line.  They are the
upstream maintainers of ax25 and I am not sure if they have seen the 
thread/discussions)

On Fri, May 04, 2012 at 07:06:33AM -0700, Dan Smith wrote:
> 
> > So, what inspiration can you give me to keep me from packing up the tent?
> 
> Some of us continue to develop and deploy new systems based on this
> stuff. Linux provides the most modern way to integrate AX.25 with other
> IP networks (IMHO) and Debian provides a good platform on which to
> build. Yes, you and I can install our own stacks, but if it goes away
> from the base distro, it will be harder to encourage other folks to do
> the same.
> 

Dan,

Playing Devil's advocate - the argument has been put forth in the
"other discussion" that according to popcon (the Debian popularity
contest), node has 81 installs, and 17 reporting as "active" while the
nodejs package has 720 installs with 163 reporting as "active."  So their
conclusion is the node package is only used by a small community.

Looking at the ax25 packages:
libax25 - 234 installs/ 49 active
ax25-tools - 74/19
ax25-xtools - 45/6
ax25-apps - 74/17

other ham packages depending on libax25:
xastir - 89/16
aprsd - 33/13
ax25mail-utils - 22/4
fbb -16/3
linamc - 13/0

and a couple of other ham packages:
hamlib - 349/119
qsstv - 80/8
gmfsk - 64/10
fldigi - 113/24
xlog - 72/12
gpredict - 650/90

for comparison, the bash shell - 121423/110245

judging by these numbers (and let me make it CLEAR I do not put much
stock in them personally since the package does not have to be installed,
the machine has to have an internet connection, and the file system has
to record atime - so low power systems or ssd drive systems with
the mount option noatime don't count) hamlib *might* currently be
*safe* in terms of keeping it's name, and clearly is used by others.

The other issue, the one I was thinking of was the active user counts.
With the exception of hamlib and gpredict they are all low double digit
or even single digit numbers.  Even if I believe there are many more
users of the software, I have no way to prove it.

I know there are many Debian and Debian based systems running ax25.
Unfortunately "the squeaky wheel gets the grease" and the ax25 users
haven't been squeaking.  Flawed as it is, the "other side" will continue
to use the only tool they have - popcon - to justify their actions in
disregarding the place of long term packages in the distribution in favor
of the next new / hot thing.  

I would like to run my tried and true systems as they are, and not have
to reinvent the wheel and debug scripts every few years when this issue
comes up again.  The same thing happened with listen in Debian, so
now it is axlisten while the music player now has the executable named
listen.  Everyone agreed then that "listen" was a generic name and should 
not really be used, and yet it is.

You claim the existence of the packages in Debian encourages others to 
try ax25, if this is so where are these people?

Pat

From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Node.js and it's future in debian
Date: Thu, 03 May 2012 21:09:35 -0700
Message-ID: <4FA3567F.2020707@trinnet.net>
References: <CACxjfDH5zYth6Q-ZDLDafqNEczbF3BqaGRcAhsaiPEnApbiUuA@mail.gmail.com> <20120501205524.GI30521@flying-gecko.net> <20120501215305.GA1250@burratino> <20120501221659.GA11430@flying-gecko.net> <20120502065003.GB2410@burratino> <20120502165031.GC7390@flying-gecko.net> <20120502171349.GA23806@burratino> <20120502200426.GF7390@flying-gecko.net> <4FA2A557.1080103@trinnet.net> <20120503170521.GD19468@flying-gecko.net> <20120503185129.GA18768@burratino>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20120503185129.GA18768@burratino>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jonathan Nieder <jrnieder@gmail.com>
Cc: Patrick Ouellette <pouelle@debian.org>, node@packages.debian.org, nodejs@packages.debian.org, debian-hams@lists.debian.org, linux-hams@vger.kernel.org


Me again..

AX.25 in Linux has been around for a long time so I can excuse it's 
overly generic "node" name purely based upon it's age but..


> The working title of Node.js was "server" for a few weeks, before
> anyone was using it.

Wow.. that's horrible!  Obviously we don't want stuff like that to 
happen.  Please also consider that all this ISN'T just a *Debian* 
problem.  Its a Linux distro-wide problem.  It's groups like this that 
form and guide aspects of all Linux distributions consistency and 
considering Debian's wide influence, changes here will surely trickle 
into other distributions over time.

It's also worth touching on that I personally appreciate the work that
Patrick Ouellette has done on maintaining the HAM packages for Debian. 
Like always, there are never enough appreciative people in this world 
but once removed / renamed /etc, I'm SURE a lot of people will come out 
of the woodwork to bitch about it.  A *lot* of people use Debian and 
Debian-related distributions with Packet radio.


>   1. Which package should use the name "node" in the long term?  What
>      can we do to ensure that happens eventually?
>
>      (My answer is that I hope that neither uses the name "node" in
>      the long term.)

I personally think that some of it SHOULD be a first come, first served 
thing.  I previously mentioned in the previous email that all of the 
various scripts that people run could/would break.  Probably no big deal 
to many of us on *this* list but trust me, I know a few Linux packet 
people who would be seriously lost because of these changes.

Also consider the tons of documentation, notably the AX.25 HOWTO that 
would be impacted and I highly doubt it would get updated (hasn't been 
since 2001) to reflect these changes.  It's not like things have needed 
to change all that much - http://tldp.org/HOWTO/AX25-HOWTO/


>   2. What should be the state in Debian's upcoming "wheezy" release to
>      provide a smooth upgrade path and not surprise users too much?

Is Node.js a new addition to Debian?  Again, I side with first come 
first served.


>      I also would hope that wheezy can include a /usr/sbin/node file
>      that prints a message to help people notice they are still using
>      it and calls /usr/sbin/axnode, but that is still under discussion.
>
>      Likewise, the Node.js needs some migration to ensure scripts
>      installed by Debian packages and from outside use the new name.
>      I would hope that wheezy can include a /usr/bin/node synonym for
>      compatibility until usage of it fades away, but that is still
>      under discussion.)

If for some reason Debian feels that longstanding packages and their 
well known binary names can be renamed at any given time (I seriously 
disagree with that mentality btw), I'd say then ALSO force the change of 
the "node" in Node.JS name to something more sane.  Don't remove one 
poorly named file for a new poorly named one just because it's new and 
shiny.

--David

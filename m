From: "Marius Petrescu" <marius@yo2loj.ro>
Subject: RE: Node.js and it's future in debian
Date: Thu, 3 May 2012 19:17:08 +0300
Message-ID: <000c01cd2948$30482130$90d86390$@ro>
References: <CACxjfDH5zYth6Q-ZDLDafqNEczbF3BqaGRcAhsaiPEnApbiUuA@mail.gmail.com> <20120501205524.GI30521@flying-gecko.net> <20120501215305.GA1250@burratino> <20120501221659.GA11430@flying-gecko.net> <20120502065003.GB2410@burratino> <20120502165031.GC7390@flying-gecko.net> <20120502171349.GA23806@burratino> <20120502200426.GF7390@flying-gecko.net> <4FA2A557.1080103@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4FA2A557.1080103@trinnet.net>
Content-Language: en-us
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Now I really subscribe di David's arguments but I would add something else.

Node.js is a server-side JavaScript environment, so the "js" is a
legitimate, even useful addition.
Node on the other hand is exactly what its name states: a communication
node.
axnode is not correct since it also supports pure tcp/ip, netrom and rose
(and virtual any other protocol which allows a character oriented p2p link).

So why get the javascript out of a java script environment and put a
restrictive title to a communication node tool?
And by the way, most know node.js as node.js, so the confusion will be even
greater if you change the name.

Marius, YO2LOJ

-----Original Message-----
From: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org] On Behalf Of David Ranch
Sent: Thursday, May 03, 2012 18:34
To: Patrick Ouellette
Cc: Jonathan Nieder; node@packages.debian.org; nodejs@packages.debian.org;
debian-hams@lists.debian.org; linux-hams@vger.kernel.org
Subject: Re: Node.js and it's future in debian


Hello Gentlemen,

I thought I'd chime in since the linux-hams@vger list was added to the
thread and give one Packet HAM's perspective.  Specifically, if one proposal
is to rename the long existing /usr/sbin/node binary to /usr/sbin/axnode,
why couldn't the "new guy" node.js binary be renamed to something like
/usr/sbin/nodejs?  The later seems more of a reasonable proposal.

 From my experience, many MANY Linux hams have customized scripts that
startup some very elaborate HAM systems.  For many, these scripts weren't
written by them and the changing of the node command could be very difficult
for some.  The other aspect is if this change came into a package update
that could impact production systems in VERY remote sites.  This could cause
all kinds ugliness that can be easily avoided.

I can appreciate Debian's goal to keep things moving forward but I'd argue
that a binary name of "/usr/sbin/nodejs" would be a lot more informative
with the two additional characters than just calling it "node" (and
disrupting a well known binary name for us Linux packet hams).

--David
KI6ZHD



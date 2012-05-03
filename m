From: Patrick Ouellette <pouelle@debian.org>
Subject: Re: Node.js and it's future in debian
Date: Thu, 03 May 2012 13:05:21 -0400
Message-ID: <20120503170521.GD19468@flying-gecko.net>
References: <CACxjfDH5zYth6Q-ZDLDafqNEczbF3BqaGRcAhsaiPEnApbiUuA@mail.gmail.com>
 <20120501205524.GI30521@flying-gecko.net> <20120501215305.GA1250@burratino>
 <20120501221659.GA11430@flying-gecko.net> <20120502065003.GB2410@burratino>
 <20120502165031.GC7390@flying-gecko.net> <20120502171349.GA23806@burratino>
 <20120502200426.GF7390@flying-gecko.net> <4FA2A557.1080103@trinnet.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-disposition: inline
In-reply-to: <4FA2A557.1080103@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Ranch <linux-hams@trinnet.net>
Cc: Patrick Ouellette <pouelle@debian.org>, node@packages.debian.org, nodejs@packages.debian.org, debian-hams@lists.debian.org, linux-hams@vger.kernel.org

Thanks for the comments!

On Thu, May 03, 2012 at 08:33:43AM -0700, David Ranch wrote:
> 
> From my experience, many MANY Linux hams have customized scripts
> that startup some very elaborate HAM systems.  For many, these
> scripts weren't written by them and the changing of the node command
> could be very difficult for some.  The other aspect is if this
> change came into a package update that could impact production
> systems in VERY remote sites.  This could cause all kinds ugliness
> that can be easily avoided.
> 

One issue here seems to be a perception problem.  The non-ham folks
look at the ax25 how to or similar documentation and see that node is
"usually called from ax25d" or a similar superserver.  This leads them
to believe that the command is only started from one or two "easily 
identified and modified" scripts.

The Node.js side argues that there are many books, tutorials, and scripts
that tell the user to run "node <script>" and so the interaction of the user
and node.js' node command is direct and uncontrollable.

> I can appreciate Debian's goal to keep things moving forward but I'd
> argue that a binary name of "/usr/sbin/nodejs" would be a lot more
> informative with the two additional characters than just calling it
> "node" (and disrupting a well known binary name for us Linux packet
> hams).

I completely agree, but apparently Node.js' upstream has changed the name 
once previously (apparently from a similar problem) and while acknowledging
the name is generic and a poor choice refuses to consider another change.
(According to what I can tell from the Debian discussion.  I have not
talked to Node.js upstream personally.)

FWIW, the commands are NOT in the same path.  The ham radio node command
is /usr/sbin/node and the Node.js command is /usr/bin/node

Debian does NOT allow binaries with the same name to have different functions.
Unfortunately "first come, first served" is not the policy either.


Pat 

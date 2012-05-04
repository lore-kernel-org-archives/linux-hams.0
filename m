From: Patrick Ouellette <ne4po@arrl.net>
Subject: Re: AX25 and related software's future in Debian
Date: Fri, 04 May 2012 15:31:08 -0400
Message-ID: <20120504193108.GG6444@flying-gecko.net>
References: <20120504151424.GC24655@flying-gecko.net>
 <E1SQLMS-00025Q-Iq@mail.kostecke.net>
 <20120504165706.GD24655@flying-gecko.net>
 <CAPSBm51RHEn7ch_A9CDrtUymZtnOJgnkCq_a=F3auq8A_6XFfg@mail.gmail.com>
 <20120504180621.GB6444@flying-gecko.net> <4FA420C2.2060308@danplanet.com>
 <20120504184934.GE6444@flying-gecko.net> <4FA42797.2020406@danplanet.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-disposition: inline
In-reply-to: <4FA42797.2020406@danplanet.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Smith <dsmith@danplanet.com>
Cc: Patrick Ouellette <pouelle@debian.org>, Bill Vodall <wa7nwp@gmail.com>, linux-hams@vger.kernel.org

On Fri, May 04, 2012 at 12:01:43PM -0700, Dan Smith wrote:
> 
> Sure, but certainly you would not argue that someone shouldn't use the
> toolkit of their choice because their distro couldn't or didn't decide
> how they should coexist, right? :)
> 

Of course not, use what you like.  However, your right to impose
what you like on a previously existing infrastructure should not
be unlimited and should respect that which is already there.

> > Actually http is not the problem so much as the plethora of poorly
> > written and implemented web sites and all the web 2.0 "interactive"
> > user experience with mouse overs that send data back to the server
> > automatically, triggering the server to send a response.
> > 
> > Don't misunderstand me, I like the flashy Ajax web2.0 user experiences
> > I get on my 25Mbps/25Mbps FiOS internet connection - I'm just really
> > skeptical it will be as nice at 9600 baud or slower on an ax25 network.
> 
> Whether it makes sense over a slow RF connection or whether people tend
> to use it to write crap is really neither here nor there, IMHO. What if
> I wanted to write something that provided a web (or web services)
> interface to my AX.25 network? I wanted to put that box on the border
> between my tens-of-megabits internet connection and my 9600 baud AX.25
> network of course, so that new-to-amateur radio kids could poke at the
> network with a web browser. I'm not using Node.js for the AX.25 side,
> but for the public-facing one. If the resolution here is to make the two
> mutually exclusive, then that becomes harder.
> 

The shared nature of the limited resource that is the ax25 network's
bandwidth changes my view on the acceptability or allowing poorly written
and inefficient resource hogs to run amok.  You want to do that on the
wired network you run, go ahead.  You want to do that on a shared resource
like the ax25 packet network, please be respectful of other user's
and at least try to write programs that make efficient use of the resources.

The conflicts would not be intended as a long term solution.  It would
allow Node.js to enter Debian this next release and allow those who
know what they are doing to install both with a --force-conflicts
dpkg option.

> Now, I'm certainly not arguing that one should have to take the rename
> penalty over the other mind you, I'm just saying I think making them
> mutually exclusive to solve the problem is precisely the sort of thing
> the guidelines are trying to avoid using Conflicts: for. I'd tend to
> lean towards a "we were here first" state of mind, but I also don't want
> to find out that debian said "fine, screw you _and_ your eighteen
> friends" when I got my head out of the sand :)

Unfortunately much of the conversation from the "rest of Debian" has been
of the "screw the ax25 users and the horses they rode in on too" variety.

Pat

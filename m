From: Patrick Ouellette <pouelle@debian.org>
Subject: Re: AX25 and related software's future in Debian
Date: Fri, 04 May 2012 14:49:34 -0400
Message-ID: <20120504184934.GE6444@flying-gecko.net>
References: <20120504151424.GC24655@flying-gecko.net>
 <E1SQLMS-00025Q-Iq@mail.kostecke.net>
 <20120504165706.GD24655@flying-gecko.net>
 <CAPSBm51RHEn7ch_A9CDrtUymZtnOJgnkCq_a=F3auq8A_6XFfg@mail.gmail.com>
 <20120504180621.GB6444@flying-gecko.net> <4FA420C2.2060308@danplanet.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-disposition: inline
In-reply-to: <4FA420C2.2060308@danplanet.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Smith <dsmith@danplanet.com>
Cc: Patrick Ouellette <pouelle@debian.org>, Bill Vodall <wa7nwp@gmail.com>, linux-hams@vger.kernel.org

On Fri, May 04, 2012 at 11:32:34AM -0700, Dan Smith wrote:
> 
> > Not seeing anything particularly well suited to ax25 networks there,
> > or anything particularly unique in general.
> 
> Not sure I'd agree there. If whatever you're running AX.25 on is
> suitable for HTTP, then Node.js would be of potential use as well. I'd
> surely vote to avoid a "Conflicts: resolution" (pun intended).

From wikipedia's node.js page:

"Similar environments written in other programming languages include 
Twisted for Python, Perl Object Environment for Perl, libevent for C 
and EventMachine for Ruby. Unlike most JavaScript programs, it is not
executed in a web browser, but is instead a server-side JavaScript 
application"


There is not any particularly novel or new thing that you can do
with Node.js that can't be done with another toolkit as far as I
can tell.  The suitability of a verbose protocol like http for use
on limited bandwidth networks is a different issue.  I suppose if
you are running ax25 over D-Star 1.2GHz (128kbps) links....

Actually http is not the problem so much as the plethora of poorly
written and implemented web sites and all the web 2.0 "interactive"
user experience with mouse overs that send data back to the server
automatically, triggering the server to send a response.

Don't misunderstand me, I like the flashy Ajax web2.0 user experiences
I get on my 25Mbps/25Mbps FiOS internet connection - I'm just really
skeptical it will be as nice at 9600 baud or slower on an ax25 network.

Pat



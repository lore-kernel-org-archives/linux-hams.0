From: w9ya <w9ya@amsat.org>
Subject: Re: making apps
Date: Thu, 27 Mar 2003 23:31:39 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200303272331.39088.w9ya@amsat.org>
References: <000001c2f4d3$4d4e0230$8c01a8c0@HP713A> <200303281357.22334.vk3bvp@qsl.net> <20030328041621.445F72B22C@www.fastmail.fm>
Reply-To: w9ya@amsat.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030328041621.445F72B22C@www.fastmail.fm>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Jose A. Amador" <co2ja01@fastmail.fm>, Shane <vk3bvp@qsl.net>, Linux Hams <linux-hams@vger.kernel.org>

Mandrake is now at 9.1

run this:
script compile.log
(then whatever you do like ./configure && make && make install - just whever 
you want to record, including prompts and other commands)
ctrl+d

bob finch
w9ya


On Thursday 27 March 2003 11:16 pm, Jose A. Amador wrote:
> On Fri, 28 Mar 2003 13:57:22 +1100, "Shane Deering" <vk3bvp@qsl.net>
>
> said:
> > On Fri, 28 Mar 2003 13:39, Dexter N Muir wrote:
> > > Hi all
> > >
> > >   Starting out with Mandrake 9.0, and trying to get ax25 up.  Looked at
> > > pa3gcu's page, and followed instructions.  Everything worked except
> > > make on ax25-apps-0.0.6, which bombed while making call.  Of course, it
> > > all scrolls up and off the screen - can someone point me to how to look
> > > at this (working at command prompt Ctrl-Alt-F1, so no xterm scrollbar
> > > :-),
> >
> > Shift + page up|down
> >
> > > so I can see better where exactly the bomb-out is?  It's repeatable.
> > >   A pointer to current archives would not go amiss either - all I could
> > > find was http://groups.google.com/groups?=mlist.linux.hams (current
> > > only to Nov 2002) and http://www.geocrawler.com/lists/3/Linux and
> > > selecting linux-hams (current to Aug 2002).
> >
> > Or install ax25-apps-0.0.6-1mdk.i586.rpm
>
> You could also make a log of your compilation with something similar to:
>
> make > /tmp/making_apps 2>&1
>
> Hope this helps. Guess that ncurses might be related as you were
> suggested
> before. Shane's suggestion (using the rpm) could be the easy way out...
>
> 73 de Jose, CO2JA
>
>
>
> --
>   Jose A. Amador
>   co2ja01@fastmail.fm


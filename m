From: "Douglas Cole" <n7bfs@qwest.net>
Subject: Re: xfbbd crashing, why ?
Date: Sat, 16 Oct 2004 07:49:53 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200410160749.53757.n7bfs@qwest.net>
References: <200410090855.37618.n7bfs@qwest.net> <200410091051.33420.n7bfs@qwest.net> <1097345002.1357.6.camel@oh2bns.ampr.org>
Reply-To: n7bfs@qwest.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1097345002.1357.6.camel@oh2bns.ampr.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tomi Manninen <oh2bns@sral.fi>, Linux-hams List <linux-hams@vger.kernel.org>

On Saturday 09 October 2004 11:03, Tomi Manninen wrote:
> On Sat, 2004-10-09 at 20:51, Douglas Cole wrote:
> > but I am not sure what "properly" would be, I know
> > that we start FBB from the command line by entering "xfbbd" and hitting
> > return, and then much info wizzes past on the screen and all is
> > running...
>
> Replace "xfbbd" with "fbb". :)

Thanks Tomi, this helped and it actually ran for more than 24hrs.
But then a few days later it crashed again, and now it won't run at all :(

Not sure what we are doing wrong, since it runs fine while its running, but 
crashes for some reason, and this time with no errors output...

Does "xfbbd" need to be run from an xterm ?

We are doing everything from the command line as root.

We are using a pk96 tnc on one of the serial ports of this pc and are using 
kissattach for the ax0 port that it talks to so am not sure if that would be 
an issue, but since it works for a while it has me confused...

I have not had a chance to look at it since my previous posting, but am going 
to try and spend some time on it today and see what I may be missing.

I know I am not giving much for you folks to chew on, but I am not sure where 
to look or what to do at this point, I guess I need to "rtfm" a bit more and 
hope that helps ;)

tia for any input


Douglas Cole   N7BFS
AMSAT#26182 , K2 # 544
http://www.users.qwest.net/~cdoug3
Registered Linux user # 188922


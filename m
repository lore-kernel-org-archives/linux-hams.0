From: Bob Nielsen <nielsen@oz.net>
Subject: Re: Looking for soundmodem info
Date: Fri, 28 Jan 2005 21:20:58 -0800
Message-ID: <20050129052058.GB12792@n7xy.net>
References: <002501c5040c$044708d0$046fa8c0@JLX> <20050127014554.GA8492@n7xy.net> <003e01c504f1$0aa804a0$046fa8c0@JLX> <200501281611.04327.budr@netride.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200501281611.04327.budr@netride.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Hams <linux-hams@vger.kernel.org>

On Fri, Jan 28, 2005 at 04:11:03PM -0600, Bud Rogers wrote:
> On Thursday 27 January 2005 22:22, Jeff Camp wrote:
> > Thanks for the info, Bob.  I spent some time scouring the internet
> > this morning looking for soundmodem info.  I downloaded
> > soundmodem-0.9-1.i386.rpm and installed it, but now I'm getting the
> > following error message when I try to start it up:
> >
> > [root@n0wjp ax25]# soundmodem -v 9
> > sm[1855]: x86 CPU capability 0383f9ff, MMX enabled
> > sm[1855]: mkiss: ifname sm0 mtu 256 hwaddr N0WJP-15 ipaddr 10.0.0.1
> > netmask 255.255.255.0 broadcast 10.0.0.255
> > sm[1855]: audio: starting "/dev/dsp"
> > sm[1855]: audio: Error, cannot open "/dev/dsp"
> > sm[1855]: cannot start audio
> > [root@n0wjp ax25]#
> >
> >
> > /dev/dsp exists.  The sound card is a sound blaster compatible. 
> > Anyone have an idea what these error mean?  I'm not sure exactly
> > where to start on this one.
> 
> Check the permissions on /dev/dsp.  On my system they look like this:
> 
> budr$ ls -l /dev/dsp
> crw-rw----  1 root audio 14, 3 Jun 19  2003 /dev/dsp
> budr$
> 
> I had to add myself to the audio group in /etc/group before I could 
> use /dev/dsp.
> 
> HTH es 73,
> 
> Bud Rogers <budr@netride.net>  KD5SZ
> 

Also check that the soundcard driver is either compiled-in or loaded as 
a module.

73,
Bob, N7XY


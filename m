From: John Ackermann N8UR <jra@febo.com>
Subject: Re: Packet Problem
Date: Mon, 15 Sep 2003 21:29:24 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <5520000.1063675764@flob>
References: <20030916012317.GA9420@leo.tneu.visi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030916012317.GA9420@leo.tneu.visi.com>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tim Neu <tim@tneu.visi.com>, linux-hams@vger.kernel.org

This may be a long shot, but at some point the command syntax for 
kissattach changed and started requiring you to specify an IP address for 
each interface, even if you weren't using TCP/IP on that radio.  Are you 
passing an address to the kissattach command?

73,

John N8UR
jra@febo.com

--On Monday, September 15, 2003 20:23:17 -0500 Tim Neu <tim@tneu.visi.com> 
wrote:

> Hello!
>
> I have a VERY bizzare problem on Linux with AX.25.  I can usually
> handle linux problems on my own, but this one I'm going to need to
> see if anyone else can help...
>
> The goal is to set up a linux box with AX25 installed, interfacing
> to two KISS TNCs on two normal serial ports (COM1/COM2) The system
> will be running node & trivnetdb (a perl database frontend for mysql
> modeled after ARESDATA), and will be used to keep track of runners
> in the Twin Cities Marathon in Minnesota, if I can get it up by
> then.
>
> I set up the box, got everything working, then at some point while
> my guard was down (as I thought I was putting on the finishing
> touches), one of the changes I made (I assume) "broke" the KISS
> interfaces.  They stopped receiving packets, and any packets
> transmitted would be heard only by the box itself (using listen -a)
> but would never even key up PTT. Naturally, I didn't notice the
> problem until I had performed too many steps to sucessfully
> backtrace what it was that I had done...
>
> At fist I thought it could be a TNC wiring problem with PTT - so I
> hooked the serial port to a known-good radio & cable.   There was no
> change in the problems.    Then I thought it might be a problem on
> the TNC - so I swapped it with my own (again, known good) TNC.
>
> No change - but everything is still working great hooked up on
> another box.
>
> Here's the kicker - I can exit KISS mode on the TNC, use minicom,
> and sucessfully connect all over the place using all involved
> hardware - so all the hardware has to be good.
>
> I can also kill kissattach, run minicom and see the raw KISS packets
> scroll on the terminal.
>
> Its like kissattach is going into lala land.
>
> Finally, and with great fustration, I figured that if a fresh
> install had worked before, I thought I'd be safe reloading and
> starting from scratch to at least get it back up & running again.
> (getting the rest of it up was not _that_ hard)
>
> So now I've reloaded the box, and kissattach is still doing the
> exact same thing.  I've tried several different kernel versions from
> ancient to bleeding edge with no change.
>
> Any ideas? It can't be hw since non-kiss mode works great.  A
> re-install of the OS (Debian installed fresh w/reformat) should
> eliminate sw as the source of the problem.
>
> I'm stumped.  It _should_ be working!  Any ideas?   It's driving me
> crazy.
>
> --
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
> -=- ______         _ __                          Military Intelligence
> /           ' )  )        -KC0LQL-         Honest Politician
>  / o ______    /  / _  . .                   Intellectual Property
> / <_/ / / <   /  (_</_(_/_  -- tneu@visi.com / http://www.visi.com/~tneu
> -- -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>



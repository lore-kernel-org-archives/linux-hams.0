From: "Curt, WE7U" <archer@eskimo.com>
Subject: KPC3+ open-source code?
Date: Fri, 19 Dec 2008 12:08:31 -0800 (PST)
Message-ID: <alpine.LNX.1.10.0812191204230.20748@wapiti2.we7u.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org


Sending this to the linux-hams list as well.  Any interest in the
project?  Perhaps development of a KISS-only ROM for the KPC-3+ as a
start?

I don't have a lot of time to help, but have HC11 hardware to play
with (MIT Handyboards where I can download/test code via serial
port) and can get the compiler and toolchain going again on my home
system.  I can also burn EPROM's to test with.  I'd pitch in where I
could.

---------- Forwarded message ----------
Date: Fri, 19 Dec 2008 10:52:29 -0800 (PST)
From: "Curt, WE7U" <archer@eskimo.com>
Reply-To: TAPR APRS Mailing List <aprssig@tapr.org>
To: TAPR APRS Mailing List <aprssig@tapr.org>
Subject: Re: [aprssig] KPC-3+ KISS mode delayed packet issue?

On Fri, 19 Dec 2008, Curt, WE7U wrote:

> KD7NM near me has the same problem periodically.  Power-cycling the
> TNC fixes it for him too.  He's running it in KISS mode with Xastir.
> It's happened at least 2 or 3 times that I can recall, but seems to
> take months to reappear.
>
> It could be that a KISS frame END character gets missed or
> corrupted, requiring a new KISS frame to come through to supply it,
> but then that one gets stuck because of not enough framing
> characters, awaiting the next packet to come through, etc.
>
> It could also be a memory leak or counters overflowing and losing
> track.  Could be all kinds of things.

Is anyone interested in an open-source replacement that would run on
KPC3+ hardware?  I happen to know where to find an HC11
cross-compiler for Linux and a GPL'ed library to get started with...

      ftp://ftp.eskimo.com/u/a/archer/hc11/

I don't have time/energy to do this myself, but perhaps a largish
group could accomplish it, perhaps with GPL'ed code thrown in from
the digi_ned and opentracker/tracker2 projects?

-- 
Curt, WE7U.				archer at eskimo dot com
http://www.eskimo.com/~archer
    Lotto:  A tax on people who are bad at math. - unknown
Windows:  Microsoft's tax on computer illiterates. - WE7U.
The world DOES revolve around me:  I picked the coordinate system!"

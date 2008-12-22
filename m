From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: KPC3+ open-source code?
Date: Mon, 22 Dec 2008 13:56:29 -0800 (PST)
Message-ID: <alpine.LNX.1.10.0812221347390.9783@wapiti2.we7u.net>
References: <200812192302.mBJN2BZ5024702@moose.dimebank.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200812192302.mBJN2BZ5024702@moose.dimebank.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Chris Kantarjiev <cak@dimebank.com>
Cc: linux-hams@vger.kernel.org

On Fri, 19 Dec 2008, Chris Kantarjiev wrote:

> I'd have to ask what the goal of such a project is? 9600 bps activity?
> Standlone APRS? Something else?
>
> For standalone APRS, my current approach is to use the aprs4r digi
> software running on the OpenWRT distro with an OpenTracker 1+ in
> KISS mode built into the case. What else are you after, Curt?

Well, considering I don't personally own any KPC-3+'s, I have to
think hard about it.  I want:

*) KISS mode that works properly in multiple TNC's, and not just for
APRS.  Considering the KISS delays that have been reported recently
in long-running TNC's, plus the lack of long packet or back-to-back
packet support in other devices, we could use some updating here and
there.  Back-to-back packets with full window size of 7 1024-byte
packets would be a good start.  Since there are a lot of KPC-3+'s
out there in shacks and on mountaintops, I think an open-source KISS
implementation would be a good start.  Once packets were flying and
the source code was available, I suspect others would add to the
code to implement smart digipeating, dupe-checking, remote
configuration, etc.  This would extend the life of the mountaintop
hardware plus extend the feature set in directions _we_ want to take
it.

*) Open hardware for my shack which I could write new code for would
definitely be on my wish list.  Whether that's doing my own
AVR-based TNC, helping with somebody else's AVR project, or waiting
for Scott's next ARM-based TNC, I don't know.  I'm picky about
processors and compilers.  I'm not a PIC fan.  The stuff Scott did
with the OpenTracker series and Motorola processors is great, but
the compilers cost $$.  Byon with his TT4/AVR project is heading in
the right direction, but as far as I know it's not open-source.  If
he has a "normal" bootloader in it perhaps it can be used for other
things via a GCC cross-compiler.

*) I'd like to get back into TCP/IP over RF from my Linux box at
some point.  I used to have a lot of fun doing that with long
packets on 2m/1200baud, 2m/9600 baud, and on the 220/1200 baud
full-duplex repeater.  That was with AEA PK-88's in KISS mode:  All
three are dead now.

-- 
Curt, WE7U.				archer at eskimo dot com
http://www.eskimo.com/~archer
   Lotto:  A tax on people who are bad at math. - unknown
Windows:  Microsoft's tax on computer illiterates. - WE7U.
The world DOES revolve around me:  I picked the coordinate system!"

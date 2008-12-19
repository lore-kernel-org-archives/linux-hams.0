From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: KPC3+ open-source code?
Date: Fri, 19 Dec 2008 12:51:28 -0800 (PST)
Message-ID: <alpine.LNX.1.10.0812191247290.23228@wapiti2.we7u.net>
References: <alpine.LNX.1.10.0812191204230.20748@wapiti2.we7u.net> <5abd436b0812191235v72f98762ub9d578fb06ab53cb@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <5abd436b0812191235v72f98762ub9d578fb06ab53cb@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Bill Vodall WA7NWP <wa7nwp@jnos.org>
Cc: linux-hams@vger.kernel.org

On Fri, 19 Dec 2008, Bill Vodall WA7NWP wrote:

> What would be the advantage of investing all this effort in the KPC3
> instead of supporting the existing new TT and OT hardware?

Lots of them in the field?

As far as the Opentrackers, the compilers still cost $$.  To me
that's an impediment to writing open-source code to go on them.  The
up-and-coming ARM-based Opentracker may be a suitable candidate
though.  Also, the Opentrackers up through the Tracker2 and T2-135
don't have a lot of RAM, so back-to-back packets and a full window's
worth of packets is impossible.

TinyTrak's are much in the same boat except for the TinyTrak4.  I
have a cross-compiler for the Atmel Mega processors running on
Linux, and development boards with some Mega processors on them.  I
suspect there's a special bootloader on Byon's systems that'd have
to be replaced if one wanted to start from scratch with his
hardware, but that'd be the only tricky part (for people without a
burner).  I haven't looked to see how much memory and flash comes
with the TT4.

-- 
Curt, WE7U.				archer at eskimo dot com
http://www.eskimo.com/~archer
   Lotto:  A tax on people who are bad at math. - unknown
Windows:  Microsoft's tax on computer illiterates. - WE7U.
The world DOES revolve around me:  I picked the coordinate system!"

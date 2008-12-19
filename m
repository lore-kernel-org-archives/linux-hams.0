From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: KPC3+ open-source code?
Date: Fri, 19 Dec 2008 14:01:23 -0800 (PST)
Message-ID: <alpine.LNX.1.10.0812191400430.26718@wapiti2.we7u.net>
References: <alpine.LNX.1.10.0812191204230.20748@wapiti2.we7u.net>    <5abd436b0812191235v72f98762ub9d578fb06ab53cb@mail.gmail.com>    <alpine.LNX.1.10.0812191247290.23228@wapiti2.we7u.net> <9fb2b9d1f423367302cb788c35da8df1.squirrel@db-reid.dyndns.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <9fb2b9d1f423367302cb788c35da8df1.squirrel@db-reid.dyndns.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: don_reid@comcast.net
Cc: Bill Vodall WA7NWP <wa7nwp@jnos.org>, linux-hams@vger.kernel.org

On Fri, 19 Dec 2008, don_reid@comcast.net wrote:

> I have been working on an APRS design using an ATMega8 (maybe upgrading
> as more resources are needed).  It transmits, but doesn't have receive
> ability yet.  One reason for picking that processor is the gcc support,
> it is great.
>
> I'd be open to working with others to expand this project.

I already have a Mega103 working here with serial and LCD support,
but haven't tackled sending/receiving yet.  Was thinking about going
to a Mega128 and doing DSP for the receive, since the MAC
instructions are pretty fast.

BTW:  The TinyTrak4 uses a Mega processor.  If Byon used a standard
bootloader without modification, it's possible that hardware could
be used by others.  If not, the chip would have to be pulled,
programmed with a standard bootloader, then plugged back in.  Still
not _that_ big of a deal.

As far as I know the TT4 doesn't have open-source code, but I
haven't looked for a while.

-- 
Curt, WE7U.				archer at eskimo dot com
http://www.eskimo.com/~archer
   Lotto:  A tax on people who are bad at math. - unknown
Windows:  Microsoft's tax on computer illiterates. - WE7U.
The world DOES revolve around me:  I picked the coordinate system!"

From: don_reid@comcast.net
Subject: Re: KPC3+ open-source code?
Date: Fri, 19 Dec 2008 13:56:36 -0800 (PST)
Message-ID: <9fb2b9d1f423367302cb788c35da8df1.squirrel@db-reid.dyndns.org>
References: <alpine.LNX.1.10.0812191204230.20748@wapiti2.we7u.net>
    <5abd436b0812191235v72f98762ub9d578fb06ab53cb@mail.gmail.com>
    <alpine.LNX.1.10.0812191247290.23228@wapiti2.we7u.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0812191247290.23228@wapiti2.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Curt, WE7U" <archer@eskimo.com>
Cc: Bill Vodall WA7NWP <wa7nwp@jnos.org>, linux-hams@vger.kernel.org

> On Fri, 19 Dec 2008, Bill Vodall WA7NWP wrote:
>
>> What would be the advantage of investing all this effort in the KPC3
>> instead of supporting the existing new TT and OT hardware?
>
> Lots of them in the field?
>
> As far as the Opentrackers, the compilers still cost $$.  To me
> that's an impediment to writing open-source code to go on them.  The
> up-and-coming ARM-based Opentracker may be a suitable candidate
> though.  Also, the Opentrackers up through the Tracker2 and T2-135
> don't have a lot of RAM, so back-to-back packets and a full window's
> worth of packets is impossible.
>
> TinyTrak's are much in the same boat except for the TinyTrak4.  I
> have a cross-compiler for the Atmel Mega processors running on
> Linux, and development boards with some Mega processors on them.  I
> suspect there's a special bootloader on Byon's systems that'd have
> to be replaced if one wanted to start from scratch with his
> hardware, but that'd be the only tricky part (for people without a
> burner).  I haven't looked to see how much memory and flash comes
> with the TT4.

I have been working on an APRS design using an ATMega8 (maybe upgrading
as more resources are needed).  It transmits, but doesn't have receive
ability yet.  One reason for picking that processor is the gcc support,
it is great.

I'd be open to working with others to expand this project.

-- 
Don - W7DMR



From: "Andrew Errington" <a.errington@lancaster.ac.uk>
Subject: Re: KPC3+ open-source code?
Date: Sat, 20 Dec 2008 11:58:06 +1300 (NZDT)
Message-ID: <5996.219.89.148.235.1229727486.squirrel@webmail02.lancs.ac.uk>
References: <alpine.LNX.1.10.0812191204230.20748@wapiti2.we7u.net>   
    <5abd436b0812191235v72f98762ub9d578fb06ab53cb@mail.gmail.com>   
    <alpine.LNX.1.10.0812191247290.23228@wapiti2.we7u.net>
    <9fb2b9d1f423367302cb788c35da8df1.squirrel@db-reid.dyndns.org>
    <alpine.LNX.1.10.0812191400430.26718@wapiti2.we7u.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0812191400430.26718@wapiti2.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Curt, WE7U" <archer@eskimo.com>
Cc: don_reid@comcast.net, Bill Vodall WA7NWP <wa7nwp@jnos.org>, linux-hams@vger.kernel.org

Hi,

It's true that an OpenSource drop-in for the KPC3+ would be great... for
KPC3+ owners.  If you have one and want to improve it- go for it.

I'd support the design of an alternative TNC with open hardware and software.

One example is the range of Fox Delta kits-

http://www.foxdelta.com/

The schematics are simple and the PCBs are very affordable.  Reprogramming
a PIC chip to perform different functions is easy (and for some projects
there are alternative firmware files available, tailored to different
applications).

Looking specifically at TNCs, there is a PIC-based modemless design by Bob
Ball WG8WBA here:

http://www.n9cx.com/BobBall.htm

And the same modemless zero-crossing detector technique is also used by
Mike Berg here:

http://www.ringolake.com/pic_proj/zcd/zcdmodem.html

And in Fox Delta's FoxDigi product.  Perhaps you could use the same
techniques for audio input in your projects?

Bob Ball's design is mostly intended as a demonstration of the modemless
receiver technique, but it has a bunch of useful features and the source
code is available.  I have built one, and it works.  I'm going to build
two more and experiment with a three-node APRS setup (one mobile tracker,
one digi and one TNC).  One immediate limitation that comes to mind is the
buffer space for an APRS packet is limited (due to limited RAM in the
PIC), but the limit does not make the design impractical.  It also doesn't
support KISS mode, but that's just software...

If PICs are not your cup of tea then the same techniques could be used on
any micro.

73,

Andrew
ZL3AME



On Sat, December 20, 2008 11:01, Curt, WE7U wrote:
> On Fri, 19 Dec 2008, don_reid@comcast.net wrote:
>
>
>> I have been working on an APRS design using an ATMega8 (maybe upgrading
>>  as more resources are needed).  It transmits, but doesn't have receive
>>  ability yet.  One reason for picking that processor is the gcc
>> support, it is great.
>>
>> I'd be open to working with others to expand this project.
>>
>
> I already have a Mega103 working here with serial and LCD support,
> but haven't tackled sending/receiving yet.  Was thinking about going to a
> Mega128 and doing DSP for the receive, since the MAC
> instructions are pretty fast.
>
> BTW:  The TinyTrak4 uses a Mega processor.  If Byon used a standard
> bootloader without modification, it's possible that hardware could be used
> by others.  If not, the chip would have to be pulled, programmed with a
> standard bootloader, then plugged back in.  Still not _that_ big of a
> deal.
>
> As far as I know the TT4 doesn't have open-source code, but I
> haven't looked for a while.
>
> --
> Curt, WE7U.				archer at eskimo dot com
> http://www.eskimo.com/~archer
> Lotto:  A tax on people who are bad at math. - unknown
> Windows:  Microsoft's tax on computer illiterates. - WE7U.
> The world DOES revolve around me:  I picked the coordinate system!"
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org More majordomo info at
> http://vger.kernel.org/majordomo-info.html
>
>



From: Bill Walton <kj6eo@kj6eo.com>
Subject: Re: Tracking down a Linux crash
Date: Thu, 17 Oct 2002 13:17:13 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3DAF1AC9.91BA36B8@kj6eo.com>
References: <3031448.1034759336@WUSJA129861-8HP> <3DAE5AD6.5CE83E7F@kj6eo.com> <200210171202.g9HC2KD08295@hartford-hwp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Haines Brown <brownh@hartford-hwp.com>
Cc: linux-hams@vger.kernel.org

Hi Haines -

I was using a temperature probe wrapped around the bottom of the CPU
cooling fan.  The probe plugs into a Digital Volt Meter that I bought down
at Sears.  I put the system into a "kernel compile" then slowed down the
speed of the CPU cooling fan via the adjustable power supply.  When the
CPU would reach 60C (plus or minus a degree sometimes), it would just
sieze up "freeze".  The CPU would not recover so I would have to cool it off
and do a cold boot on the entire system.  During this test I would spray some
"component cooler" (freeze spray) lightly on the motherboard to keep it
cool.  You can get the freeze spray at almost any electronics store.  You can
also turn those cans of "compressed air" into freeze spray by holding them
upside down while spraying them.  Be advised that some of the compressed
air (canned) stuff is flammable.  Should you spray it into say some high
voltage it will ignite (you may have known that already).

Since I determined the sieze up temperature of the CPU all I had to do was
to stop cooling down the motherboard with the freeze spray.  And sure
enough at around 50 to 51C the system hung up.  I went down to the local
computer store and exchanged the motherboard....problem resolved.

In my opinion nobody should intentionally overheat their CPU.  In my case
the CPU was "inexpensive".  Furthermore I asked my friends down at the
computer store what type of heat the "Duron" could take before it would
sieze.  I work in the electronics industry, I own a small business and we
service high resolution X-Ray equipment down to component level.  I can't
begin to tell you how many electronics problems I have isolated by
cooling suspected components down with freeze spray (>:  It's just a trick
of the trade.

Regards,

Bill KJ6EO

Haines Brown wrote:

> > I put a variable powersupply on the CPU fan and slowly starved it
> > for air to see if I could duplicate the problem that I was having.
> > The Duron 1300 locked up at 60 degrees C.  Even on the hottest days
> > I was not exceeding a CPU temperature of 50 degrees C max.  To make
> > a long story short, my problem was due to a motherboard failure.  I
> > traced it down by using some component cooler.  I replaced the MB
> > .... problem solved.
>
> Bill,
>
> Could I ask for a little more detail? How were you measuring CPU
> temperature? What do you mean by a "component cooler?" Did you select
> areas of the MB to cool and then await the result?
>
> Haines Brown KB1GRM


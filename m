From: John Magliacane <kd2bd@yahoo.com>
Subject: Re: DCF receiver as frequency normal ?
Date: Tue, 8 Jan 2008 13:15:47 -0800 (PST)
Message-ID: <224969.88075.qm@web36903.mail.mud.yahoo.com>
References: <4780B854.5020306@mail.tele.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4780B854.5020306@mail.tele.dk>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Erik Jakobsen <erik_ja@mail.tele.dk>, linux-hams@vger.kernel.org

--- Erik Jakobsen <erik_ja@mail.tele.dk> wrote:

> Hi.
> 
> Up here in Denmark we used to use the Kalundborg Longwave
> transmitter as frequency normal for frequency coumters.
> This did stop at the first of year 2007 as the station closed.
> 
> I then thought, if I could use many of the DCF clocks I have
> here in the house.
> 
> Has anyone made that, or know where to find information about
> such a project ?

I think it might be rather difficult since most DCF, MSF, WWVB
time code receivers are essentially TRF designs with a tuning
fork crystal to provide the needed selectivity.

A receiver using synchronous detection might be better suited for
DCF carrier reception and extraction.

DCF's 77.5 kHz is a bit odd, but there is probably a way of
dividing a stable crystal oscillator down in a way that it can
be phase compared to DCF's carrier, with the resulting error
voltage being fed back to the crystal oscillator to steer it
into agreement with DCF's atomically controlled carrier.

I use a synchronous detection approach in the US using WWVB's
carrier on 60 kHz.  My homebrew receiver disciplines a 10 MHz
crystal oscillator which in turn serves as a timebase for my
homebrew frequency counter.  It works very well.


73, de John, KD2BD


Visit John on the Web at:

	http://kd2bd.ham.org/
.
.
.
.


      ____________________________________________________________________________________
Never miss a thing.  Make Yahoo your home page. 
http://www.yahoo.com/r/hs

From: Bill Walton <kj6eo@kj6eo.com>
Subject: Re: Tracking down a Linux crash
Date: Wed, 16 Oct 2002 23:38:14 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3DAE5AD6.5CE83E7F@kj6eo.com>
References: <3031448.1034759336@WUSJA129861-8HP>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Ackermann N8UR <jra@febo.com>
Cc: linux@lists.tapr.org, linux-hams@vger.kernel.org

Hi John -

The others are much more qualified than me to comment on your problem but I do
have some information that I would like to contribute.  Recently I have built a
prototype system (RH7.2)(2.4.19)(Duron 1300)(MSI KT3 Ultra2)(250MB DDR
SDRAM)(30gig Maxtor 7200 HD)(TNT2 PCI Video Card)(D-Link Lan cards).
I had the same type of failure that your having and it was driving me nuts.  My
servers are in a 19" rack cabinet out in the garage.  As you can imagine during the
hot summer months the servers take a beating out there.  However I do run every
type of cooler gadget I can get my hands on...even HD coolers.  Believe it or not
they work great out there inspite of the heat.

In my case I had to determine if the CPU was locking up, or if the MB, or something
else was overheating.  I ran a heat test on the DURON 1300.  I put a variable
powersupply on the CPU fan and slowly starved it for air to see if I could duplicate
the problem that I was having.  The Duron 1300 locked up at 60 degrees C.  Even
on the hottest days I was not exceeding a CPU temperature of 50 degrees C max.
To make a long story short, my problem was due to a motherboard failure.  I traced
it down by using some component cooler.  I replaced the MB .... problem solved.

I don't know about the Athlon processor but the Duron runs extremely hot.  The
run of the mill CPU cooler down at the computer store just will not cut it.  I am
running  a copper heatsink CPU cooler now with a high speed fan, heat pipes, silver
grease, etc.  Even on the hottest days I don't exceed around 42 degrees C.

It would be interesting to know what temperature your CPU is running at!  I bet that
the Athlon would lock up at 60 degrees C.  If you have a good CPU cooler that
would be almost impossible to accomplish inside your house with the AC on.

Good Luck,

Bill KJ6EO




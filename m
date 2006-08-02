From: Dave Platt <dplatt@radagast.org>
Subject: Re: soundmodem won't decode 300 baud signals?
Date: Wed, 2 Aug 2006 16:08:09 -0700 (PDT)
Message-ID: <courier.44D13059.000019AF@radagast.org>
References: <20060802223941.GA30169@cloud.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20060802223941.GA30169@cloud.net.au>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

> > There was a very similar question posted here back in November 2005 
> > which never got an answer, so I guess I will have to ask again. I've 
> > been trying to receive 300 baud packet signals via HF with soundmodem, 
> > and have had no luck thus far. I have a channel configured with these 
> > settings on the Demodulator tab:
> > 
> [..]
> > When receiving a signal, the diagnostic screen shows that the modem is 
> > just detecting a solid string of '1's. The app seems to be able to 
> > decode 300 baud packets sent over FM from another computer running 
> > soundmodem with the same settings.
> > 
> > Is this supposed to work? If so, what am I doing wrong?

> At a glance at the source code, 300 baud isn't supported, so I don't
> know how you got 300 baud from another computer to be detected. Was that
> running soundmodem also, or some other implementation?

The code at the beginning of the "demodconfig" function in
afsk/modem.c suggests to me that it'll at least try to work
at rates of between 100 and 9600 bits/second. 

If it works correctly using FM, and not on HF, then my guess
would be that it may be an issue of tuning accuracy.

I suspect that the soundmodem demodulator probably uses
fairly sharp (high-Q) digital filters, in order to improve
noise immunity.  If that's the case, then the tuning of
your HF rig would become quite critical.  You're trying to
distinguish between two frequencies which are only
200 Hz apart... and if the filters are actually sharp enough
to distinguish these frequencies, then a tuning error of
as little as 50 Hz might be enough to move the carriers too
far away from the filters' center-of-passband points.

You might want to fiddle with your rig's RIT function, while
trying to receive/demodulate an HF packet signal.  Adjust the
tuning in increments of as small as you can - 10 Hz or so at
a time - and see if there's a point at which the demodulator
manages to lock onto the signal and give you a recognizable
bitstream.

Commercially-built HF packet modems usually have some sort of
tuning indicator on the front panel, which shows the frequency
of the audio carrier in some way - this allows the receiver tuning
to be adjusted to allow proper decoding of the tones.

Digital-mode software for HF (e.g. PSK31 and similar modes)
often incorporates a software-driven fine-tuning feature, to
allow the software to lock onto the signal in the face of
slight tuning errors, frequency drift in the transmitter and/or
receiver, etc.  This fine-tuning is done by changing the
configuration of the software demodulator (e.g. recalculating
filter coefficients), not by actually re-tuning the radio.

As far as I can tell, the soundmodem demodulators don't have
this capability.  I imagine it could be added, at some
investment of effort.



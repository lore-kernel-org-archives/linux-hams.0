From: Dave Platt <dplatt@radagast.org>
Subject: Re: USB sound adapter for use with Tom's soundmodem?
Date: Mon, 15 Dec 2008 11:00:15 -0800
Message-ID: <4946A93F.5060104@radagast.org>
References: <49432397.8060304@weca.org>    <courier.4943332E.0000255C@radagast.org> <4388.219.89.148.235.1229141951.squirrel@webmail02.lancs.ac.uk> <49443D5C.1020307@weca.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <49443D5C.1020307@weca.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alan Crosswell <n2ygk@weca.org>
Cc: Andrew Errington <a.errington@lancaster.ac.uk>, linux-hams@vger.kernel.org

Alan Crosswell wrote:
> Do these cheapo USB things with only a Mic input have enough impedance
> matching to handle a line level input? 

A line-level signal is at a substantially higher voltage level... it's
usually 1 to 2 volts peak-to-peak.  Microphone level is lower... perhaps
100 millivolts peak-to-peak.

Driving a microphone input with a line-level signal may overdrive it
into serious distortion.  On some devices, the input is switchable
between line and microphone levels (this is usually done via the
software mixer).  On others, the additional gain in the mic path
cannot be defeated, and it's necessary to "turn down" the input
signal to avoid overdriving.

This "turn-down" can be done with a couple of resistors, or (if
you want adjustable gain) via a potentiometer.

There's a disadvantage to "padding" down the signal level and
going in the higher-gain mic input - the resulting noise level will
probably be somewhat higher than if you went into a properly-
level-matched line input.

Impedance matching per se is very probably not a problem in this
case.  Line-level drive circuits usually have a fairly low output
impedance (a few tens or hundreds of ohms), and both mic and line-level
inputs have relatively high input impedances (tens of thousands of
ohms).  The input impedance is so high that it does not load down
the driving circuit by any significant amount.

> The reviews seem to be focused on playback.  I'm willing to invest the
> $5 to find out but would rather not waste a week to find out....

My guess is that this approach would probably work just fine for
AFSK packet, with most cheap USB audio dongles (plus a padding
resistor or two), due to the characteristic of the signal...
high audio level, lots of gain in the FM signal path, and no
close-in interferers within the audio bandwidth.

I'm not sure they'd work as well in (for example) weak-signal
I/Q demodulation applications - their dynamic range might not
be adequate.


From: Dave Platt <dplatt@radagast.org>
Subject: Re: user soundmodem problems on Inspiron 8200 i810 chipset...
Date: Wed, 10 Mar 2004 11:15:11 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040310191511.18981.qmail@radagast.org>
References: <404F540B.3050309@scs.ch>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <404F540B.3050309@scs.ch>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sailer@scs.ch
Cc: braddock@braddock.com, Linux-Hams@vger.kernel.org

> Looks like alsa tries to do sample rate conversion, but
> "somewhat" imperfectly. Sigh. Does anyone know how to convince
> ALSA to not do any sample rate conversion in their OSS emulation?

From what I can see, it looks as if ALSA tries to pick the "native"
rate supported by the card/chipset which is closest to the rate
being requested by the application.  There seems to be some logic
which will also accept a [sub?]multiple of the native "best" rate.

If the native rate is within 5% of the application-requested rate, 
then ALSA says "What the heck!" and passes the data through without
conversion.  Otherwise, the sample-rate-conversion plugin is 
inserted into the digital-signal chain.

The Intel 8x0 driver definition says that the driver supports
precisely one native sample rate - 48000 samples/second.  I
can't remember whether AC97 codecs are physically capable of
supporting any other sampling rate, and I don't know whether the
8x0 has a built-in hardware resampler.

There may be no way around having to do software-based resampling
on this chip (or on some others).  Whether it should be done by
ALSA in the kernel, or by the application, is probably a decision
which would depend on the application.

> In the long run soundmodem probably should just use alsa natively.

That's probably quite desireable, as the 2.6 kernel has switched
over to ALSA, and the OSS emulation does seem to have some
significant limits to it.

It might be worth considering adding support for the ALSA "JACK"
bus interface, in addition to (or instead of) doing low-level ALSA
calls.


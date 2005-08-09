From: Dave Platt <dplatt@radagast.org>
Subject: Re: Filter for 430Mhz
Date: Tue, 9 Aug 2005 14:11:42 -0700 (PDT)
Message-ID: <20050809211142.4910.qmail@radagast.org>
References: <200508092151.57245.stephen@g6dzj.demon.co.uk>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200508092151.57245.stephen@g6dzj.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: stephen@g6dzj.demon.co.uk
Cc: linux-hams@vger.kernel.org

> I have a problem with a really near 430Mz transmitter (my own) that is 
> breaking though to the TV. The Transmitter isn't off tune and as far as I 
> Know or can see, it isn't producing any side transmissions or birdies. 

I had similar problems with my 2-meter transmissions affecting all the TVs
in the house.

The root of the problem was the use of a cheap Radio Shack TV signal
amplifier and distribution box.  The strong local signal was overdriving
the amplifier (probably a 1- or 2-transistor broadband design) and causing
it to distort every signal passing through it.

You may be running into a similar problem, even if you don't have a
separate distribution amplifier.  TV tuner circuits are often optimized
for weak-signal conditions, and may not have a high enough IP3 to hold
off a strong local signal.  This "fundamental overload" can't be cured
at the transmitter, as you clearly understand - you have to keep the strong
signal out of the electronics which were being overdriven.

> So, My question is, does anyone know of a really good filter design or 
> commercial filer that will block 430.625 so that it dosn't appear in the 
> downlead to the TV.

You'll need a notch or bandstop filter, or a set of paralleled bandpass 
filters, to allow the TV frequencies through and block the 430 MHz signal.
A notch or bandstop will probably be the best way to go.

The solution I found (after searching around for quite a while) is
a notch filter made by the Tin Lee company in Canada.  They specialize
in TV filters of various sorts, and their selection is much richer
than I was able to find via any local supplier. 

The one I bought was one of their CR7 models - a band-stop
type which knocks out everything from 130 MHz to 175 MHz.
Mounted right up at the antenna, it does a beautiful job...
the overload/interference problem has gone away entirely.

I suggest that you contact them at www.tinlee.com, and give them
the details of the frequency range(s) you want to pass and which
you wish to notch out.  They may have a stock model which will
do what you want, they have some tunable models, and if all
else fails I'm sure they can build you a custom trap against
the frequency you're concerned about.

You could try building a coaxial-trap notch (e.g. a quarter-wave
open section of coax, or a half-wave shorted section of coax,
connected in parallel with the feedline) but this might have
adverse effects on other frequencies.

73,

	Dave AE6EO

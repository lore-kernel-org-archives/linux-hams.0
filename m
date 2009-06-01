From: Dave Platt <dplatt@radagast.org>
Subject: Re: /dev/dsp busy
Date: Sun, 31 May 2009 22:38:15 -0700
Message-ID: <4A236947.8070602@radagast.org>
References: <200906011059.15279.phillor@telstra.com> <4A234B0C.6010608@radagast.org> <200906011450.38388.phillor@telstra.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200906011450.38388.phillor@telstra.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Phil <phillor@telstra.com>
Cc: linux-hams@vger.kernel.org


> Now another problem has surfaced; there is a ticking sound in the 
> background of the transmitted sound. Again, this is a problem that I 
> had previously encountered and the cure was to buy a different sound 
> card. However, this option is not viable in the case of a laptop.
> 
> I don't know what effect this ticking sound will have on my transmitted  
> signal (I've recently returned to Amateur Radio after a lengthy break 
> and need to construct a suitable lead) but I'm sure that I can do without 
> it.
> 
> Again, can anyone offer any suggestions?

I've observed something like this when:

-  The sound card has an ALSA driver, and

-  The sound card supports only a limited set of audio sample
    rates, and

-  The application is asking for a sample rate which is not
    directly supported by the sound card hardware, and

-  The application is using the legacy /dev/dsp audio
    API, via the ALSA OSS-compatibility driver

The problem here seems to be a flaw in the ALSA /dev/dsp
driver in the kernel.  This driver attempts to do sample
rate (and format) conversion, when the app asks for a sample
rate that the hardware doesn't support, but there's a bug
in the conversion algorithm. I've seen this problem on input
(the input data has zero-valued samples inserted) and I've
noticed it on output as well.  I think it occurs when the
ALSA I/O ring buffer wraps around.

The only solution I've found (short of using a different
sound interface) is to have the application use the ALSA
I/O API directly, rather than going through the /dev/dsp
OSS emulation driver.  When using ALSA, the direct hardware
driver ("hw:") won't do any sample rate or format conversions
at all - if the app asks for a format or rate not supported,
an error is returned.  If the app really does need a rate not
supported by the hardware, you can use the "plughw:" driver,
which does software sample-rate/format conversion in a
library plug-in - this conversion seems to work much better
than the one in the OSS emulation driver.

As far as laptop sound cards go - I gave up on trying to get
the one in my Chembook laptop to work right (the mic input
is fouled up somehow), and bought a SignaLink USB.  This
works very well for ham applications (it has its own VOX-
based PTT) when used with the ALSA "plughw:" driver.


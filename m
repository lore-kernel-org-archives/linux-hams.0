From: Luc Langehegermann <luc@lx2gt.lu>
Subject: Re: Usermode Soundmodem
Date: Mon, 26 Jul 2004 19:47:40 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200407261947.40492.luc@lx2gt.lu>
References: <20040726173439.32595.qmail@radagast.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040726173439.32595.qmail@radagast.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Monday 26 July 2004 19:34, you wrote:
> Dave Stubbs <dave.stubbs@utoronto.ca> wrote:
> > Hello all,
> >
> > Just to mention, I recently set up the usermode soundmodem on Linux
> > 2.6.6 and when configuring my kernel I noticed that a new option was
> > available under the ALSA settings - OSS PCM (Digital Audio) API.  This
> > basically gives a /dev/dsp device which plugs right into ALSA.  So far,
> > the usermode soundmodem software is working really well with this setup,
> > on a Soundblaster Live even.  Something worth trying?
>
> The OSS emulation seems to work well for the soundmodem on some systems,
> and not on others.  Similar issues appear to exist with certain other
> sound-card ham software.
>
> From what I can tell, the problem is one of rate conversion.  The OSS
> plugin for ALSA attempts to provide/accept data at the sample rate
> specified by the user-mode application.  If the system's sound card
> cannot sample/play at a rate fairly close to what the application
> requests, the ALSA plugin tries to rate-convert the samples.  This
> conversion logic appears to have some rather major glitches in
> quite a few cases - these result in zero-values samples appearing
> in the buffers (at buffer boundaries, I suspect), and the resulting
> crackling and noise plays merry hob with the digital radio modes.
>
> The problem appears to be most apparent on systems whose sound
> interfaces use an AC97 codec.  These codecs usually have only
> a limited number of hardware-based audio rates available (e.g.
> 44100 and 48000 samples/second).  Some systems have hardware-based
> sample rate converters in their audio chips, to convert between
> the codec's rate(s) and the application data rate, but I think
> that not all of the ALSA drivers are "aware" of this and can
> take advantage of it.
>
> The net result is that using the OSS emulation plugin, on a
> system with an AC97 codec, often results in unacceptable
> distortion of the audio signal and bad results in the digital-
> mode ham software.
>
> It's possible to "echo" a string into one of the ALSA
> configuration entries in the /proc filesystem, after loading
> the OSS emulation plugin, and turn off the sample rate conversion.
> This will, I believe, cause the OSS emulator to restrict the
> rates at which it will work (and which it reports to the application)
> to those rates implemented by the native hardware.  An application
> which can do its own rate conversion (or simply operate at
> an arbitrary sample rate) will probably work better, in this
> mode.
>
> The newer "native" ALSA support in the soundmodem should also
> provide a way around the poor sample-rate conversion in the
> OSS plugin, as it bypasses this plugin entirely.
>

Well... that is only true for 'standart' soundcards.

You will not be able to use it with an card which has an ice1712 chip. 
Channels arent there defined per PCM devices, but you have one PCM device 
with 12 channels. 

soundmodem doesn't support that. Another problem is, you will only get 32 bit 
samples, so anyway have to use plughw (again plugins....)

I did an ugly hack, added an command line switch to the code, that lets you 
use an fixed sample rate. This workaround seems to work with my card, and OSS 
emulation. But only testet it with loopback from another soundcard, didn't 
yet get a chance to test it on the air.

If anyone is interested to try it out, I could send him the modified source.

73, Luc, LX2GT

> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

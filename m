From: Braddock Gaskill KD5ZVK <braddock@braddock.com>
Subject: Re: user soundmodem problems on Inspiron 8200 i810 chipset...
Date: Wed, 10 Mar 2004 13:36:45 -0600
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040310193645.GA3882@braddock.com>
References: <20040309022333.GA4377@braddock.com> <1078861838.2336.1.camel@law3lz8h11.lib.loc.gov> <20040309213542.GA27566@braddock.com> <404F540B.3050309@scs.ch>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <404F540B.3050309@scs.ch>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-Hams@vger.kernel.org
Cc: Thomas Sailer <sailer@scs.ch>

On Wed, Mar 10, 2004 at 06:44:43PM +0100, Thomas Sailer wrote:
> >http://braddock.com/soundmodem.png
> 
> Looks like alsa tries to do sample rate conversion, but
> "somewhat" imperfectly. Sigh. Does anyone know how to convince

The only strange thing about that theory (which I tend to agree
probably is what's going on) is that if I do a 9600 samp/sec capture
with SOX using the OSS interface, and look at the capture in Octave, I
don't see the anomaly.  In fact, I can then take the 9600 samp/sec SOX
capture of APRS input and use it with an unmodified version of
soundmodem in "file" mode and get perfect copy.

The command I'm using for the sox capture is:
sox -V -r 9600 -t ossdsp /dev/dsp -t wav -b -u -r 9600 /tmp/output4.wav
(or -t raw to look at it in Octave)

Now, a dmesg reveals an ALSA warning message when the snd-ac97-codec
module is inserted:
ALSA ../../alsa-kernel/pci/ac97/ac97_codec.c:1861: MC'97 1 converters and GPIO not ready (0xff00)

I don't know if that warning is related.

Sox (in -V verbose mode) outputs:
sox: Input file /dev/dsp: using sample rate 9600
        size bytes, encoding unsigned, 1 channel
sox: Input file /dev/dsp: comment "/dev/dsp"
sox: Writing Wave file: Microsoft PCM format, 1 channel, 9600 samp/sec
sox:         9600 byte/sec, 1 block align, 8 bits/samp
sox: Output file /tmp/output4.wav: using sample rate 9600
        size bytes, encoding unsigned, 1 channel
sox: Output file: comment "/dev/dsp"
sox: Finished writing Wave file, 17408 data bytes 17408 samples

At any rate, it's at least good to have these findings in the list
archives for others if nothing else.

	braddock gaskill (KD5ZVK)

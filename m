From: braddock@braddock.com
Subject: Re: user soundmodem problems on Inspiron 8200 i810 chipset...
Date: Tue, 9 Mar 2004 16:52:14 -0600
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040309225214.GA529@braddock.com>
References: <20040309022333.GA4377@braddock.com> <1078861838.2336.1.camel@law3lz8h11.lib.loc.gov> <20040309213542.GA27566@braddock.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040309213542.GA27566@braddock.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-Hams@vger.kernel.org
Cc: Patrick Ouellette <kb8pym@vzavenue.net>, t.sailer@alumni.ethz.ch

I have found a (kludgy) fix to my i810 chipset sampling problems.

The problem does indeed seem to have something to do with the sound
sampling rate with the i810 ALSA driver.  By forcing soundmodem to
capture at the more standard 22500 samp/sec instead of the 9600
samp/sec that it wants to, I get PERFECT RECEPTION!  (now I wish I
hadn't ordered that hardware TNC this morning...*sigh*)

Specifically what I did was to force the sample rate in the
afsk/modem.c file in the modconfig() function.  soundmodem tries to
set it to 8*baudrate.  I just hard code it to 22500.

        /* *samplerate = 8 * s->bps;*/ /* OLD */
        *samplerate = 22500; /* NEW - braddock's ALSA kludge */

This presumably won't be sufficient for 9600 baud, but it
gets me working fine at 1200 which is all I need right now.

I suspect there is some portion of soundmodem which relies on that 8 *
bps sample rate.  One thing I did find is that if I force the rate to
48000 samp/sec, DCD stops working almost entirely.  Maybe Tom Sailer
could shed some light on this, or point me to code that I can fix it?
Or maybe it's just another driver quirk.  I also found that if I force
the rate to 8000 samp/sec that I saw the same anomaly in the scope
that I described for 9600 samp/sec.

It should be a simple matter to allow the user to add a prefered
sample rate on the command line.

	Braddock Gaskill

On Tue, Mar 09, 2004 at 03:35:42PM -0600, braddock@braddock.com wrote:
> On Tue, Mar 09, 2004 at 02:50:38PM -0500, Patrick Ouellette wrote:
> I did notice one anomaly that occurred frequently on the soundmodem
> diagnostic scope that I'm thinking might be signs of trouble.  In the
> capture, the line traced on the scope would occasionally draw a
> straight horizontal line within the signal at random places (both
> horizontally and vertically).  This "dead spot" seems to be uniformly
> about 4 1200 Hz cycles (~3 ms).  This does not seem to be clipping
> because it occurs at random levels.
> 
> Here is an excellent screen shot of the scope showing two instances of
> this anomaly in an otherwise pretty clean looking signal:
> 
> http://braddock.com/soundmodem.png
> 
> I'm wondering if this is a sampling problem with the ALSA i810 driver?
> If anyone could take a look at that scope image and let me know if
> that's normal behavior within the scope or a sound capture problem it
> would help us narrow this down.  It occurs at all sound levels AFAIK.
> 
> Also, I tried running soundmodem on a desktop system (vs my Inspiron
> laptop) that also has the Intel i810 sound chipset and ALSA drivers,
> with the exact same results.
> 
> All help much appreciated!
> 
> 	-Braddock Gaskill

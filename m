From: braddock@braddock.com
Subject: Re: user soundmodem problems on Inspiron 8200 i810 chipset...
Date: Tue, 9 Mar 2004 15:35:42 -0600
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040309213542.GA27566@braddock.com>
References: <20040309022333.GA4377@braddock.com> <1078861838.2336.1.camel@law3lz8h11.lib.loc.gov>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1078861838.2336.1.camel@law3lz8h11.lib.loc.gov>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-Hams@vger.kernel.org
Cc: Patrick Ouellette <kb8pym@vzavenue.net>, t.sailer@alumni.ethz.ch

On Tue, Mar 09, 2004 at 02:50:38PM -0500, Patrick Ouellette wrote:
> Have you tried muting the microphone input?  I had problems a few years

I have tried muting it (as well as using the mic-in jack directly
instead of the line-in jack).

I did notice one anomaly that occurred frequently on the soundmodem
diagnostic scope that I'm thinking might be signs of trouble.  In the
capture, the line traced on the scope would occasionally draw a
straight horizontal line within the signal at random places (both
horizontally and vertically).  This "dead spot" seems to be uniformly
about 4 1200 Hz cycles (~3 ms).  This does not seem to be clipping
because it occurs at random levels.

Here is an excellent screen shot of the scope showing two instances of
this anomaly in an otherwise pretty clean looking signal:

http://braddock.com/soundmodem.png

I'm wondering if this is a sampling problem with the ALSA i810 driver?
If anyone could take a look at that scope image and let me know if
that's normal behavior within the scope or a sound capture problem it
would help us narrow this down.  It occurs at all sound levels AFAIK.

Also, I tried running soundmodem on a desktop system (vs my Inspiron
laptop) that also has the Intel i810 sound chipset and ALSA drivers,
with the exact same results.

All help much appreciated!

	-Braddock Gaskill

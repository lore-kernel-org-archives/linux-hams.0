From: Thomas Sailer <sailer@scs.ch>
Subject: Re: user soundmodem problems on Inspiron 8200 i810 chipset...
Date: Wed, 10 Mar 2004 20:26:23 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1078946783.18937.92.camel@kronenbourg.scs.ch>
References: <20040310191511.18981.qmail@radagast.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040310191511.18981.qmail@radagast.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dave Platt <dplatt@radagast.org>
Cc: braddock@braddock.com, Linux-Hams@vger.kernel.org

On Wed, 2004-03-10 at 20:15, Dave Platt wrote:

> From what I can see, it looks as if ALSA tries to pick the "native"
> rate supported by the card/chipset which is closest to the rate
> being requested by the application.  There seems to be some logic

This is what OSS is supposed to do too. Soundmodem doesn't care much
about what sample rate is chosen in the end, it just needs to know to
update the filters correctly.

> which will also accept a [sub?]multiple of the native "best" rate.

which is not a good idea. This introduces aliasing distortion, and many
application just try to request one rate, trusting that the driver will
tell it if the hardware doesn't support it.

> The Intel 8x0 driver definition says that the driver supports
> precisely one native sample rate - 48000 samples/second.  I
> can't remember whether AC97 codecs are physically capable of
> supporting any other sampling rate, and I don't know whether the
> 8x0 has a built-in hardware resampler.

AC97 codec aren't required to support anything else than 48kHz, and
afaik the 8x0 doesn't have a hw sample rate converter.

> ALSA in the kernel, or by the application, is probably a decision
> which would depend on the application.

Soundmodem can do this itself. In fact it would prefer the driver to
just say what the hardware does, and that the driver doesn't try to be
too clever.

Tom


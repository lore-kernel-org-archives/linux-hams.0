From: Dave Platt <dplatt@radagast.org>
Subject: Re: Usermode Soundmodem
Date: Tue, 27 Jul 2004 10:54:06 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040727175406.4373.qmail@radagast.org>
References: <1090949358.1278.29.camel@oh2bns.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1090949358.1278.29.camel@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-hams List <linux-hams@vger.kernel.org>

Tomi Manninen <oh2bns@sral.fi> wrote:
> On Tue, 2004-07-27 at 18:04, Andrea Borgia wrote:
> 
> > Unfortunately, I am not really a DSP expert, so there might be deeper 
> > reasons why the soundmodem is using a specific sample rate rather than 
> > the one most convenient to the hardware, especially considering that 
> > quite a few recent chipsets only offer a limited selection of rates.
> 
> I think most modems (but not all!) in soundmodem should work with
> any sample rate (above some minimum). Soundmodem requests the rate
> that best suits whatever modem is in use and then settles for
> whatever it gets (calculating stuff respectively).

As I understand it, part of the problem is that the ALSA OSS layer
tries to be very accommodating of the application's desires.
If the application requests a rate of 9600 samples/second, and
the sound card can't come close to this, the normal behavior of
the ALSA OSS plugin is to say "Sure, this rate is available!" and
activate its own internal sample-rate converter.  It looks to me
as if it's difficult (or perhaps even impossible?) for the soundmodem
to "know" what the underlying card's native sample rates are, and
what rates are available only via ALSA sample-rate conversion.

If you disable the OSS emulator's sample rate converter, then
the rate conversion won't happen, and the ALSA driver will
pass through one of the native (non-converted) sample rates.
This will then let the soundmodem adjust itself accordingly,
and I suspect that it will produce rather better results.


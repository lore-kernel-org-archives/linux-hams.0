From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: Usermode Soundmodem
Date: Tue, 27 Jul 2004 21:21:12 +0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1090952471.1272.34.camel@oh2bns.ampr.org>
References: <20040727175406.4373.qmail@radagast.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040727175406.4373.qmail@radagast.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

On Tue, 2004-07-27 at 20:54, Dave Platt wrote:

> It looks to me
> as if it's difficult (or perhaps even impossible?) for the soundmodem
> to "know" what the underlying card's native sample rates are, and
> what rates are available only via ALSA sample-rate conversion.

It probably is impossible (I don't know if the ALSA can be used
to ask for a "real" rate?).

> If you disable the OSS emulator's sample rate converter, then
> the rate conversion won't happen, and the ALSA driver will
> pass through one of the native (non-converted) sample rates.
> This will then let the soundmodem adjust itself accordingly,
> and I suspect that it will produce rather better results.

Yes, but anyway it could be usefull to give the user the
possibility to fix the rate. The user might actually know what
the best rate is (and it gives the possibility to try
different rates).

-- 
Tomi Manninen / OH2BNS / KP20ME04


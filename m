From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: Re: spread spectrum and broadband
Date: Mon, 18 Nov 2002 13:55:43 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021118115543.GD1099@mea-ext.zmailer.org>
References: <200211172241.gAHMf4C31685@hartford-hwp.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200211172241.gAHMf4C31685@hartford-hwp.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Haines Brown <brownh@hartford-hwp.com>
Cc: linux-hams@vger.kernel.org

On Sun, Nov 17, 2002 at 05:41:04PM -0500, Haines Brown wrote:
> So I wondered about the potential of spread spectrum for increasing
> bandwidth from, say, 1200 baud to 56 Kbaud. I'd appreciate someone's
> input on the relation of information bandwidth and RF spectrum
> bandwidth when using spread spectrum. Does spread spectrum offer any
> potential at all for increasing signal bandwidth of a TCP/IP HF WAN?

  In theory the best signal/power (and likely best working HF-) solution 
  would be M-ary-FSK.   It is being used quite successfully in various
  forms of QRP QSO communication, but nothing (in theory) prevents its
  use for some other purposes.  For a long time various forms of it
  have been used in commercial RTTY-like communciations. (Piccolo, et.al.)

  You _will_ need special radios, if you aim to reach for more than
  3 kHz RF bandwidth.

  Take 32-ary-FSK-at-100 baud:

  - Send 5 bits per baud (half of them FEC, or 3/4..)
  - 100 baud -> tone separation _at_least_ 100 Hz -> 3 200 Hz total BW.
  - BARELY doable with SSB radio!

  With that you get 500 bps datastream, of which perhaps 130 bps is 
  payload.  There are a number of reasons why going beyond 32-ary is
  probably not usefull, so your only way to increase the throughput
  is to increase baud-rate --> increase total signal bandwidth.
  Tradeoff (like with ary-ness increase) is in the noise-margin, and
  transmitter power.  At HF even 16-ary (at high speed) is tough.

  If you want 32000 bps datastream with 3/4 FEC, you need around 128 000
  bps raw stream, and with 16-ary (4 bit) that means around 32000 baud,
  and similarly >= 32000 kHz tone separation, and >= 0.512 MHz total 
  bandwidth.  Quite spread-spectrum already...

  At microwave frequencies (up from VHF) that is no problem at all, but at
  HF it is unacceptable, and likely will encounter differing propagation
  delays.

  Pure BPSK has troubles with HF propagation, as the phase has a tendency
  to flip around in ionosphere.

> Haines Brown KG1GRM 

/Matti Aarnio, OH1MQK

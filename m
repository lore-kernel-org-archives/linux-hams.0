From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: ANN: mt63lx version 0.5
Date: Thu, 15 Jul 2004 17:05:19 +0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1089900318.1286.21.camel@oh2bns.ampr.org>
References: <20040715035315.28315.qmail@radagast.org>
	 <40F612A9.2060903@gelm.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <40F612A9.2060903@gelm.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

Chuck,

>   Is 'MT63' a development project or is it really ready for
> 'user' deployment?  i.e. Is it 'alpha', 'beta', or
> stable release?

MT63 is an 'advanced' HF modulation method for keyboard to
keyboard QSOs, devised by Pawel SP9VRC some eight, nine years 
ago. I'm not sure what constitutes stable release but the mode
has been in use in this form for years. Look for MT63 signals
on 14.109.5 MHz USB. For more information about MT63 go to

 http://www.qsl.net/zl1bpu/MT63/MT63.html

There is also a YahooGroups group for MT63.

The MT63lx package I announced is a text mode modem/terminal for
MT63, written by Pawel himself, and like I said it's the 
base for most of the other programs out there that support MT63.

For end users, on Linux, I'd recommend my gMFSK which also has
an MT63 modem built in. Go to:

 http://gmfsk.connect.fi/

Software dependencies of gMFSK are hopefully detailed clear enough
there. Apart from Gnome libs and FFTW there aren't any special
needs. All modern Linux distributions, FreeBSD, OpenBSD and
possibly others should work without big problems.

I started coding gMFSK on a 120 MHz Pentium, but it has grown a
lot since. I don't have a low end PC to test with so I don't dare
to give a minimum required CPU limit. My 900 MHz Duron mostly
twiddles it's thumbs when decoding any of the supported modes...

As to connecting to your radio, whatever works for PSK31, works
for MT63. There should be plenty of info about interfacing
sound card digital modes on the Net. Level adjustment is quite
critical with MT63 as the mode has a rather high peak to average
power ratio.

-- 
Tomi Manninen / OH2BNS / KP20ME04


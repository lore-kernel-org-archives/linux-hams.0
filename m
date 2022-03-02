From: Richard Stearn <richard@rns-stearn.co.uk>
Subject: Re: Wireshark ax25 dissector
Date: Wed, 02 Mar 2022 15:00:07 +0000
Message-ID: <621F8677.3000008@rns-stearn.co.uk>
References: <20220301173317.AF98C28A6C6@yagi.h-net.msu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20220301173317.AF98C28A6C6@yagi.h-net.msu.edu>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Hams <linux-hams@vger.kernel.org>

Dennis Boone wrote:

> I'm having trouble getting Wireshark's ax25 dissector to process
> callsign filters properly.  I can't get _anything_ to match.  I've tried
> expressions like:

The ax25 dissector never had the ability to filter on a callsign in the form 
<CALL>-<SSID> it has always used the builtin filter primitives.

See "man wireshark-filter"

So to filter on KB8ZQZ you would use:

	ax25.src[0:6] == 97:85:71:B5:A3:B5

to filter on the source address or

	ax25.dst[0:6] == 97:85:71:B5:A3:B5

You can find the hexadecimal in the AX.25 line in brackets after the
callsign.

So it is not a bug per se.  More of the point at which I had to abandon
development due to ill health.

-- 
Regards
	Richard


From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: Usermode Soundmodem
Date: Tue, 27 Jul 2004 20:29:18 +0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1090949358.1278.29.camel@oh2bns.ampr.org>
References: <E1BpBxl-0007Fp-00@penngrove.fdns.net>
	 <41066EF6.9000200@cs.unibo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <41066EF6.9000200@cs.unibo.it>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

On Tue, 2004-07-27 at 18:04, Andrea Borgia wrote:

> Unfortunately, I am not really a DSP expert, so there might be deeper 
> reasons why the soundmodem is using a specific sample rate rather than 
> the one most convenient to the hardware, especially considering that 
> quite a few recent chipsets only offer a limited selection of rates.

I think most modems (but not all!) in soundmodem should work with
any sample rate (above some minimum). Soundmodem requests the rate
that best suits whatever modem is in use and then settles for
whatever it gets (calculating stuff respectively).

A command line switch to force a specific sample rate could be
useful addition to soundmodem. (I think someone already did that?)

-- 
Tomi Manninen / OH2BNS / KP20ME04


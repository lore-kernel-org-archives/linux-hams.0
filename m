From: Bill Vodall WA7NWP <wa7nwp@jnos.org>
Subject: Re: YAPP server pgm - Packet File Transfer
Date: Thu, 14 Jul 2005 16:50:31 -0700
Message-ID: <42D6FA47.3060403@jnos.org>
References: <20050714230149.31626.qmail@radagast.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20050714230149.31626.qmail@radagast.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


> 
> It's been years since I played around much with this (back when I was
> the de facto code-wrangler for the Macintosh port of UUPC), but I still
> maintain a uucp link between my system here at work, and my home system.
> It's normally done over TCP/IP but I could drop back to using a direct-
> dial connection if I had to.  Fun stuff!

Lots of good UUCP reference info there.  Thanks.  I know it's a rich 
tool but I don't have the gritty details.   I do remember one posting by 
a fellow some years ago where he mentions doing UUCP over packet. 
Thanks to Googles massive cache, I found it:

-----
I've been running this sort of thing for the last 2 or 3 years, and I've 
recently added UUCP to the mix, as I'm now running FreeBSD on my laptop, 
and so use UUCP to transport email from the server to the laptop via 
802.11b, cell phone, or packet radio (no TCP/IP layer needed to slow 
things down - I connect to the server via packet, login, then start the 
UUCP session).
Ed. C---
-----

Search on "wetnet packet uucp" and you'll see it as the 3rd or so posting..

I'm guessing there's some UUCP scripting tricks to establish the 
connection and then put the TNC into transparent mode.   Hmm.  Might 
still work through the AX25 stack which I wouldn't give up for all the 
other tools it enables.

Bill


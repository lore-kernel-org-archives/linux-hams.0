From: "Daniel Roloff" <dlr@cs.pdx.edu>
Subject: RE: no data from user-mode soundmodem
Date: Sun, 25 Aug 2002 18:45:16 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <NCBBKMFJEOGLLIAIAGGJCEBHFDAA.dlr@cs.pdx.edu>
References: <200208250147.g7P1l7N07098@12-224-31-54.client.attbi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200208250147.g7P1l7N07098@12-224-31-54.client.attbi.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

I wrote:
>
> I have successfully gotten the user-mode soundmodem working on two
> linux systems, but a third one has me stumped. The systems are all very
> similar. For two of them, I had to install the alsa sound drivers to get
> the i810 audio to work, but after doing that, one of the systems seems to
> be working fine.  (So far, I have only tried receiving packet data.) The
> other system brings up the sm0 device (as reported by ifconfig), but never
> receives any packets. But using soundmodemconfig shows audio getting to
> the modem and DCD being detected.  Also, using soundmodem -v255 shows
> DCD being set appropriately. Neither soundmodem or soundmodemconfig
> fully decode any packets though, (ie. nothing is printed to stdout,
> or to the diagnostic modem text window).
>
> In kisspkt.c, pktput is called, as is hdlc_receive, but that's as far
> as I got with my debug attempt.
>
I was able to get a little farther with debugging this and it seems that the
received packets are not passing the check_crc_ccitt call. I commented this
call out and data is being received, but it is about half garbage. I do not
know what is causing this because the receiver audio (through the soundcard)
sounds good and looks good on the soundmodemconfig diagnostic tools. I'll be
investigating it some more though.

Dan


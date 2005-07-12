From: Bill Vodall <wa7nwp@jnos.org>
Subject: Re: YAPP File Transfer with Linux
Date: Tue, 12 Jul 2005 12:05:27 -0500 (CDT)
Message-ID: <Pine.LNX.4.44.0507121202210.19475-100000@srv01.compumont.com>
References: <20050712152823.GA17591@oz.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20050712152823.GA17591@oz.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org


> > Yes.  I'm guessing TCP/IP cuts the transfer rate in half and that's
> > a best case without any digi's or nodes.
> > 
> > FTP (and other options <wink>) work fine but I'm looking for something
> > that reduces the overhead to a minimum.
> > 
> 
> You realize, of course, that YAPP has its own overhead issues.
> 
> Bob

Hopefully it's per file and not per packet like TCP/IP.

I watched Airmail send a message (15k picture) over AX25
a couple weeks ago and it beautiful.   3 full packets
of compressed data followed by a single ACK.  3 more data
packets and one more ACK.   A minute or so later and it
was done.

We should be able to do the same, or better (as we have
better compression) with native system tools.

Bill - WA7NWP



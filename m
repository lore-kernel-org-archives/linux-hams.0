From: Michael Taylor <mctaylor@privacy.nb.ca>
Subject: Re: YAPP File Transfer with Linux
Date: Tue, 12 Jul 2005 21:51:48 +0100
Message-ID: <20050712205148.GA97430@coffee>
References: <20050712152823.GA17591@oz.net> <Pine.LNX.4.44.0507121202210.19475-100000@srv01.compumont.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0507121202210.19475-100000@srv01.compumont.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Vodall <wa7nwp@jnos.org>
Cc: linux-hams@vger.kernel.org

On Tue, Jul 12, 2005 at 12:05:27PM -0500, Bill Vodall wrote:
> 
> > > FTP (and other options <wink>) work fine but I'm looking for something
> > > that reduces the overhead to a minimum.
> 
> Hopefully it's per file and not per packet like TCP/IP.
> 
> I watched Airmail send a message (15k picture) over AX25
> a couple weeks ago and it beautiful.   3 full packets
> of compressed data followed by a single ACK.  3 more data
> packets and one more ACK.   A minute or so later and it
> was done.
> 
> We should be able to do the same, or better (as we have
> better compression) with native system tools.
 
So what you seem to be looking for are tools that send and receive
files using just AX.25. 'ax25send filename ve3tix' and
'ax25receive' running on the listening ("server") side.

I don't know of anything, but it wouldn't be that hard to write.

Maybe if I find some free time.

-ve3tix

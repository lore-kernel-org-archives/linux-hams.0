From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: Re: Ethereal ax25 monitoring
Date: Sun, 14 Aug 2005 22:54:41 +0100
Message-ID: <42FFBDA1.6040400@rns-stearn.demon.co.uk>
References: <620c90570508131043a53b9db@mail.gmail.com> <42FE6C9E.2060808@rns-stearn.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <42FE6C9E.2060808@rns-stearn.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>

Richard Stearn wrote:
> There appears to be a reasonably conprehensive guide to how a new
> dissector is created and connected in. I am am attempting to compile
> 0.10.12 to see how easily I could import an ax.25 module from a
> protocol analyser I wrote some years ago.

OK, an update for those interested.

I have managed to add an outline AX.25 dissector to Ethereal. It doesn't do
anything, that wasn't the plot. Importing the ax.25 module from my old
analyser is a non-starter (as I suspected) so it is a reimplement from
scratch.

Before I actually get down to design and coding I will make some enquiries
on the Ethereal dev mailing list to see if anybody on that list is currently
working on an AX.25 dissector and also to see if it would be accepted if offered.

So is there anybody on this list who has done/is doing/has abandoned an AX.25
dissector for Ethereal?

Is there anybody on the list who is up for testing?

My guess is that Netrom & Rose would also be on the followup list, any others?.

-- 
Regards
	Richard
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Hardware wrangler, Windows smasher, Network knotter and Unix whisperer.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

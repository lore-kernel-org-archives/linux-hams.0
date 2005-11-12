From: "Wilson G. Hein" <wilson.hein@verizon.net>
Subject: Re: AX25 in libpcap, tcpdump & ethereal
Date: Fri, 11 Nov 2005 21:36:03 -0800
Message-ID: <1131773763.2520.18.camel@CO>
References: <4373BBBD.10505@rns-stearn.demon.co.uk>
	<20051111115014.GB3137@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: <20051111115014.GB3137@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: Richard Stearn <richard@rns-stearn.demon.co.uk>, linux-hams@vger.kernel.org

On Fri, 2005-11-11 at 03:50, Ralf Baechle DL5RB wrote:
> On Thu, Nov 10, 2005 at 09:29:33PM +0000, Richard Stearn wrote:
> 
> > For the foolhardy, desperate or those who just like to live dangerously.
> > 
> > To play with this you will need to be comfortable with using tar, patch
> > & make at the very least and using Linux. The system I am using is a
> > Slackware 8.1 install (kernel 2.4.31)
> > 
> > Attached is a patch that adds AX.25 to:
> > 	libpcap  - recognition and capture
> > 	tcpdump  - decoding AX.25, to a limited extent
> > 		 - decoding an ARP payload
> > 		 - decoding a TCP/IP payload
> > 	ethereal - dissection of AX.25
> > 		 - dissection of an TCP/IP payload
> > 
> > All others are treated as having no L3 protocol and printed in hex
> > and ascii.
> 
> This is excellent news and I hope it means we can soon retire listen(8)
> in favor of the standard tools tcpdump and ethereal!
> 
>   Ralf
> -

I agree that it's good news as far ass the added abilities to tcpdump
and ethereal, but I wholeheartedly disagree with retiring listen. For me
and maybe others, with respect to packet radio, listen is a standard
tool. Even with added abilities to the other tools, only listen provides
me with just what I want to see when monitoring my packet systems on air
activities. Nothing more, nothing less...

Willie, WJ3G



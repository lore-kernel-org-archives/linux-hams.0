From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: AX25 in libpcap, tcpdump & ethereal
Date: Fri, 11 Nov 2005 11:50:15 +0000
Message-ID: <20051111115014.GB3137@linux-mips.org>
References: <4373BBBD.10505@rns-stearn.demon.co.uk>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4373BBBD.10505@rns-stearn.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Stearn <richard@rns-stearn.demon.co.uk>
Cc: linux-hams@vger.kernel.org

On Thu, Nov 10, 2005 at 09:29:33PM +0000, Richard Stearn wrote:

> For the foolhardy, desperate or those who just like to live dangerously.
> 
> To play with this you will need to be comfortable with using tar, patch
> & make at the very least and using Linux. The system I am using is a
> Slackware 8.1 install (kernel 2.4.31)
> 
> Attached is a patch that adds AX.25 to:
> 	libpcap  - recognition and capture
> 	tcpdump  - decoding AX.25, to a limited extent
> 		 - decoding an ARP payload
> 		 - decoding a TCP/IP payload
> 	ethereal - dissection of AX.25
> 		 - dissection of an TCP/IP payload
> 
> All others are treated as having no L3 protocol and printed in hex
> and ascii.

This is excellent news and I hope it means we can soon retire listen(8)
in favor of the standard tools tcpdump and ethereal!

  Ralf

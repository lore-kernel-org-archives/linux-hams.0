From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: Re: Amateur Radio -> MacOS?
Date: Thu, 31 Jan 2008 20:41:08 +0200
Message-ID: <20080131184108.GR2537@mea-ext.zmailer.org>
References: <1201798150.47a1fc062d0bc@mgtmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1201798150.47a1fc062d0bc@mgtmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "IT2 Stuart Blake Tener, USNR" <teners@bh90210.net>
Cc: linux-hams@vger.kernel.org

On Thu, Jan 31, 2008 at 04:49:10PM +0000, IT2 Stuart Blake Tener, USNR wrote:
> 
> I am interested in finding out what efforts (if any) maybe underway with
> regard to trying to get AX.25, and other sorts of Amateur Radio Support
> for the MacOS environment.
> 
> I saw Bent's announcement, and I wonder if developers of Amateur Radio
> Software under Linux ever consider attempting to try to compile their
> software within an Apple environment (MacOS)?

Like others have noted, nothing prevents making integrated applications
that are able to talk with radio modems et.al.   They are not as integrable
as AX.25 packet radio protocols in Linux are, but that is fairly limited
application suite anyway.   Xastir for APRS is one example that is truly
platform agnostic -- some say "portable".

Several applications exist for HF data modulations, and EME work with
Joe Taylor's softwares.   Those need in essence some way to listen using
line mode (or even microphone) input, and transmit with line out (or
headphones) plus some way to key the transmitter.


What I think that Linux needs (and other operating systems as well)
is an easy way to write a protocol engine server process to be run
in user space, and then have kernel to hook socket API to that server
process to handle application protocols.   With low-speed protocols
and current generation of hardware that is a lot more sensible approach
than making the protocol in kernel.

For applications the socket API is the best thing there is.
Emulating socket API with a wrapper layer on top of socket connection
is ... cumbersome.  Primarily the  listen()  is rather ugly thing
over generic socket, but over PF_LOCAL the FD passing may save most
of the bacon, so to speak.

I am thinking of making such service for STANAG 5066 for HF data, but
that is "another story".

> I am by no means a BSD/MacOS type kernel developer, but my understanding
> is that MacOS certainly does support loadable modules.

We are somewhat "wrong people" to ask help for other than Linux
environment, especially about kernel side work, but there are known
differences in between Linux and BSD network stacks,  common details
of which do apply regardless of the protocol.  A bit more cumbersome
thing is that Linux kernel codes are GPL(v2) licensed, which is not 
liked by some BSD kernel coders.

> Thanks in advance.
> 73,
> Stuart, N3GWG
> -- 
> IT2 Stuart Blake Tener, USNR, N3GWG (Extra), MROP
> e-mail: teners@bh90210.net

73 de Matti, OH2MQK

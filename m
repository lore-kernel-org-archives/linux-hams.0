From: Kelly Black <kelly.black@penguinpackets.com>
Subject: Re: Linux AX.25 Socket programming
Date: 01 Jan 2003 16:48:27 -0600
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1041461308.10491.17.camel@edith>
References: <onKLlQBZqzE+EwXZ@mechserv.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <onKLlQBZqzE+EwXZ@mechserv.demon.co.uk>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Hams mailing list <linux-hams@vger.kernel.org>

On Wed, 2003-01-01 at 12:59, Jonathan Naylor wrote:
> AX.25 (and NET/ROM and ROSE) server development can by careful design of 
> the server be made extremely easy. The program ax25d is exactly 
> analogous to inetd, in that it can launch programs when an incoming 
> connection is received. This is controlled by the ax25d.conf file which 
> also allows for different servers to be started depending on the 
> incoming interface and/or incoming callsign. The started program only 
> has to read and write to stdin and stdout respectively, ax25d is also 
> capable of passing command line arguments to the started program based 
> on a set of substitution parameters and literal text given in its 
> configuration file.

Thanks G4KLX!

Excellent!!!  Does anybody know where I can find an example of a script
that is doing just this read from stdin and write to stdout.

Sounds like a great way to prototype a server quickly.  Neat way to
implement a quick service outside of the regular ones to get emergency
services via a simple scripted telnet client as well!

Kelly
KB0GBJ



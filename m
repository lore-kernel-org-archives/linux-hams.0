From: Kelly Black <kelly.black@penguinpackets.com>
Subject: Re: Linux AX.25 Socket programming
Date: 01 Jan 2003 20:12:39 -0600
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1041473560.10921.9.camel@edith>
References: <onKLlQBZqzE+EwXZ@mechserv.demon.co.uk>
	<1041461308.10491.17.camel@edith>  <3E13731B.C965C3A7@omeganetserv.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3E13731B.C965C3A7@omeganetserv.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Hams mailing list <linux-hams@vger.kernel.org>

On Wed, 2003-01-01 at 17:00, Andrew Bates wrote:
> > Excellent!!!  Does anybody know where I can find an example of a script
> > that is doing just this read from stdin and write to stdout.
> >
> 
> Here is a very simply perl script that reads and writes to the stdin/stdout:
> 
SNIP---

O.K. Thanks for the tip.  Can you get the callsign or other environment
info from the environment ( $ENV ?) as well like a CGI script does.

I will probably still write the program in C though as I was impressed
at how well I was able to view a curses based application via TCP/IP
over AX.25, and was floored by its responsiveness.

One of my reasons for re-writing the existing application is to make
user training simple by providing a simple interface option instead of
just the terse command line option that exists now.

Kelly
KB0GBJ

P.S. The application I am trying to re-create will be a sub-set of
ARES-DATA.  I will tailor it for tracking runners in a marathon race.


